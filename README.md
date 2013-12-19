Unity-Leap
==========
Eric Lee
University of Pennsylvania
DMD Senior Project

Project blog: http://environmentsthroughmotion.blogspot.com/

Project proposal: https://fling.seas.upenn.edu/~cis497/dynamic/projects2014/proposals/eric_lee_proposal.pdf



Directions for use:
Please run on WINDOWS machine. To use, open Assets\Test_scene.unity
Have the Leap motion controller connected, and in Unity, go to Window -> Leap Control
The Unity Leap controller should appear and display various data from the Leap. 
Move your hand around on the Leap to have a yellow marker appear in the scene that tracks where you hand is.
Hover over objects to select them, press S to toggle between selection and translation mode. Press S again while
in translation mode to drop the object and enable selection of another object.
Translation mode - simply move your hand around and the game object will follow your hand (it will not go past the 
boundaries of the scene)
Pressing Z will also deselect the object.
Hit D to enable/disable Leap control.
Hit G to enable/disable grid resizing. When grid resizing is enabled, create circle gestures with your finger to
increase or decrease the size of the grid which will decrease or increase the sensitivity of the translation 
respectively.
Hit 1 to create a new game asset in the scene and drop it somewhere (it is a chair in the demo scene but can be remapped
by assigning a prefab to the variable in the UnityLeapBridge game object.
Hit 2 to enable/disable rotation mode and rotate your hand to rotate the game object.
Hit 3 to enable/disable scaling mode and open or close your hand to grow or shrink the object respectively.

Note that throughout use of the Leap, traditional Unity controls with mouse and keyboard will always be available.

The Leap-Unity editor window has a Help button that will display a concise version of these directions.

Troubleshooting: 
If errors appear when loading the window for the first time, please go into the LeapWindow.cs file, make a trivial change
so that the file is changed, save, then reload the window. Bug is slated to be fixed. 