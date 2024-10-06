The first line loads the CSV file from a designated location, processing one row at a time. 
Lines two through four generate nodes for User, Team, and TeamChatSession, with a specific column converted to an integer, 
which is then assigned to the id attribute. Lines five and six establish the CreatesSession and OwnedBy edges, 
connecting the previously created nodes. These edges include a timestamp property, which is populated from the fourth column of the schema.

CREATE CONSTRAINT FOR (u:User) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT FOR (t:Team) REQUIRE t.id IS UNIQUE;
CREATE CONSTRAINT FOR (c:TeamChatSession) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT FOR (i:ChatItem) REQUIRE i.id IS UNIQUE;

LOAD CSV FROM "file:///D:/chat_csv/chat_create_team_chat.csv" AS row
MERGE (u:User {id: toInteger(row[0])})
MERGE (t:Team {id: toInteger(row[1])}) 
MERGE (c:TeamChatSession {id: toInteger(row[2])})
MERGE (u)-[:CreatesSession{timeStamp: row[3]}]->(c)
MERGE (c)-[:OwnedBy{timeStamp: row[3]}]->(t)
