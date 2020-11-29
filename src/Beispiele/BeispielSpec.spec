SpecPackage A

Specification Bsp
{
	target 
	RuleType SingleFire
	BusinessRule Test
	targetEntity ENB_SRC.client
	PrimarySource ENB_SRC.card
	childSources [
		ENB_SRC.card
		PrimaryJoinFields { ENB_SRC.acct.account_id}
		SecondaryJoinField { ENB_SRC.trans.account}	
		JoinType LEFT 	
		
		
	]
}