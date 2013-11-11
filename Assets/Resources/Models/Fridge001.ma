//Maya ASCII 2013 scene
//Name: Fridge001.ma
//Last modified: Sun, Nov 10, 2013 06:55:52 PM
//Codeset: 1252
requires maya "2013";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2013";
fileInfo "version" "2013 x64";
fileInfo "cutIdentifier" "201202220241-825136";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 5.3090861391643926 10.397336605488441 24.357786554154906 ;
	setAttr ".r" -type "double3" -15.3383527296078 16.199999999999552 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 23.368925573963313;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "pCube1";
	setAttr ".t" -type "double3" 0 4.3217783872329543 0 ;
	setAttr ".s" -type "double3" 3.6725280622248158 9.5081916158181432 3.9074709579662965 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCube2";
	setAttr ".t" -type "double3" 0 7.383833140945768 2.2055203869401883 ;
	setAttr ".s" -type "double3" 2.9615495368728841 2.9615495368728841 0.47802407290107318 ;
createNode mesh -n "pCubeShape2" -p "pCube2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCube3";
	setAttr ".t" -type "double3" 0 2.8399528025819745 2.2055203869401883 ;
	setAttr ".s" -type "double3" 2.9615495368728841 5.756452900380344 0.47802407290107318 ;
createNode mesh -n "pCubeShape3" -p "pCube3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "polySurfaceShape1" -p "pCube3";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 48 ".uvst[0].uvsp[0:47]" -type "float2" 0.37905461 0.77512002
		 0.62094539 0.97487998 0.34987998 0.24594539 0.15012002 0.24594539 0.15012002 0.004054606
		 0.34987998 0.004054606 0.84987998 0.004054606 0.84987998 0.24594539 0.65012002 0.24594539
		 0.65012002 0.004054606 0.37905461 0.27512002 0.37905461 0.50405461 0.37905461 0.97487998
		 0.375 0.97487998 0.375 0.77512002 0.375 0.004054606 0.375 0.24594539 0.625 0.97487998
		 0.62094539 0.77512002 0.625 0.77512002 0.62094539 0.004054606 0.375 0.27512002 0.375
		 0.47487998 0.37905467 0.25 0.62094533 0.24594539 0.62094539 0.25 0.62094539 0.27512002
		 0.625 0.27512002 0.375 0.50405461 0.37905461 0.5 0.62094539 0.47487998 0.62094539
		 0.5 0.62094539 0.50405461 0.625 0.50405461 0.625 0.74594539 0.37905461 0.75 0.62094533
		 0.74594539 0.37905461 0 0.37905461 0.004054606 0.62094545 0 0.625 0.004054606 0.37905461
		 0.24594539 0.625 0.24594539 0.37905461 0.47487998 0.625 0.47487998 0.375 0.74594539
		 0.37905461 0.74594539 0.62094539 0.75;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.5 -0.48378158 0.39951992 -0.48378155 -0.5 0.39951992
		 -0.48378155 -0.48378158 0.5 0.48378155 -0.5 0.39951992 0.5 -0.48378158 0.39951992
		 0.48378155 -0.48378158 0.5 -0.48378155 0.50000048 0.39951992 -0.5 0.48378158 0.39951992
		 -0.48378155 0.48378158 0.5 0.5 0.48378158 0.39951992 0.48378155 0.50000048 0.39951992
		 0.48378155 0.48378158 0.5 -0.48378155 0.48378158 -0.5 -0.5 0.48378158 -0.39951992
		 -0.48378155 0.50000048 -0.39951992 0.5 0.48378158 -0.39951992 0.48378155 0.48378158 -0.5
		 0.48378155 0.50000048 -0.39951992 -0.48378155 -0.5 -0.39951992 -0.5 -0.48378158 -0.39951992
		 -0.48378155 -0.48378158 -0.5 0.5 -0.48378158 -0.39951992 0.48378155 -0.5 -0.39951992
		 0.48378155 -0.48378158 -0.5;
	setAttr -s 48 ".ed[0:47]"  18 22 0 22 3 0 3 1 0 1 18 0 5 11 0 11 8 0
		 8 2 0 2 5 0 7 13 0 13 19 0 19 0 0 0 7 0 21 15 0 15 9 0 9 4 0 4 21 0 10 17 0 17 14 0
		 14 6 0 6 10 0 16 23 0 23 20 0 20 12 0 12 16 0 1 0 0 19 18 0 2 1 0 3 5 0 0 2 0 8 7 0
		 4 3 0 22 21 0 5 4 0 9 11 0 7 6 0 14 13 0 6 8 0 11 10 0 10 9 0 15 17 0 13 12 0 20 19 0
		 12 14 0 17 16 0 16 15 0 21 23 0 18 20 0 23 22 0;
	setAttr -s 26 -ch 96 ".fc[0:25]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 18 1 12
		f 4 4 5 6 7
		mu 0 4 20 24 41 38
		f 4 8 9 10 11
		mu 0 4 2 3 4 5
		f 4 12 13 14 15
		mu 0 4 6 7 8 9
		f 4 16 17 18 19
		mu 0 4 26 30 43 10
		f 4 20 21 22 23
		mu 0 4 32 36 46 11
		f 4 24 -11 25 -4
		mu 0 4 12 13 14 0
		f 4 26 -3 27 -8
		mu 0 4 38 37 39 20
		f 4 28 -7 29 -12
		mu 0 4 15 38 41 16
		f 4 30 -2 31 -16
		mu 0 4 17 1 18 19
		f 4 32 -15 33 -5
		mu 0 4 20 40 42 24
		f 4 34 -19 35 -9
		mu 0 4 21 10 43 22
		f 4 36 -6 37 -20
		mu 0 4 23 41 24 25
		f 4 38 -14 39 -17
		mu 0 4 26 27 44 30
		f 4 40 -23 41 -10
		mu 0 4 28 11 46 45
		f 4 42 -18 43 -24
		mu 0 4 29 43 30 31
		f 4 44 -13 45 -21
		mu 0 4 32 33 34 36
		f 4 46 -22 47 -1
		mu 0 4 35 46 36 47
		f 3 -25 -27 -29
		mu 0 3 15 37 38
		f 3 -31 -33 -28
		mu 0 3 39 40 20
		f 3 -35 -30 -37
		mu 0 3 23 16 41
		f 3 -39 -38 -34
		mu 0 3 42 25 24
		f 3 -41 -36 -43
		mu 0 3 29 22 43
		f 3 -45 -44 -40
		mu 0 3 44 31 30
		f 3 -26 -42 -47
		mu 0 3 35 45 46
		f 3 -32 -48 -46
		mu 0 3 34 47 36;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube4";
	setAttr ".t" -type "double3" -1.0828382987480061 7.3310620809743945 2.6913120037030627 ;
	setAttr ".s" -type "double3" 0.22671791915422271 2.3659146951968451 0.28797658641714868 ;
