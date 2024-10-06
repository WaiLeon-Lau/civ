-------------------------------------
--     Technologies Adjustment     --
-------------------------------------

-- New techs
insert or replace into Types
    (Type,                                Kind)
values
    ('TECH_CALENDAR_HD',                  'KIND_TECH'),
    ('TECH_PAPER_MAKING_HD',              'KIND_TECH'),
    ('TECH_COMPASS_HD',                   'KIND_TECH'),
    ('TECH_PHYSICS_HD',                   'KIND_TECH'),
    ('TECH_BIOLOGY_HD',                   'KIND_TECH'),
    ('TECH_CIVIL_ENGINEERING_HD',         'KIND_TECH');

insert or replace into Technologies
    (TechnologyType,                Name,                                    Description,                                        Cost,   EraType,            UITreeRow,  AdvisorType)
values
    ('TECH_CALENDAR_HD',            'LOC_TECH_CALENDAR_HD_NAME',             'LOC_TECH_CALENDAR_HD_DESCRIPTION',                 80,     'ERA_ANCIENT',      -1,         'ADVISOR_TECHNOLOGY'),
    ('TECH_PAPER_MAKING_HD',        'LOC_TECH_PAPER_MAKING_HD_NAME',         'LOC_TECH_PAPER_MAKING_HD_DESCRIPTION',             120,    'ERA_CLASSICAL',    -1,         'ADVISOR_TECHNOLOGY'),
    ('TECH_COMPASS_HD',             'LOC_TECH_COMPASS_HD_NAME',              'LOC_TECH_COMPASS_HD_DESCRIPTION',          		300,    'ERA_MEDIEVAL',     -3,         'ADVISOR_CONQUEST'),
    ('TECH_PHYSICS_HD',             'LOC_TECH_PHYSICS_HD_NAME',              NULL,                                               730,    'ERA_RENAISSANCE',  -2,         'ADVISOR_TECHNOLOGY'),
    ('TECH_BIOLOGY_HD',             'LOC_TECH_BIOLOGY_HD_NAME',              'LOC_TECH_BIOLOGY_HD_DESCRIPTION',                  1250,   'ERA_MODERN',       1,          'ADVISOR_GENERIC'),
    ('TECH_CIVIL_ENGINEERING_HD',   'LOC_TECH_CIVIL_ENGINEERING_HD_NAME',    'LOC_TECH_CIVIL_ENGINEERING_HD_DESCRIPTION',        930,    'ERA_INDUSTRIAL',   1,          'ADVISOR_GENERIC');


insert or replace into TechnologyQuotes
    (TechnologyType,                Quote,                                      QuoteAudio)
values
    ('TECH_CALENDAR_HD',            'LOC_TECH_CALENDAR_HD_QUOTE_1',             'Play_CalendarHD_Quote_1'),
    ('TECH_CALENDAR_HD',            'LOC_TECH_CALENDAR_HD_QUOTE_2',             'Play_CalendarHD_Quote_2'),
    ('TECH_PAPER_MAKING_HD',        'LOC_TECH_PAPER_MAKING_HD_QUOTE_1',         'Play_PaperMakingHD_Quote_1'),
    ('TECH_PAPER_MAKING_HD',        'LOC_TECH_PAPER_MAKING_HD_QUOTE_2',         'Play_PaperMakingHD_Quote_2'),
    ('TECH_COMPASS_HD',             'LOC_TECH_COMPASS_HD_QUOTE_1',              'Play_CompassHD_Quote_1'),
    ('TECH_COMPASS_HD',             'LOC_TECH_COMPASS_HD_QUOTE_2',              'Play_CompassHD_Quote_2'),
    ('TECH_PHYSICS_HD',             'LOC_TECH_PHYSICS_HD_QUOTE_1',              'Play_PhysicsHD_Quote_1'),
    ('TECH_PHYSICS_HD',             'LOC_TECH_PHYSICS_HD_QUOTE_2',              'Play_PhysicsHD_Quote_2'),
    ('TECH_BIOLOGY_HD',             'LOC_TECH_BIOLOGY_HD_QUOTE_1',              'Play_BiologyHD_Quote_1'),
    ('TECH_BIOLOGY_HD',             'LOC_TECH_BIOLOGY_HD_QUOTE_2',              'Play_BiologyHD_Quote_2'),
    ('TECH_CIVIL_ENGINEERING_HD',   'LOC_CIVIC_CIVIL_SERVICE_QUOTE_1',          'PLAY_CIVIL_SERVICE_QUOTE_2'),
    ('TECH_CIVIL_ENGINEERING_HD',   'LOC_CIVIC_CIVIL_SERVICE_QUOTE_2',          'PLAY_CIVIL_SERVICE_QUOTE_1');

