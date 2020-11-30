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
		PrimaryJoinFields{ENB_SRC.client.client_id}
		SecondaryJoinField{ENB_SRC.disposition.client_id}
		JoinType INNER
		[
			ENB_SRC.card
			//Filter: Anzeige nur für Owner --> User soll nicht mit Karte verbunden werden
			VectoryKeys {ENB_SRC.card.disp_id}
			PrimaryJoinFields{ENB_SRC.disposition.disp_id}
			SecondaryJoinField{ENB_SRC.card.disp_id}			
			JoinType INNER			
		]
	]
	
}


