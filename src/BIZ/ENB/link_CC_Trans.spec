SpecPackage ENB

Specification link_CC_trans
{
	target 
	RuleType SingleFire
	BusinessRule L_BIZ_CC_trans
	//tbd.....
	//targetRelationship ENB.Geschaeftspartner.link_GP_CC
	//PrimarySource ENB_SRC.client
	//childSources[		
		//ENB_SRC.disposition
		//PrimaryJoinFields {ENB_SRC.client.client_id}
		//SecondaryJoinField {ENB_SRC.disposition.client_id}
		//JoinType INNER
		//[
		//	ENB_SRC.card
			//PrimaryJoinFields {ENB_SRC.disposition.disp_id}
			//SecondaryJoinField {ENB_SRC.card.disp_id}
			//JoinType LEFT
	//	]		
	//] 
}