createNode mesh -n "pCubeShape4" -p "pCube4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 88 ".pt";
	setAttr ".pt[0]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[1]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[2]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[3]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[4]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[5]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[6]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[7]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[8]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[9]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[10]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[11]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[12]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[13]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[14]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[15]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[16]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[17]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[18]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[19]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[20]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[21]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[22]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[23]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[32]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[33]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[34]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[35]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[36]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[37]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[38]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[39]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[40]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[41]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[42]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[43]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[44]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[45]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[46]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[47]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[48]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[49]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[50]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[51]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[52]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[53]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[54]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[55]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[56]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[57]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[58]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[59]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[60]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[61]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[62]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[63]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[64]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[65]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[66]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[67]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[68]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[69]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[70]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[71]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[72]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[73]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[74]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[75]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[76]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[77]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[78]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[79]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[80]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[81]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[82]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[83]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[84]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[85]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[86]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[87]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[88]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[89]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[90]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[91]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[92]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[93]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[94]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[95]" -type "float3" 0 2.220446e-016 -0.5689351 ;
createNode transform -n "pCube5";
	setAttr ".t" -type "double3" -1.0828382987480061 2.7392236293431029 2.6913120037030627 ;
	setAttr ".s" -type "double3" 0.22671791915422271 4.9323805255784015 0.28797658641714868 ;
