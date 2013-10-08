// Eric Lee 
// 9/28/13
// Custom Leap Editor Window
using UnityEngine;
using UnityEditor;
using Leap;
using System.Collections;

// Window derives from EditorWindow
public class LeapWindow : EditorWindow {
	// Controller provides main interaction between Leap and the app (Unity in this case)
	static Leap.Controller 		m_controller	= new Leap.Controller();
	static Leap.Frame			m_Frame			= null;
	
	// coordinates of the hand
	//static float handXCoordinate = 0;
	//static float handYCoordinate = 0;
	
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
	/*
	bool groupEnabled;
	bool myBool = true;
	float myFloat = 1.23f;
	*/
	
	// delays
	static int modeChangeDelay = 0;
	static int editModeChangeDelay = 0;
	
	// Add menu named "Leap Motion" to the Window menu
	[MenuItem ("Window/Leap Control")]
	static void Init () {
		// Get existing open window or if none, make a new one:
		LeapWindow window = (LeapWindow)EditorWindow.GetWindow (typeof (LeapWindow));
		window.minSize = new Vector2(500, 500);
		//controller = new Controller();
		
		// enable gestures 
		m_controller.EnableGesture(Gesture.GestureType.TYPECIRCLE);
        m_controller.EnableGesture(Gesture.GestureType.TYPEKEYTAP);
        m_controller.EnableGesture(Gesture.GestureType.TYPESCREENTAP);
        m_controller.EnableGesture(Gesture.GestureType.TYPESWIPE);
		
		
		// init in selection mode
		currentMode = Modes.leapSelection;
		currentEditMode = EditModes.rotate;
	}

	// actual window controls go here
	void OnGUI () {
	
		GUILayout.Label ("Leap Unity Controller", EditorStyles.boldLabel);
		EditorGUILayout.LabelField ("Current mode", currentModeText);
		EditorGUILayout.LabelField ("Current edit mode", currentEditModeText);
		EditorGUILayout.LabelField ("Current frame", currentFrameText);
		EditorGUILayout.LabelField ("Leap FPS", currentFPSText);
		EditorGUILayout.LabelField ("Number of hands", numHandsText);
		EditorGUILayout.LabelField ("Number of fingers", numFingersText);
		EditorGUILayout.LabelField ("Hand Position", hand1PosText);
		EditorGUILayout.LabelField ("Hand Normal", hand1NormalText);
		EditorGUILayout.LabelField ("Hand Velocity", hand1VelocityText);
		EditorGUILayout.LabelField ("Circle gesture", currentGestureText);
		EditorGUILayout.LabelField ("Circle count", circleCountText);
		EditorGUILayout.LabelField ("Scale factor", scaleFactorText);
			//myString = EditorGUILayout.TextField ("Text Field", myString);
			/*
		groupEnabled = EditorGUILayout.BeginToggleGroup ("Optional Settings", groupEnabled);
			myBool = EditorGUILayout.Toggle ("Toggle", myBool);
			myFloat = EditorGUILayout.Slider ("Slider", myFloat, -3, 3);
		EditorGUILayout.EndToggleGroup ();
		*/
		
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
                    break;
                }
        }
	}
	
	void OnSceneGUI() {
		Event e = Event.current;
				
		switch (e.type)
        {
            case EventType.keyDown:
                {
					// select object
					if (Event.current.keyCode == (KeyCode.P))
                    {
						Debug.Log("P was pressed");
						// scale larger
                        //Debug.Log(e.mousePosition.ToString());
						//Ray ray = HandleUtility.GUIPointToWorldRay(e.mousePosition);
						Ray ray = HandleUtility.GUIPointToWorldRay(e.mousePosition);
						RaycastHit hit = new RaycastHit();
						if (Physics.Raycast(ray, out hit, 1000.0f)) {
							//Debug.Log("hit!");
							Debug.Log(hit.point.ToString());
						}
                    }
                    break;
                }
        }
	}
	
	public static Leap.Frame Frame
	{
		get { return m_Frame; }
	}
	
	// update function
	void Update () {
		
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
}


