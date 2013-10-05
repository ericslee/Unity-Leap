//Example Simple Window
// by Gawain Doell, 2012
// Some code borrowed from the Unity manual examples.
//
// Save this code into this path to make it work:
// Project Folder/Assets/Editor
//
// The script must be named SimpleWin.js
// Any other name will throw an error.

// we extend the EditorWindow class, this allows
// us to create a new window that does what we want
// to do.

class SimpleWin extends EditorWindow {

 //We'll create a string, and a few true/false flags to show how useful
 // this can be.  These values are attached to our editor window interface.
 var myString = "Hello Everyone";
 var myBool = true;
 var myFloat = 1.23;
 
 //add menu named Simple Window to Window Menu
 @MenuItem ("Window/Simple Window")
 
 static function ShowWindow () {
 
  //Get existing open window or if none, make a new one
  //The EditorWindow.GetWindow function takes care of making the
  // window if it doesn't exist yet, and if it does, Unity's
  // default behavior will be to grab the existing window.
  
  EditorWindow.GetWindow (SimpleWin);
  
  //The "SimpleWin" part of the above line tells Unity which script
  // in the Editor folder to spawn.  It must be the name of
  // a valid Editor Script, or Unity will toss an error.
  //For example, if you save this script as Foo.js instead of
  // SimpleWin.js, you would have to edit the above to say
  //
  //  EditorWindow.GetWindow (Foo);
  //
 }
 
 function OnGUI () {
  //actual window code goes here
  
  //Anything supported by a normal OnGUI event can go here
  //The main difference is we want to use the
  //EditorGUILayout object instead of the in game GUI.
  
  //Show a label with our custom string in it
  GUILayout.Label ("Base Settings", EditorStyles.boldLabel);
  myString = EditorGUILayout.TextField ("Text Field",myString);
  
  //Show a Editor checkbox that allows us to
  //control the value of myBool
  myBool = EditorGUILayout.Toggle ("Toggle",myBool);
  
  //Show a slider to allow us to set
  //myFloat to anything we want
  myFloat = EditorGUILayout.Slider ("Slider",myFloat,-3,3);
 }
}