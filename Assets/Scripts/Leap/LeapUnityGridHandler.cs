/******************************************************************************\
* Eric Lee
* Unity Grid Asset Handler
* 
\******************************************************************************/

using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using Leap;

[ExecuteInEditMode]
// Ground plane should be centered at 0,0,0
public class LeapUnityGridHandler : MonoBehaviour 
{
	public bool isSelected = false;

	// hovering vars
	public static float hoverAmount = 30.0f;
	private bool isHovered = false;
	public bool isGrounded = true;
	
	// wiggle vars
	private bool wiggleCW = true;
	private int wiggleLimit = 10;
	private int wiggleCount = 0;
	private float initialXRot = 0.0f;
	
	public float rotBuffer = 0.0f;
	public float xBuffer = 0.0f;
	public float yBuffer = 0.0f;
	public float zBuffer = 0.0f;
	
	// distinguish between selection by hand and selection by mouse
	private bool selectedByHand = false;
	
	LeapUnityGrid theGrid;
	
	public void setSelectedByHand(bool selected) 
	{
		selectedByHand = selected;
	}

	void Update()
	{
		// raise the object off the ground a little bit when translating
		// only when selected using the Leap
		if(isSelected && selectedByHand) 
		{
			if(!isHovered)
			{
				yBuffer = gameObject.transform.position.y + hoverAmount;
				isHovered = true;
				isGrounded = false;
				
				// save the initial x rotation
				initialXRot = gameObject.transform.eulerAngles.x;
			}
			// Make object wiggle
			if(wiggleCW)
			{	
				//gameObject.transform.Rotate(Vector3.right * 1);
				//gameObject.transform.rotation = Quaternion.AngleAxis(1, Vector3.right);
				//Quaternion rot = gameObject.transform.rotation;
				//gameObject.transform.rotation = rot * Quaternion.Euler(2, 0, 0);
				gameObject.transform.Rotate(2, 0, 0);
				wiggleCount++;
				if(wiggleCount > wiggleLimit) 
				{
					wiggleCW = false;
					wiggleCount = 0;
				}
			}
			else 
			{
				//gameObject.transform.Rotate(Vector3.right * -1);
				//gameObject.transform.rotation = Quaternion.AngleAxis(-1, Vector3.right);
				//Quaternion rot = gameObject.transform.rotation;
				//gameObject.transform.rotation = rot * Quaternion.Euler(-2, 0, 0);
				gameObject.transform.Rotate(-2, 0, 0);
				wiggleCount++;
				if(wiggleCount > wiggleLimit) 
				{
					wiggleCW = true;
					wiggleCount = 0;
				}
			}
			
			// find the grid object
			GameObject ground = GameObject.FindWithTag("Ground");
			if(ground != null) theGrid = ground.GetComponent<LeapUnityGrid>();
			
			
			// snap position to the center of the closest grid center
			float x = Mathf.Floor(xBuffer/theGrid.width)*theGrid.width + theGrid.width/2.0f;
			float z = Mathf.Floor(zBuffer/theGrid.height)*theGrid.height + theGrid.height/2.0f;
			
			// clamp values if needed
			if(x >= theGrid.xMax) x = theGrid.xMax;
			else if(x <= theGrid.xMin) x = theGrid.xMin;
			if(z >= theGrid.zMax) z = theGrid.zMax;
			else if(z <= theGrid.zMin) z = theGrid.zMin;
			
			//Debug.Log(x);
			// raise the object off the ground a little bit when translating
			gameObject.transform.position = new Vector3(x, yBuffer, z);
			
		}
		else
		{
			if(!isGrounded)
			{
				yBuffer = gameObject.transform.position.y - hoverAmount;
				isHovered = false;
				isGrounded = true;
				
				gameObject.transform.position = new Vector3(gameObject.transform.position.x, yBuffer, gameObject.transform.position.z);
			}
			
			// reset wiggle rot
			//gameObject.transform.rotation = Quaternion.Euler(initialXRot, gameObject.transform.eulerAngles.y, gameObject.transform.eulerAngles.z);
			gameObject.transform.rotation = Quaternion.Euler(0.0f, gameObject.transform.eulerAngles.y, 0.0f); // hack, resetting x and z to 0 always
			
			// reset selectedByHand
			selectedByHand = false;
		}
	}
}