createNode mesh -n "pCubeShape5" -p "pCube5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 156 ".uvst[0].uvsp[0:155]" -type "float2" 0.41482449 0.78135288
		 0.58517551 0.96864712 0.34364712 0.24618375 0.15635288 0.24618375 0.15635288 0.0038162172
		 0.34364712 0.0038162172 0.84364712 0.0038162172 0.84364712 0.24618375 0.65635288
		 0.24618375 0.65635288 0.0038162172 0.41482449 0.28135288 0.41482449 0.50381625 0.41482449
		 0.96864712 0.375 0.96864712 0.375 0.78135288 0.375 0.0038162172 0.375 0.24618375
		 0.625 0.96864712 0.58517551 0.78135288 0.625 0.78135288 0.58517551 0.0038162172 0.375
		 0.28135288 0.375 0.46864712 0.41482449 0.25 0.58517551 0.24618375 0.58517551 0.25
		 0.58517551 0.28135288 0.625 0.28135288 0.375 0.50381625 0.41482455 0.5 0.58517551
		 0.46864712 0.58517557 0.5 0.58517551 0.50381625 0.625 0.50381625 0.625 0.74618381
		 0.41482449 0.75 0.58517557 0.74618375 0.41482449 3.7252903e-009 0.41482446 0.0038162172
		 0.58517551 0 0.625 0.0038162172 0.41482449 0.24618375 0.625 0.24618375 0.41482449
		 0.46864712 0.625 0.46864712 0.375 0.74618381 0.41482449 0.74618381 0.58517557 0.75
		 0.58517551 0.12761496 0.41482449 0.12761496 0.34364712 0.12761496 0.375 0.12761496
		 0.15635288 0.12761496 0.375 0.62238508 0.41482449 0.62238508 0.58517551 0.62238503
		 0.84364712 0.12761496 0.625 0.62238508 0.65635288 0.12761496 0.625 0.12761496 0.58517551
		 0.15749991 0.41482449 0.15749991 0.34364712 0.15749991 0.375 0.15749991 0.15635288
		 0.15749991 0.375 0.59250009 0.41482449 0.59250015 0.58517551 0.59250009 0.84364712
		 0.15749991 0.625 0.59250015 0.65635288 0.15749991 0.625 0.15749991 0.58517551 0.1829696
		 0.41482449 0.1829696 0.34364712 0.1829696 0.375 0.1829696 0.15635288 0.1829696 0.375
		 0.56703043 0.41482449 0.56703043 0.58517551 0.56703043 0.84364712 0.1829696 0.625
		 0.56703043 0.65635288 0.1829696 0.625 0.1829696 0.58517551 0.20717448 0.41482449
		 0.20717447 0.34364712 0.20717448 0.375 0.20717448 0.15635288 0.20717447 0.375 0.54282558
		 0.41482449 0.54282558 0.58517551 0.54282558 0.84364712 0.20717448 0.625 0.54282558
		 0.65635288 0.20717447 0.625 0.20717447 0.58517551 0.22647911 0.41482449 0.2264791
		 0.34364712 0.22647911 0.375 0.22647911 0.15635288 0.2264791 0.375 0.52352095 0.41482449
		 0.52352095 0.58517551 0.52352095 0.84364712 0.22647911 0.625 0.52352095 0.65635288
		 0.2264791 0.625 0.2264791 0.58517551 0.097125351 0.41482449 0.097125351 0.34364712
		 0.097125351 0.375 0.097125351 0.15635288 0.097125351 0.375 0.65287471 0.41482449
		 0.65287471 0.58517551 0.65287465 0.84364712 0.097125351 0.625 0.65287471 0.65635288
		 0.097125351 0.625 0.097125351 0.58517551 0.06864091 0.41482449 0.06864091 0.34364712
		 0.06864091 0.375 0.06864091 0.15635288 0.06864091 0.375 0.68135917 0.41482449 0.68135917
		 0.58517551 0.68135905 0.84364712 0.06864091 0.625 0.68135917 0.65635288 0.06864091
		 0.625 0.06864091 0.65635288 0.048065122 0.625 0.048065122 0.84364712 0.048065122
		 0.625 0.70193493 0.58517557 0.70193487 0.41482449 0.70193493 0.15635288 0.048065122
		 0.375 0.70193493 0.34364712 0.048065122 0.375 0.048065122 0.41482449 0.048065122
		 0.58517551 0.048065122 0.58517551 0.024286624 0.41482449 0.024286626 0.34364712 0.024286624
		 0.375 0.024286624 0.15635288 0.024286626 0.375 0.72571337 0.41482449 0.72571337 0.58517557
		 0.72571337 0.84364712 0.024286624 0.625 0.72571337 0.65635288 0.024286626 0.625 0.024286626;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 88 ".pt";
	setAttr ".pt[0]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[1]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[2]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[3]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[4]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[5]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[6]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[7]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[8]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[9]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[10]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[11]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[12]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[13]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[14]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[15]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[16]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[17]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[18]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[19]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[20]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[21]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[22]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[23]" -type "float3" 0 0 -1.0979042 ;
	setAttr ".pt[32]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[33]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[34]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[35]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[36]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[37]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[38]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[39]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[40]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[41]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[42]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[43]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[44]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[45]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[46]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[47]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[48]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[49]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[50]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[51]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[52]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[53]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[54]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[55]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[56]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[57]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[58]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[59]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[60]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[61]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[62]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[63]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[64]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[65]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[66]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[67]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[68]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[69]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[70]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[71]" -type "float3" 0 0 -0.0551522 ;
	setAttr ".pt[72]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[73]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[74]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[75]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[76]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[77]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[78]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[79]" -type "float3" 0 0 -0.23416448 ;
	setAttr ".pt[80]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[81]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[82]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[83]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[84]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[85]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[86]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[87]" -type "float3" 0 0 -0.42662844 ;
	setAttr ".pt[88]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[89]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[90]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[91]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[92]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[93]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[94]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr ".pt[95]" -type "float3" 0 2.220446e-016 -0.5689351 ;
	setAttr -s 96 ".vt[0:95]"  -0.5 -0.48473513 0.37458897 -0.34070221 -0.50000024 0.37458897
		 -0.34070221 -0.48473513 0.50000048 0.34070221 -0.50000024 0.37458897 0.5 -0.48473513 0.37458897
		 0.34070221 -0.48473513 0.50000048 -0.34070221 0.50000012 0.37458897 -0.5 0.48473513 0.37458897
		 -0.34070221 0.48473513 0.50000048 0.5 0.48473513 0.37458897 0.34070221 0.50000012 0.37458897
		 0.34070221 0.48473513 0.50000048 -0.34070221 0.48473513 -0.50000048 -0.5 0.48473513 -0.37458801
		 -0.34070221 0.50000012 -0.37458801 0.5 0.48473513 -0.37458801 0.34070221 0.48473513 -0.50000048
		 0.34070221 0.50000012 -0.37458801 -0.34070221 -0.50000024 -0.37458801 -0.5 -0.48473513 -0.37458801
		 -0.34070221 -0.48473513 -0.50000048 0.5 -0.48473513 -0.37458801 0.34070221 -0.50000024 -0.37458801
		 0.34070221 -0.48473513 -0.50000048 0.34070221 0.01045987 0.50000048 -0.34070221 0.01045987 0.50000048
		 -0.5 0.01045987 0.37458897 -0.5 0.01045987 -0.37458801 -0.34070221 0.01045987 -0.50000048
		 0.34070221 0.01045987 -0.50000048 0.5 0.01045987 -0.37458801 0.5 0.01045987 0.37458897
		 0.34070224 0.12999968 0.50000048 -0.34070221 0.12999967 0.50000048 -0.5 0.12999968 0.37458897
		 -0.5 0.12999967 -0.37458801 -0.34070224 0.12999968 -0.50000048 0.34070221 0.12999967 -0.50000048
		 0.5 0.12999968 -0.37458801 0.5 0.12999967 0.37458897 0.34070224 0.23187849 0.50000048
		 -0.34070221 0.23187849 0.50000048 -0.5 0.23187849 0.37458897 -0.5 0.23187849 -0.37458801
		 -0.34070224 0.23187849 -0.50000048 0.34070221 0.23187849 -0.50000048 0.5 0.23187849 -0.37458801
		 0.5 0.23187849 0.37458897 0.34070224 0.32869798 0.50000048 -0.34070221 0.32869795 0.50000048
		 -0.5 0.32869798 0.37458897 -0.5 0.32869795 -0.37458801 -0.34070224 0.32869798 -0.50000048
		 0.34070221 0.32869795 -0.50000048 0.5 0.32869798 -0.37458801 0.5 0.32869795 0.37458897
		 0.34070224 0.40591651 0.50000048 -0.34070221 0.40591651 0.50000048 -0.5 0.40591651 0.37458897
		 -0.5 0.40591651 -0.37458801 -0.34070224 0.40591651 -0.50000048 0.34070221 0.40591651 -0.50000048
		 0.5 0.40591651 -0.37458801 0.5 0.40591651 0.37458897 0.34070221 -0.11149859 0.50000048
		 -0.34070221 -0.11149859 0.50000048 -0.5 -0.11149859 0.37458897 -0.5 -0.11149859 -0.37458801
		 -0.34070221 -0.11149859 -0.50000048 0.34070221 -0.11149859 -0.50000048 0.5 -0.11149859 -0.37458801
		 0.5 -0.11149859 0.37458897 0.34070221 -0.22543636 0.50000048 -0.34070221 -0.22543636 0.50000048
		 -0.5 -0.22543636 0.37458897 -0.5 -0.22543636 -0.37458801 -0.34070221 -0.22543636 -0.50000048
		 0.34070221 -0.22543636 -0.50000048 0.5 -0.22543636 -0.37458801 0.5 -0.22543636 0.37458897
		 0.5 -0.30773953 0.374589 0.5 -0.3077395 -0.37458801 0.34070221 -0.30773953 -0.50000048
		 -0.34070221 -0.3077395 -0.50000048 -0.5 -0.30773953 -0.37458801 -0.5 -0.3077395 0.37458897
		 -0.34070221 -0.30773953 0.50000048 0.34070221 -0.3077395 0.50000048 0.34070218 -0.40285349 0.50000048
		 -0.34070221 -0.40285352 0.50000048 -0.5 -0.40285349 0.37458897 -0.5 -0.40285352 -0.37458801
		 -0.34070218 -0.40285349 -0.50000048 0.34070221 -0.40285352 -0.50000048 0.5 -0.40285349 -0.37458801
		 0.5 -0.40285352 0.37458897;
	setAttr -s 192 ".ed";
	setAttr ".ed[0:165]"  18 22 0 22 3 0 3 1 0 1 18 0 5 88 0 11 8 0 8 57 0 2 5 0
		 7 13 0 13 59 0 19 0 0 0 90 0 21 94 0 15 9 0 9 63 0 4 21 0 10 17 0 17 14 0 14 6 0
		 6 10 0 16 61 0 23 20 0 20 92 0 12 16 0 1 0 0 19 18 0 2 1 0 3 5 0 0 2 0 8 7 0 4 3 0
		 22 21 0 5 4 0 9 11 0 7 6 0 14 13 0 6 8 0 11 10 0 10 9 0 15 17 0 13 12 0 20 19 0 12 14 0
		 17 16 0 16 15 0 21 23 0 18 20 0 23 22 0 24 32 0 25 65 0 24 25 1 26 34 0 25 26 1 27 67 0
		 26 27 1 28 36 0 27 28 1 29 69 0 28 29 1 30 38 0 29 30 1 31 71 0 30 31 1 31 24 1 32 40 0
		 33 25 0 32 33 1 34 42 0 33 34 1 35 27 0 34 35 1 36 44 0 35 36 1 37 29 0 36 37 1 38 46 0
		 37 38 1 39 31 0 38 39 1 39 32 1 40 48 0 41 33 0 40 41 1 42 50 0 41 42 1 43 35 0 42 43 1
		 44 52 0 43 44 1 45 37 0 44 45 1 46 54 0 45 46 1 47 39 0 46 47 1 47 40 1 48 56 0 49 41 0
		 48 49 1 50 58 0 49 50 1 51 43 0 50 51 1 52 60 0 51 52 1 53 45 0 52 53 1 54 62 0 53 54 1
		 55 47 0 54 55 1 55 48 1 56 11 0 57 49 0 56 57 1 58 7 0 57 58 1 59 51 0 58 59 1 60 12 0
		 59 60 1 61 53 0 60 61 1 62 15 0 61 62 1 63 55 0 62 63 1 63 56 1 64 24 0 65 73 0 64 65 1
		 66 26 0 65 66 1 67 75 0 66 67 1 68 28 0 67 68 1 69 77 0 68 69 1 70 30 0 69 70 1 71 79 0
		 70 71 1 71 64 1 72 64 0 73 86 0 72 73 1 74 66 0 73 74 1 75 84 0 74 75 1 76 68 0 75 76 1
		 77 82 0 76 77 1 78 70 0 77 78 1 79 80 0 78 79 1 79 72 1 80 95 0 81 78 0 80 81 1 82 93 0
		 81 82 1 83 76 0;
	setAttr ".ed[166:191]" 82 83 1 84 91 0 83 84 1 85 74 0 84 85 1 86 89 0 85 86 1
		 87 72 0 86 87 1 87 80 1 88 87 0 89 2 0 88 89 1 90 85 0 89 90 1 91 19 0 90 91 1 92 83 0
		 91 92 1 93 23 0 92 93 1 94 81 0 93 94 1 95 4 0 94 95 1 95 88 1;
	setAttr -s 98 -ch 384 ".fc[0:97]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 18 1 12
		f 4 173 146 145 174
		mu 0 4 143 120 121 142
		f 4 150 149 170 169
		mu 0 4 122 124 138 140
		f 4 161 158 157 162
		mu 0 4 134 128 130 132
		f 4 16 17 18 19
		mu 0 4 26 30 43 10
		f 4 153 166 165 154
		mu 0 4 127 136 137 126
		f 4 24 -11 25 -4
		mu 0 4 12 13 14 0
		f 4 26 -3 27 -8
		mu 0 4 38 37 39 20
		f 4 172 -146 148 -170
		mu 0 4 141 142 121 123
		f 4 30 -2 31 -16
		mu 0 4 17 1 18 19
		f 4 175 -158 159 -174
		mu 0 4 143 133 131 120
		f 4 34 -19 35 -9
		mu 0 4 21 10 43 22
		f 4 36 -6 37 -20
		mu 0 4 23 41 24 25
		f 4 38 -14 39 -17
		mu 0 4 26 27 44 30
		f 4 152 -166 168 -150
		mu 0 4 125 126 137 139
		f 4 42 -18 43 -24
		mu 0 4 29 43 30 31
		f 4 156 -162 164 -154
		mu 0 4 127 129 135 136
		f 4 46 -22 47 -1
		mu 0 4 35 46 36 47
		f 3 -25 -27 -29
		mu 0 3 15 37 38
		f 3 -31 -33 -28
		mu 0 3 39 40 20
		f 3 -35 -30 -37
		mu 0 3 23 16 41
		f 3 -39 -38 -34
		mu 0 3 42 25 24
		f 3 -41 -36 -43
		mu 0 3 29 22 43
		f 3 -45 -44 -40
		mu 0 3 44 31 30
		f 3 -26 -42 -47
		mu 0 3 35 45 46
		f 3 -32 -48 -46
		mu 0 3 34 47 36
		f 4 48 66 65 -51
		mu 0 4 48 60 61 49
		f 4 -53 -66 68 -52
		mu 0 4 51 49 61 63
		f 4 70 69 -55 51
		mu 0 4 62 64 52 50
		f 4 72 -56 -57 -70
		mu 0 4 65 66 54 53
		f 4 73 -59 55 74
		mu 0 4 67 55 54 66
		f 4 76 -60 -61 -74
		mu 0 4 67 69 57 55
		f 4 -63 59 78 77
		mu 0 4 58 56 68 70
		f 4 -64 -78 79 -49
		mu 0 4 48 59 71 60
		f 4 64 82 81 -67
		mu 0 4 60 72 73 61
		f 4 -69 -82 84 -68
		mu 0 4 63 61 73 75
		f 4 86 85 -71 67
		mu 0 4 74 76 64 62
		f 4 88 -72 -73 -86
		mu 0 4 77 78 66 65
		f 4 89 -75 71 90
		mu 0 4 79 67 66 78
		f 4 92 -76 -77 -90
		mu 0 4 79 81 69 67
		f 4 -79 75 94 93
		mu 0 4 70 68 80 82
		f 4 -80 -94 95 -65
		mu 0 4 60 71 83 72
		f 4 80 98 97 -83
		mu 0 4 72 84 85 73
		f 4 -85 -98 100 -84
		mu 0 4 75 73 85 87
		f 4 102 101 -87 83
		mu 0 4 86 88 76 74
		f 4 104 -88 -89 -102
		mu 0 4 89 90 78 77
		f 4 105 -91 87 106
		mu 0 4 91 79 78 90
		f 4 108 -92 -93 -106
		mu 0 4 91 93 81 79
		f 4 -95 91 110 109
		mu 0 4 82 80 92 94
		f 4 -96 -110 111 -81
		mu 0 4 72 83 95 84
		f 4 96 114 113 -99
		mu 0 4 84 96 97 85
		f 4 -101 -114 116 -100
		mu 0 4 87 85 97 99
		f 4 118 117 -103 99
		mu 0 4 98 100 88 86
		f 4 120 -104 -105 -118
		mu 0 4 101 102 90 89
		f 4 121 -107 103 122
		mu 0 4 103 91 90 102
		f 4 124 -108 -109 -122
		mu 0 4 103 105 93 91
		f 4 -111 107 126 125
		mu 0 4 94 92 104 106
		f 4 -112 -126 127 -97
		mu 0 4 84 95 107 96
		f 4 112 5 6 -115
		mu 0 4 96 24 41 97
		f 4 -117 -7 29 -116
		mu 0 4 99 97 41 16
		f 4 8 9 -119 115
		mu 0 4 2 3 100 98
		f 4 40 -120 -121 -10
		mu 0 4 28 11 102 101
		f 4 20 -123 119 23
		mu 0 4 32 103 102 11
		f 4 44 -124 -125 -21
		mu 0 4 32 33 105 103
		f 4 -127 123 13 14
		mu 0 4 106 104 7 8
		f 4 -128 -15 33 -113
		mu 0 4 96 107 42 24
		f 4 128 50 49 -131
		mu 0 4 108 48 49 109
		f 4 -133 -50 52 -132
		mu 0 4 111 109 49 51
		f 4 54 53 -135 131
		mu 0 4 50 52 112 110
		f 4 56 -136 -137 -54
		mu 0 4 53 54 114 113
		f 4 57 -139 135 58
		mu 0 4 55 115 114 54
		f 4 60 -140 -141 -58
		mu 0 4 55 57 117 115
		f 4 -143 139 62 61
		mu 0 4 118 116 56 58
		f 4 -144 -62 63 -129
		mu 0 4 108 119 59 48
		f 4 144 130 129 -147
		mu 0 4 120 108 109 121
		f 4 -149 -130 132 -148
		mu 0 4 123 121 109 111
		f 4 134 133 -151 147
		mu 0 4 110 112 124 122
		f 4 136 -152 -153 -134
		mu 0 4 113 114 126 125
		f 4 137 -155 151 138
		mu 0 4 115 127 126 114
		f 4 140 -156 -157 -138
		mu 0 4 115 117 129 127
		f 4 -159 155 142 141
		mu 0 4 130 128 116 118
		f 4 -160 -142 143 -145
		mu 0 4 120 131 119 108
		f 4 12 190 189 15
		mu 0 4 6 152 154 9
		f 4 188 -13 45 -186
		mu 0 4 151 153 34 36
		f 4 186 185 21 22
		mu 0 4 150 151 36 46
		f 4 184 -23 41 -182
		mu 0 4 149 150 46 45
		f 4 182 181 10 11
		mu 0 4 146 148 4 5
		f 4 28 -178 180 -12
		mu 0 4 15 38 145 147
		f 4 4 178 177 7
		mu 0 4 20 144 145 38
		f 4 32 -190 191 -5
		mu 0 4 20 40 155 144
		f 4 176 -175 171 -179
		mu 0 4 144 143 142 145
		f 4 -181 -172 -173 -180
		mu 0 4 147 145 142 141
		f 4 -171 167 -183 179
		mu 0 4 140 138 148 146
		f 4 -169 -184 -185 -168
		mu 0 4 139 137 150 149
		f 4 -167 163 -187 183
		mu 0 4 137 136 151 150
		f 4 -165 -188 -189 -164
		mu 0 4 136 135 153 151
		f 4 -191 187 -163 160
		mu 0 4 154 152 134 132
		f 4 -192 -161 -176 -177
		mu 0 4 144 155 133 143;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 5 ".lnk";
	setAttr -s 5 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode polyCube -n "polyCube1";
	setAttr ".cuv" 4;
