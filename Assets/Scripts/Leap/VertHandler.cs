/******************************************************************************\
* Eric Lee
* Unity Leap
*
* Vert handler class for manipulating vertices from within the Unity environment
* Used for creating hills using the Leap - feature not complete
\******************************************************************************/

using UnityEngine;
using System.Collections;
 
[ExecuteInEditMode]
 
public class VertHandler : MonoBehaviour 
{
    Mesh mesh;
    Vector3[] verts;
    Vector3 vertPos;
    public GameObject[] handles;
 
    void OnEnable()
    {
       mesh = GetComponent<MeshFilter>().mesh;
       verts = mesh.vertices;
	   int i = 0;
       foreach(Vector3 vert in verts)
       {
         vertPos = transform.TransformPoint(vert);
		 string name = "handle" + i;
         //GameObject handle = new GameObject("handle");
		 GameObject handle = new GameObject(name);
         handle.transform.position = vertPos;
         handle.transform.parent = transform;
         handle.tag = "handle";
         //print(vertPos);
		 i++;
       }
    }
 
    void OnDisable()
    {
       GameObject[] handles = GameObject.FindGameObjectsWithTag("handle");
       foreach(GameObject handle in handles)
       {
         DestroyImmediate(handle);    
       }
    }
 
    void Update()
    {
       handles = GameObject.FindGameObjectsWithTag ("handle");
       for(int i = 0; i < verts.Length; i++)
       {
         verts[i] = handles[i].transform.localPosition;   
       }
       mesh.vertices = verts;
       mesh.RecalculateBounds();
       mesh.RecalculateNormals();
    }
}