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
	static float handXCoordinate = 0;
	static float handYCoordinate = 0;

	string myString = "Hello World";
	bool groupEnabled;
	bool myBool = true;
	float myFloat = 1.23f;
	
	// Add menu named "Leap Motion" to the Window menu
	[MenuItem ("Window/Leap Control")]
	static void Init () {
		// Get existing open window or if none, make a new one:
		LeapWindow window = (LeapWindow)EditorWindow.GetWindow (typeof (LeapWindow));
		//controller = new Controller();
		
		// enable gestures 
		m_controller.EnableGesture(Gesture.GestureType.TYPECIRCLE, true);
	}

	// actual window controls go here
	void OnGUI () {
		GUILayout.Label ("Base Settings", EditorStyles.boldLabel);
			myString = EditorGUILayout.TextField ("Text Field", myString);
			
		groupEnabled = EditorGUILayout.BeginToggleGroup ("Optional Settings", groupEnabled);
			myBool = EditorGUILayout.Toggle ("Toggle", myBool);
			myFloat = EditorGUILayout.Slider ("Slider", myFloat, -3, 3);
		EditorGUILayout.EndToggleGroup ();
		
		
		// for GUI only interactions, pressing a key
		Event e = Event.current;
				
		switch (e.type)
        {
            case EventType.keyDown:
                {
                    if (Event.current.keyCode == (KeyCode.A))
                    {
                        Debug.Log("a was pressed");
						manipulateObj();
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
				
				Frame lastFrame = m_Frame == null ? Frame.Invalid : m_Frame;
				m_Frame	= m_controller.Frame();
				
				if(m_Frame.Gestures().Count > 0) {
					//Debug.Log("Detected gesture!");
					//Gesture g = m_Frame.Gestures()[0];
					
					for(int g = 0; g < m_Frame.Gestures().Count; g++)
					{
						switch (m_Frame.Gestures()[g].Type) {
						case Gesture.GestureType.TYPECIRCLE:
							//Handle circle gestures
							//Debug.Log("Circle gesture detected!");
							manipulateObj();
							break;
						case Gesture.GestureType.TYPEKEYTAP:
							//Handle key tap gestures
							break;
						case Gesture.GestureType.TYPESCREENTAP:
							//Handle screen tap gestures
							break;
						case Gesture.GestureType.TYPESWIPE:
							//Handle swipe gestures
							break;
							default:
							//Handle unrecognized gestures
							break;
						}
					}
					/*
					if (g.Type.equals("Gesture.GestureType.TYPECIRCLE")) {
						Debug.Log("Circle gesture detected!");
					}
					*/
				}
			}
			
			
			//DispatchLostEvents(Frame, lastFrame);
			//DispatchFoundEvents(Frame, lastFrame);
			//DispatchUpdatedEvents(Frame, lastFrame);
		}
	}
	
	void manipulateObj() {
		GameObject currentAsset = Selection.activeGameObject;
		currentAsset.transform.Rotate(Vector3.up*1);
	}
}