createNode polyCube -n "polyCube2";
	setAttr ".cuv" 4;
createNode polyBevel -n "polyBevel1";
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 3.6725280622248158 0 0 0 0 9.5081916158181432 0 0 0 0 3.9074709579662965 0
		 0 4.3217783872329543 0 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".o" 0.05392156830787951;
	setAttr ".at" 180;
	setAttr ".fn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
	setAttr ".ma" 180;
createNode polyBevel -n "polyBevel2";
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 2.9615495368728841 0 0 0 0 2.9615495368728841 0 0 0 0 0.47802407290107318 0
		 0 7.383833140945768 2.2055203869401883 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".o" 0.20098039172772392;
	setAttr ".at" 180;
	setAttr ".fn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
	setAttr ".ma" 180;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n"
		+ "            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n"
		+ "                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n"
		+ "                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n"
		+ "            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n"
		+ "            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n"
		+ "                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n"
		+ "                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n"
		+ "                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n"
		+ "            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -shadows 0\n            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n"
		+ "            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n"
		+ "                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n"
		+ "                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n"
		+ "                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n"
		+ "                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n"
		+ "                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n"
		+ "                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n"
		+ "                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n"
		+ "                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -island 0\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode phong -n "phong1";
createNode shadingEngine -n "phong1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "C:/Users/Eric/Desktop/Maya/Leap/Fridge//sourceimages/fridge_texture.jpg";
createNode place2dTexture -n "place2dTexture1";
	setAttr ".re" -type "float2" 4 4 ;
