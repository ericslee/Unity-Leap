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
	public float rotBuffer = 0.0f;

	void Update()
	{
		// snap rotation to nearest 90 degree
		//float yAngle = gameObject.transform.localEulerAngles.y;
		
		float yAngle = rotBuffer;
		yAngle = yAngle % 360;
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
		
		
		//float increment = gameObject.transform.localEulerAngles.y % 90;
		/*
		float increment = rotBuffer % 90;
		if(increment != 0) 
		{
			Debug.Log(increment);
			float diff = 90 - increment;
			if(diff <= 45.0f)
			{
				//float angle = gameObject.transform.rotation.eulerAngles.y - diff;
				float angle = rotBuffer - diff;
				gameObject.transform.rotation = Quaternion.AngleAxis(angle, Vector3.up);
			}
			else
			{
				float angle = rotBuffer + (90 - diff);
				gameObject.transform.rotation = Quaternion.AngleAxis(angle, Vector3.up);
			}
			//gameObject.transform.localEulerAngles.y = gameObject.transform.localEulerAngles.y + increment;
			//float rotAngle = 0.0f;
			//gameObject.transform.rotation = Quaternion.AngleAxis(rotAngle, Vector3.up);
		}
		*/
		
		
	}
}