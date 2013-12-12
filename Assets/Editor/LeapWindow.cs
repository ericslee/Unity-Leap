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
	public static float hoverAmount = 50.0f;

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
	
	/********************************************************************
	* current mode of the Leap interface
	*********************************************************************/
	enum Modes { leapSelection, leapEdit, leapTerrain, leapScale };
	enum EditModes { translate, scale, rotate };
	static Modes currentMode;
	//static EditModes currentEditMode;

	/********************************************************************
	* For scaling: -1.0f means baseSphereRadius is not set
	*********************************************************************/
	static System.Collections.Generic.LinkedList<Frame> previousFrames;
	
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
		//currentEditMode = EditModes.translate;
		canSelectMultiple = false;
			
		lub = (LeapUnityBridge) leapController.GetComponent(typeof(LeapUnityBridge));
		//lub.Awake();
		
		// Create new hands
		lub.setUp();
		
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
		
		// Instantiate previous frames linked list
		previousFrames = new System.Collections.Generic.LinkedList<Frame>();
		
		// Create audio player if it does not exist
		/*
		GameObject audioPlayer = GameObject.FindWithTag("AudioPlayer");
		if(audioPlayer == null)
		{
			GameObject ap = new GameObject("AudioPlayer");
			ap.transform.position = new Vector3(0,0,0);
		}
		*/
		SceneView.onSceneGUIDelegate += OnScene;
	}
	
	
	/********************************************************************
	* called when window is destroyed
	*********************************************************************/
	void OnDestroy() {
		if(lub != null) { lub.SetFalse(); }
		Debug.Log(lub.getCreated());
		
		// what does this do...
		SceneView.onSceneGUIDelegate -= OnScene;
		
		
		// delete hands (be careful with this...)
		//GameObject handsGO = GameObject.FindWithTag("Hands");
		//if(handsGO != null) { DestroyImmediate(handsGO); }
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
							"Press hotkeys 1-5 to create new assets and drop them in place. \n" +
							"You can assign the assets in the Inspector for the Leap Unity Bridge. \n" +
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
						
						// we are not in hand selection mode anymore
						lub.setSelectedWithLeap(false);
						
						// also drop whatever is currently selected
						Selection.objects = new UnityEngine.Object[0];		

						// set a delay so that the object is not immediately picked up again
						lub.selectionDelay = 0;
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
				// HOT KEYS FOR ASSET CREATION
				if (Event.current.keyCode == (KeyCode.Alpha1)) { createGameObject(lub.hotkey1); }
				if (Event.current.keyCode == (KeyCode.Alpha2)) { createGameObject(lub.hotkey2); }
				if (Event.current.keyCode == (KeyCode.Alpha3)) 
				{
					// Enter or exit scale mode
					if(currentMode != Modes.leapScale) 
					{
						currentMode = Modes.leapScale;
					}
					else 
					{
						currentMode = Modes.leapSelection;
						if(lub != null) lub.currentMode = LeapUnityBridge.Modes.leapSelection;
						currentModeText = "Selection";
						
						// we are not in hand selection mode anymore
						lub.setSelectedWithLeap(false);	
						
						// set grid handler to not grounded
						if(Selection.activeGameObject != null) 
						{
							LeapUnityGridHandler gh = Selection.activeGameObject.GetComponent<LeapUnityGridHandler>();
							if(gh != null)
							{
								gh.isGrounded = false;
							}
						}
						
						// also drop whatever is currently selected
						Selection.objects = new UnityEngine.Object[0];		
						
						// set a delay so that the object is not immediately picked up again
						lub.selectionDelay = 0;
					}
				}
				if (Event.current.keyCode == (KeyCode.Alpha4)) 
				{
					// Enter or exit terrain altering mode
					if(currentMode != Modes.leapTerrain) 
					{
						currentMode = Modes.leapTerrain;
					}
					else 
					{
						currentMode = Modes.leapSelection;
					}
				}
				if (Event.current.keyCode == (KeyCode.Alpha5)) 
				{	
					// ENTER TREE CREATION MODE
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
						
						// we are not in hand selection mode anymore
						lub.setSelectedWithLeap(false);	
						
						// also drop whatever is currently selected
						Selection.objects = new UnityEngine.Object[0];		
						
						// set a delay so that the object is not immediately picked up again
						lub.selectionDelay = 0;
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
				// HOT KEYS FOR ASSET CREATION
				if (Event.current.keyCode == (KeyCode.Alpha1)) { createGameObject(lub.hotkey1); }
				if (Event.current.keyCode == (KeyCode.Alpha2)) { createGameObject(lub.hotkey2); }
				if (Event.current.keyCode == (KeyCode.Alpha3)) 
				{
					// Enter or exit scale mode
					if(currentMode != Modes.leapScale) 
					{
						currentMode = Modes.leapScale;
					}
					else 
					{
						currentMode = Modes.leapSelection;
						if(lub != null) lub.currentMode = LeapUnityBridge.Modes.leapSelection;
						currentModeText = "Selection";
						
						// we are not in hand selection mode anymore
						lub.setSelectedWithLeap(false);	
						
						// set grid handler to not grounded
						if(Selection.activeGameObject != null) 
						{
							LeapUnityGridHandler gh = Selection.activeGameObject.GetComponent<LeapUnityGridHandler>();
							if(gh != null)
							{
								gh.isGrounded = false;
							}
						}
						
						// also drop whatever is currently selected
						Selection.objects = new UnityEngine.Object[0];		
						
						// set a delay so that the object is not immediately picked up again
						lub.selectionDelay = 0;
					}
				}
				if (Event.current.keyCode == (KeyCode.Alpha4)) 
				{ 
					// Enter or exit terrain altering mode
					if(currentMode != Modes.leapTerrain) 
					{
						currentMode = Modes.leapTerrain;
					}
					else 
					{
						currentMode = Modes.leapSelection;
					}
				}
				if (Event.current.keyCode == (KeyCode.Alpha5)) 
				{	
					// ENTER TREE CREATION MODE
					//Debug.Log(lub.hotkey5.data);
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
					
					// update previous frames
					if(previousFrames.Count > 25) 
					{
						previousFrames.RemoveFirst();
					}
					previousFrames.AddLast(m_Frame);
					
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
					Vector handNormal = new Vector();
					Vector handVelocity = new Vector();
					
					if(hands.Count > 0) 
					{
						Hand hand1 = hands[0];
						handPos = hand1.PalmPosition;
						hand1PosText = handPos.ToString();
						
						handNormal = hand1.PalmNormal;
						hand1NormalText = handNormal.ToString();
						
						handVelocity = hand1.PalmVelocity;
						hand1VelocityText = handVelocity.ToString();
					}
					
					currentGestureText = "None";
					
					// handle terrain transforming
					// hard coded for current grass plane
					if(currentMode.Equals(Modes.leapTerrain)) 
					{
						if(Selection.activeGameObject != null && Selection.activeGameObject.tag.Equals("handle"))
						{
							GameObject terrain = GameObject.FindWithTag("terrain");
							if(terrain != null)
							{
								// get the nine handles
								string handleName = Selection.activeGameObject.name;
								int handleNum = System.Convert.ToInt32(handleName.Substring(6));
								//Debug.Log(handleNum);
								
								VertHandler vertH = terrain.GetComponent<VertHandler>();
								if(vertH != null)
								{
									GameObject handsGO = GameObject.FindWithTag("Palm");
									if(handsGO != null)
									{
										// move the selected handle to the y of the palm
										vertH.handles[handleNum].transform.position = new Vector3(
											vertH.handles[handleNum].transform.position.x, handsGO.transform.position.y, vertH.handles[handleNum].transform.position.z);
											
										// move the eight surrounding handles to 75% of the y of the palm
										int vert1 = handleNum - 10;
										int vert2 = handleNum - 11;
										int vert3 = handleNum - 12;
										int vert4 = handleNum + 1;
										int vert6 = handleNum - 1;
										int vert7 = handleNum + 12;
										int vert8 = handleNum + 11;
										int vert9 = handleNum + 10;
										
										moveHandles(vert1, vertH, handsGO.transform.position.y);
										moveHandles(vert2, vertH, handsGO.transform.position.y);
										moveHandles(vert3, vertH, handsGO.transform.position.y);
										moveHandles(vert4, vertH, handsGO.transform.position.y);
										moveHandles(vert6, vertH, handsGO.transform.position.y);
										moveHandles(vert7, vertH, handsGO.transform.position.y);
										moveHandles(vert8, vertH, handsGO.transform.position.y);
										moveHandles(vert9, vertH, handsGO.transform.position.y);
									}	
								}
								
							}
						}
					}
					
					// scaling
					if(currentMode.Equals(Modes.leapScale))
					{
						Hand hand1;
						if(hands.Count > 0)
						{
							hand1 = hands[0];
							//Debug.Log(hand1.ScaleFactor(previousFrames.First.Value));
							if(Selection.activeGameObject != null && Selection.activeGameObject.GetComponent<LeapUnityGridHandler>() != null)
							{
								// scale the scaleFactor so it is not as dramatic of scaling			
								float scaleFactor = hand1.ScaleFactor(previousFrames.First.Value);
								if(scaleFactor > 1.0f)
								{
									float decimals = (scaleFactor - 1.0f) * 0.25f;
									scaleFactor = 1.0f + decimals;
								}
								else if(scaleFactor < 1.0f) 
								{
									float decimals = (1.0f - scaleFactor) * 0.25f;
									scaleFactor = 1.0f - decimals;
								}
								
								float currentScaleX = Selection.activeGameObject.transform.localScale.x * scaleFactor;
								float currentScaleY = Selection.activeGameObject.transform.localScale.y * scaleFactor;
								float currentScaleZ = Selection.activeGameObject.transform.localScale.z * scaleFactor;
								
								// clamp scale values so asset remains visible
								if(currentScaleX <= 0.2f) currentScaleX = 0.2f;
								if(currentScaleY <= 0.2f) currentScaleY = 0.2f;
								if(currentScaleZ <= 0.2f) currentScaleZ = 0.2f;	
								
								Selection.activeGameObject.transform.localScale = new Vector3(currentScaleX, currentScaleY, currentScaleZ);
							}
						}
					}					
					
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
	
	/********************************************************************
	* Rotates selected object(s)
	*********************************************************************/
	void rotateObject(bool isClockwise) 
	{
		if(Selection.activeGameObject != null) 
		{
			GameObject currentAsset = Selection.activeGameObject;
			if(isClockwise)	currentAsset.transform.Rotate(Vector3.up*1);
			else currentAsset.transform.Rotate(Vector3.up*-1);			
		}
	}
	
	/********************************************************************
	* scales selected object(s)
	*********************************************************************/
	void scaleObject(float scaleFactor) 
	{
		if(Selection.activeGameObject != null) 
		{
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
	
	/********************************************************************
	* scales selected object(s) using circle gesture
	*********************************************************************/
	void scaleObjectCircleGesture(bool isClockwise) 
	{
		if(Selection.activeGameObject != null) 
		{
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
	
	/********************************************************************
	* Translates objects while snapping to grid
	*********************************************************************/
	void translateObject(float transX, float transY, float transZ) 
	{
		if(Selection.activeGameObject != null) 
		{
			if(!canSelectMultiple)
			{
				GameObject currentAsset = Selection.activeGameObject;
				Vector3 translateVector = new Vector3(transX, transY, transZ);
				//Vector3 unityTranslatedLeap = translateVector.ToUnityTranslated();
				/*
				Vector3 translateVector2 = new Vector3(currentAsset.transform.position.x + translateVector.x,
													currentAsset.transform.position.y + translateVector.y, 
													currentAsset.transform.position.z + translateVector.z);
				*/									
													
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
	
	/********************************************************************
	* Create new game object
	*********************************************************************/
	static void createGameObject(GameObject assetToCreate) 
	{
		// make sure nothing is currently selected and drop it if it is
		Selection.objects = new UnityEngine.Object[0];
		
		// create asset
		if(assetToCreate != null)
		{
			//Object prefab = AssetDatabase.LoadAssetAtPath("Assets/Seat001.prefab", typeof(GameObject));
			GameObject handsGO = GameObject.FindWithTag("Palm");
			Vector3 currentHandPos = new Vector3(0.0f, 0.0f, 0.0f);
			if(handsGO != null)
			{
				//currentHandPos = new Vector3(handsGO.transform.position.x, handsGO.transform.position.y, handsGO.transform.position.z);
				currentHandPos = new Vector3(handsGO.transform.position.x, 20.0f, handsGO.transform.position.z);
			}
			// set initial state
			GameObject clone = Instantiate(assetToCreate, currentHandPos, Quaternion.identity) as GameObject;
			// set as selected
			LeapUnityGridHandler gridHandlerScript = clone.GetComponent<LeapUnityGridHandler>();
			// make sure the object is valid to be selected by Leap
			if(gridHandlerScript != null) 
			{
				gridHandlerScript.setSelectedByHand(true);
				Selection.activeGameObject = clone.gameObject;
			}
			// switch to edit mode
			currentMode = Modes.leapEdit;
			if(lub != null) lub.currentMode = LeapUnityBridge.Modes.leapEdit;
			currentModeText = "Edit";
		}
	}
	
	/********************************************************************
	* Move handles
	*********************************************************************/
	static void moveHandles(int vertNum, VertHandler vertH, float newY)
	{
		// check for invalid vertNum
		if(vertNum < 0 || vertNum > vertH.handles.Length) return;
		
		// move the selected handle to the y of the palm
		vertH.handles[vertNum].transform.position = new Vector3(
			vertH.handles[vertNum].transform.position.x, newY * 0.65f, vertH.handles[vertNum].transform.position.z);
	}
}


