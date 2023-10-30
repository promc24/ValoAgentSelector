BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "agents_details" (
	"a_num"	INTEGER NOT NULL,
	"a_name"	TEXT NOT NULL,
	"a_type"	TEXT NOT NULL,
	PRIMARY KEY("a_num")
);
INSERT INTO "agents_details" ("a_num","a_name","a_type") VALUES (1,'Brimstone','Controller'),
 (2,'Viper','Controller'),
 (3,'Omen','Controller'),
 (4,'Killjoy','Sentinel'),
 (5,'Cypher','Sentinel'),
 (6,'Sova','Initiator'),
 (7,'Sage','Sentinel'),
 (9,'Phoenix','Duelist'),
 (10,'Jett','Duelist'),
 (11,'Reyna','Duelist'),
 (12,'Raze','Duelist'),
 (13,'Breach','Initiator'),
 (14,'Skye','Initiator'),
 (15,'Yoru','Duelist'),
 (16,'Astra','Controller'),
 (17,'KAY/O','Initiator'),
 (18,'Chamber','Sentinel'),
 (19,'Neon','Duelist'),
 (20,'Fade','Initiator'),
 (21,'Harbor','Controller'),
 (22,'Gekko','Initiator'),
 (23,'Deadlock','Sentinel');
COMMIT;