createNode polyPlanarProj -n "polyPlanarProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:25]";
	setAttr ".ix" -type "matrix" 2.9615495368728841 0 0 0 0 2.9615495368728841 0 0 0 0 0.47802407290107318 0
		 0 7.383833140945768 2.2055203869401883 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 7.3838334083557129 2.2055203914642334 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 2.9615495204925537 0.47802400588989258 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "polyPlanarProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:25]";
	setAttr ".ix" -type "matrix" 2.9615495368728841 0 0 0 0 2.9615495368728841 0 0 0 0 0.47802407290107318 0
		 0 7.383833140945768 2.2055203869401883 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 7.3838334083557129 2.2055203914642334 ;
	setAttr ".ro" -type "double3" 0 90 0 ;
	setAttr ".ps" -type "double2" 0.47802400588989258 2.9615507125854492 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "polyPlanarProj3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:25]";
	setAttr ".ix" -type "matrix" 2.9615495368728841 0 0 0 0 2.9615495368728841 0 0 0 0 0.47802407290107318 0
		 0 7.383833140945768 2.2055203869401883 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 7.3838334083557129 2.2055203914642334 ;
	setAttr ".ps" -type "double2" 2.9615495204925537 2.9615507125854492 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode phong -n "Fridge_doors";
