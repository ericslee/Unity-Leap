/******************************************************************************\
* Eric Lee
* Unity Leap
\******************************************************************************/

using UnityEngine;
using UnityEditor;
using Leap;
using System.Collections;
//using EditorUtility;

// Window derives from EditorWindow
public class LeapWindow : EditorWindow {
	public static float hoverAmount = 30.0f;

	// Controller provides main interaction between Leap and the app (Unity in this case)
	static Leap.Controller 		m_controller	= new Leap.Controller();
	static Leap.Frame			m_Frame			= null;
	
	public static bool leapActive = true;
	public bool translationEnabled = true;
	public bool rotationEnabled = true;
	public bool scaleEnabled = false; // TODO
	public static bool canSelectMultiple = false;
	private static bool canResizeGrid = false;
	
	// variables that refer to the gameObject that contains the LeapController, its Bridge script, and the world grid
	static GameObject leapController;
	static LeapUnityBridge lub;
	static LeapUnityGrid theGrid;
		
	//These arrays allow us to use our game object arrays much like pools.
	//When a new hand/finger is found, we mark a game object by active
	//by storing it's id, and when it goes out of scope we make the
	//corresponding gameobject invisible & set the id to -1.
	static int[]					m_fingerIDs = null;
	static int[]					m_handIDs	= null;
	
	/********************************************************************
	* current mode of the Leap interface
	*********************************************************************/
	enum Modes { leapSelection, leapEdit };
	enum EditModes { translate, scale, rotate };
	static Modes currentMode;
	static EditModes currentEditMode;

	/********************************************************************
	* GUI variables
	*********************************************************************/
	// strings for display Leap data
	static string currentModeText = "Selection";
	static string canSelectMultipleText = "False";
	static string canResizeGridText = "False";
	string currentEditModeText = "Rotate";
	static string leapActiveText = "True";
	string currentFrameText = "0";
	string currentFPSText = "0";
	string numHandsText = "0";
	string numFingersText = "0";
	string hand1PosText = "0";
	string hand1NormalText = "0";
	string hand1VelocityText = "0";
	string currentGestureText = "None";
	string circleCountText = "0";
	string scaleFactorText = "1.0";
	
	string helpText = "";
	bool displayHelp = false;
	
	// customizing Leap options
	float xScale = 0.02f;
	float yScale = 0.02f;
	float zScale = 0.02f;
	
	// These values, set from the editor window, set the corresponding fields in the
	// LeapUnityExtension for translating vectors.
	public static Vector3 m_LeapScaling = new Vector3(0.02f, 0.02f, 0.02f);
	public static Vector3 m_LeapOffset = new Vector3(0,0,0);
	
