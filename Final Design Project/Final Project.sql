-- Cristian Hernandez 
-- Final Project
-- April 20, 2016

DROP TABLE IF EXISTS Games;
DROP TABLE IF EXISTS Weapons;
DROP TABLE IF EXISTS Spells;
DROP TABLE IF EXISTS Minions;
DROP TABLE IF EXISTS Servers;
DROP TABLE IF EXISTS Consists;
DROP TABLE IF EXISTS Cards;
DROP TABLE IF EXISTS Decks;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Heroes;

--- Players ---
CREATE TABLE Players (
  pid char(3) Not null,
  account_name text,
  account_number numeric(4),
  rank_number integer,
  PRIMARY KEY (pid)
  );

--- Heroes ---
CREATE TABLE Heroes (
  hid char(2) not null, 
  hero_name text,
  hero_power text,
  health numeric(2),
  PRIMARY KEY (hid)	
);

--- Decks ---
Create Table Decks (
  did char(2) not null,
  deck_name text,
  primary key (did)
); 

--- Cards ---
create table Cards (
  cid char(4) not null, 
  card_name text,
  card_type text,
  rarity text,
  expansion text,
  primary key (cid)
);

--- The cards that the deck conists of --- 
Create table Consists (
  did char(2) not null references decks(did),
  cid char(4) not null references cards(cid), 
  primary key(did, cid)
);

--- Minion Cards ---
create table Minions (
  cid char(4) not null references cards(cid),
  manacost integer,
  attack integer,
  health integer,
  primary key(cid)
);

--- Spell Cards ---
create table Spells (
  cid char(4) not null references cards(cid),
  manacost integer,
  primary key(cid)
);

--- Weapon Cards ---
create table Weapons (
  cid char(4) not null references cards(cid),
  manacost integer,
  attack integer,
  durability integer,
  primary key(cid)
);

--- Server in the game ---
create table Servers (
  sid char(3),
  region_name text,
  primary key(sid)
);

--- Matches Online ---
create table Games ( 
  mid char(4) not null,
  sid char(3) not null references servers(sid),
  pid_1 char(3) not null references players(pid), 
  pid_2 char(3) not null references players(pid),
  hid_1 char(2) not null references heroes(hid),
  hid_2 char(2) not null references heroes(hid),
  primary key(mid)
);

--- Players ---
insert into Players(pid, account_name, account_number, rank_number)
  values('p01', 'PabloTheGreat', 3003, 1);

insert into Players(pid, account_name, account_number, rank_number)
  values('p02', 'Chez', 1996, 2);

insert into Players(pid, account_name, account_number, rank_number)
  Values('p03', 'Crazygirl', 1008, 16);

insert into Players(pid, account_name, account_number, rank_number)
  values('p04', 'DarenP', 1234, 25);
  
--- Heroes ---
insert into Heroes(hid, hero_name, hero_power, health)
  values('h1', 'Mage', 'Fireblast', 30);

insert into Heroes(hid, hero_name, hero_power, health)
  values('h2', 'Warrior', 'Armor Up!', 30);

insert into Heroes(hid, hero_name, hero_power, health)
  values('h3', 'Shaman', 'Totemic Call', 30);

insert into Heroes(hid, hero_name, hero_power, health)
  values('h4', 'Rogue', 'Dagger Mastery', 30);

insert into Heroes(hid, hero_name, hero_power, health)
  values('h5', 'Hunter', 'Steady Shot', 30);

insert into Heroes(hid, hero_name, hero_power, health)
  values('h6', 'Druid', 'Shapeshift', 30);

insert into Heroes(hid, hero_name, hero_power, health)
  values('h7', 'Paladin', 'Reinforce', 30);

insert into Heroes(hid, hero_name, hero_power, health)
  values('h8', 'Warlock', 'Lifetap', 30);

insert into Heroes(hid, hero_name, hero_power, health)
  values('h9', 'Priest', 'Lesser Heal', 30);

 --- Decks ---
