--------------------------------------------------
--TypeTags dacaogu-------------------------------
insert or replace into TypeTags
	(Type,									Tag)
values
	('UNIT_HUNGARY_BLACK_ARMY',				'CLASS_DACAOGU'),
	('UNIT_HORSEMAN',						'CLASS_DACAOGU'),
	('UNIT_COURSER',						'CLASS_DACAOGU');

insert or replace into Tags
	(Tag,									Vocabulary)
values
	('CLASS_DACAOGU',						'ABILITY_CLASS');
---------------------------------------------------
--TypeTags all millitary units---------------------
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_LAND_COMBAT' from Units where FormationClass = 'FORMATION_CLASS_LAND_COMBAT';
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_LAND_UNITS' from Units where Domain = 'DOMAIN_LAND';
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_NAVAL' from Units where FormationClass = 'FORMATION_CLASS_NAVAL';
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_AIR' from Units where FormationClass = 'FORMATION_CLASS_AIR';
insert or replace into TypeTags(Type,Tag)
select UnitType ,'CLASS_MILITARY' from Units where FormationClass != 'FORMATION_CLASS_CIVILIAN' AND FormationClass != 'FORMATION_CLASS_SUPPORT';

insert or replace into Tags
	(Tag,									Vocabulary)
values
	('CLASS_HD_GAIN_SCIENCE_WHEN_KILLS',	'ABILITY_CLASS'),
	('CLASS_HD_CAN_MOVE_AFTER_ATTACK',		'ABILITY_CLASS'),
	('CLASS_MILITARY_ENGINEER',				'ABILITY_CLASS'),
	('CLASS_MILITARY',						'ABILITY_CLASS'),
	('CLASS_LAND_UNITS',					'ABILITY_CLASS'),
	('CLASS_AIR',							'ABILITY_CLASS'),
	('CLASS_NAVAL',							'ABILITY_CLASS'),
	('CLASS_LAND_COMBAT',					'ABILITY_CLASS');

insert or replace into TypeTags
	(Type,									Tag)
values
	('UNIT_MILITARY_ENGINEER', 'CLASS_MILITARY_ENGINEER');
------------------------------------------------------------------------
--typetags warrior monks------
insert or replace into TypeTags
 	(Type,									Tag)
values
 	('UNIT_WARRIOR_MONK',				'CLASS_ALL_ERAS');
----------------------------------------------------------------------