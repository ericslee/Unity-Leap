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
	// Controller provides main interaction between Leap and the app (Unity in this case)
	static Leap.Controller 		m_controller	= new Leap.Controller();
	static Leap.Frame			m_Frame			= null;
	
	// variables that refer to the gameObject that contains the LeapController and its Bridge script
	static GameObject leapController;
	static LeapUnityBridge lub;
		
	// These values, set from the editor window, set the corresponding fields in the
	// LeapUnityExtension for translating vectors.
	public static Vector3 m_LeapScaling = new Vector3(0.02f, 0.02f, 0.02f);
	public static Vector3 m_LeapOffset = new Vector3(0,0,0);
	
		
	//These arrays allow us to use our game object arrays much like pools.
	//When a new hand/finger is found, we mark a game object by active
	//by storing it's id, and when it goes out of scope we make the
	//corresponding gameobject invisible & set the id to -1.
	static int[]					m_fingerIDs = null;
	static int[]					m_handIDs	= null;
	
	// current mode of the Leap interface
	enum Modes { leapSelection, leapEdit };
	enum EditModes { translate, scale, rotate };
	static Modes currentMode;
	static EditModes currentEditMode;

	// strings for display Leap data
	string currentModeText = "Selection";
	string currentEditModeText = "Rotate";
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
	
	// delays
	static int modeChangeDelay = 0;
	static int editModeChangeDelay = 0;
	
	// Add menu named "Leap Motion" to the Window menu
	[MenuItem ("Window/Leap Control")]
	// called when window is initialized
	static void Init () {
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
		currentEditMode = EditModes.rotate;
		
		
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
	}
	
	void OnDestroy() {
		// when closing the editor window
		//lub = (LeapUnityBridge) leapController.GetComponent(typeof(LeapUnityBridge));
		lub.SetFalse();
		
		// delete hands (be careful with this...)
		//GameObject handsGO = GameObject.FindWithTag("Hands");
		//DestroyImmediate(handsGO);
	}

	// actual window controls go here
	// sets up what is on GUI and handles any events when window is in focus
	void OnGUI () {
		// set up GUI elements
		GUILayout.Label("Leap Unity Controller", EditorStyles.boldLabel);
		xScale = EditorGUILayout.FloatField ("Leap Scale: X", xScale, GUILayout.Width(300));
		yScale = EditorGUILayout.FloatField ("Leap Scale: Y", yScale, GUILayout.Width(300));
		zScale = EditorGUILayout.FloatField ("Leap Scale: Z", zScale, GUILayout.Width(300));
		if(GUILayout.Button("Scale", GUILayout.Width(150))) {
			lub.SetLeapScaling(xScale, yScale, zScale);
		}
		EditorGUILayout.LabelField("Current mode", currentModeText);
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
			helpText = displayHelp ? "Key tap to switch between edit and selection modes. \n" +
							"In edit mode, screen tap to switch between rotation, translation, and scaling. \n" +
							"To rotate, make circle gestures. \n" +
							"To scale, make circle gestures as well. \n" +
							"To translate, swipe over the Leap. \n" +
							"1cm of hand motion = .02m scene motion" : "";
        }
		GUILayout.Label(helpText);
		
		// for GUI only interactions, pressing a key
		Event e = Event.current;
				
		switch (e.type)
        {
            case EventType.keyDown:
                {
					// select object
					
					if (Event.current.keyCode == (KeyCode.P))
                    {
						// scale larger
                        Debug.Log(e.mousePosition.ToString());
						//Ray ray = HandleUtility.GUIPointToWorldRay(e.mousePosition);
						Ray ray = HandleUtility.GUIPointToWorldRay(e.mousePosition);
						RaycastHit hit = new RaycastHit();
						if (Physics.Raycast(ray, out hit, 1000.0f)) {
							//Debug.Log("hit!");
							Debug.Log(hit.point.ToString());
						}
                    }
					
					// SCALING
                    if (Event.current.keyCode == (KeyCode.S))
                    {
						// scale larger
                        Debug.Log("s was pressed");
						scaleObject(2.0f);
                    }
					if (Event.current.keyCode == (KeyCode.D))
                    {
						// scale smaller
                        Debug.Log("d was pressed");
						scaleObject(0.5f);
                    }
					// TRANSLATION
					if (Event.current.keyCode == (KeyCode.Z))
                    {
						// + X
						translateObject(1.0f, 0.0f, 0.0f);
                    }
					if (Event.current.keyCode == (KeyCode.X))
                    {
						// - X
						translateObject(-1.0f, 0.0f, 0.0f);
                    }
					if (Event.current.keyCode == (KeyCode.C))
                    {
						// + Y
						translateObject(0.0f, 1.0f, 0.0f);
                    }
					if (Event.current.keyCode == (KeyCode.V))
                    {
						// - Y
						translateObject(0.0f, -1.0f, 0.0f);
                    }
					if (Event.current.keyCode == (KeyCode.B))
                    {
						// + Z
						translateObject(0.0f, 0.0f, 1.0f);
                    }
					if (Event.current.keyCode == (KeyCode.N))
                    {
						// - Z
						translateObject(0.0f, 0.0f, -1.0f);
                    }
					if (Event.current.keyCode == (KeyCode.P))
                    {
						CreateCube();
                    }										
                    break;
                }
			case EventType.MouseDown:
			{			
				if(e.button == 0)
				{
					Debug.Log("Mouse clicked");
					e.Use();  //Eat the event so it doesn't propagate through the editor.
				}
				break;
			}
        }
	}
	
	/*
	Called when scene view is repainted
	In the OnSceneGUI you can do eg. mesh editing, terrain painting or advanced gizmos If call Event.current.Use(), 
	the event will be "eaten" by the editor and not be used by the scene view itself.
	*/
	void OnSceneGUI() {

	}
	
	public static Leap.Frame Frame
	{
		get { return m_Frame; }
	}
	
	// update function
	void Update () {
		if(leapController != null) EditorUtility.SetDirty(leapController);
		
		// if editor camera in scene view changes, map the transformation to the Leap hands transform as well
		if(Camera.current != null) {
			// Camera.current refers to the editor camera
			Transform cameraTransform = Camera.current.transform;
			Vector3 cameraLookAt = cameraTransform.forward;
			Vector3 cameraPosition = cameraTransform.position;
			//Debug.Log("(" + cameraLookAt.x + ", " + cameraLookAt.y + ", " + cameraLookAt.z);
			//Debug.Log("Camera position: (" + cameraPosition.x + ", " + cameraPosition.y + ", " + cameraPosition.z);
			lub.TransformHands(cameraPosition.x, cameraPosition.y, cameraPosition.z, cameraLookAt.x, 
				cameraLookAt.y, cameraLookAt.z);
		}
	
		Event e = Event.current;
		if(e != null) {		
			switch (e.type)
			{
			 case EventType.keyDown:
			 {
				Debug.Log("key pressed");
				break;
			 }
			case EventType.MouseDown:
				{	
					Debug.Log("Mouse clicked");				
					if(e.button == 0)
					{
						Debug.Log("Mouse clicked");
						e.Use();  //Eat the event so it doesn't propagate through the editor.
					}
					break;
				}
			}
		}
		
		//if( !m_UseFixedUpdate ) LeapInput.Update();
		
		// Reduce number of frames processed (maybe will mess with some input and will need to be changed later)
		if(Time.time % 1000 == 0) {
			if( m_controller != null )
			{	
				// grab the current frame
				//Frame lastFrame = m_Frame == null ? Frame.Invalid : m_Frame;
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
				Vector handNormal = new Vector();
				Vector handVelocity = new Vector();
				
				if(hands.Count > 0) {
					Hand hand1 = hands[0];
					handPos = hand1.PalmPosition;
					hand1PosText = handPos.ToString();
					
					handNormal = hand1.PalmNormal;
					hand1NormalText = handNormal.ToString();
					
					handVelocity = hand1.PalmVelocity;
					hand1VelocityText = handVelocity.ToString();
					
					//CreateHand();
					// display a sphere on the screen where the hand is
					//Debug.Log("Hand detected");
				}
				
				currentGestureText = "None";

				//Average a finger position for the last 10 frames
				/*
				for(int j; j < fingers.Count; j++) {
					int count = 0;
					Vector average = new Vector ();
					Finger fingerToAverage = frame.Fingers [0];
					for (int i = 0; i < 10; i++) {
							Finger fingerFromFrame = controller.Frame (i).Finger (fingerToAverage.Id);
							if (fingerFromFrame.IsValid) {
									average += fingerFromFrame.TipPosition;
									count++;
							}
					average /= count;
				}
				*/
				
				// increment delays
				modeChangeDelay++;
				editModeChangeDelay++;
								
				// handle gestures
				if(m_Frame.Gestures().Count > 0) {					
					for(int g = 0; g < m_Frame.Gestures().Count; g++)
					{
						Gesture gest = m_Frame.Gestures()[g];
						switch (gest.Type) {
						case Gesture.GestureType.TYPECIRCLE:
							//Handle circle gestures
							currentGestureText = "Circle";
							
							// create new circle gesture and transform accordingly
							CircleGesture circle = new CircleGesture(gest);
							bool isClockwise = false;
							if(circle.Normal.z < 0) {
								isClockwise = true;
							}
							if(currentMode.Equals(Modes.leapEdit)) {
								if(currentEditMode.Equals(EditModes.rotate)) {					
									rotateObject(isClockwise);
								}
								else if(currentEditMode.Equals(EditModes.scale)) {
									scaleObjectCircleGesture(isClockwise);
								}
							}
							
							float turns = circle.Progress;
							circleCountText = turns.ToString();
							break;
						case Gesture.GestureType.TYPEKEYTAP:
							//Handle key tap gestures
							currentGestureText = "Key Tap";
							
							// only change mode after a sufficient delay
							if(modeChangeDelay > 20) {
								// switch modes
								if(currentMode.Equals(Modes.leapSelection))	{
									currentMode = Modes.leapEdit;
									currentModeText = "Edit";
								}
								else {
									currentMode = Modes.leapSelection;
									currentModeText = "Selection";
								}
								modeChangeDelay = 0;
							}
							break;
						case Gesture.GestureType.TYPESCREENTAP:
							//Handle screen tap gestures
							currentGestureText = "Screen Tap";
							
							// only change mode after a sufficient delay
							if(currentMode.Equals(Modes.leapEdit)) {
								if(editModeChangeDelay > 50) {
									// Change edit mode
									if(currentEditMode.Equals(EditModes.rotate)) {
										currentEditMode = EditModes.translate;
										currentEditModeText = "Translate";
									}
									else if(currentEditMode.Equals(EditModes.translate)) {
										currentEditMode = EditModes.scale;
										currentEditModeText = "Scale";
									}
									else {
										currentEditMode = EditModes.rotate;
										currentEditModeText = "Rotate";
									}
									// reset delay
									editModeChangeDelay = 0;
								}
							}
							break;
						case Gesture.GestureType.TYPESWIPE:
							//Handle swipe gestures
							currentGestureText = "Swipe";
							
							//CreateCube();
							
							/*
							if(currentEditMode.Equals(EditModes.translate)) {
							// create a new swipe gesture
								SwipeGesture swipe = new SwipeGesture(gest);
								Leap.Vector swipeDirection = swipe.Direction;
								//Debug.Log(swipeDirection.ToString());
								translateObject(swipeDirection.x/5.0f, swipeDirection.y/5.0f, swipeDirection.z/5.0f);
							}
							*/
							break;
							default:
							//Handle unrecognized gestures
							
							break;
						}
					}
				}
				
				// handle scaling
				/*
				if(currentEditMode.Equals(EditModes.scale)) {
					float scaleFactor = m_Frame.ScaleFactor(m_controller.Frame(10));
					scaleObject(scaleFactor);
					scaleFactorText = scaleFactor.ToString();
				}
				*/
				
				// handle translation
				if(currentMode.Equals(Modes.leapEdit)) {
					if(currentEditMode.Equals(EditModes.translate)) {
						positionObject(handPos.x/15.0f, handPos.y/15.0f, handPos.z/15.0f);
					}
				}
														
				// update the GUI
				Repaint();
			}
			
			
			//DispatchLostEvents(Frame, lastFrame);
			//DispatchFoundEvents(Frame, lastFrame);
			//DispatchUpdatedEvents(Frame, lastFrame);
		}
	}
	
	// rotates selected object(s)
	void rotateObject(bool isClockwise) {
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
			GameObject currentAsset = Selection.activeGameObject;
			Vector3 translateVector = new Vector3(transX, transY, transZ);
			currentAsset.transform.Translate(translateVector);
		}
	}
	
	void positionObject(float posX, float posY, float posZ) {
		if(Selection.activeGameObject != null) {
			GameObject currentAsset = Selection.activeGameObject;
			Vector3 positionVector = new Vector3(posX, posY, posZ);
			currentAsset.transform.position = positionVector;
		}
	}
	/*
	private GameObject CreateHand() {
		//GameObject hand = new GameObject("hand");
		if(handTracker == null) {
			handTracker = GameObject.CreatePrimitive(PrimitiveType.Sphere);
			handTracker.transform.position = new Vector3(0, 0, 0);
		}
		//hand.transform.parent = parent.transform;
		
		if( index == 0 )
			hand.name = "Primary Hand";
		else if( index == 1 )
			hand.name = "Secondary Hand";
		else
			hand.name = "Unknown Hand";
		
		return handTracker;
	}
	*/
	
	private GameObject CreateCube() {
		GameObject cube = GameObject.CreatePrimitive(PrimitiveType.Cube);
		Selection.activeGameObject = cube;
		
		return cube;
	}
	/*
	private GameObject CreatePalm(GameObject parent, int index)
	{
		GameObject palm = Instantiate(m_PalmTemplate) as GameObject;
		palm.name = "Palm " + index;
		palm.transform.parent = parent.transform;
		
		return palm;
	}
	*/
}


