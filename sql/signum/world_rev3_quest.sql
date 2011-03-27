-- Vanquishing Aquantion
DELETE FROM event_scripts WHERE id=9980;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)VALUES
('9980', '0', '10', '16292', '30000', '0', '7929.65', '-7635.611', '114.839', '6.1121');

-- Captives at Deatholme
UPDATE creature_template SET scriptname='npc_captive' WHERE entry IN(16206,16208,16209);

-- A Little Dash of Seasoning
UPDATE quest_template SET ReqCreatureOrGOId1='-181250',ReqCreatureOrGOId2='-181251',ReqCreatureOrGOId3='-181252',ReqCreatureOrGOCount1='1',ReqCreatureOrGOCount2='1',ReqCreatureOrGOCount3='1',ReqSpellCast1='29517',ReqSpellCast2='29517',ReqSpellCast3='29517',CompleteEmote='1' WHERE entry=9275;
UPDATE gameobject_template SET TYPE=2, data1=9275 WHERE entry IN(181250,181251,181252);

-- Escape from the Catacombs
DELETE FROM `script_waypoint` WHERE entry=16295;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
('16295','0','7545.07','-7359.87','162.354','4000','SAY_START'),
('16295','1','7550.05','-7362.24','162.236','0',''),
('16295','2','7566.98','-7364.32','161.739','0',''),
('16295','3','7578.83','-7361.68','161.739','0',''),
('16295','4','7590.97','-7359.05','162.258','0',''),
('16295','5','7598.35','-7362.82','162.257','4000','SAY_PROGRESS_1'),
('16295','6','7605.86','-7380.42','161.937','0',''),
('16295','7','7605.3','-7387.38','157.254','0',''),
('16295','8','7606.13','-7393.89','156.942','0',''),
('16295','9','7615.21','-7400.19','157.143','0',''),
('16295','10','7618.96','-7402.65','158.202','0',''),
('16295','11','7636.85','-7401.76','162.145','0','SAY_PROGRESS_2'),
('16295','12','7637.06','-7404.94','162.207','4000',''),
('16295','13','7636.91','-7412.59','162.366','0',''),
('16295','14','7637.61','-7425.59','162.631','0',''),
('16295','15','7637.82','-7459.06','163.303','0',''),
('16295','16','7638.86','-7470.9','162.517','0',''),
('16295','17','7641.4','-7488.22','157.381','0',''),
('16295','18','7634.46','-7505.45','154.682','0','SAY_PROGRESS_3'),
('16295','19','7631.91','-7516.95','153.597','0',''),
('16295','20','7622.23','-7537.04','151.587','0',''),
('16295','21','7610.92','-7550.67','149.639','0',''),
('16295','22','7598.23','-7562.55','145.954','0',''),
('16295','23','7588.51','-7577.76','148.294','0',''),
('16295','24','7567.34','-7608.46','146.006','0',''),
('16295','25','7562.55','-7617.42','148.098','0',''),
('16295','26','7561.51','-7645.06','151.245','0',''),
('16295','27','7563.34','-7654.65','151.227','0',''),
('16295','28','7565.53','-7658.3','151.249','0',''),
('16295','30','7579.12','-7662.21','151.652','0','quest complete'),
('16295','31','7603.77','-7667','153.998','0',''),
('16295','32','7603.77','-7667','153.998','4000','SAY_END_1'),
('16295','33','7603.77','-7667','153.998','8000','SAY_END_2'),
('16295','34','7603.77','-7667','153.998','0',''),
('16295','39','7571.16','-7659.12','151.245','0','');
 