--------------------------------------------------------------------------------

update Technologies set EmbarkAll = 1 where TechnologyType = 'TECH_CELESTIAL_NAVIGATION';
update ModifierArguments set Value = 20 where ModifierId = 'COMPUTERS_BOOST_ALL_TOURISM' and Name = 'Amount';

insert or replace into Technologies_XP2 (TechnologyType, RandomPrereqs, HiddenUntilPrereqComplete)
select TechnologyType, 0, 0 from Technologies where EraType = 'ERA_FUTURE';

update Technologies set AdvisorType = 'ADVISOR_TECHNOLOGY' where TechnologyType = 'TECH_COMPUTERS';

--------------------------------------------------------------------------------
-- from tech testing
update Projects set PrereqTech = 'TECH_ELECTRICITY' where ProjectType = 'PROJECT_CONVERT_REACTOR_TO_COAL';
update Projects set PrereqTech = 'TECH_REFINING' where ProjectType = 'PROJECT_CONVERT_REACTOR_TO_OIL';

update Buildings set PrereqTech = 'TECH_STEAM_POWER' where BuildingType = 'BUILDING_SEAPORT';
update Buildings set PrereqTech = 'TECH_ELECTRICITY' where BuildingType = 'BUILDING_COAL_POWER_PLANT';
update Buildings set PrereqTech = 'TECH_REFINING' where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT';
update Buildings set PrereqTech = 'TECH_METAL_CASTING' where BuildingType = 'BUILDING_WORKSHOP';
update Resources set PrereqTech = 'TECH_CHEMISTRY' where ResourceType = 'RESOURCE_OIL';
update Improvements set PrereqTech = 'TECH_MILITARY_ENGINEERING' where ImprovementType = 'IMPROVEMENT_FORT';

update ModifierArguments set Value = 'TECH_METAL_CASTING' where ModifierId = 'OPPIDUM_GRANT_TECH_APPRENTICESHIP' and Name = 'TechType';

insert or replace into Technologies_XP2 (TechnologyType, RandomPrereqs, HiddenUntilPrereqComplete)
select TechnologyType, 0, 0 from Technologies where EraType = 'ERA_FUTURE';