	// Add menu named "Leap Motion" to the Window menu
	[MenuItem ("Window/Leap Control")]
	/********************************************************************
	* called when window is initialized
	*********************************************************************/
	static void Init () 
	{
		// Get existing open window or if none, make a new one:
		LeapWindow window = (LeapWindow)EditorWindow.GetWindow (typeof (LeapWindow));
		window.minSize = new Vector2(500, 500);
		
		// check if LeapController already exists, and create dynamically if not
		leapController = GameObject.FindWithTag("LeapController");
		if(leapController != null) Debug.Log("found controller!");
		else 
		{
			Debug.Log("no controller found, creating new Leap Controller");
			leapController = new GameObject("LeapController");
			leapController.tag = "LeapController"; // what if this tag doesn't exist already?
			
			// attach scripts and set components
			leapController.AddComponent(typeof(LeapUnityBridge));
			leapController.AddComponent(typeof(LeapUnitySelectionController));
			lub = leapController.GetComponent<LeapUnityBridge>();
			lub.m_LeapScaling = new Vector3(0.1f, 0.1f, 0.1f);
		}
		
		// enable gestures 
		m_controller.EnableGesture(Gesture.GestureType.TYPECIRCLE);
        m_controller.EnableGesture(Gesture.GestureType.TYPEKEYTAP);
        m_controller.EnableGesture(Gesture.GestureType.TYPESCREENTAP);
        m_controller.EnableGesture(Gesture.GestureType.TYPESWIPE);
		
		
		// init in selection mode
		currentMode = Modes.leapSelection;
		// Make sure the bridge knows what mode to start in as well
		if(lub != null) lub.currentMode = LeapUnityBridge.Modes.leapSelection;
		currentEditMode = EditModes.translate;
		canSelectMultiple = false;
		
		
		// init data structures to house fingers and hands
		m_fingerIDs = new int[10];
		for( int i = 0; i < m_fingerIDs.Length; i++ )
		{
			m_fingerIDs[i] = -1;	
		}
		
		m_handIDs = new int[2];
		for( int i = 0; i < m_handIDs.Length; i++ )
		{
			m_handIDs[i] = -1;	
		}
			
		lub = (LeapUnityBridge) leapController.GetComponent(typeof(LeapUnityBridge));
		lub.Awake();
		
		// Transform hands to where camera is looking initially
		if(Camera.current != null) 
		{
			// Camera.current refers to the editor camera
			Transform cameraTransform = Camera.current.transform;
			Vector3 cameraLookAt = cameraTransform.forward;
			Vector3 cameraPosition = cameraTransform.position;
			lub.TransformHands(cameraPosition.x, cameraPosition.y, cameraPosition.z, cameraLookAt.x, 
				cameraLookAt.y, cameraLookAt.z, cameraTransform);
		}
		
		// Get the grid
		GameObject ground = GameObject.FindWithTag("Ground");
		if(ground != null) theGrid = ground.GetComponent<LeapUnityGrid>();
		
		SceneView.onSceneGUIDelegate += OnScene;
	}
	
	
	/********************************************************************
	* called when window is destroyed
	*********************************************************************/
	void OnDestroy() {
		if(lub != null) { lub.SetFalse(); }
		
		// what does this do...
		SceneView.onSceneGUIDelegate -= OnScene;
		// delete hands (be careful with this...)
		//GameObject handsGO = GameObject.FindWithTag("Hands");
		//DestroyImmediate(handsGO);
	}

