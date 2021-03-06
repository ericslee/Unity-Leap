/******************************************************************************\
* Copyright (C) Leap Motion, Inc. 2011-2013.                                   *
* Leap Motion proprietary and  confidential.  Not for distribution.            *
* Use subject to the terms of the Leap Motion SDK Agreement available at       *
* https://developer.leapmotion.com/sdk_agreement, or another agreement between *
* Leap Motion and you, your company or other organization.                     *
\******************************************************************************/

/******************************************************************************\
* Eric Lee
* Unity Leap
*
* Built and modified on top of existing Leap code - this class is used to communicate between the 
* Leap Window and the actual game environment.
\******************************************************************************/

using UnityEditor;
using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class LeapUnityBridge : MonoBehaviour
{
	/// <summary>
	/// These values, set from the Inspector, set the corresponding fields in the
	/// LeapUnityExtension for translating vectors.
	/// </summary>
	public Vector3 m_LeapScaling = new Vector3(0.05f, 0.05f, 0.05f);
	public Vector3 m_LeapOffset = new Vector3(0,0,0);
	
	public bool m_UseFixedUpdate = false; //If true, calls LeapInput.Update from FixedUpdate instead of Update
	public bool m_ShowInspectorFingers = true; //If false, hides the hand game objects in the inspector.
	public GameObject m_InputParent; //The parent of the hand objects for motion.  Useful 
	public GameObject m_FingerTemplate; //The template object to use for the fingers. Must have Tags set correctly
	public GameObject m_PalmTemplate; //The template object to use for the palms.
	
	/// <summary>
	/// The materials to use for the different hands.
	/// </summary>
	public Material m_PrimaryHandMaterial; 
	public Material m_SecondaryHandMaterial;
	public Material m_UnknownHandMaterial;
	
	private static bool m_Created = false;
	
	public int selectionDelay = 56;
	// current mode of the Leap interface
	public enum Modes { leapSelection, leapEdit };
	public enum EditModes { translate, scale, rotate };
	public Modes currentMode;
	public EditModes currentEditMode;
	public bool leapActive = true;
	public bool canSelectMultiple = false;
	// was the current selection selected from Leap controls
	private bool selectedWithLeap = false;
	
	// Hot key game assets
	public GameObject hotkey1;
	public GameObject hotkey2;
	public GameObject hotkey3;
	public GameObject hotkey4;
	public GameObject hotkey5; // maybe reserve this one for tree building
	
	public void setUp() 
	{
		if( m_Created )
		{
			Debug.Log("A LeapUnityBridge has already been created!");
		}
		m_Created = true;
		Leap.UnityVectorExtension.InputScale = m_LeapScaling;
		Leap.UnityVectorExtension.InputOffset = m_LeapOffset;
		
		if( !m_FingerTemplate )
		{
			Debug.LogError("No Finger template set!");
			return;
		}
		if( !m_PalmTemplate )
		{
			Debug.LogError("No Palm template set!");
			return;
		}
		CreateSceneHands();
	}
	
	public void Awake()
	{
		/*
		if( m_Created )
		{
			Debug.Log("A LeapUnityBridge has already been created!");
		}
		m_Created = true;
		Leap.UnityVectorExtension.InputScale = m_LeapScaling;
		Leap.UnityVectorExtension.InputOffset = m_LeapOffset;
		
		if( !m_FingerTemplate )
		{
			Debug.LogError("No Finger template set!");
			return;
		}
		if( !m_PalmTemplate )
		{
			Debug.LogError("No Palm template set!");
			return;
		}
		CreateSceneHands();
		*/
	}

	public void OnDestroy()
	{
		m_Created = false;	
	}
	
	void FixedUpdate()
	{
		if( m_UseFixedUpdate )
			LeapInput.Update();
	}
	
	void Update()
	{
		if(!leapActive)
		{
			// To do: turn off renderer
		}
		else
		{
			// increment delay
			selectionDelay++;
			
			if(m_Created) 
			{
				if( !m_UseFixedUpdate )
					LeapInput.Update();
				
				if( Input.GetKeyDown(KeyCode.T) )
					LeapInput.EnableTranslation = !LeapInput.EnableTranslation;
				if( Input.GetKeyDown(KeyCode.R) )
					LeapInput.EnableRotation = !LeapInput.EnableRotation;
				if( Input.GetKeyDown(KeyCode.S) )
					LeapInput.EnableScaling = !LeapInput.EnableScaling;
			}
		}
	}
	
	// alter scaling of hands
	public void SetLeapScaling(float x, float y, float z) 
	{
		m_LeapScaling = new Vector3(x, y, z);
		Leap.UnityVectorExtension.InputScale = m_LeapScaling;
	}
	
	// alter the transformation of the hands
	public void TransformHands(float transX, float transY, float transZ, float fowX, float fowY, float fowZ, Transform cameraTrans) 
	{
		GameObject hands = GameObject.FindWithTag("Hands");
		if(hands == null) {
			Debug.Log("No hands to transform");
			return;
		}
		// parent hands to perspective camera
		//if(!hands.transform
		hands.transform.parent = cameraTrans;
	}
	
	private void CreateSceneHands()
	{
		// check if hands already exist in the scene to avoid creating multiple hand game objects
		GameObject hands = GameObject.FindWithTag("Hands");
		if(hands != null) 
		{
			Debug.Log("Hands exist already");
			// For debugging purposes
			//Selection.activeGameObject = hands;
			return;
		}
		Debug.Log("Creating new hands");
		hands = new GameObject("Leap Hands");
		hands.tag = "Hands";
		
		/*
		if( m_InputParent )
		{
			hands.transform.parent = m_InputParent.transform;
		}
		else
		{*/
			//hands.transform.parent = transform;
		//}
		
		hands.AddComponent(typeof(LeapUnityHandController));
		LeapUnityHandController behavior = hands.GetComponent<LeapUnityHandController>();
		behavior.m_palms = new GameObject[2];
		behavior.m_fingers = new GameObject[10];
		behavior.m_hands = new GameObject[3]; //extra 'invalid' hand for grouping purposes
		behavior.m_materials = new Material[] { m_PrimaryHandMaterial, m_SecondaryHandMaterial, m_UnknownHandMaterial };
		
		for( int i = 0; i < behavior.m_hands.Length; i++ )
		{
			behavior.m_hands[i] = CreateHand(hands, i);	
		}
		for( int i = 0; i < behavior.m_fingers.Length; i++ )
		{
			behavior.m_fingers[i] = CreateFinger(behavior.m_hands[2], i);
		}
		for( int i = 0; i < behavior.m_palms.Length; i++ )
		{
			behavior.m_palms[i] = CreatePalm(behavior.m_hands[2], i);	
		}
		
		foreach( GameObject palm in GameObject.FindGameObjectsWithTag("Palm") )
		{
			Debug.Log ("adding component...");
			palm.AddComponent(typeof(LeapFingerCollisionDispatcher));	
		}
		
		foreach( GameObject fingerTip in GameObject.FindGameObjectsWithTag("FingerTip") )
		{
			Debug.Log ("adding component...");
			fingerTip.AddComponent(typeof(LeapFingerCollisionDispatcher));	
		}
		
		// For debugging purposes
		//Selection.activeGameObject = hands;
	}
	private GameObject CreateHand(GameObject parent, int index)
	{
		GameObject hand = new GameObject();
		hand.transform.parent = parent.transform;
		if( index == 0 ) 
		{
			hand.name = "Primary Hand";
			hand.tag = "PrimaryHand";
		}
		else if( index == 1 )
		{
			hand.name = "Secondary Hand";
			hand.tag = "SecondaryHand";
		}
		else
			hand.name = "Unknown Hand";
		
		return hand;
	}
	private GameObject CreateFinger(GameObject parent, int index)
	{
		GameObject finger = Instantiate(m_FingerTemplate) as GameObject;
		finger.transform.parent = parent.transform;
		finger.name = "Finger " + index;
		
		/*
		//finger.AddComponent<SphereCollider>();
		SphereCollider sphere = finger.GetComponent<SphereCollider>();
		if(sphere != null) 
		{
			sphere.enabled = true;
			sphere.isTrigger = true;
		}
		
		Rigidbody rb = finger.AddComponent<Rigidbody>(); // Add the rigidbody.
		rb.mass = 0.5f; // Set the GO's mass to 5 via the Rigidbody.
		rb.useGravity = false;
		//rb.collisionDetectionMode = CollisionDetectionMode.Continuous;
		rb.collisionDetectionMode = CollisionDetectionMode.ContinuousDynamic;
		rb.isKinematic = true;
		rb.interpolation = RigidbodyInterpolation.Interpolate;
		
		// add collision dispatcher script
		finger.AddComponent("LeapFingerCollisionDispatcher");
		*/
		return finger;
	}
	private GameObject CreatePalm(GameObject parent, int index)
	{
		GameObject palm = Instantiate(m_PalmTemplate) as GameObject;
		palm.name = "Palm " + index;
		palm.transform.parent = parent.transform;
		palm.tag = "Palm";
		
		//finger.AddComponent<SphereCollider>();
		SphereCollider sphere = palm.GetComponent<SphereCollider>();
		if(sphere != null) 
		{
			sphere.enabled = true;
			sphere.isTrigger = true;
		}
		
		Rigidbody rb = palm.AddComponent<Rigidbody>(); // Add the rigidbody.
		rb.mass = 0.5f; // Set the GO's mass to 5 via the Rigidbody.
		rb.useGravity = false;
		//rb.collisionDetectionMode = CollisionDetectionMode.Continuous;
		rb.collisionDetectionMode = CollisionDetectionMode.ContinuousDynamic;
		rb.isKinematic = true;
		rb.interpolation = RigidbodyInterpolation.Interpolate;
			
		// add collision dispatcher script
		palm.AddComponent("LeapFingerCollisionDispatcher");
		
		return palm;
	}
	
	// Getters
	public bool getSelectedWithLeap() { return selectedWithLeap; }
	public bool getCreated() { return m_Created; }
	
	// Setters
	public void setSelectedWithLeap(bool b) { selectedWithLeap = b; }
	public void SetFalse() { m_Created = false;	}
};