-- set UI Row
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_POTTERY';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_ANIMAL_HUSBANDRY';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_MINING';
update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_SAILING';
update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_ASTROLOGY';
update Technologies set UITreeRow = -1 where TechnologyType = 'TECH_IRRIGATION';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_ARCHERY';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_WRITING';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_MASONRY';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_BRONZE_WORKING'; -- , Cost = 50
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_THE_WHEEL';
update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_CELESTIAL_NAVIGATION';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_CURRENCY';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_HORSEBACK_RIDING';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_IRON_WORKING';
update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_SHIPBUILDING';
update Technologies set UITreeRow = -1 where TechnologyType = 'TECH_MATHEMATICS';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_CONSTRUCTION';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_ENGINEERING';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_BUTTRESS';
update Technologies set UITreeRow = 2, Cost = 600, EraType = 'ERA_RENAISSANCE' where TechnologyType = 'TECH_MILITARY_TACTICS';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_APPRENTICESHIP';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_MACHINERY'; -- , Cost = 550
update Technologies set UITreeRow = -1 where TechnologyType = 'TECH_EDUCATION';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_STIRRUPS';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_MILITARY_ENGINEERING';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_CASTLES'; -- , Cost = 450
update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_CARTOGRAPHY'; -- Cost = 550, EraType = 'ERA_MEDIEVAL'
update Technologies set UITreeRow = -1 where TechnologyType = 'TECH_MASS_PRODUCTION';
update Technologies set UITreeRow = 0, Cost = 730 where TechnologyType = 'TECH_BANKING';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_GUNPOWDER';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_PRINTING'; -- Cost = 950
update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_SQUARE_RIGGING';
update Technologies set UITreeRow = -2, cost = 600 where TechnologyType = 'TECH_ASTRONOMY';
update Technologies set UITreeRow = 2, Cost = 300, EraType = 'ERA_MEDIEVAL' where TechnologyType = 'TECH_METAL_CASTING';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_SIEGE_TACTICS';
-- Industrial era
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_INDUSTRIALIZATION';
update Technologies set UITreeRow = -1 where TechnologyType = 'TECH_SCIENTIFIC_THEORY';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_BALLISTICS';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_MILITARY_SCIENCE';
update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_STEAM_POWER';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_SANITATION';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_ECONOMICS';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_RIFLING';
update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_FLIGHT';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_REPLACEABLE_PARTS';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_STEEL';
update Technologies set UITreeRow = -1, Cost = 1250 where TechnologyType = 'TECH_ELECTRICITY';
update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_RADIO';
update Technologies set UITreeRow = 0, Cost = 1250 where TechnologyType = 'TECH_CHEMISTRY';
update Technologies set UITreeRow = 0, Cost = 1370 where TechnologyType = 'TECH_REFINING';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_COMBUSTION';
update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_ADVANCED_FLIGHT';
update Technologies set UITreeRow = -1, Cost = 1660 where TechnologyType = 'TECH_ROCKETRY';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_ADVANCED_BALLISTICS';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_COMBINED_ARMS';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_PLASTICS';
update Technologies set UITreeRow = -1, Cost = 1480 where TechnologyType = 'TECH_COMPUTERS';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_NUCLEAR_FISSION';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_SYNTHETIC_MATERIALS';
update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_TELECOMMUNICATIONS';
update Technologies set UITreeRow = -1 where TechnologyType = 'TECH_SATELLITES';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_GUIDANCE_SYSTEMS';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_LASERS';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_COMPOSITES';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_STEALTH_TECHNOLOGY';
update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_ROBOTICS';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_NANOTECHNOLOGY';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_NUCLEAR_FUSION';
update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_SEASTEADS';
update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_ADVANCED_AI';
update Technologies set UITreeRow = -1 where TechnologyType = 'TECH_ADVANCED_POWER_CELLS';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_CYBERNETICS';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_SMART_MATERIALS';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_PREDICTIVE_SYSTEMS';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_OFFWORLD_MISSION';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_FUTURE_TECH';

delete from TechnologyPrereqs;
insert or replace into TechnologyPrereqs
	(Technology,					PrereqTech)
