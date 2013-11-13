/******************************************************************************\
* Eric Lee
* Unity Grid Asset Handler
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
	
	LeapUnityGrid theGrid;

	void Update()
	{
		// raise the object off the ground a little bit when translating
		if(isSelected) 
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
			
		}
		else
		{
			if(!isGrounded)
			{
				yBuffer = gameObject.transform.position.y - hoverAmount;
				isHovered = false;
				isGrounded = true;
			}
			
			// reset wiggle rot
			//gameObject.transform.rotation = Quaternion.Euler(initialXRot, gameObject.transform.eulerAngles.y, gameObject.transform.eulerAngles.z);
			gameObject.transform.rotation = Quaternion.Euler(0.0f, gameObject.transform.eulerAngles.y, 0.0f); // hack, resetting x and z to 0 always
		}
		// find the grid object
		GameObject ground = GameObject.FindWithTag("Ground");
		if(ground != null) theGrid = ground.GetComponent<LeapUnityGrid>();
		
		/*
		// snap rotation to nearest 90 degree
		float yAngle = rotBuffer % 360;
		if(yAngle >= 0 && yAngle <= 45)
		{
			gameObject.transform.rotation = Quaternion.AngleAxis(0.0f, Vector3.up);
		}
		else if(yAngle > 45 && yAngle <= 135)
		{
			gameObject.transform.rotation = Quaternion.AngleAxis(90.0f, Vector3.up);
		}
		else if(yAngle > 135 && yAngle <= 225)
		{
			gameObject.transform.rotation = Quaternion.AngleAxis(180.0f, Vector3.up);
		}
		else if(yAngle > 225 && yAngle <= 315)
		{
			gameObject.transform.rotation = Quaternion.AngleAxis(270.0f, Vector3.up);
		}
		else
		{
			gameObject.transform.rotation = Quaternion.AngleAxis(0.0f, Vector3.up);
		}	
		*/
		
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
}