	/********************************************************************
	* actual window controls go here
	* sets up what is on GUI and handles any events when window is in focus
	*********************************************************************/
	void OnGUI () {
		// set up GUI elements
		GUILayout.Label("Leap Unity Controller", EditorStyles.boldLabel);
		xScale = EditorGUILayout.FloatField ("Leap Scale: X", xScale, GUILayout.Width(300));
		yScale = EditorGUILayout.FloatField ("Leap Scale: Y", yScale, GUILayout.Width(300));
		zScale = EditorGUILayout.FloatField ("Leap Scale: Z", zScale, GUILayout.Width(300));
		if(GUILayout.Button("Scale", GUILayout.Width(150))) {
			lub.SetLeapScaling(xScale, yScale, zScale);
		}
		EditorGUILayout.LabelField("Current mode", currentModeText, EditorStyles.boldLabel);
		EditorGUILayout.LabelField("Multi-Selection", canSelectMultipleText, EditorStyles.boldLabel);
		EditorGUILayout.LabelField("Grid-Resizable", canResizeGridText, EditorStyles.boldLabel);
		EditorGUILayout.LabelField("Leap active: ", leapActiveText, EditorStyles.boldLabel);
		EditorGUILayout.LabelField("Current edit mode", currentEditModeText);
		EditorGUILayout.LabelField("Current frame", currentFrameText);
		EditorGUILayout.LabelField("Leap FPS", currentFPSText);
		EditorGUILayout.LabelField("Number of hands", numHandsText);
		EditorGUILayout.LabelField("Number of fingers", numFingersText);
		EditorGUILayout.LabelField("Hand Position", hand1PosText);
		EditorGUILayout.LabelField("Hand Normal", hand1NormalText);
		EditorGUILayout.LabelField("Hand Velocity", hand1VelocityText);
		EditorGUILayout.LabelField("Circle gesture", currentGestureText);
		EditorGUILayout.LabelField("Circle count", circleCountText);
		EditorGUILayout.LabelField("Scale factor", scaleFactorText);
		
		// displaying help
		if (GUILayout.Button("Help", GUILayout.Width(150)))
        {
            // display help
			displayHelp = !displayHelp;
			helpText = displayHelp ? "Press S to switch between edit and selection modes. \n" +
							"Press D to disable Leap control completely. \n" +
							"To translate, just move your hand around. \n" +
							"To deselect/drop the object, hit Z. \n" +
							"To resize grid, toggle grid resizing on with G and draw circles to change the size. \n" +
							"1cm of hand motion = .02m scene motion" : "";
        }
		GUILayout.Label(helpText);
		
		
		// for GUI only interactions, pressing a key
		Event e = Event.current;	
		switch (e.type)
        {
            case EventType.KeyDown:
            {
				// toggle leap active or not
				if (Event.current.keyCode == (KeyCode.D)) 
				{
					leapActive = !leapActive;
					if(lub != null)	lub.leapActive = leapActive;
					leapActiveText = leapActive ? "True" : "False";
					if(lub != null) Debug.Log("LeapActive:" + lub.leapActive);
				}	
				// switch modes
				if (Event.current.keyCode == (KeyCode.S)) 
				{
					if(currentMode.Equals(Modes.leapSelection))	
					{
						currentMode = Modes.leapEdit;
						if(lub != null) lub.currentMode = LeapUnityBridge.Modes.leapEdit;
						currentModeText = "Edit";
					}
					else 
					{
						currentMode = Modes.leapSelection;
						if(lub != null) lub.currentMode = LeapUnityBridge.Modes.leapSelection;
						currentModeText = "Selection";
					}					
				}
				// enable/disable multiple selection with Leap
				if (Event.current.keyCode == (KeyCode.A)) 
				{
					canSelectMultiple = !canSelectMultiple;
					canSelectMultipleText = canSelectMultiple ? "True" : "False";
					if(lub != null)	lub.canSelectMultiple = canSelectMultiple;
					
					// handle multiple objects here (deselect all?)
					Selection.objects = new UnityEngine.Object[0];				
				}
				// drop selected game asset(s)
				if (Event.current.keyCode == (KeyCode.Z)) 
				{
					Selection.objects = new UnityEngine.Object[0];
								
					// we are not in hand selection mode anymore
					lub.setSelectedWithLeap(false);			
				}
				// enable/disable grid resizing
				if (Event.current.keyCode == (KeyCode.G)) 
				{
					canResizeGrid = !canResizeGrid;
					canResizeGridText = canResizeGrid ? "True" : "False";	
				}
                break;
            }
        }
	}
	
	/********************************************************************
	* handles interactions when scene is in focus
	*********************************************************************/
	private static void OnScene(SceneView sceneview)
    {
        // for GUI only interactions, pressing a key
		Event e = Event.current;	
		switch (e.type)
        {
            case EventType.KeyDown:
            {
				// toggle leap active or not
				if (Event.current.keyCode == (KeyCode.D)) 
				{
					leapActive = !leapActive;
					if(lub != null)	lub.leapActive = leapActive;
					leapActiveText = leapActive ? "True" : "False";
					if(lub != null) Debug.Log("LeapActive:" + lub.leapActive);
				}	
				// switch modes
				if (Event.current.keyCode == (KeyCode.S)) 
				{
					if(currentMode.Equals(Modes.leapSelection))	
					{
						currentMode = Modes.leapEdit;
						if(lub != null) lub.currentMode = LeapUnityBridge.Modes.leapEdit;
						currentModeText = "Edit";
					}
					else 
					{
						currentMode = Modes.leapSelection;
						if(lub != null) lub.currentMode = LeapUnityBridge.Modes.leapSelection;
						currentModeText = "Selection";
					}					
				}
				// enable/disable multiple selection with Leap
				if (Event.current.keyCode == (KeyCode.A)) 
				{
					canSelectMultiple = !canSelectMultiple;
					canSelectMultipleText = canSelectMultiple ? "True" : "False";
					if(lub != null)	lub.canSelectMultiple = canSelectMultiple;
					
					// handle multiple objects here (deselect all?)
					Selection.objects = new UnityEngine.Object[0];				
				}
				// drop selected game asset(s)
				if (Event.current.keyCode == (KeyCode.Z)) 
				{
					Selection.objects = new UnityEngine.Object[0];
								
					// we are not in hand selection mode anymore
					lub.setSelectedWithLeap(false);			
				}
				// enable/disable grid resizing
				if (Event.current.keyCode == (KeyCode.G)) 
				{
					canResizeGrid = !canResizeGrid;
					canResizeGridText = canResizeGrid ? "True" : "False";
				}
                break;
            }
        }
    }
	
