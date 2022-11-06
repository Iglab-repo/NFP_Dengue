(* ::Package:: *)

Clear["Global`*"];

potCutoff = 100;

maxPotFactorChange = 10;

(* Read in the neut data file *)
neutFile = Import[NotebookDirectory[]<>"mab_neut_22_ch-vrc-overlap.in", "Table", "Numeric" -> False]; (*the input neutralization file*)
neutFileSize = Dimensions[neutFile];
neutMatrix = ToExpression[neutFile[[2 ;; All, 2 ;; All]]];
numStrains = neutFileSize[[1]] - 1;
strainNames = neutFile[[2 ;; All, 1]];
mabNames = neutFile[[1,  2 ;; All]];

(*Read in the epitope-specific antibody classes*)
epAbClassFile=Import[NotebookDirectory[]<>"ab_ep_cl_22.in","Table"];
epAbClassNames=epAbClassFile[[1]];
epAbClassData=epAbClassFile[[2;;All]];

(*Read in the neut variability data and transform into a distribution*)
neutVarData=Flatten[Import[NotebookDirectory[]<>"neut-variability_data.in","Table"]];
distr=EmpiricalDistribution[neutVarData];

numCombPerSpecificityPair = 100; (* the number of combinations for each pair of antibody specificities *)

classWeights = Table[{},{numCombPerSpecificityPair*Length[epAbClassNames]*(Length[epAbClassNames]-1)/2}];
neutCombData = Table[{},{Length[classWeights]}];

log = OpenWrite[NotebookDirectory[]<>"mab_comb_neut-data.out"];

(* for each pair of antibody specificities *)
curInd=1;
For[abSp1=1,abSp1<=Length[epAbClassNames],abSp1++,
	For[abSp2=abSp1+1,abSp2<=Length[epAbClassNames],abSp2++,
	
	
		combCoeff = Table[If[i==abSp1 || i==abSp2, 0.5, 0],{i,1,Length[epAbClassNames]}];
	
		
		(* for each combination for the current pair of antibody specificities *)
		For[curCombForPair=1,curCombForPair<=numCombPerSpecificityPair,curCombForPair++,
		
		
			classWeights[[curInd]] = combCoeff;
		
		
			(*Extract the neut data for one antibody from each of the two specificity classes*)
			mab1 = RandomChoice[epAbClassData[[abSp1]]];
			neutD1 = Flatten[neutMatrix[[All,Flatten[Position[mabNames,mab1]][[1]]]]];
			mab2 = RandomChoice[epAbClassData[[abSp2]]];
			neutD2 = Flatten[neutMatrix[[All,Flatten[Position[mabNames,mab2]][[1]]]]];
			
			
			(*Generate variability factors for the neut data in the current combination*)
			nv1 = RandomVariate[distr,numStrains];
			neutVar1 = Table[nv1[[i]]^RandomChoice[{-1,1}],{i,1,Length[nv1]}];
			nv2 = RandomVariate[distr,numStrains];
			neutVar2 = Table[nv2[[i]]^RandomChoice[{-1,1}],{i,1,Length[nv2]}];
			
			
			(*Generate potency factors for the neut data in the current combination*)
			neutPotF1 = RandomVariate[UniformDistribution[{1,maxPotFactorChange}]]^RandomChoice[{-1,1}];
			neutPotF2 = RandomVariate[UniformDistribution[{1,maxPotFactorChange}]]^RandomChoice[{-1,1}];
			
			
			(*neutCombData[[curInd]] = Table[Min[If[neutD1[[i]]<potCutoff, neutD1[[i]]*neutVar1[[i]]*neutPotF1,potCutoff], If[neutD2[[i]]<potCutoff, neutD2[[i]]*neutVar2[[i]]*neutPotF2, potCutoff]],{i,1,numStrains}];*)
			(*neutCombData[[curInd]] = Table[1/(If[neutD1[[i]]<potCutoff, N[1/(neutD1[[i]]*neutVar1[[i]]*neutPotF1)], N[1/potCutoff]]+If[neutD2[[i]]<potCutoff, N[1/(neutD2[[i]]*neutVar2[[i]]*neutPotF2)], N[1/potCutoff]]),{i,1,numStrains}];*)
			neutCombData[[curInd]] = Table[(Which[neutD1[[i]]<potCutoff && neutD2[[i]]<potCutoff, 1/(N[1/(neutD1[[i]]*neutVar1[[i]]*neutPotF1)]+N[1/(neutD2[[i]]*neutVar2[[i]]*neutPotF2)]), neutD1[[i]]<potCutoff && neutD2[[i]]>=potCutoff, neutD1[[i]]*neutVar1[[i]]*neutPotF1, neutD1[[i]]>=potCutoff && neutD2[[i]]<potCutoff, neutD2[[i]]*neutVar2[[i]]*neutPotF2, True, potCutoff]),{i,1,numStrains}];
						
			WriteString[log,mab1," ",ToString[neutVar1]," ",ToString[neutPotF1],"\n"];
			WriteString[log,mab2," ",ToString[neutVar2]," ",ToString[neutPotF2],"\n"];
			
			
			curInd++;
		];
	];
];

Close[log];

Export[NotebookDirectory[]<>"sera_neut.out",Transpose[-neutCombData],"Table"];
Export[NotebookDirectory[]<>"sera_classWeights.out",classWeights,"Table"];

Exit[];



