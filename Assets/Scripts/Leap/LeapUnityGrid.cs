/******************************************************************************\
* Eric Lee
* Unity Grid
*
* Attach to the ground plane of the scene to control the grid of the system
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
	
	public float width = 32.0f;
    public float height = 32.0f;
	
	public bool canDraw = true;
	
	public Texture selectionTexture;
	
	void Start () 
    {
	
    }
	
	void Update()
	{
		
	}
	
	/********************************
	* Used to draw in the editor
	********************************/
	void OnDrawGizmos()
    {
		// only draw when leap is active an there are object(s) selected
		if(canDraw)
		{
			// save the camera's current position
			Vector3 pos = Camera.current.transform.position;
			
			Gizmos.color = Color.cyan;
		 
			// draw grid
			for (float z = pos.z - 800.0f; z < pos.z + 800.0f; z+= height)
			{
				Gizmos.DrawLine(new Vector3(-1000.0f, 15.5f, Mathf.Floor(z/height) * height),
								new Vector3(1000.0f, 15.5f, Mathf.Floor(z/height) * height));
			}
			
			for (float x = pos.x - 1200.0f; x < pos.x + 1200.0f; x+= width)
			{
				Gizmos.DrawLine(new Vector3(Mathf.Floor(x/width) * width, 15.5f, -1000.0f),
								new Vector3(Mathf.Floor(x/width) * width, 15.5f, 1000.0f));
			}
		}
    }
	
	public void SetDraw(bool active) 
	{
		canDraw = active;
	}
	
	
	/********************************
	* Getters
	********************************/
	public float getWidth() { return width; }
	public float getHeight() { return height; }
	
	/********************************
	* Setters
	********************************/
	public void setWidth(float w) { width += w; }
	public void setHeight(float h) { height += h; }
}