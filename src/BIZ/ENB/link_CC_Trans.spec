SpecPackage ENB

Specification link_CC_trans
{
	target 
	RuleType SingleFire
	BusinessRule L_BIZ_CC_trans
	targetRelationship ENB.Transaktion.link_CC_trans
	PrimarySource ENB_SRC.trans
	childSources[
		ENB_SRC.disposition
		PrimaryJoinFields {ENB_SRC.trans.account_id}
		SecondaryJoinField {ENB_SRC.disposition.account_id}
		JoinType RIGHT
		[
			ENB_SRC.card
			PrimaryJoinFields {ENB_SRC.disposition.disp_id}
			SecondaryJoinField {ENB_SRC.card.disp_id}
			JoinType RIGHT
		]
	]
}