values
	--  Ancient  ----------------------------------------------------------
    ('TECH_IRRIGATION',             'TECH_POTTERY'),
    ('TECH_ARCHERY',                'TECH_ANIMAL_HUSBANDRY'),
    ('TECH_WRITING',                'TECH_POTTERY'),
    ('TECH_MASONRY',                'TECH_MINING'),
    ('TECH_CALENDAR_HD',            'TECH_IRRIGATION'),
    ('TECH_CALENDAR_HD',            'TECH_WRITING'),
    ('TECH_BRONZE_WORKING',         'TECH_MINING'),
    ('TECH_THE_WHEEL',              'TECH_MINING'),
    --  Classical  --------------------------------------------------------
    ('TECH_CELESTIAL_NAVIGATION',   'TECH_SAILING'),
    ('TECH_CELESTIAL_NAVIGATION',   'TECH_ASTROLOGY'),
    ('TECH_CURRENCY',               'TECH_WRITING'),
    ('TECH_HORSEBACK_RIDING',       'TECH_ARCHERY'),
    ('TECH_IRON_WORKING',           'TECH_BRONZE_WORKING'),
    ('TECH_SHIPBUILDING',           'TECH_SAILING'),
    ('TECH_PAPER_MAKING_HD',        'TECH_CALENDAR_HD'),
    ('TECH_MATHEMATICS',            'TECH_PAPER_MAKING_HD'),
    ('TECH_MATHEMATICS',            'TECH_CURRENCY'),
    ('TECH_CONSTRUCTION',           'TECH_MASONRY'),
    ('TECH_ENGINEERING',            'TECH_THE_WHEEL'),
    ('TECH_ENGINEERING',            'TECH_IRON_WORKING'),
    --  Medieval  ---------------------------------------------------------
    ('TECH_METAL_CASTING',          'TECH_CONSTRUCTION'),
    ('TECH_METAL_CASTING',          'TECH_IRON_WORKING'),
    ('TECH_APPRENTICESHIP',         'TECH_CURRENCY'),
    ('TECH_APPRENTICESHIP',         'TECH_ENGINEERING'),
    ('TECH_MACHINERY',              'TECH_ENGINEERING'),
    ('TECH_COMPASS_HD',             'TECH_CELESTIAL_NAVIGATION'),
    ('TECH_COMPASS_HD',             'TECH_SHIPBUILDING'),
    ('TECH_EDUCATION',              'TECH_MATHEMATICS'),
    ('TECH_EDUCATION',              'TECH_APPRENTICESHIP'),
    ('TECH_STIRRUPS',               'TECH_HORSEBACK_RIDING'),
    ('TECH_BUTTRESS',               'TECH_HORSEBACK_RIDING'),
    ('TECH_BUTTRESS',               'TECH_CONSTRUCTION'),
    ('TECH_CASTLES',                'TECH_BUTTRESS'),
    ('TECH_MILITARY_ENGINEERING',   'TECH_BUTTRESS'),
    ('TECH_MILITARY_ENGINEERING',   'TECH_METAL_CASTING'),
    --  Renaissance  ------------------------------------------------------
    ('TECH_CARTOGRAPHY',            'TECH_COMPASS_HD'),
    ('TECH_MASS_PRODUCTION',        'TECH_EDUCATION'),
    ('TECH_PRINTING',               'TECH_MACHINERY'),
    ('TECH_PRINTING',               'TECH_MILITARY_ENGINEERING'),
    ('TECH_PRINTING',               'TECH_METAL_CASTING'),
    ('TECH_GUNPOWDER',              'TECH_CASTLES'),
    ('TECH_GUNPOWDER',              'TECH_MILITARY_ENGINEERING'),
    ('TECH_INDUSTRIALIZATION',      'TECH_MASS_PRODUCTION'), --TECH_EDUCATION
    ('TECH_BANKING',                'TECH_APPRENTICESHIP'),
    ('TECH_BANKING',                'TECH_PRINTING'),
    ('TECH_SQUARE_RIGGING',         'TECH_CARTOGRAPHY'),
    ('TECH_ASTRONOMY',              'TECH_EDUCATION'),
    ('TECH_ASTRONOMY',              'TECH_CELESTIAL_NAVIGATION'),
    ('TECH_PHYSICS_HD',             'TECH_ASTRONOMY'),
    ('TECH_PHYSICS_HD',             'TECH_MASS_PRODUCTION'),
    ('TECH_MILITARY_TACTICS',       'TECH_MILITARY_ENGINEERING'),
    ('TECH_SIEGE_TACTICS',          'TECH_GUNPOWDER'),
    --  Industrial  -------------------------------------------------------
    ('TECH_INDUSTRIALIZATION',      'TECH_BANKING'),
    ('TECH_SCIENTIFIC_THEORY',      'TECH_BANKING'),
    ('TECH_SCIENTIFIC_THEORY',      'TECH_PHYSICS_HD'),
    ('TECH_SCIENTIFIC_THEORY',      'TECH_MASS_PRODUCTION'), --TECH_PHYSICS_HD
    ('TECH_BALLISTICS',             'TECH_STIRRUPS'),
    ('TECH_BALLISTICS',             'TECH_GUNPOWDER'),
    ('TECH_MILITARY_SCIENCE',       'TECH_MILITARY_TACTICS'),
    ('TECH_MILITARY_SCIENCE',       'TECH_SIEGE_TACTICS'),
    ('TECH_STEAM_POWER',            'TECH_SQUARE_RIGGING'),
    ('TECH_STEAM_POWER',            'TECH_PHYSICS_HD'), --TECH_MASS_PRODUCTION
    ('TECH_STEAM_POWER',            'TECH_SCIENTIFIC_THEORY'),
    ('TECH_SANITATION',             'TECH_CIVIL_ENGINEERING_HD'),
    ('TECH_SANITATION',             'TECH_INDUSTRIALIZATION'),
    ('TECH_ECONOMICS',              'TECH_INDUSTRIALIZATION'),
    ('TECH_RIFLING',                'TECH_SIEGE_TACTICS'),
    ('TECH_RIFLING',                'TECH_BALLISTICS'),
    ('TECH_CIVIL_ENGINEERING_HD',   'TECH_PRINTING'),
    --  Modern  -----------------------------------------------------------
    ('TECH_FLIGHT',                 'TECH_STEAM_POWER'),
    ('TECH_REPLACEABLE_PARTS',      'TECH_RIFLING'),
    ('TECH_STEEL',                  'TECH_RIFLING'),
    ('TECH_STEEL',                  'TECH_MILITARY_SCIENCE'),
    ('TECH_CHEMISTRY',              'TECH_SANITATION'),
    ('TECH_CHEMISTRY',              'TECH_ECONOMICS'),
    ('TECH_CHEMISTRY',              'TECH_SCIENTIFIC_THEORY'),
    ('TECH_ELECTRICITY',            'TECH_SCIENTIFIC_THEORY'),
    ('TECH_ELECTRICITY',            'TECH_STEAM_POWER'),
    ('TECH_RADIO',                  'TECH_FLIGHT'),
    ('TECH_RADIO',                  'TECH_ELECTRICITY'),
    ('TECH_REFINING',               'TECH_CHEMISTRY'),
    ('TECH_REFINING',               'TECH_ELECTRICITY'),
    ('TECH_REFINING',               'TECH_BIOLOGY_HD'),
    ('TECH_BIOLOGY_HD',             'TECH_SANITATION'),
    ('TECH_COMBUSTION',             'TECH_BIOLOGY_HD'),
    ('TECH_COMBUSTION',             'TECH_STEEL'),
    --  Atomic  -----------------------------------------------------------
    ('TECH_ADVANCED_FLIGHT',        'TECH_RADIO'),
    ('TECH_COMPUTERS',              'TECH_RADIO'),
    ('TECH_COMPUTERS',              'TECH_REFINING'),
    ('TECH_COMPUTERS',              'TECH_ELECTRICITY'),
    ('TECH_ADVANCED_BALLISTICS',    'TECH_COMBUSTION'),
    ('TECH_COMBINED_ARMS',          'TECH_STEEL'),
    ('TECH_PLASTICS',               'TECH_REPLACEABLE_PARTS'),
    ('TECH_ROCKETRY',               'TECH_COMPUTERS'),
    ('TECH_ROCKETRY',               'TECH_ADVANCED_FLIGHT'),
    ('TECH_NUCLEAR_FISSION',        'TECH_ADVANCED_BALLISTICS'),
    ('TECH_NUCLEAR_FISSION',        'TECH_COMBINED_ARMS'),
    ('TECH_SYNTHETIC_MATERIALS',    'TECH_PLASTICS'),
    --  Infor  ------------------------------------------------------------
    ('TECH_TELECOMMUNICATIONS',     'TECH_ADVANCED_FLIGHT'),
    ('TECH_SATELLITES',             'TECH_ADVANCED_FLIGHT'),
    ('TECH_SATELLITES',             'TECH_ROCKETRY'),
    ('TECH_GUIDANCE_SYSTEMS',       'TECH_ROCKETRY'),
    ('TECH_GUIDANCE_SYSTEMS',       'TECH_ADVANCED_BALLISTICS'),
    ('TECH_LASERS',                 'TECH_NUCLEAR_FISSION'),
    ('TECH_COMPOSITES',             'TECH_SYNTHETIC_MATERIALS'),
    ('TECH_STEALTH_TECHNOLOGY',     'TECH_SYNTHETIC_MATERIALS'),
    ('TECH_ROBOTICS',               'TECH_SATELLITES'),
    ('TECH_ROBOTICS',               'TECH_GUIDANCE_SYSTEMS'),
    ('TECH_ROBOTICS',               'TECH_LASERS'),
    ('TECH_NANOTECHNOLOGY',         'TECH_COMPOSITES'),
    ('TECH_NUCLEAR_FUSION',         'TECH_LASERS'),
	-- Future Era  --------------------------------------------------------
	('TECH_FUTURE_TECH',			'TECH_OFFWORLD_MISSION'),
	('TECH_OFFWORLD_MISSION',		'TECH_ADVANCED_AI'),
	('TECH_OFFWORLD_MISSION',		'TECH_ADVANCED_POWER_CELLS'),
	('TECH_OFFWORLD_MISSION',		'TECH_CYBERNETICS'),
	('TECH_OFFWORLD_MISSION',		'TECH_SMART_MATERIALS'),
    ('TECH_OFFWORLD_MISSION',       'TECH_PREDICTIVE_SYSTEMS'),
    ('TECH_OFFWORLD_MISSION',       'TECH_SEASTEADS'),
	-- 
	('TECH_SEASTEADS',				'TECH_TELECOMMUNICATIONS'),
    ('TECH_ADVANCED_AI',            'TECH_TELECOMMUNICATIONS'),
	('TECH_ADVANCED_AI',			'TECH_ROBOTICS'),
	('TECH_ADVANCED_POWER_CELLS',	'TECH_ROBOTICS'),
	('TECH_ADVANCED_POWER_CELLS',	'TECH_NUCLEAR_FUSION'),
	('TECH_CYBERNETICS',			'TECH_ROBOTICS'),
	('TECH_SMART_MATERIALS',		'TECH_ROBOTICS'),
	('TECH_SMART_MATERIALS',		'TECH_NUCLEAR_FUSION'),
	('TECH_SMART_MATERIALS',		'TECH_NANOTECHNOLOGY'),
    ('TECH_PREDICTIVE_SYSTEMS',     'TECH_STEALTH_TECHNOLOGY'),
	('TECH_PREDICTIVE_SYSTEMS',		'TECH_NANOTECHNOLOGY');
