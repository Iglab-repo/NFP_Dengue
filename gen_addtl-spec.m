(* ::Package:: *)

Clear["Global`*"];

numSera = 1000;
highCorrCutoff = 0.2;

minBreadth = 0.3;
maxBreadth = 0.98;

(*Read in the antibody neutralization fingerprint data*)
abFile = Import["mab_neut_data_template_unknown.in", "Table", "Numeric" -> False];
abFileSize = Dimensions[abFile];
numStrains = abFileSize[[1]] - 1;
numAbs = abFileSize[[2]] - 1;
abNames = abFile[[1, 2 ;; All]];
abNeutData = ToExpression[abFile[[2 ;; All, 2 ;; All]]];

strainInd = Table[i,{i,1,numStrains}];

(*Generate a list of 'sera' where the only specificity is an unknown one:do this by generating neutralization vectors that do not correlate with any of the current antibody FP*)
curSerum = 1;
seraMatrixNeut = Table[{}, {numSera}];
While[curSerum <= numSera,
  
	curSeraMatrixNeut = RandomReal[{0.00001, 49.9}, numStrains];
	curSeraMatrixNeut[[RandomSample[strainInd,Floor[(1-RandomReal[{minBreadth,maxBreadth}])*numStrains]]]] = 50;

	serumFPcorr = SpearmanRho[Transpose[List[curSeraMatrixNeut]], abNeutData];
  
	If[ Max[serumFPcorr]<highCorrCutoff,
   
	   seraMatrixNeut[[curSerum]] = curSeraMatrixNeut;	   
	   curSerum++;
	];
];
  
Export[ToString["match_unknown_spec_sim_sera.in"],Transpose[seraMatrixNeut],"Table"];
Export[ToString["match_unknown_spec_sim_sera_notranspose.in"],seraMatrixNeut,"Table"];
Exit[];
