
-- join on id+1 and num = num 

SELECT DISTINCT l.num AS ConsecutiveNums
FROM Logs l
JOIN Logs l2
  ON l.id - l2.id = 1 AND l.num = l2.num
JOIN Logs l3
  ON l2.id -l3.id = 1 AND l2.num = l3.num;

-- another way
SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num;

-- link: https://leetcode.com/problems/consecutive-numbers/submissions/