Insert into Decks(did, deck_name)
  Values('m1', 'Tempo Mage');

Insert into Decks(did, deck_name)
  Values('w2', 'Control Warrior');

Insert into Decks(did, deck_name)
  values('s3', 'Aggro Shaman');

Insert into Decks(did, deck_name)
  Values('r4', 'Raptor Rogue');

--- Cards --- 
Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c001', 'Arcane Blast', 'Epic', 'Spell', 'The Grand Tournament');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c002', 'Arcane Missiles x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c003', 'Mana Wyrm x2', 'Common', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c004', 'Flamecannon', 'Common', 'Spell', 'Goblins and Gnomes');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c005', 'Frostbolt x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c006', 'Unstable Portal x2', 'Rare', 'Spell', 'Goblins and Gnomes');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c007', 'Arcane Intellect x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c008', 'Effigy x2', 'Common', 'Spell', 'The Grand Tournament');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c009', 'Flamewaker x2', 'Rare', 'Minion', 'Blackrock Mountain');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c010', 'Mirror Entity', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c011', 'Fireball x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c012', 'Ethreal Conjurer x2', 'Common', 'Minion', 'League of Explorers');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c013', 'Mad Scientist x2', 'Common', 'Minion', 'Curse of Naxxramas');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c014', 'Piloted Shredder x2', 'Common', 'Minion', 'Goblins and Gnomes');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c015', 'Sludge Belcher', 'Rare', 'Minion', 'Curse of Naxxramas');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c016', 'Dr. Boom', 'Legendary', 'Minion', 'Goblins and Gnomes');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c017', 'Ragnaros the Firelord', 'Legendary', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c018', 'Execute x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c019', 'Shield Slam x2', 'Epic', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c020', 'Armorsmith', 'Common', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c021', 'Fiery War Axe x2', 'Common', 'Weapon', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c022', 'Revenge', 'Rare', 'Spell', 'Blackrock Mountain');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c023', 'Slam x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c024', 'Bash x2', 'Common', 'Spell', 'The Grand Tournament');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c025', 'Shield Block', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c026', 'Deaths Bite', 'Common', 'Weapon', 'Curse of Naxxramas');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c027', 'Brawl x2', 'Epic', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c028', 'Shieldmaiden', 'Rare', 'Minion', 'Goblins and Gnomes');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c029', 'Grommash Hellscream', 'Legendary', 'Minion','Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c030', 'Doomsayer', 'Epic', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c031', 'Acolyte of Pain', 'Common', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c032', 'Big Game Hunter', 'Epic', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c033', 'Harrsion Jones', 'Legendary', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c034', 'Justicar Trueheart', 'Legendary', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c035', 'Sylvanas Windrunner', 'Legendary', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c036', 'Baron Geddon', 'Legendary', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c037', 'Lighting Bolt x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c038', 'Rockbiter Weapon x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c039', 'Tunnel Trogg x2', 'Common', 'Minion', 'League of Explorers');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c040', 'Ancestral Knowledge x2', 'Common', 'Spell', 'The Grand Tournament');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c041', 'Crackle x2', 'Common', 'Spell', 'Goblins and Gnomes');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c042', 'Lava Shock', 'Rare', 'Spell', 'Blackrock Mountain');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c043', 'Totem Golem x2', 'Common', 'Minion', 'The Grand Tournament');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c044', 'Whirling Zap-o-Matic', 'Common', 'Minion', 'Goblins and Gnomes');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c045', 'Feral Spirit x2', 'Rare', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c046', 'Lava Burst x2', 'Rare', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c047', 'Doomhammer x2', 'Epic', 'Weapon', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c048', 'Abusive Sergeant x2', 'Common', 'Minion', 'Classic'); 

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c049', 'Leper Gnome x2', 'Common', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c050', 'Sir Finley Mrrglton', 'Legendary', 'Minion', 'League of Explorers');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c051', 'Ironbeak Owl x2', 'Common', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c052', 'Arcane Golem', 'Rare', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c053', 'Argent Horserider', 'Common', 'Minion', 'League of Explorers');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c054', 'Backstab x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c055', 'Cold Blood x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c056', 'Eviscerate x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c057', 'Sap', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c058', 'Fan of Knives x2', 'Common', 'Spell', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c059', 'Unearthed Raptor', 'Rare', 'Minion', 'League of Explorers');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c060', 'Loot Hoarder x2', 'Common', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c061', 'Nerubian Egg x2', 'Rare', 'Minion', 'Curse of Naxxramas'); 

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c062', 'Defender of Argus x2', 'Rare', 'Minion', 'Classic');

