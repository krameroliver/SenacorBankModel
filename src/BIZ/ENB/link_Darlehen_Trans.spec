SpecPackage ENB

Specification link_darlehen_trans
{
	target 
	RuleType SingleFire
	BusinessRule L_BIZ_darlehen_trans
	targetRelationship ENB.Transaktion.link_darlehen_trans
	PrimarySource ENB_SRC.trans
	childSources[
		ENB_SRC.loan
		PrimaryJoinFields {ENB_SRC.trans.account_id}
		SecondaryJoinField {ENB_SRC.loan.account_id}
		JoinType RIGHT
	]
}