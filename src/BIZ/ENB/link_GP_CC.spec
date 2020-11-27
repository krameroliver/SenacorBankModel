SpecPackage A

Specification link_GP_CC
{
	target 
	RuleType SingleFire
	BusinessRule L_BIZ_GP_CC
	targetRelationship ENB.Geschaeftspartner.link_GP_darlehen
	PrimarySource ENB_SRC.loan
	childSources[
		ENB_SRC.disposition
		PrimaryJoinFields {ENB_SRC.loan.account_id}
		SecondaryJoinField {ENB_SRC.disposition.account_id}
		JoinType INNER
		[
			ENB_SRC.client
			PrimaryJoinFields {ENB_SRC.disposition.client_id}
			SecondaryJoinField {ENB_SRC.client.client_id}
			JoinType INNER
		]		
	] 
}