Insert into Cards(cid, card_name, rarity, card_type, expansion)
Values('c063', 'Loatheb', 'Legendary', 'Minion', 'Curse of Naxxramas');

insert into Cards(cid, card_name, rarity, card_type, expansion)
values('c064', 'Shielded Minibot', 'Common', 'Minion', 'Classic');


--- Minions ---
Insert into Minions(cid, manacost, attack, health)
  Values('c003', 1, 1, 3);

Insert into Minions(cid, manacost, attack, health)
  Values('c009', 3, 2, 4);

Insert into Minions(cid, manacost, attack, health)
  Values('c012', 5, 6, 3);

Insert into Minions(cid, manacost, attack, health)
  Values('c013', 2, 2, 2);

Insert into Minions(cid, manacost, attack, health)
  Values('c014', 4, 4, 3);

Insert into Minions(cid, manacost, attack, health)
  Values('c015', 5, 3, 5);

Insert into Minions(cid, manacost, attack, health)
  Values('c016', 7, 7, 7);

Insert into Minions(cid, manacost, attack, health)
  Values('c017', 8, 8, 8);

Insert into Minions(cid, manacost, attack, health)
  Values('c020', 2, 1, 4);

Insert into Minions(cid, manacost, attack, health)
  Values('c028', 6, 5, 5);

Insert into Minions(cid, manacost, attack, health)
  Values('c029', 8, 4, 10); 

Insert into Minions(cid, manacost, attack, health)
  Values('c030', 2, 0, 7);

Insert into Minions(cid, manacost, attack, health)
  Values('c031', 3, 1, 3);

Insert into Minions(cid, manacost, attack, health)
  Values('c032', 3, 4, 2);

Insert into Minions(cid, manacost, attack, health)
  Values('c033', 5, 5, 4);

Insert into Minions(cid, manacost, attack, health)
  Values('c034', 6, 6, 3);

Insert into Minions(cid, manacost, attack, health)
  Values('c035', 6, 5, 5); 

Insert into Minions(cid, manacost, attack, health)
  Values('c036', 7, 7, 5);

Insert into Minions(cid, manacost, attack, health)
  Values('c039', 1, 1, 3);

Insert into Minions(cid, manacost, attack, health)
  Values('c043', 3, 3, 4); 

Insert into Minions(cid, manacost, attack, health)
  Values('c044', 2, 3, 2);

Insert into Minions(cid, manacost, attack, health)
  Values('c048', 1, 2, 1);

Insert into Minions(cid, manacost, attack, health)
  Values('c049', 1, 2, 1);

Insert into Minions(cid, manacost, attack, health)
  Values('c050', 1, 1, 3);

Insert into Minions(cid, manacost, attack, health)
  Values('c051', 2, 2, 1);

Insert into Minions(cid, manacost, attack, health)
  Values('c052', 3, 4, 2);

Insert into Minions(cid, manacost, attack, health)
  Values('c053', 3, 2, 1);

Insert into Minions(cid, manacost, attack, health)
  Values('c059', 3, 3, 4);

Insert into Minions(cid, manacost, attack, health)
  Values('c060', 2, 2, 1);

Insert into Minions(cid, manacost, attack, health)
  Values('c061', 2, 0, 2);

Insert into Minions(cid, manacost, attack, health)
  Values('c062', 4, 2, 3);

