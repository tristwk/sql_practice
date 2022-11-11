-- find out top 5th percentile 
-- join two tables, return fraud_score >= five_percent 

SELECT policy_num, 
        fs.state, 
        claim_cost,
        fraud_score,
        five_percent
FROM fraud_score fs
LEFT JOIN (
SELECT state,
    PERCENTILE_CONT(0.05) WITHIN GROUP(ORDER BY fraud_score DESC) AS five_percent
FROM fraud_score 
GROUP BY state
) sn
ON fs.state = sn.state
WHERE fraud_score >= five_percent
ORDER BY state ASC, fraud_score DESC
