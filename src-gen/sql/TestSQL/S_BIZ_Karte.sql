SELECT * FROM 
(
    Select sqt.* FROM s_card as sat
    inner join h_card as hub
    on sat.card_hk = hub.card_hk) as card

;