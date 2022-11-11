select from_user, 
       COUNT(from_user) AS total_email,
       ROW_NUMBER() OVER (ORDER BY COUNT(from_user) DESC, from_user ASC)
from google_gmail_emails
GROUP BY from_user
ORDER BY total_email DESC, from_user ASC
