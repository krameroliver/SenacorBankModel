SpecPackage A

Specification Bsp
{
	target 
	RuleType SingleFire
	BusinessRule Test
	targetEntity ENB.acct
	PrimarySource ENB.card
	childSources [
		ENB.disposition
		PrimaryJoinFields { ENB.trans.account}
		SecondaryJoinField { ENB.acct.account_id}	
		JoinType LEFT 	
		
	]
}