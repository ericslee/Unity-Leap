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

	public static float hoverAmount = 30.0f;
	private bool isHovered = false;
	private bool isGrounded = true;
	public float rotBuffer = 0.0f;
	public float xBuffer = 0.0f;
	public float yBuffer = 0.0f;
	public float zBuffer = 0.0f;
	
	LeapUnityGrid theGrid;

	void Update()
	{
		if(isSelected) 
		{
			if(!isHovered)
			{
				yBuffer = gameObject.transform.position.y + hoverAmount;
				isHovered = true;
				isGrounded = false;
			}
		}
		else if(!isGrounded)
		{
			yBuffer = gameObject.transform.position.y - hoverAmount;
			isHovered = false;
			isGrounded = true;
		}
		// find the grid object
		GameObject ground = GameObject.FindWithTag("Ground");
		theGrid = ground.GetComponent<LeapUnityGrid>();
		
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
		
		// snap position to the center of the closest grid center
		
		//float xPos = xBuffer % 10;
		//float zPos = zBuffer % 10;
		float snapInverse = 1/theGrid.cellSize;
		//Vector3 aligned = new Vector3(Mathf.Floor(xBuffer - xPos), gameObject.transform.position.y, Mathf.Floor(zBuffer - zPos));
		float x = Mathf.Round(xBuffer * snapInverse)/snapInverse;
		float z = Mathf.Round(zBuffer * snapInverse)/snapInverse; 
		//Vector3 aligned = new Vector3(Mathf.Floor(mousePos.x/grid.width)*grid.width + grid.width/2.0f , 0.0f);
		

		// clamp values if needed
		if(x >= theGrid.xMax) x = theGrid.xMax;
		else if(x <= theGrid.xMin) x = theGrid.xMin;
		if(z >= theGrid.zMax) z = theGrid.zMax;
		else if(z <= theGrid.zMin) z = theGrid.zMin;
		
		Debug.Log(x);
		// raise the object off the ground a little bit when translating
		gameObject.transform.position = new Vector3(x, yBuffer, z);
	}
}