--------------------------------------------------------------------------------

-- v3
update Technologies set Cost = 4500 where Cost = 2600;
-- 
update Technologies set Cost = 4000 where Cost = 2500;
update TechnologyRandomCosts set Cost = 3700 where Cost = 2300;
update TechnologyRandomCosts set Cost = 3600 where Cost = 2200;
-- 
update Technologies set Cost = 3100 where Cost = 2155;
update Technologies set Cost = 3000 where Cost = 1850;
-- 
update Technologies set Cost = 2500 where Cost = 1660;
update Technologies set Cost = 2400 where Cost = 1480;
-- 
update Technologies set Cost = 1900 where Cost = 1370;
update Technologies set Cost = 1800 where Cost = 1250;
-- 
update Technologies set Cost = 1400 where Cost = 1070;
update Technologies set Cost = 1300 where Cost = 930;
-- 
update Technologies set Cost = 950 where Cost = 730;
update Technologies set Cost = 850 where Cost = 600;
-- 
update Technologies set Cost = 600 where Cost = 390;
update Technologies set Cost = 450 where Cost = 300;
-- 
update Technologies set Cost = 280 where Cost = 200;
update Technologies set Cost = 160 where Cost = 120;
-- Ancient
update Technologies set Cost = 80 where Cost = 80;
update Technologies set Cost = 50 where Cost = 50;

