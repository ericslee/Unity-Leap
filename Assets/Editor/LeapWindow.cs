// Eric Lee 
// 9/28/13
// Custom Leap Editor Window
using UnityEngine;
using UnityEditor;
using Leap;

// Window derives from EditorWindow
public class LeapWindow : EditorWindow {
	static Leap.Controller 		m_controller	= new Leap.Controller();
	static Leap.Frame			m_Frame			= null;
	//Controller controller;
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
	}

	// actual window controls go here
	void OnGUI () {
		GUILayout.Label ("Base Settings", EditorStyles.boldLabel);
			myString = EditorGUILayout.TextField ("Text Field", myString);
			
		groupEnabled = EditorGUILayout.BeginToggleGroup ("Optional Settings", groupEnabled);
			myBool = EditorGUILayout.Toggle ("Toggle", myBool);
			myFloat = EditorGUILayout.Slider ("Slider", myFloat, -3, 3);
		EditorGUILayout.EndToggleGroup ();
	}
	
	public static Leap.Frame Frame
	{
		get { return m_Frame; }
	}
	
	// update function
	void Update () {
		//LeapInput.Update();
		
		/*
		if(Time.time % 1000 == 0) {
			Debug.Log("Updating");
		}
		*/
		if( m_controller != null )
		{
			
			Frame lastFrame = m_Frame == null ? Frame.Invalid : m_Frame;
			m_Frame	= m_controller.Frame();
			
			Debug.Log(m_Frame);
			
			//DispatchLostEvents(Frame, lastFrame);
			//DispatchFoundEvents(Frame, lastFrame);
			//DispatchUpdatedEvents(Frame, lastFrame);
		}
	}
}