createNode shadingEngine -n "phong2SG";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "C:/Users/Eric/Desktop/Maya/Leap/Fridge//sourceimages/fridge_texture.jpg";
createNode place2dTexture -n "place2dTexture2";
createNode polyPlanarProj -n "polyPlanarProj4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:25]";
	setAttr ".ix" -type "matrix" 2.9615495368728841 0 0 0 0 5.756452900380344 0 0 0 0 0.47802407290107318 0
		 0 2.8399528025819745 2.2055203869401883 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 2.839954137802124 2.2055203914642334 ;
	setAttr ".ps" -type "double2" 2.9615495204925537 5.7564558982849121 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyCube -n "polyCube3";
	setAttr ".cuv" 4;
createNode lambert -n "lambert2";
	setAttr ".c" -type "float3" 0.10000763 0.10000763 0.10000763 ;
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode polyBevel -n "polyBevel3";
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".ws" yes;
	setAttr ".oaf" yes;
	setAttr ".o" 0.31862745120865749;
	setAttr ".at" 180;
	setAttr ".fn" yes;
	setAttr ".mv" yes;
	setAttr ".mvt" 0.0001;
	setAttr ".sa" 30;
	setAttr ".ma" 180;
createNode polySplitRing -n "polySplitRing1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[4]" "e[6]" "e[9]" "e[11:12]" "e[14]" "e[20]" "e[22]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.51078927516937256;
	setAttr ".re" 4;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[6]" "e[9]" "e[14]" "e[20]" "e[48]" "e[51]" "e[55]" "e[59]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.2520473301410675;
	setAttr ".dr" no;
	setAttr ".re" 48;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[6]" "e[9]" "e[14]" "e[20]" "e[64]" "e[67]" "e[71]" "e[75]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.2871965765953064;
	setAttr ".re" 64;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[6]" "e[9]" "e[14]" "e[20]" "e[80]" "e[83]" "e[87]" "e[91]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.38290265202522278;
	setAttr ".re" 80;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[6]" "e[9]" "e[14]" "e[20]" "e[96]" "e[99]" "e[103]" "e[107]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.49487283825874329;
	setAttr ".re" 96;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[4]" "e[11:12]" "e[22]" "e[49]" "e[53]" "e[57]" "e[61]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.75371628999710083;
	setAttr ".dr" no;
	setAttr ".re" 4;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing7";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[4]" "e[11:12]" "e[22]" "e[129]" "e[133]" "e[137]" "e[141]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.69473040103912354;
	setAttr ".dr" no;
	setAttr ".re" 4;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[4]" "e[11:12]" "e[22]" "e[145]" "e[149]" "e[153]" "e[157]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.31740668416023254;
	setAttr ".re" 157;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing9";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[4]" "e[11:12]" "e[22]" "e[160]" "e[163]" "e[167]" "e[171]";
	setAttr ".ix" -type "matrix" 0.34393852900234173 0 0 0 0 3.5891702916411061 0 0 0 0 0.43686993903668714 0
		 0 6.9023982239038579 3.1169021571958933 1;
	setAttr ".wt" 0.46261951327323914;
	setAttr ".re" 4;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 5 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :defaultTextureList1;
	setAttr -s 2 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 2 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "polyBevel1.out" "pCubeShape1.i";