insert or replace into TechnologyModifiers
	(TechnologyType,							ModifierId)
values
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_WRITING_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_LANDSCAPE_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_PORTRAIT_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_SCULPTURE_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_MUSIC_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_RELIGIOUS_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_ARTIFACTS_YIELD_BOOST'),
	('TECH_STEAM_POWER',						'TRAIT_WATER_TRADE_ROUTE_RANGE'),
	('TECH_CALENDAR_HD',						'TECH_CALENDAR_HD_MONUMENT_CULTURE'),
	('TECH_SAILING',							'TECH_SAILING_TRADER_EMBARK');
--	('TECH_SAILING',							'TECH_SAILING_SETTLER_EMBARK');

insert or replace into Modifiers
	(ModifierId,													ModifierType)
values
	('TECH_TELECOMMUNICATIONS_WRITING_YIELD_BOOST',					'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
	('TECH_TELECOMMUNICATIONS_LANDSCAPE_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),					
	('TECH_TELECOMMUNICATIONS_PORTRAIT_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
	('TECH_TELECOMMUNICATIONS_SCULPTURE_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),	
	('TECH_TELECOMMUNICATIONS_MUSIC_YIELD_BOOST',					'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
	('TECH_TELECOMMUNICATIONS_RELIGIOUS_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
	('TECH_TELECOMMUNICATIONS_ARTIFACTS_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
    ('ASTRONOMY_ADJACENT_MOUNTAIN_CAMPUS_SCIENCE',                  'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE'),
    ('TECH_CALENDAR_HD_MONUMENT_CULTURE',                           'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'),
	('TECH_SAILING_TRADER_EMBARK',									'MODIFIER_PLAYER_ADJUST_EMBARK_UNIT_PASS');

update Modifiers set SubjectRequirementSetId = 'IS_CAMPUS_ADJACENT_TO_MOUNTAIN_REQUIREMENTS'
    where ModifierId = 'ASTRONOMY_ADJACENT_MOUNTAIN_CAMPUS_SCIENCE';

insert or replace into ModifierArguments
	(ModifierId,												Name,						Value)
values
	('TECH_TELECOMMUNICATIONS_WRITING_YIELD_BOOST',				'GreatWorkObjectType',		'GREATWORKOBJECT_WRITING'),
	('TECH_TELECOMMUNICATIONS_WRITING_YIELD_BOOST',				'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_LANDSCAPE_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_LANDSCAPE'),
	('TECH_TELECOMMUNICATIONS_LANDSCAPE_YIELD_BOOST',			'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_PORTRAIT_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_PORTRAIT'),
	('TECH_TELECOMMUNICATIONS_PORTRAIT_YIELD_BOOST',			'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_SCULPTURE_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_SCULPTURE'),
	('TECH_TELECOMMUNICATIONS_SCULPTURE_YIELD_BOOST',			'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_MUSIC_YIELD_BOOST',				'GreatWorkObjectType',		'GREATWORKOBJECT_MUSIC'),
	('TECH_TELECOMMUNICATIONS_MUSIC_YIELD_BOOST',				'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_RELIGIOUS_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_RELIGIOUS'),
	('TECH_TELECOMMUNICATIONS_RELIGIOUS_YIELD_BOOST',			'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_ARTIFACTS_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_ARTIFACT'),
	('TECH_TELECOMMUNICATIONS_ARTIFACTS_YIELD_BOOST',			'ScalingFactor',			150),
    ('ASTRONOMY_ADJACENT_MOUNTAIN_CAMPUS_SCIENCE',              'YieldType',                'YIELD_SCIENCE'),
    ('ASTRONOMY_ADJACENT_MOUNTAIN_CAMPUS_SCIENCE',              'Amount',                   3),
    ('TECH_CALENDAR_HD_MONUMENT_CULTURE',                       'BuildingType',             'BUILDING_MONUMENT'),
    ('TECH_CALENDAR_HD_MONUMENT_CULTURE',                       'YieldType',                'YIELD_CULTURE'),
    ('TECH_CALENDAR_HD_MONUMENT_CULTURE',                       'Amount',                   1),
	('TECH_SAILING_TRADER_EMBARK',								'UnitType',					'UNIT_TRADER');


--移除雨林前移到采矿
update Features set RemoveTech = 'TECH_MINING' where FeatureType = 'FEATURE_JUNGLE';
--种树前移到工会，越南到神秘主义
update Features set AddCivic = 'CIVIC_GUILDS' where FeatureType = 'FEATURE_FOREST';
update Technologies set Description = null where TechnologyType = 'TECH_SANITATION';