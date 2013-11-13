/******************************************************************************\
* Copyright (C) Leap Motion, Inc. 2011-2013.                                   *
* Leap Motion proprietary and  confidential.  Not for distribution.            *
* Use subject to the terms of the Leap Motion SDK Agreement available at       *
* https://developer.leapmotion.com/sdk_agreement, or another agreement between *
* Leap Motion and you, your company or other organization.                     *
\******************************************************************************/
using UnityEngine;
using UnityEditor;
using System.Collections;

//This relatively simple classis added to fingertip objects by the LeapUnityBridge,
//which allows our LeapSelectionController to be notified when a finger collides with any
//object tagged as 'Touchable'

[ExecuteInEditMode]
public class LeapFingerCollisionDispatcher : MonoBehaviour {
//public class LeapFingerCollisionDispatcher : Editor {
	
	const float kHitDistance = 10.0f;
	
	void OnTriggerEnter(Collider other)
	{		
		// only collide with the primary hand
		if( gameObject.transform.parent.tag == "PrimaryHand" && other.tag == "Touchable")
		{
			LeapUnitySelectionController.Get().OnTouched(gameObject, other);
				
			// only set new active object after a certain delay
			GameObject leapController = GameObject.FindWithTag("LeapController");
			LeapUnityBridge lub = (LeapUnityBridge) leapController.GetComponent(typeof(LeapUnityBridge));
			if(lub.selectionDelay > 55 && lub.currentMode.Equals(LeapUnityBridge.Modes.leapSelection)) 
			{
				// Sets collided object as selected
				if(lub.canSelectMultiple) 
				{
					Object[] newSelection = new GameObject[Selection.objects.Length + 1];
					for(int i = 0; i < Selection.objects.Length; i++) 
					{
						newSelection[i] = Selection.objects[i];
					}
					newSelection[Selection.objects.Length] = other.gameObject;
					Selection.objects = newSelection;
				}
				else Selection.activeGameObject = other.gameObject;
				lub.selectionDelay = 0;
			}
		}
	}
	
	void OnTriggerExit(Collider other)
	{
		// only collide with the primary hand
		if( gameObject.transform.parent.tag == "PrimaryHand" && other.tag == "Touchable" )
		{
			LeapUnitySelectionController.Get().OnStoppedTouching(gameObject, other);	
		}
	}
	
	void FixedUpdate()
	{
		//Debug.Log("COLLIDER UPDATING");
		if( gameObject.collider.enabled )
		{
			Debug.DrawRay(transform.position, transform.forward, Color.green);
			RaycastHit hit;
			if( Physics.Raycast(transform.position, transform.forward, out hit, 20.0f) )
			{
				LeapUnitySelectionController.Get().OnRayHit(hit);	
			}
		}
	}
}