connectAttr "polyPlanarProj3.out" "pCubeShape2.i";
connectAttr "polyPlanarProj4.out" "pCubeShape3.i";
connectAttr "polySplitRing9.out" "pCubeShape4.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "phong1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "phong2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "phong1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "phong2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polyCube1.out" "polyBevel1.ip";
connectAttr "pCubeShape1.wm" "polyBevel1.mp";
connectAttr "polyCube2.out" "polyBevel2.ip";
connectAttr "pCubeShape2.wm" "polyBevel2.mp";
connectAttr "file1.oc" "phong1.c";
connectAttr "phong1.oc" "phong1SG.ss";
connectAttr "pCubeShape1.iog" "phong1SG.dsm" -na;
connectAttr "phong1SG.msg" "materialInfo1.sg";
connectAttr "phong1.msg" "materialInfo1.m";
connectAttr "file1.msg" "materialInfo1.t" -na;
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "polyBevel2.out" "polyPlanarProj1.ip";
connectAttr "pCubeShape2.wm" "polyPlanarProj1.mp";
connectAttr "polyPlanarProj1.out" "polyPlanarProj2.ip";
connectAttr "pCubeShape2.wm" "polyPlanarProj2.mp";
connectAttr "polyPlanarProj2.out" "polyPlanarProj3.ip";
connectAttr "pCubeShape2.wm" "polyPlanarProj3.mp";
connectAttr "file2.oc" "Fridge_doors.c";
connectAttr "Fridge_doors.oc" "phong2SG.ss";
connectAttr "pCubeShape2.iog" "phong2SG.dsm" -na;
connectAttr "pCubeShape3.iog" "phong2SG.dsm" -na;
connectAttr "phong2SG.msg" "materialInfo2.sg";
connectAttr "Fridge_doors.msg" "materialInfo2.m";
connectAttr "file2.msg" "materialInfo2.t" -na;
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr "polySurfaceShape1.o" "polyPlanarProj4.ip";
connectAttr "pCubeShape3.wm" "polyPlanarProj4.mp";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "pCubeShape4.iog" "lambert2SG.dsm" -na;
connectAttr "pCubeShape5.iog" "lambert2SG.dsm" -na;
connectAttr "lambert2SG.msg" "materialInfo3.sg";
connectAttr "lambert2.msg" "materialInfo3.m";
connectAttr "polyCube3.out" "polyBevel3.ip";
connectAttr "pCubeShape4.wm" "polyBevel3.mp";
connectAttr "polyBevel3.out" "polySplitRing1.ip";
connectAttr "pCubeShape4.wm" "polySplitRing1.mp";
connectAttr "polySplitRing1.out" "polySplitRing2.ip";
connectAttr "pCubeShape4.wm" "polySplitRing2.mp";
connectAttr "polySplitRing2.out" "polySplitRing3.ip";
connectAttr "pCubeShape4.wm" "polySplitRing3.mp";
connectAttr "polySplitRing3.out" "polySplitRing4.ip";
connectAttr "pCubeShape4.wm" "polySplitRing4.mp";
connectAttr "polySplitRing4.out" "polySplitRing5.ip";
connectAttr "pCubeShape4.wm" "polySplitRing5.mp";
connectAttr "polySplitRing5.out" "polySplitRing6.ip";
connectAttr "pCubeShape4.wm" "polySplitRing6.mp";
connectAttr "polySplitRing6.out" "polySplitRing7.ip";
connectAttr "pCubeShape4.wm" "polySplitRing7.mp";
connectAttr "polySplitRing7.out" "polySplitRing8.ip";
connectAttr "pCubeShape4.wm" "polySplitRing8.mp";
connectAttr "polySplitRing8.out" "polySplitRing9.ip";
connectAttr "pCubeShape4.wm" "polySplitRing9.mp";
connectAttr "phong1SG.pa" ":renderPartition.st" -na;
connectAttr "phong2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "phong1.msg" ":defaultShaderList1.s" -na;
connectAttr "Fridge_doors.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of Fridge001.ma