	/********************************************************************
	* Update function, called continuously
	*********************************************************************/
	void Update () 
	{
		// Don't remember why I need to do this...leave comments Eric
		if(leapController != null) EditorUtility.SetDirty(leapController);
		
		// if editor camera in scene view changes, map the transformation to the Leap hands transform as well
		if(Camera.current != null) 
		{
			// Camera.current refers to the editor camera
			Transform cameraTransform = Camera.current.transform;
			Vector3 cameraLookAt = cameraTransform.forward;
			Vector3 cameraPosition = cameraTransform.position;
			//Debug.Log("(" + cameraLookAt.x + ", " + cameraLookAt.y + ", " + cameraLookAt.z);
			//Debug.Log("Camera position: (" + cameraPosition.x + ", " + cameraPosition.y + ", " + cameraPosition.z);
			lub.TransformHands(cameraPosition.x, cameraPosition.y, cameraPosition.z, cameraLookAt.x, 
				cameraLookAt.y, cameraLookAt.z, cameraTransform);
		}
		
		// Only if Leap controls are active
		if(leapActive)
		{
			// Reduce number of frames processed (maybe will mess with some input and will need to be changed later)
			if(Time.time % 1000 == 0) 
			{
				if( m_controller != null )
				{	
					// grab the current frame
					m_Frame	= m_controller.Frame();
					
					// get data from the frame
					HandList hands = m_Frame.Hands;
					//PointableList pointables = m_Frame.Pointables;
					FingerList fingers = m_Frame.Fingers;
					//ToolList tools = m_Frame.Tools;
					
					// update GUI text
					currentFrameText = m_Frame.ToString();
					currentFPSText = m_Frame.CurrentFramesPerSecond.ToString();
					numHandsText = hands.Count.ToString();
					numFingersText = fingers.Count.ToString();
					
					Vector handPos = new Vector();
					Vector stableHandPos = new Vector();
					Vector handNormal = new Vector();
					Vector handVelocity = new Vector();
					
					if(hands.Count > 0) 
					{
						Hand hand1 = hands[0];
						handPos = hand1.PalmPosition;
						hand1PosText = handPos.ToString();
						
						stableHandPos = hand1.StabilizedPalmPosition;
						
						handNormal = hand1.PalmNormal;
						hand1NormalText = handNormal.ToString();
						
						handVelocity = hand1.PalmVelocity;
						hand1VelocityText = handVelocity.ToString();
					}
					
					currentGestureText = "None";
					
					// increment delays here if using counters for delaying anything
									
					// handle gestures
					if(m_Frame.Gestures().Count > 0) {					
						for(int g = 0; g < m_Frame.Gestures().Count; g++)
						{
							Gesture gest = m_Frame.Gestures()[g];
							switch (gest.Type) {
							case Gesture.GestureType.TYPECIRCLE:
								//Handle circle gestures
								currentGestureText = "Circle";
								CircleGesture circle = new CircleGesture(gest);
								
								// adjust size of grid
								bool isClockwise = false;
								if(circle.Normal.z < 0) 
								{
									isClockwise = true;
								}
								if(canResizeGrid) 
								{	
									resizeGrid(isClockwise);
								}
								
								// create new circle gesture and transform accordingly
								// UNCOMMENT TO ROTATE
								/*
								bool isClockwise = false;
								if(circle.Normal.z < 0) 
								{
									isClockwise = true;
								}
								if(currentMode.Equals(Modes.leapEdit)) 
									
									rotateObject(isClockwise);
								}
								*/
								float turns = circle.Progress;
								circleCountText = turns.ToString();
								break;
							case Gesture.GestureType.TYPEKEYTAP:
								//Handle key tap gestures
								currentGestureText = "Key Tap";
								
								// deselect all objects
								//Selection.objects = new UnityEngine.Object[0];
								
								// we are not in hand selection mode anymore
								//lub.setSelectedWithLeap(false);
								
								break;
							case Gesture.GestureType.TYPESCREENTAP:
								//Handle screen tap gestures
								currentGestureText = "Screen Tap";								
								break;
							case Gesture.GestureType.TYPESWIPE:
								//Handle swipe gestures
								currentGestureText = "Swipe";		
								break;
								default:
								//Handle unrecognized gestures
								
								break;
							}
						}
					}
					
					// handle translation
					if(currentMode.Equals(Modes.leapEdit)) 
					{
						// this seems to be the magic number atm
						if(translationEnabled) 
						{
							/*
							if(Camera.current != null) 
							{
								// Camera.current refers to the editor camera
								Transform cameraTransform = Camera.current.transform;
								Vector3 cameraLookAt = cameraTransform.forward;
								Vector3 cameraPosition = cameraTransform.position;
								lub.TransformHands(cameraPosition.x, cameraPosition.y, cameraPosition.z, cameraLookAt.x, 
									cameraLookAt.y, cameraLookAt.z);
								
								// Translate handPos to cameraPos
								Vector3 transformedHandPos = new Vector3(handPos.x - cameraPosition.x, handPos.y - cameraPosition.y, handPos.z - cameraPosition.z);
								// rotate to camera forward
								float angle = Vector3.Angle(transformedHandPos, cameraLookAt);
								Quaternion q = Quaternion.AngleAxis(angle,Vector3.up);
								transformedHandPos = q * transformedHandPos;
								
								translateObject(transformedHandPos.x/2.0f, transformedHandPos.y/2.0f, -transformedHandPos.z * 2.0f); 
							}
							*/
							
							GameObject handsGO = GameObject.FindWithTag("Palm");
							if(handsGO != null)
							{
								translateObject(handsGO.transform.position.x, handsGO.transform.position.y, handsGO.transform.position.z);
							}
							//translateObject(handPos.x, handPos.y, -handPos.z);	
						}
						//if(currentEditMode.Equals(EditModes.translate)) translateObject(handPos.x/2.0f, handPos.y/2.0f, -handPos.z/2.0f); 
						//if(currentEditMode.Equals(EditModes.translate)) translateObject(stableHandPos.x/2.0f, stableHandPos.y/2.0f, -stableHandPos.z/2.0f); 
					}
															
					// update the GUI
					Repaint();
				}
				
				/////////////////////////////////////////////////////////////
				// Update the status of other scripts in the scene
				/////////////////////////////////////////////////////////////
				
				// update selection status of all LeapUnityGrid objects
				LeapUnityGridHandler[] sceneItems = Object.FindObjectsOfType(typeof(LeapUnityGridHandler)) as LeapUnityGridHandler[];
				foreach (LeapUnityGridHandler currentAsset in sceneItems) 
				{
					if(Selection.Contains(currentAsset.gameObject)) currentAsset.isSelected = true;
					else currentAsset.isSelected = false;
				}			
			}
		}
		
		// update the grid itself to draw if necessary (only when with objects selected from Leap)
		if(theGrid != null) theGrid.SetDraw(leapActive && Selection.objects.Length > 0 && lub.getSelectedWithLeap() == true);
		
	}
	