Insert into Minions(cid, manacost, attack, health)
  Values('c063', 5, 5, 5);

 --- Spells ---
insert into Spells(cid, manacost)
  Values('c001', 1);

insert into Spells(cid, manacost)
  Values('c002', 1);

insert into Spells(cid, manacost)
  Values('c004', 2);

insert into Spells(cid, manacost)
  Values('c005', 2);

insert into Spells(cid, manacost)
  Values('c006', 2);

insert into Spells(cid, manacost)
  Values('c007', 3);

insert into Spells(cid, manacost)
  Values('c008', 3);

insert into Spells(cid, manacost)
  Values('c010', 3);

insert into Spells(cid, manacost)
  Values('c011', 4);

insert into Spells(cid, manacost)
  Values('c018', 1);

insert into Spells(cid, manacost)
  Values('c019', 1);

insert into Spells(cid, manacost)
  Values('c022', 2);

insert into Spells(cid, manacost)
  Values('c023', 2);

insert into Spells(cid, manacost)
  Values('c024', 3);

insert into Spells(cid, manacost)
  Values('c025', 3);

insert into Spells(cid, manacost)
  Values('c027', 5);

insert into Spells(cid, manacost)
  Values('c037', 1);

insert into Spells(cid, manacost)
  Values('c038', 1);

insert into Spells(cid, manacost)
  Values('c040', 2);

insert into Spells(cid, manacost)
  Values('c041', 2);

insert into Spells(cid, manacost)
  Values('c042', 2);

insert into Spells(cid, manacost)
  Values('c045', 3);

insert into Spells(cid, manacost)
  Values('c046', 3);

insert into Spells(cid, manacost)
  Values('c054', 0);

insert into Spells(cid, manacost)
  Values('c055', 2);

insert into Spells(cid, manacost)
  Values('c056', 2);

insert into Spells(cid, manacost)
  Values('c057', 2);

insert into Spells(cid, manacost)
  Values('c058', 3);

--- Weapons ---
Insert into Weapons(cid, manacost, attack, durability)
  values('c021', 2, 3, 2);

Insert into Weapons(cid, manacost, attack, durability)
  values('c026', 4, 4, 2);

Insert into Weapons(cid, manacost, attack, durability)
  values('c047', 5, 2, 8);

--- Servers ---
Insert into Servers(sid, region_name)
  Values('s01', 'Americas');

Insert into Servers(sid, region_name)
  Values('s02', 'Europe');

Insert into Servers(sid, region_name)
  Values('s03', 'Asia');

--- Matches Online ---
insert into Games(mid, sid, pid_1, pid_2, hid_1, hid_2)
  values('m001', 's01', 'p01', 'p02', 'h1', 'h2');

insert into Games(mid, sid, pid_1, pid_2, hid_1, hid_2)
  values('m002', 's02', 'p03', 'p04', 'h3', 'h4');

insert into Games(mid, sid, pid_1, pid_2, hid_1, hid_2)
  values('m003', 's03', 'p01', 'p03', 'h1', 'h3');

insert into Games(mid, sid, pid_1, pid_2, hid_1, hid_2)
  values('m004', 's01', 'p02', 'p04', 'h2', 'h4');

insert into Games(mid, sid, pid_1, pid_2, hid_1, hid_2)
  values('m005', 's02', 'p01', 'p04', 'h1', 'h4');

insert into Games(mid, sid, pid_1, pid_2, hid_1, hid_2)
  values('m006', 's03', 'p02', 'p03', 'h2', 'h3');

--- The Constructed Decks ---
insert into consists(did, cid)
  Values('m1', 'c001');

 insert into consists(did, cid)
  Values('m1', 'c002');

insert into consists(did, cid)
  Values('m1', 'c003');

insert into consists(did, cid)
  Values('m1', 'c004');

insert into consists(did, cid)
  Values('m1', 'c005');

insert into consists(did, cid)
  Values('m1', 'c006');

insert into consists(did, cid)
  Values('m1', 'c007');

insert into consists(did, cid)
  Values('m1', 'c008');

