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
	public static float hoverAmount = 50.0f;
	private bool isHovered = false;
	public bool isGrounded = true;
	
	// wiggle vars
	private bool wiggleCW = true;
	private int wiggleLimit = 10;
	private int wiggleCount = 5;
	//private float initialXRot = 0.0f;
	
	// temp vars that store where the Leap translates the object too then 
	public float rotBuffer = 0.0f;
	public float xBuffer = 0.0f;
	public float yBuffer = 0.0f;
	public float zBuffer = 0.0f;
	
	// distinguish between selection by hand and selection by mouse
	private bool selectedByHand = false;
	
	// Object reference to the one grid for the scene
	private LeapUnityGrid theGrid;
	
	
	// Setters
	public void setSelectedByHand(bool selected) 
	{
		selectedByHand = selected;
	}
	
	// Activated when other collider collides with this object (as long as this collider has Is Trigger set)
	void OnTriggerEnter(Collider other)
	{
		//if(!other.transform.root.tag.Equals("Hands"))
		if(!other.ToString().Equals("PalmSphere") && !other.ToString().Equals("Palm 0") && !other.ToString().Equals("Palm 1") 
			&& !other.ToString().Equals("Palm 0 (UnityEngine.SphereCollider)") && !other.gameObject.tag.Equals("CollidableGO"))
		{
			Debug.Log("collided with plane");
			isGrounded = true;
			
			// play audio
			GameObject audioPlayer = GameObject.FindWithTag("AudioPlayer");
			if(audioPlayer != null) 
			{ 
				AudioSource ap = audioPlayer.GetComponent<AudioSource>(); 
				// Playing it
				if(ap != null)
				{	
					Debug.Log("Playing audio");
					ap.Play(); 
				}
			}	
		}
	}

	
	// Called continuously for whatever gameobject this is attached too
	// Handles updating position when moving using the Leap
	void Update()
	{
		// raise the object off the ground a little bit when translating
		// only when selected using the Leap
		if(isSelected && selectedByHand) 
		{
			if(!isHovered)
			{
				// hover object and update state
				yBuffer = gameObject.transform.position.y + hoverAmount;
				isHovered = true;
				isGrounded = false;
				
				// save the initial x rotation
				//initialXRot = gameObject.transform.eulerAngles.x;
			}
			// Make object wiggle
			if(wiggleCW)
			{	
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
			float x = Mathf.Floor(xBuffer/theGrid.getWidth())*theGrid.getWidth() + theGrid.getWidth()/2.0f;
			float z = Mathf.Floor(zBuffer/theGrid.getHeight())*theGrid.getHeight() + theGrid.getHeight()/2.0f;
			
			// clamp values if needed
			if(x >= theGrid.xMax) x = theGrid.xMax;
			else if(x <= theGrid.xMin) x = theGrid.xMin;
			if(z >= theGrid.zMax) z = theGrid.zMax;
			else if(z <= theGrid.zMin) z = theGrid.zMin;
			
			// raise the object off the ground a little bit when translating
			gameObject.transform.position = new Vector3(x, yBuffer, z);		
		}
		else
		{
			if(!isGrounded)
			{
				// drop object until it collides with something and onTrigger is hit, causing isGrounded to be true
				yBuffer = gameObject.transform.position.y - 2.5f;
				isHovered = false;
				
				gameObject.transform.position = new Vector3(gameObject.transform.position.x, yBuffer, gameObject.transform.position.z);
				// lower object back down and update state
				/*
				yBuffer = gameObject.transform.position.y - hoverAmount;
				isHovered = false;
				isGrounded = true;
				
				gameObject.transform.position = new Vector3(gameObject.transform.position.x, yBuffer, gameObject.transform.position.z);
				*/
			}
			
			// reset wiggle rot
			//gameObject.transform.rotation = Quaternion.Euler(initialXRot, gameObject.transform.eulerAngles.y, gameObject.transform.eulerAngles.z);
			gameObject.transform.rotation = Quaternion.Euler(0.0f, gameObject.transform.eulerAngles.y, 0.0f); // hack, resetting x and z to 0 always
			wiggleCount = 5;
			
			// reset selectedByHand
			selectedByHand = false;
		}
	}
}