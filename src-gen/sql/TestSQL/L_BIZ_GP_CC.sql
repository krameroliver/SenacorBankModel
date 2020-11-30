SELECT * FROM 
(
    Select sqt.* FROM s_loan as sat
    inner join h_loan as hub
    on sat.loan_hk = hub.loan_hk) as loan
INNERJOIN 
;