insert into consists(did, cid)
  Values('m1', 'c009');

insert into consists(did, cid)
  Values('m1', 'c010');

insert into consists(did, cid)
  Values('m1', 'c011');

insert into consists(did, cid)
  Values('m1', 'c012');

insert into consists(did, cid)
  Values('m1', 'c013');

insert into consists(did, cid)
  Values('m1', 'c014');

insert into consists(did, cid)
  Values('m1', 'c015');

insert into consists(did, cid)
  Values('m1', 'c016');

insert into consists(did, cid)
  Values('m1', 'c017');    

insert into consists(did, cid)
  Values('w2', 'c018');

insert into consists(did, cid)
  Values('w2', 'c019');

insert into consists(did, cid)
  Values('w2', 'c020');

insert into consists(did, cid)
  Values('w2', 'c021');

insert into consists(did, cid)
  Values('w2', 'c022');

insert into consists(did, cid)
  Values('w2', 'c023');

insert into consists(did, cid)
  Values('w2', 'c024');

insert into consists(did, cid)
  Values('w2', 'c025');

insert into consists(did, cid)
  Values('w2', 'c026');

insert into consists(did, cid)
  Values('w2', 'c027');

insert into consists(did, cid)
  Values('w2', 'c028');

insert into consists(did, cid)
  Values('w2', 'c029');

insert into consists(did, cid)
  Values('w2', 'c030');

insert into consists(did, cid)
  Values('w2', 'c031');

insert into consists(did, cid)
  Values('w2', 'c032');

insert into consists(did, cid)
  Values('w2', 'c033');

insert into consists(did, cid)
  Values('w2', 'c036');

insert into consists(did, cid)
  Values('s3', 'c037');

insert into consists(did, cid)
  Values('s3', 'c038');

insert into consists(did, cid)
  Values('s3', 'c039');

insert into consists(did, cid)
  Values('s3', 'c040');

insert into consists(did, cid)
  Values('s3', 'c041');

insert into consists(did, cid)
  Values('s3', 'c042');

insert into consists(did, cid)
  Values('s3', 'c043');

insert into consists(did, cid)
  Values('s3', 'c044');

insert into consists(did, cid)
  Values('s3', 'c045');

insert into consists(did, cid)
  Values('s3', 'c046');

insert into consists(did, cid)
  Values('s3', 'c047');
  
insert into consists(did, cid)
  Values('s3', 'c048');

insert into consists(did, cid)
  Values('s3', 'c049');

insert into consists(did, cid)
  Values('s3', 'c050');

insert into consists(did, cid)
  Values('s3', 'c051');

insert into consists(did, cid)
  Values('s3', 'c052');

insert into consists(did, cid)
  Values('s3', 'c053');

insert into consists(did, cid)
  Values('r4', 'c054');

insert into consists(did, cid)
  Values('r4', 'c055');

insert into consists(did, cid)
  Values('r4', 'c056');

insert into consists(did, cid)
  Values('r4', 'c057');

insert into consists(did, cid)
  Values('r4', 'c058');

insert into consists(did, cid)
  Values('r4', 'c059');

insert into consists(did, cid)
  Values('r4', 'c060');

insert into consists(did, cid)
  Values('r4', 'c061');

insert into consists(did, cid)
  Values('r4', 'c062');

insert into consists(did, cid)
  Values('r4', 'c063');

------------------------------

select card_name
from cards
where cid in(Select cid
from spells
where manacost > 5
union 
select cid
from minions
where manacost > 5
union 
select cid
from weapons
where manacost > 5
);

create or replace function get_card_by_mana_rare(text, REFCURSOR) returns refcursor as 
$$
declare
   Rare text       := $1;
   card_name   REFCURSOR := $2;
begin
   open card_name for 
      select cards.card_name
      from   cards
       where  cards.rarity  = Rare;
   return card_name;
end;
$$ 
language plpgsql;



select get_card_by_mana_rare('Legendary', 'results');
Fetch all from results;