	/********************************************************************
	* Resizes grid - Clockwise is increase, ccw decrease
	*********************************************************************/
	void resizeGrid(bool isClockwise) 
	{
		if(theGrid != null) 
		{
			if(isClockwise)
			{
				theGrid.setWidth(0.03f);
				theGrid.setHeight(0.03f);
			}
			else 
			{
				theGrid.setWidth(-0.03f);
				theGrid.setHeight(-0.03f);
			}
		}
	}
	
	// rotates selected object(s)
	void rotateObject(bool isClockwise) 
	{
		if(Selection.activeGameObject != null) {
			GameObject currentAsset = Selection.activeGameObject;
			if(isClockwise)	currentAsset.transform.Rotate(Vector3.up*1);
			else currentAsset.transform.Rotate(Vector3.up*-1);			
		}
	}
	
	// scales selected object(s)
	void scaleObject(float scaleFactor) {
		if(Selection.activeGameObject != null) {
			GameObject currentAsset = Selection.activeGameObject;
			//float scaleFactorNormalized = scaleFactor / 1.0f;
			
			float currentScaleX = currentAsset.transform.localScale.x * scaleFactor;
			float currentScaleY = currentAsset.transform.localScale.y * scaleFactor;
			float currentScaleZ = currentAsset.transform.localScale.z * scaleFactor;
			
			// clamp scale values so asset remains visible
			if(currentScaleX <= 0.2f) currentScaleX = 0.2f;
			if(currentScaleY <= 0.2f) currentScaleY = 0.2f;
			if(currentScaleZ <= 0.2f) currentScaleZ = 0.2f;
			
			currentAsset.transform.localScale = new Vector3(currentScaleX, currentScaleY, currentScaleZ);
		}
	}
	
