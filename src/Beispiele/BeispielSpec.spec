SpecPackage A

Specification Bsp
{
	target 
	RuleType SingleFire
	BusinessRule Test
	targetEntity A.BeispielEntity
	PrimarySource A.BeispielEntity
	childSources [
		A.BeispielEntity
		PrimaryJoinFields { A.BeispielCommonMapping.A}
		SecondaryJoinField { A.BeispielCommonMapping.C}	
		JoinType LEFT 	
		
	]
}