/******************************************************************************\
* Eric Lee
* Unity Grid
\******************************************************************************/

using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using Leap;

[ExecuteInEditMode]
// Ground plane should be centered at 0,0,0
public class LeapUnityGrid : MonoBehaviour 
{
	public float cellSize = 10.0f;
	public float xMin = -150.0f;
	public float xMax = 150.0f;
	public float zMin = -100.0f;
	public float zMax = 100.0f;
	
	void Update()
	{
		// dynamically set x and z min and max
		// TODO: move these somewhere else in the script since a lot of redundant work is being done
		/*
		xMin = -((gameObject.transform.localScale.x)/2.0f);
		xMax = -xMin;
		zMin = -((gameObject.transform.localScale.z)/2.0f);
		zMax = -zMin;
		*/
		
	}
}