SpecPackage A

Specification link_GP_CC
{
	target 
	RuleType SingleFire
	BusinessRule L_BIZ_GP_CC
	targetRelationship ENB.Geschaeftspartner.link_GP_CC
	PrimarySource ENB_SRC.client
	childSources[
		
		ENB_SRC.disposition
		PrimaryJoinFields {ENB_SRC.client.client_id}
		SecondaryJoinField {ENB_SRC.disposition.client_id}
		JoinType INNER
		[
			ENB_SRC.card
			PrimaryJoinFields {ENB_SRC.disposition.disp_id}
			SecondaryJoinField {ENB_SRC.card.disp_id}
			JoinType LEFT
		]		
	] 
}
