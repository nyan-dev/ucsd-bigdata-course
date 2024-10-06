// the length of the conversation (path length) 

MATCH p = (i1)-[:RespondedTo*]->(i2) 
RETURN p ORDER BY length(p) DESC LIMIT 1

// The longest conversation chain in the chat data has path length 9, therefore 10 chats are involved in it. 

// how many unique users were part of the conversation chain.

MATCH p = (i1)-[:RespondedTo*]->(i2)
WHERE length(p) = 9
WITH p
MATCH (u)-[:CreatesChat]->(i)
WHERE i IN nodes(p)
RETURN count(distinct u)

// The unique user count is 5
