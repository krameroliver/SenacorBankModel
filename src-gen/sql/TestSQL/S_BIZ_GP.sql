SELECT * FROM 
(
    Select sqt.* FROM s_client as sat
    inner join h_client as hub
    on sat.client_hk = hub.client_hk) as client

;