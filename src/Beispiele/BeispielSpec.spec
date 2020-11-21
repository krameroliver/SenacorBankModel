SpecPackage A

Specification Bsp
{
	target 
	RuleType SingleFire
	BusinessRule Test
	targetEntity Beispiel.BeispielEntity
	PrimarySource Beispiel.BeispielEntity
	childSources [
		Beispiel.BeispielEntity
		PrimaryJoinFields { Beispiel.BeispielCommonMapping.A}
		SecondaryJoinField { Beispiel.BeispielCommonMapping.C}	
		JoinType LEFT 	
		
	]
}