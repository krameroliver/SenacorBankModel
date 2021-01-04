SpecPackage ENB

Specification GP
{
	target 
	RuleType SingleFire
	BusinessRule S_BIZ_GP
	targetEntity ENB.Geschaeftspartner
	PrimarySource ENB_SRC.client
	childSources [
		ENB_SRC.disposition
		FILTER ENB_SRC.disposition.user_type = 'Owner'
		PrimaryJoinFields{ENB_SRC.client.client_id}
		SecondaryJoinField{ENB_SRC.disposition.client_id}
		JoinType INNER
		[
			
			ENB_SRC.card
			VectoryKeys {ENB_SRC.card.disp_id}
			PrimaryJoinFields{ENB_SRC.disposition.disp_id}
			SecondaryJoinField{ENB_SRC.card.disp_id}			
			JoinType INNER			
		]
	]
	
}