DELETE FROM `script_texts` WHERE entry IN(-1000140,-1000141,-1000142,-1000143,-1000144,-1000145,-1000146);
INSERT INTO `script_texts` (`npc_entry`,`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('16295','-1000146','Liatha, get someone to look at those injuries. Thank you for bringing her back safely.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','0','lilatha CAPTAIN_ANSWER'),
('16295','-1000145','Captain Helios, I\'ve been rescued from the Amani Catacombs. Reporting for duty, sir!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','0','lilatha SAY_END2'),
('16295','-1000144','Thank you for saving my life and bringing me back to safety, $N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','0','lilatha SAY_END1'),
('16295','-1000143','There\'s Farstrider Enclave now, $C. Not far to go... Look out! Troll ambush!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','0','lilatha SAY_PROGRESS3'),
('16295','-1000142','I can see the light at the end of the tunnel!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','0','lilatha SAY_PROGRESS2'),
('16295','-1000141','$N, let\'s use the antechamber to the right.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','0','lilatha SAY_PROGRESS1'),
('16295','-1000140','Let\'s go.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','1','0','lilatha SAY_START');
UPDATE creature SET MovementType=2 WHERE id=16295;
UPDATE creature_template SET ScriptName='npc_ranger_lilatha',MovementType=2 WHERE entry=16295;
UPDATE quest_template SET SpecialFlags=2,OfferRewardText='You\'re quite the hero, $c, to get her out of there alive.  I suppose we\'ll have to mount an offensive to clear out those catacombs too.  As if we didn\'t have enough trouble with the living trolls!$B$BYou\'ve done a great thing today, I should reward you.  Take your pick from any of these.',CompleteEmote=1 WHERE entry=9212;

-- Healing the Lake
UPDATE `quest_template` SET PrevQuestId=9293,EndText='',CompletedText='Return to Botanist Taerix at the Crash Site in Ammen Vale.',ReqCreatureOrGOId1='181433',ReqCreatureOrGOCount1='1',ReqSpellCast1='28700',DetailsEmote1='1',CompleteEmote='1',OfferRewardEmote1='1',OfferRewardEmote2='4',OfferRewardEmoteDelay2='1000' WHERE entry=9294;

-- The Dwarven Spy
UPDATE creature_template SET MovementType=2 WHERE entry=15420;
UPDATE creature SET MovementType=2, spawntimesecs=60 WHERE id=15420;
 
DELETE FROM script_waypoint WHERE entry =15420;
INSERT INTO `script_waypoint` (`entry`,`pointid`,`location_x`,`location_y`,`location_z`,`waittime`,`point_comment`)VALUES
(15420,0,9294.78,-6682.51,22.42,0, 'npc_prospector_anvilward'),
(15420,1,9298.27,-6667.99,22.42,0, 'npc_prospector_anvilward'),
(15420,2,9309.63,-6658.84,22.43,0, 'npc_prospector_anvilward'),
(15420,3,9304.43,-6649.31,26.46,0, 'npc_prospector_anvilward'),
(15420,4,9298.83,-6648,28.61,0, 'npc_prospector_anvilward'),
(15420,5,9291.06,-6653.46,31.83,2500,'npc_prospector_anvilward'),
(15420,6,9289.08,-6660.17,31.85,5000, 'npc_prospector_anvilward'),
(15420,7,9291.06,-6653.46,31.83,0, 'npc_prospector_anvilward');
 
DELETE FROM script_texts WHERE entry IN(-1000209, -1000210);
INSERT INTO script_texts(entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8, sound, TYPE, LANGUAGE, emote, COMMENT)VALUES
(-1000209, 'Very well. Let\'s see what you have to show me, $N.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0, 'npc_prospector_anvilward'),
(-1000210, 'What manner of trick is this, $R? If you seek to ambush me, I warn you I will not go down quietly!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0, 'npc_prospector_anvilward');

-- A Smart Start
UPDATE `gameobject_template` SET questItem1=23738 WHERE entry=181675;
UPDATE `gameobject_loot_template` SET item=23738 WHERE entry=181675;

-- Captain Kelisendra's Lost Rutters
UPDATE creature_loot_template SET ChanceOrQuestChance='5' WHERE item=21776 AND entry= 15937;