	void scaleObjectCircleGesture(bool isClockwise) {
		if(Selection.activeGameObject != null) {
			GameObject currentAsset = Selection.activeGameObject;
			float scaleFactor = 1.01f;
			if(!isClockwise) scaleFactor = 0.99f;
			
			float currentScaleX = currentAsset.transform.localScale.x * scaleFactor;
			float currentScaleY = currentAsset.transform.localScale.y * scaleFactor;
			float currentScaleZ = currentAsset.transform.localScale.z * scaleFactor;
			
			// clamp scale values so asset remains visible
			if(currentScaleX <= 0.2f) currentScaleX = 0.2f;
			if(currentScaleY <= 0.2f) currentScaleY = 0.2f;
			if(currentScaleZ <= 0.2f) currentScaleZ = 0.2f;
			
			currentAsset.transform.localScale = new Vector3(currentScaleX, currentScaleY, currentScaleZ);
		}
	}
	
	void translateObject(float transX, float transY, float transZ) {
		if(Selection.activeGameObject != null) {
			if(!canSelectMultiple)
			{
				GameObject currentAsset = Selection.activeGameObject;
				Vector3 translateVector = new Vector3(transX, transY, transZ);
				//Vector3 unityTranslatedLeap = translateVector.ToUnityTranslated();
				Vector3 translateVector2 = new Vector3(currentAsset.transform.position.x + translateVector.x,
													currentAsset.transform.position.y + translateVector.y, 
													currentAsset.transform.position.z + translateVector.z);
													
													
				LeapUnityGridHandler gridHandler = currentAsset.GetComponent<LeapUnityGridHandler>();
				if(gridHandler != null) 
				{
					// send the FLOOR of the hand translation so that we work with integers								
					gridHandler.xBuffer = Mathf.Floor(translateVector.x);
					gridHandler.zBuffer = Mathf.Floor(translateVector.z);
					//currentAsset.transform.Translate(translateVector2);
				}
			}
			else
			{
				for(int i = 0; i < Selection.transforms.Length; i++) 
				{
					GameObject currentAsset = Selection.transforms[i].gameObject;
					
					Vector3 translateVector = new Vector3(transX, transY, transZ);
					LeapUnityGridHandler gridHandler = currentAsset.GetComponent<LeapUnityGridHandler>();
					if(gridHandler != null) 
					{
						// send the FLOOR of the hand translation so that we work with integers								
						gridHandler.xBuffer = Mathf.Floor(translateVector.x);
						gridHandler.zBuffer = Mathf.Floor(translateVector.z);
					}
				}
			}
		}
	}
	
	void positionObject(float posX, float posY, float posZ) {
		if(Selection.activeGameObject != null) {
			GameObject currentAsset = Selection.activeGameObject;
			Vector3 positionVector = new Vector3(posX, posY, posZ);
			currentAsset.transform.position = positionVector;
		}
	}
	
	private GameObject CreateCube() {
		GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
		Selection.activeGameObject = cube;
		
		return cube;
	}
}


