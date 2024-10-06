-------------------------------------
--      Buildings Adjustments      --
-------------------------------------

-- Specialist Yield
-- The total yields of the specialist is 2, 3, 4, 6 for each tier of building excepts:
-- Specialist in Industrial Zone yields 2, 4, 5, 6.
-- Specialist in Holy Site yields 3, 4, 5, 6.
-- each extra yield increases the gold requirement of the specialist by 1 (or 2) except Gold or Faith yield.
insert or replace into Building_CitizenYieldChanges
	(BuildingType,							YieldType,			YieldChange)
values
	-- Campus
	('BUILDING_LIBRARY',					'YIELD_SCIENCE',	1),
	('BUILDING_LIBRARY',					'YIELD_GOLD',		-1),
	('BUILDING_UNIVERSITY',					'YIELD_SCIENCE',	1),
	('BUILDING_UNIVERSITY',					'YIELD_GOLD',		-1),
	('BUILDING_MADRASA',					'YIELD_SCIENCE',	1),
	('BUILDING_MADRASA',					'YIELD_GOLD',		-1),
	('BUILDING_RESEARCH_LAB',				'YIELD_SCIENCE',	2),
	('BUILDING_RESEARCH_LAB',				'YIELD_GOLD',		-2),
	-- Theater Square
	('BUILDING_AMPHITHEATER',				'YIELD_CULTURE',	1),
	('BUILDING_AMPHITHEATER',				'YIELD_GOLD',		-1),
	('BUILDING_MARAE',						'YIELD_CULTURE',	1),
	('BUILDING_MARAE',						'YIELD_GOLD',		-1),
	('BUILDING_MUSEUM_ART',					'YIELD_CULTURE',	1),
	('BUILDING_MUSEUM_ART',					'YIELD_GOLD',		-1),
	('BUILDING_MUSEUM_ARTIFACT',			'YIELD_CULTURE',	1),
	('BUILDING_MUSEUM_ARTIFACT',			'YIELD_GOLD',		-1),
	('BUILDING_FILM_STUDIO',				'YIELD_CULTURE',	2),
	('BUILDING_FILM_STUDIO',				'YIELD_GOLD',		-2),
	('BUILDING_BROADCAST_CENTER',			'YIELD_CULTURE',	2),
	('BUILDING_BROADCAST_CENTER',			'YIELD_GOLD',		-2),
	-- Industrial Zone
	('BUILDING_WORKSHOP',					'YIELD_PRODUCTION', 2),
	('BUILDING_WORKSHOP',					'YIELD_GOLD',		-2),
	('BUILDING_FACTORY',					'YIELD_PRODUCTION', 1),
	('BUILDING_FACTORY',					'YIELD_GOLD',		-1),
	('BUILDING_ELECTRONICS_FACTORY',		'YIELD_PRODUCTION', 1),
	('BUILDING_ELECTRONICS_FACTORY',		'YIELD_GOLD',		-1),
	('BUILDING_COAL_POWER_PLANT',			'YIELD_PRODUCTION', 1),
	('BUILDING_COAL_POWER_PLANT',			'YIELD_GOLD',		-1),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_PRODUCTION', 1),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_GOLD',		-1),
	('BUILDING_POWER_PLANT',				'YIELD_PRODUCTION', 1),
	('BUILDING_POWER_PLANT',				'YIELD_GOLD',		-1),
	-- Holy Site
	('BUILDING_SHRINE',						'YIELD_FAITH',		1),
	('BUILDING_TEMPLE',						'YIELD_FAITH',		1),
	('BUILDING_STAVE_CHURCH',				'YIELD_FAITH',		1),
	-- Harbor
	('BUILDING_LIGHTHOUSE',					'YIELD_PRODUCTION', 2),
	('BUILDING_SHIPYARD',					'YIELD_FOOD',		1),
	('BUILDING_SHIPYARD',					'YIELD_PRODUCTION',	1),
	('BUILDING_SHIPYARD',					'YIELD_GOLD',		-2),
	-- harbor: third level
	('BUILDING_SEAPORT',					'YIELD_FOOD',		0),
	('BUILDING_SEAPORT',					'YIELD_PRODUCTION',	2),
	('BUILDING_SEAPORT',					'YIELD_GOLD',		-2),
	-- Encampment
	('BUILDING_BARRACKS',					'YIELD_PRODUCTION', 1),
	('BUILDING_BARRACKS',					'YIELD_GOLD',		-1),
	('BUILDING_STABLE',						'YIELD_PRODUCTION', 1),
	('BUILDING_STABLE',						'YIELD_GOLD',		-1),
	('BUILDING_ORDU',						'YIELD_PRODUCTION', 1),
	('BUILDING_ORDU',						'YIELD_GOLD',		-1),
	('BUILDING_ARMORY',						'YIELD_PRODUCTION', 1),
	('BUILDING_ARMORY',						'YIELD_GOLD',		-1),
	('BUILDING_MILITARY_ACADEMY',			'YIELD_PRODUCTION', 2),
	('BUILDING_MILITARY_ACADEMY',			'YIELD_GOLD',		-2),
	-- Commercial Hub
	('BUILDING_MARKET',						'YIELD_GOLD',		2),
	('BUILDING_BANK',						'YIELD_GOLD',		2),
	('BUILDING_GRAND_BAZAAR',				'YIELD_GOLD',		2),
	('BUILDING_STOCK_EXCHANGE',				'YIELD_GOLD',		4),
	-- Neighbourhood
	('BUILDING_FOOD_MARKET',				'YIELD_FOOD',		1),
	('BUILDING_SHOPPING_MALL',				'YIELD_GOLD',		3);
delete from Building_CitizenYieldChanges where BuildingType = 'BUILDING_SEAPORT' and YieldType = 'YIELD_FOOD';

-- Citizen Slot
update Buildings set CitizenSlots = 1 where
	   BuildingType = 'BUILDING_FOOD_MARKET'
	or BuildingType = 'BUILDING_SHOPPING_MALL';

-- Prereq Tech & Civic
update Buildings set PrereqTech = NULL, PrereqCivic = 'CIVIC_HUMANISM' where BuildingType = 'BUILDING_ZOO' or BuildingType = 'BUILDING_THERMAL_BATH';
update Buildings set PrereqTech = NULL, PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where BuildingType = 'BUILDING_GRAND_BAZAAR';
update Buildings set PrereqTech = NULL, PrereqCivic = 'CIVIC_URBANIZATION' where BuildingType = 'BUILDING_FOOD_MARKET';
update Buildings set PrereqTech = NULL, PrereqCivic = 'CIVIC_URBANIZATION' where BuildingType = 'BUILDING_SHOPPING_MALL';
update Buildings set PrereqTech = 'TECH_IRON_WORKING', PrereqCivic = NULL where BuildingType = 'BUILDING_BARRACKS';
update Buildings set PrereqTech = 'TECH_BUTTRESS', PrereqCivic = NULL where BuildingType = 'BUILDING_TSIKHE';

-- Regional Range
update Buildings set RegionalRange = 4
where BuildingType = 'BUILDING_AMPHITHEATER'
	or BuildingType = 'BUILDING_ARENA'
	or BuildingType = 'BUILDING_TLACHTLI';
update Buildings set RegionalRange = 6
where BuildingType = 'BUILDING_UNIVERSITY'
	or BuildingType = 'BUILDING_MADRASA';
update Buildings set RegionalRange = 6
where BuildingType = 'BUILDING_RESEARCH_LAB'
	or BuildingType = 'BUILDING_MUSEUM_ART'
	or BuildingType = 'BUILDING_MUSEUM_ARTIFACT'
	or BuildingType = 'BUILDING_FILM_STUDIO'
	or BuildingType = 'BUILDING_BROADCAST_CENTER'
	or BuildingType = 'BUILDING_BANK'
	or BuildingType = 'BUILDING_GRAND_BAZAAR'
	or BuildingType = 'BUILDING_STOCK_EXCHANGE'
	or BuildingType = 'BUILDING_FOOD_MARKET'
	or BuildingType = 'BUILDING_SHOPPING_MALL'
	or BuildingType = 'BUILDING_FERRIS_WHEEL';

-- Entertainment
update Buildings set Entertainment = 1
where BuildingType = 'BUILDING_ARENA'
	or BuildingType = 'BUILDING_TLACHTLI'
	or BuildingType = 'BUILDING_FERRIS_WHEEL'
	or BuildingType = 'BUILDING_SEWER';
update Buildings set Entertainment = 2
where BuildingType = 'BUILDING_AQUARIUM'
	or BuildingType = 'BUILDING_ZOO';

-- Housing
update Buildings set Housing = 1
where BuildingType = 'BUILDING_CASTLE'
	or BuildingType = 'BUILDING_STAR_FORT'
	or BuildingType = 'BUILDING_TSIKHE'
	or BuildingType = 'BUILDING_GRANARY'
	or BuildingType = 'BUILDING_WATER_MILL';
update Buildings set Housing = 2
where BuildingType = 'BUILDING_LIGHTHOUSE';

-- Misc
insert or replace into Building_YieldDistrictCopies
	(BuildingType,							OldYieldType,			NewYieldType)
values
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_PRODUCTION',		'YIELD_PRODUCTION'),
	('BUILDING_POWER_PLANT',				'YIELD_PRODUCTION',		'YIELD_PRODUCTION');

delete from BuildingPrereqs where Building = 'BUILDING_AIRPORT' and PrereqBuilding = 'BUILDING_HANGAR';

-- Yield
delete from Building_YieldChanges where BuildingType = 'BUILDING_WATER_MILL' and YieldType = 'YIELD_FOOD';
insert or replace into Building_YieldChanges
	(BuildingType,					YieldType,			YieldChange)
values
	-- City Center
	('BUILDING_PALACE',				'YIELD_FOOD',		1),
	('BUILDING_PALACE',				'YIELD_PRODUCTION',	3),
	('BUILDING_GRANARY',			'YIELD_FOOD',		1),
	('BUILDING_WATER_MILL',			'YIELD_PRODUCTION',	2),
	-- Holy Site
	('BUILDING_CATHEDRAL',			'YIELD_FAITH',		8),
	('BUILDING_GURDWARA',			'YIELD_FAITH',		8),
	('BUILDING_MEETING_HOUSE',		'YIELD_FAITH',		8),
	('BUILDING_MOSQUE',				'YIELD_FAITH',		8),
	('BUILDING_PAGODA',				'YIELD_FAITH',		8),
	('BUILDING_SYNAGOGUE',			'YIELD_FAITH',		12),
	('BUILDING_WAT',				'YIELD_FAITH',		8),
	('BUILDING_STUPA',				'YIELD_FAITH',		8),
	('BUILDING_DAR_E_MEHR',			'YIELD_FAITH',		8),
	-- Commercial Hub
	('BUILDING_MARKET',				'YIELD_GOLD',		5),
	('BUILDING_BANK',				'YIELD_GOLD',		8),
	('BUILDING_GRAND_BAZAAR',		'YIELD_GOLD',		8),
	('BUILDING_STOCK_EXCHANGE',		'YIELD_GOLD',		8),
	-- Industrial Zone
	('BUILDING_WORKSHOP',			'YIELD_PRODUCTION',	3),
	('BUILDING_FACTORY',			'YIELD_PRODUCTION',	6),
	-- Campus
	('BUILDING_LIBRARY',			'YIELD_SCIENCE',	3),
	('BUILDING_UNIVERSITY',			'YIELD_SCIENCE',	4),
	('BUILDING_MADRASA',			'YIELD_SCIENCE',	5),
	('BUILDING_RESEARCH_LAB',		'YIELD_SCIENCE',	4),
	-- Theater Square
	('BUILDING_MUSEUM_ART',			'YIELD_CULTURE',	4),
	('BUILDING_MUSEUM_ARTIFACT',	'YIELD_CULTURE',	4),
	('BUILDING_BROADCAST_CENTER',	'YIELD_CULTURE',	4),
	('BUILDING_FILM_STUDIO',		'YIELD_CULTURE',	4),
	-- Harbor
	('BUILDING_SEAPORT',			'YIELD_FOOD',		3),
	('BUILDING_SEAPORT',			'YIELD_GOLD',		6),
	-- Airport
	('BUILDING_HANGAR',				'YIELD_PRODUCTION',	5),
	-- Neighborhood
	('BUILDING_SHOPPING_MALL',		'YIELD_GOLD',		6),
	('BUILDING_FOOD_MARKET',		'YIELD_FOOD',		3);
insert or replace into Building_YieldChangesBonusWithPower
	(BuildingType,					YieldType,			YieldChange)
values
	('BUILDING_STOCK_EXCHANGE',		'YIELD_GOLD',		8),
	('BUILDING_RESEARCH_LAB',		'YIELD_SCIENCE',	4),
	('BUILDING_BROADCAST_CENTER',	'YIELD_CULTURE',	3),
	('BUILDING_FILM_STUDIO',		'YIELD_CULTURE',	3),
	('BUILDING_SHOPPING_MALL',		'YIELD_GOLD',		6),
	('BUILDING_FOOD_MARKET',		'YIELD_FOOD',		3);

-- Yield Percentage
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	-- City Center
	('BUILDING_SEWER',						'SEWER_GROWTH_RATE'),
	-- Neighborhood
	('BUILDING_FOOD_MARKET',				'FOOD_MARKET_GROWTH_RATE'),
	('BUILDING_FOOD_MARKET',				'POWERED_FOOD_MARKET_GROWTH_RATE'),
	('BUILDING_SHOPPING_MALL',				'SHOPPING_MALL_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_SHOPPING_MALL',				'POWERED_SHOPPING_MALL_GOLD_PERCENTAGE_BOOST'),
	-- Campus
	('BUILDING_RESEARCH_LAB',				'RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_RESEARCH_LAB',				'POWERED_RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST'),
	-- Theater Square
	('BUILDING_MUSEUM_ART',					'MUSEUM_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_MUSEUM_ARTIFACT',			'MUSEUM_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_BROADCAST_CENTER',			'BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_BROADCAST_CENTER',			'POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_FILM_STUDIO',				'BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_FILM_STUDIO',				'POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST'),
	-- Commercial hub
	('BUILDING_BANK',						'BANK_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_GRAND_BAZAAR',				'BANK_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_STOCK_EXCHANGE',				'STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_STOCK_EXCHANGE',				'POWERED_STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST'),
	-- Holy site
	('BUILDING_CATHEDRAL',					'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_GURDWARA',					'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_MEETING_HOUSE',				'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_MOSQUE',						'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_PAGODA',						'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_SYNAGOGUE',					'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_WAT',						'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_STUPA',						'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_DAR_E_MEHR',					'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	-- Industrial Zone
	('BUILDING_FACTORY',					'FACTORY_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_FACTORY',					'FACTORY_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_ELECTRONICS_FACTORY',		'FACTORY_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_ELECTRONICS_FACTORY',		'FACTORY_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_POWER_PLANT',				'POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_POWER_PLANT',				'POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_COAL_POWER_PLANT',			'POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_COAL_POWER_PLANT',			'POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST');
insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	-- City Center
	('SEWER_GROWTH_RATE',									'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH'),
	-- Neighborhood
	('FOOD_MARKET_GROWTH_RATE',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH'),
	('SHOPPING_MALL_GOLD_PERCENTAGE_BOOST',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	-- Campus
	('RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST', 				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	-- Theater Square
	('MUSEUM_CULTURE_PERCENTAGE_BOOST', 					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST', 			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	-- Commercial Hub
	('BANK_GOLD_PERCENTAGE_BOOST', 							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST', 				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	-- Holy Site
	('TEMPLE_FAITH_PERCENTAGE_BOOST', 						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST', 			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	-- Industrial Zone
	('FACTORY_BUILDING_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER'),
	('FACTORY_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER'),
	('POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST',	'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER'),
	('POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',	'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER');
insert or replace into Modifiers
	(ModifierId, 											ModifierType,										SubjectRequirementSetId)
values
	('POWERED_FOOD_MARKET_GROWTH_RATE',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH',			'CITY_IS_POWERED'),
	('POWERED_SHOPPING_MALL_GOLD_PERCENTAGE_BOOST',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'CITY_IS_POWERED'),
	('POWERED_RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'CITY_IS_POWERED'),
	('POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'CITY_IS_POWERED'),
	('POWERED_STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'CITY_IS_POWERED');
insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	-- City Center
	('SEWER_GROWTH_RATE',									'Amount',		20),
	-- Neighborhood
	('FOOD_MARKET_GROWTH_RATE',								'Amount',		5),
	('SHOPPING_MALL_GOLD_PERCENTAGE_BOOST',					'YieldType',	'YIELD_GOLD'),
	('SHOPPING_MALL_GOLD_PERCENTAGE_BOOST',					'Amount',		5),
	-- Campus
	('RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',				'YieldType',	'YIELD_SCIENCE'),
	('RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',				'Amount',		5),
	-- Theater Square
	('MUSEUM_CULTURE_PERCENTAGE_BOOST',						'YieldType',	'YIELD_CULTURE'),
	('MUSEUM_CULTURE_PERCENTAGE_BOOST',						'Amount',		5),
	('BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',			'YieldType',	'YIELD_CULTURE'),
	('BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',			'Amount',		5),
	-- Commercial Hub
	('BANK_GOLD_PERCENTAGE_BOOST',							'YieldType',	'YIELD_GOLD'),
	('BANK_GOLD_PERCENTAGE_BOOST',							'Amount',		5),
	('STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',				'YieldType',	'YIELD_GOLD'),
	('STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',				'Amount',		5),
	-- Holy Site
	('TEMPLE_FAITH_PERCENTAGE_BOOST',						'YieldType',	'YIELD_FAITH'),
	('TEMPLE_FAITH_PERCENTAGE_BOOST',						'Amount',		5),
	('RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST',			'YieldType',	'YIELD_FAITH'),
	('RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST',			'Amount',		10),
	-- Industrial Zone
	('FACTORY_BUILDING_PRODUCTION_PERCENTAGE_BOOST',		'Amount',		5),
	('FACTORY_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',		'Amount',		5),
	('POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST',	'Amount',		10),
	('POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',	'Amount',		10),
	-- Powered
	('POWERED_FOOD_MARKET_GROWTH_RATE',						'Amount',		5),
	('POWERED_SHOPPING_MALL_GOLD_PERCENTAGE_BOOST',			'YieldType',	'YIELD_GOLD'),
	('POWERED_SHOPPING_MALL_GOLD_PERCENTAGE_BOOST',			'Amount',		5),
	('POWERED_RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',		'YieldType',	'YIELD_SCIENCE'),
	('POWERED_RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',		'Amount',		10),
	('POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',	'YieldType',	'YIELD_CULTURE'),
	('POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',	'Amount',		5),
	('POWERED_STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',		'YieldType',	'YIELD_GOLD'),
	('POWERED_STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',		'Amount',		5);

update ModifierArguments set Value = 'ERA_ANCIENT' where ModifierId = 'FILMSTUDIO_ENHANCEDLATETOURISM' and Name = 'MinimumEra';

-- Maintainance and Cost
-- City Center
update Buildings set Maintenance = 0,	Cost = 50	where BuildingType = 'BUILDING_MONUMENT';
update Buildings set Maintenance = 1,	Cost = 65	where BuildingType = 'BUILDING_GRANARY';
update Buildings set Maintenance = 1,	Cost = 80	where BuildingType = 'BUILDING_WATER_MILL';
update Buildings set Maintenance = 1,	Cost = 80	where BuildingType = 'BUILDING_PALGUM';
update Buildings set Maintenance = 0,	Cost = 60	where BuildingType = 'BUILDING_WALLS';
update Buildings set Maintenance = 1,	Cost = 180	where BuildingType = 'BUILDING_CASTLE';
update Buildings set Maintenance = 2,	Cost = 300	where BuildingType = 'BUILDING_STAR_FORT';
update Buildings set Maintenance = 2,	Cost = 140	where BuildingType = 'BUILDING_TSIKHE';
update Buildings set Maintenance = 5,	Cost = 200	where BuildingType = 'BUILDING_SEWER';
-- Campus
update Buildings set Maintenance = 1,	Cost = 95	where BuildingType = 'BUILDING_LIBRARY';
update Buildings set Maintenance = 4,	Cost = 275	where BuildingType = 'BUILDING_UNIVERSITY';
update Buildings set Maintenance = 4,	Cost = 250	where BuildingType = 'BUILDING_MADRASA';
update Buildings set Maintenance = 10,	Cost = 600	where BuildingType = 'BUILDING_RESEARCH_LAB';
-- Commercial Hub
update Buildings set Maintenance = 1,	Cost = 120	where BuildingType = 'BUILDING_MARKET';
update Buildings set Maintenance = 1,	Cost = 100	where BuildingType = 'BUILDING_SUKIENNICE';
update Buildings set Maintenance = 4,	Cost = 275	where BuildingType = 'BUILDING_BANK';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_GRAND_BAZAAR';
update Buildings set Maintenance = 10,	Cost = 550	where BuildingType = 'BUILDING_STOCK_EXCHANGE';
-- Harbor
update Buildings set Maintenance = 1,	Cost = 120	where BuildingType = 'BUILDING_LIGHTHOUSE';
update Buildings set Maintenance = 4,	Cost = 250	where BuildingType = 'BUILDING_SHIPYARD';
update Buildings set Maintenance = 10,	Cost = 400	where BuildingType = 'BUILDING_SEAPORT';
-- Encampment
update Buildings set Maintenance = 1,	Cost = 90	where BuildingType = 'BUILDING_BARRACKS';
update Buildings set Maintenance = 1,	Cost = 90	where BuildingType = 'BUILDING_STABLE';
update Buildings set Maintenance = 1,	Cost = 90	where BuildingType = 'BUILDING_BASILIKOI_PAIDES';
update Buildings set Maintenance = 1,	Cost = 90	where BuildingType = 'BUILDING_ORDU';
update Buildings set Maintenance = 4,	Cost = 200	where BuildingType = 'BUILDING_ARMORY';
update Buildings set Maintenance = 7,	Cost = 400	where BuildingType = 'BUILDING_MILITARY_ACADEMY';
-- Industrial Zone
update Buildings set Maintenance = 3,	Cost = 200	where BuildingType = 'BUILDING_WORKSHOP';
update Buildings set Maintenance = 7,	Cost = 400	where BuildingType = 'BUILDING_FACTORY';
update Buildings set Maintenance = 7,	Cost = 360	where BuildingType = 'BUILDING_ELECTRONICS_FACTORY';
update Buildings set Maintenance = 10,	Cost = 500	where BuildingType = 'BUILDING_COAL_POWER_PLANT';
update Buildings set Maintenance = 10,	Cost = 550	where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT';
update Buildings set Maintenance = 10,	Cost = 600	where BuildingType = 'BUILDING_POWER_PLANT';
-- Holy Site
update Buildings set Maintenance = 1,	Cost = 80	where BuildingType = 'BUILDING_SHRINE';
update Buildings set Maintenance = 2,	Cost = 140	where BuildingType = 'BUILDING_TEMPLE';
update Buildings set Maintenance = 2,	Cost = 140	where BuildingType = 'BUILDING_STAVE_CHURCH';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_CATHEDRAL';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_GURDWARA';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_MEETING_HOUSE';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_MOSQUE';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_PAGODA';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_SYNAGOGUE';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_WAT';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_STUPA';
update Buildings set Maintenance = 4,	Cost = 220	where BuildingType = 'BUILDING_DAR_E_MEHR';
update Buildings set Maintenance = 2,	Cost = 140	where BuildingType = 'BUILDING_PRASAT';
-- Theater Square
update Buildings set Maintenance = 1,	Cost = 135	where BuildingType = 'BUILDING_AMPHITHEATER';
update Buildings set Maintenance = 1,	Cost = 100	where BuildingType = 'BUILDING_MARAE';
update Buildings set Maintenance = 4,	Cost = 300	where BuildingType = 'BUILDING_MUSEUM_ART';
update Buildings set Maintenance = 4,	Cost = 300	where BuildingType = 'BUILDING_MUSEUM_ARTIFACT';
update Buildings set Maintenance = 10,	Cost = 550	where BuildingType = 'BUILDING_BROADCAST_CENTER';
update Buildings set Maintenance = 10,	Cost = 480	where BuildingType = 'BUILDING_FILM_STUDIO';
-- Entertainment & Water Park
update Buildings set Maintenance = 1,	Cost = 150	where BuildingType = 'BUILDING_ARENA';
update Buildings set Maintenance = 1,	Cost = 120	where BuildingType = 'BUILDING_TLACHTLI';
update Buildings set Maintenance = 4,	Cost = 380	where BuildingType = 'BUILDING_ZOO';
update Buildings set Maintenance = 4,	Cost = 320	where BuildingType = 'BUILDING_THERMAL_BATH';
update Buildings set Maintenance = 10,	Cost = 550	where BuildingType = 'BUILDING_STADIUM';
update Buildings set Maintenance = 1,	Cost = 250	where BuildingType = 'BUILDING_FERRIS_WHEEL';
update Buildings set Maintenance = 4,	Cost = 380	where BuildingType = 'BUILDING_AQUARIUM';
update Buildings set Maintenance = 10,	Cost = 550	where BuildingType = 'BUILDING_AQUATICS_CENTER';
-- Airport
update Buildings set Maintenance = 8,	Cost = 360	where BuildingType = 'BUILDING_HANGAR';
update Buildings set Maintenance = 12,	Cost = 480	where BuildingType = 'BUILDING_AIRPORT';
-- Dam
update Buildings set Maintenance = 6,	Cost = 360	where BuildingType = 'BUILDING_HYDROELECTRIC_DAM';
-- Diplomatic Quater
update Buildings set Maintenance = 1,	Cost = 150	where BuildingType = 'BUILDING_CONSULATE';
update Buildings set Maintenance = 4,	Cost = 300	where BuildingType = 'BUILDING_CHANCERY';
-- Neighborhood
update Buildings set Maintenance = 7,	Cost = 360	where BuildingType = 'BUILDING_FOOD_MARKET';
update Buildings set Maintenance = 7,	Cost = 360	where BuildingType = 'BUILDING_SHOPPING_MALL';
-- Government Plaza
update Buildings set Maintenance = 1,	Cost = 150	where BuildingType = 'BUILDING_GOV_TALL';
update Buildings set Maintenance = 1,	Cost = 150	where BuildingType = 'BUILDING_GOV_WIDE';
update Buildings set Maintenance = 1,	Cost = 150	where BuildingType = 'BUILDING_GOV_CONQUEST';
update Buildings set Maintenance = 4,	Cost = 300	where BuildingType = 'BUILDING_GOV_CITYSTATES';
update Buildings set Maintenance = 4,	Cost = 300	where BuildingType = 'BUILDING_GOV_SPIES';
update Buildings set Maintenance = 4,	Cost = 300	where BuildingType = 'BUILDING_GOV_FAITH';
update Buildings set Maintenance = 4,	Cost = 225	where BuildingType = 'BUILDING_QUEENS_BIBLIOTHEQUE';
update Buildings set Maintenance = 7,	Cost = 600	where BuildingType = 'BUILDING_GOV_MILITARY';
update Buildings set Maintenance = 7,	Cost = 600	where BuildingType = 'BUILDING_GOV_CULTURE';
update Buildings set Maintenance = 7,	Cost = 600	where BuildingType = 'BUILDING_GOV_SCIENCE';

-- BuildingModifiers
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'LIGHTHOUSE_TRADE_ROUTE_CAPACITY';

delete from BuildingModifiers where BuildingType = 'BUILDING_GOV_TALL' and ModifierId = 'GOV_TALL_LOYALTY_DEBUFF';
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'GOV_TALL_AMENITY_BUFF';
update Modifiers set ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY' where ModifierId = 'GOV_TALL_AMENITY_BUFF';
update ModifierArguments set Value = 1 where ModifierId = 'GOV_TALL_AMENITY_BUFF';
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'GOV_TALL_HOUSING_BUFF';

delete from BuildingModifiers where BuildingType = 'BUILDING_LIGHTHOUSE' and ModifierId = 'LIGHTHOUSE_COASTAL_CITY_HOUSING';
delete from BuildingModifiers where BuildingType = 'BUILDING_AIRPORT' and ModifierId = 'AIRPORT_BONUS_AIR_SLOTS';
update ModifierArguments set Value = 2 where ModifierId = 'HANGAR_BONUS_AIR_SLOTS' and Name = 'Amount';
delete from BuildingModifiers where ModifierId like '%_ADJUST_RESOURCE_STOCKPILE_CAP';
delete from BuildingModifiers where BuildingType = 'BUILDING_SHOPPING_MALL' and ModifierId = 'SHOPPING_MALL_TOURISM';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	-- City Center
	('BUILDING_GRANARY',			'GRANARY_POP_FOOD_MODIFIER'),
	('BUILDING_GRANARY',			'GRANARY_BONUS_PLANTATION_FOOD'),
	('BUILDING_GRANARY',			'GRANARY_BONUS_CAMP_FOOD'),
	-- Holy Site
	('BUILDING_SHRINE',				'SHRINE_BUILDER_PURCHASE'),
	('BUILDING_TEMPLE',				'TEMPLE_SETTLER_PURCHASE'),
	('BUILDING_STAVE_CHURCH',		'TEMPLE_SETTLER_PURCHASE'),
	-- Campus
	('BUILDING_LIBRARY',			'LIBRARY_POP_SCIENCE_MODIFIER'),
	-- Industrial Zone
    ('BUILDING_WORKSHOP',           'WORKSHOP_IMPROVEMENT_PRODUCTION'),
	('BUILDING_FACTORY',			'FACTORY_POP_PRODUCTION_MODIFIER'),
	('BUILDING_ELECTRONICS_FACTORY','FACTORY_POP_PRODUCTION_MODIFIER'),
	('BUILDING_FACTORY',			'FACTORY_ADD_RESOURCE_PRODUCTION'),
	('BUILDING_ELECTRONICS_FACTORY','FACTORY_ADD_RESOURCE_PRODUCTION'),
	-- Harbor
	('BUILDING_LIGHTHOUSE',			'LIGHTHOUSE_ADD_FISHERY_GOLD'),
	('BUILDING_SHIPYARD',			'SHIPYARD_NAVAL_UNIT_PRODUCTION'),
	('BUILDING_SEAPORT',			'SEAPORT_EXTRA_GREAT_ADMIRAL_POINTS'),
	('BUILDING_SEAPORT',			'SEAPORT_TRAINED_STRENGTH_MODIFIER'),
	-- Encampment
	('BUILDING_BARRACKS',			'BARRACKS_ADD_IRON_PRODUCTION'),
	('BUILDING_BARRACKS',			'BARRACKS_TRAINED_STRENGTH_MODIFIER'),
	('BUILDING_STABLE',				'STABLE_ADD_HORSES_PRODUCTION'),
	('BUILDING_STABLE',				'STABLE_TRAINED_STRENGTH_MODIFIER'),
	('BUILDING_ORDU',				'STABLE_ADD_HORSES_PRODUCTION'),
	('BUILDING_ORDU',				'ORDU_TRAINED_STRENGTH_MODIFIER'),
	('BUILDING_ARMORY',				'ARMORY_ADD_RESOURCE_PRODUCTION'),
	('BUILDING_ARMORY',				'CITY_DEFENDER_FREE_PROMOTIONS'),
	('BUILDING_ARMORY',				'HD_ARMORY_ADJUST_RESOURCE_STOCKPILE_CAP'),
	('BUILDING_MILITARY_ACADEMY',	'MILITARY_ACADEMY_ADD_RESOURCE_PRODUCTION'),
	('BUILDING_MILITARY_ACADEMY',	'MILITARY_ACADEMY_EXTRA_GREAT_GENERAL_POINTS'),
	('BUILDING_MILITARY_ACADEMY',	'MILITARY_ACADEMY_TRAINED_STRENGTH_MODIFIER'),
	-- Aerodrome
	('BUILDING_HANGAR',				'HANGAR_AIR_UNIT_PRODUCTION'),
	-- Dam
	('BUILDING_HYDROELECTRIC_DAM',	'HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	('SHRINE_BUILDER_PURCHASE',								'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE'),
	('TEMPLE_SETTLER_PURCHASE',								'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE'),
	('FACTORY_POP_PRODUCTION_MODIFIER',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('SEAPORT_EXTRA_GREAT_ADMIRAL_POINTS',					'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
    ('MILITARY_ACADEMY_EXTRA_GREAT_GENERAL_POINTS',			'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
	('HD_ARMORY_ADJUST_RESOURCE_STOCKPILE_CAP',				'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP'),
	('HANGAR_AIR_UNIT_PRODUCTION',							'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('SHIPYARD_NAVAL_UNIT_PRODUCTION',						'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,									ModifierType,													SubjectRequirementSetId)
values
	('GRANARY_BONUS_PLANTATION_FOOD',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'HD_PLOT_HAS_PLANTATION_OVER_BONUS_RESOURCES'),
	('GRANARY_BONUS_CAMP_FOOD',						'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'HD_PLOT_HAS_CAMP_OVER_BONUS_RESOURCES'),
	('GRANARY_POP_FOOD_MODIFIER',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		'PLAYER_HAS_CALENDAR_REQUIREMENTS'),
	('LIGHTHOUSE_ADD_FISHERY_GOLD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'PLOT_HAS_IMPROVEMENT_FISHERY_REQUIREMENTS'), 
	('BARRACKS_ADD_IRON_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'HAS_IMPROVED_IRON'),
	('STABLE_ADD_HORSES_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'HAS_IMPROVED_HORSES'),
	('ARMORY_ADD_RESOURCE_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'HAS_ARMORY_RESOURCE'),
	('FACTORY_ADD_RESOURCE_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'HAS_FACTORY_RESOURCE'),
	('MILITARY_ACADEMY_ADD_RESOURCE_PRODUCTION',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'HAS_MILITARY_ACADEMY_RESOURCE'),
    ('WORKSHOP_IMPROVEMENT_PRODUCTION',          	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',          		'PLOT_IS_IMPROVED'),
	('HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS'),
	('LIBRARY_POP_SCIENCE_MODIFIER',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		'PLAYER_HAS_PAPER_MAKING_REQUIREMENTS');

insert or replace into Modifiers
	(ModifierId,									ModifierType,												Permanent)
values
	('BARRACKS_TRAINED_STRENGTH_MODIFIER',			'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1),
	('BASILIKOI_TRAINED_STRENGTH_MODIFIER', 		'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1),
	('STABLE_TRAINED_STRENGTH_MODIFIER',			'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1),
	('SEAPORT_TRAINED_STRENGTH_MODIFIER',			'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1),
	('MILITARY_ACADEMY_TRAINED_STRENGTH_MODIFIER',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1),
	('ORDU_TRAINED_STRENGTH_MODIFIER',				'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1);

insert or replace into ModifierArguments
	(ModifierId,									Name,						Value)
values
	('SHRINE_BUILDER_PURCHASE',						'Tag',						'CLASS_BUILDER'),
	('TEMPLE_SETTLER_PURCHASE',						'Tag',						'CLASS_SETTLER'),
	('GRANARY_POP_FOOD_MODIFIER',					'YieldType',				'YIELD_FOOD'),
	('GRANARY_POP_FOOD_MODIFIER',					'Amount',					'0.5'),
	('LIBRARY_POP_SCIENCE_MODIFIER',				'YieldType',				'YIELD_SCIENCE'),
	('LIBRARY_POP_SCIENCE_MODIFIER',				'Amount',					'0.3'),
	('FACTORY_POP_PRODUCTION_MODIFIER',				'YieldType',				'YIELD_PRODUCTION'),
	('FACTORY_POP_PRODUCTION_MODIFIER',				'Amount',					'0.5'),
	('SEAPORT_EXTRA_GREAT_ADMIRAL_POINTS',			'GreatPersonClassType',		'GREAT_PERSON_CLASS_ADMIRAL'),
	('SEAPORT_EXTRA_GREAT_ADMIRAL_POINTS',			'Amount',					10),
	('MILITARY_ACADEMY_EXTRA_GREAT_GENERAL_POINTS',	'GreatPersonClassType',		'GREAT_PERSON_CLASS_GENERAL'),
	('MILITARY_ACADEMY_EXTRA_GREAT_GENERAL_POINTS',	'Amount',					10),
	('HD_ARMORY_ADJUST_RESOURCE_STOCKPILE_CAP',		'Amount',					30),
	('HANGAR_AIR_UNIT_PRODUCTION',					'Domain',					'DOMAIN_AIR'),
	('HANGAR_AIR_UNIT_PRODUCTION',					'Amount',					50),
	('SHIPYARD_NAVAL_UNIT_PRODUCTION',				'Domain',					'DOMAIN_SEA'),
	('SHIPYARD_NAVAL_UNIT_PRODUCTION',				'Amount',					25),
	('GRANARY_BONUS_PLANTATION_FOOD',				'YieldType',				'YIELD_FOOD'),
	('GRANARY_BONUS_PLANTATION_FOOD',				'Amount',					1),
	('GRANARY_BONUS_CAMP_FOOD',						'YieldType',				'YIELD_FOOD'),
	('GRANARY_BONUS_CAMP_FOOD',						'Amount',					1),
	('LIGHTHOUSE_ADD_FISHERY_GOLD',					'YieldType',				'YIELD_GOLD'),
	('LIGHTHOUSE_ADD_FISHERY_GOLD',					'Amount',					1),
	('BARRACKS_ADD_IRON_PRODUCTION',				'YieldType',				'YIELD_PRODUCTION'),
	('BARRACKS_ADD_IRON_PRODUCTION',				'Amount',					2),
	('STABLE_ADD_HORSES_PRODUCTION',				'YieldType',				'YIELD_PRODUCTION'),
	('STABLE_ADD_HORSES_PRODUCTION',				'Amount',					2),
	('ARMORY_ADD_RESOURCE_PRODUCTION',				'YieldType',				'YIELD_PRODUCTION'),
	('ARMORY_ADD_RESOURCE_PRODUCTION',				'Amount', 					1),
	('FACTORY_ADD_RESOURCE_PRODUCTION',				'YieldType',				'YIELD_PRODUCTION'),
	('FACTORY_ADD_RESOURCE_PRODUCTION',				'Amount', 					1),
	('MILITARY_ACADEMY_ADD_RESOURCE_PRODUCTION',	'YieldType',				'YIELD_PRODUCTION'),
	('MILITARY_ACADEMY_ADD_RESOURCE_PRODUCTION',	'Amount',					1),
	('HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION',		'YieldType',				'YIELD_PRODUCTION'),
	('HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION',		'Amount',					1),
    ('WORKSHOP_IMPROVEMENT_PRODUCTION',      		'YieldType',    			'YIELD_PRODUCTION'),
    ('WORKSHOP_IMPROVEMENT_PRODUCTION',         	'Amount',       			1),
	('BARRACKS_TRAINED_STRENGTH_MODIFIER',			'AbilityType',				'ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH'),
	('BASILIKOI_TRAINED_STRENGTH_MODIFIER',			'AbilityType',				'ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH'),
	('STABLE_TRAINED_STRENGTH_MODIFIER',			'AbilityType',				'ABILITY_STABLE_TRAINED_UNIT_STRENGTH'),
	('MILITARY_ACADEMY_TRAINED_STRENGTH_MODIFIER',	'AbilityType',				'ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH'),
	('SEAPORT_TRAINED_STRENGTH_MODIFIER',			'AbilityType',				'ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH'),
	('ORDU_TRAINED_STRENGTH_MODIFIER',				'AbilityType',				'ABILITY_ORDU_TRAINED_UNIT_STRENGTH');

---University buff adjacent rainforest and gain science from rainforest
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_MADRASA',			'MADRASA_ADD_DESERT_ADJACENCY'),
	('BUILDING_MADRASA',			'MADRASA_ADD_DESERT_HILLS_ADJACENCY'),
	('BUILDING_MADRASA',			'FEUDALISM_ADD_RAINFOREST_ADJACENCY'),
	('BUILDING_MADRASA',			'UNIVERSITY_ADD_POPULATION_SCIENCE'),
	('BUILDING_UNIVERSITY',			'FEUDALISM_ADD_RAINFOREST_ADJACENCY'),
	('BUILDING_UNIVERSITY',			'UNIVERSITY_ADD_POPULATION_SCIENCE');

insert or ignore into Modifiers
	(ModifierId,									ModifierType,												SubjectRequirementSetId)
values
	('MADRASA_ADD_DESERT_ADJACENCY',				'MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',					NULL),
	('MADRASA_ADD_DESERT_HILLS_ADJACENCY',			'MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',					NULL),
	('FEUDALISM_ADD_RAINFOREST_ADJACENCY',			'MODIFIER_SINGLE_CITY_FEATURE_ADJACENCY',					'PLAYER_HAS_CIVIC_FEUDALISM_REQUIREMENTS'),
	('UNIVERSITY_ADD_POPULATION_SCIENCE',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL),
	('UNIVERSITY_ADD_ADJACENT_RAINFOREST_SCIENCE',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'UNIVERSITY_ADJACENCY_SCIENCE_JUNGLE_REQUIREMENTS');

insert or ignore into ModifierArguments
	(ModifierId,										Name,				Value)
values
	('MADRASA_ADD_DESERT_ADJACENCY',					'DistrictType',		'DISTRICT_CAMPUS'),
	('MADRASA_ADD_DESERT_ADJACENCY',					'TerrainType',		'TERRAIN_DESERT'),
	('MADRASA_ADD_DESERT_ADJACENCY',					'YieldType',		'YIELD_SCIENCE'),
	('MADRASA_ADD_DESERT_ADJACENCY',					'Amount',			1),
	('MADRASA_ADD_DESERT_ADJACENCY',					'Description',		'LOC_DISTRICT_DESERT_SCIENCE'),
	('MADRASA_ADD_DESERT_HILLS_ADJACENCY',				'DistrictType',		'DISTRICT_CAMPUS'),
	('MADRASA_ADD_DESERT_HILLS_ADJACENCY',				'TerrainType',		'TERRAIN_DESERT_HILLS'),
	('MADRASA_ADD_DESERT_HILLS_ADJACENCY',				'YieldType',		'YIELD_SCIENCE'),
	('MADRASA_ADD_DESERT_HILLS_ADJACENCY',				'Amount',			1),
	('MADRASA_ADD_DESERT_HILLS_ADJACENCY',				'Description',		'LOC_DISTRICT_DESERT_HILLS_SCIENCE'),
	('FEUDALISM_ADD_RAINFOREST_ADJACENCY',				'DistrictType',		'DISTRICT_CAMPUS'),
	('FEUDALISM_ADD_RAINFOREST_ADJACENCY',				'FeatureType',		'FEATURE_JUNGLE'),
	('FEUDALISM_ADD_RAINFOREST_ADJACENCY',				'YieldType',		'YIELD_SCIENCE'),
	('FEUDALISM_ADD_RAINFOREST_ADJACENCY',				'Amount',			1),
	('FEUDALISM_ADD_RAINFOREST_ADJACENCY',				'Description',		'LOC_UNIVERSITY_JUNGLE_SCIENCE'),
	('UNIVERSITY_ADD_POPULATION_SCIENCE',				'YieldType',		'YIELD_SCIENCE'),
	('UNIVERSITY_ADD_POPULATION_SCIENCE',				'Amount',			0.5),
	('UNIVERSITY_ADD_ADJACENT_RAINFOREST_SCIENCE',		'YieldType',		'YIELD_SCIENCE'),
	('UNIVERSITY_ADD_ADJACENT_RAINFOREST_SCIENCE',		'Amount',			1);

--政体建筑改动
--一级政体建筑
--谒见厅住房
update ModifierArguments set Value = 2 where ModifierId = 'GOV_TALL_HOUSING_BUFF';
--军阀宝座下城加产
update ModifierArguments set Value = 15 where ModifierId = 'GOV_PRODUCTION_BOOST_FROM_CAPTURE' and Name = 'Amount';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
--谒见厅余粮
--	('BUILDING_GOV_TALL',			'GOV_TALL_GROWTH_RATE'),
--谒见厅奇观、建筑加速
	('BUILDING_GOV_TALL',			'GOV_TALL_BUILDING_PRODUCTION'),
	('BUILDING_GOV_TALL',			'GOV_TALL_WONDER_PRODUCTION'),
--谒见厅区域加速
	('BUILDING_GOV_TALL',			'GOV_TALL_DISTRICT_PRODUCTION'),
--谒见厅区域使者
--	('BUILDING_GOV_TALL',			'GOV_TALL_DISTRICT_ENVOY'),
--谒见厅额外区域
	('BUILDING_GOV_TALL',			'GOV_TALL_EXTRA_DISTRICT'),
--军阀宝座劫掠加成
	('BUILDING_GOV_CONQUEST',		'GOV_CONQUEST_DOUBLEPILLAGEDISTRICT'),
	('BUILDING_GOV_CONQUEST',		'GOV_CONQUEST_DOUBLEPILLAGEIMPROVE'),
--军阀宝座锤军事单位加速
	('BUILDING_GOV_CONQUEST',	    'GOV_CONQUEST_MILITARY_UNIT_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,								ModifierType,														SubjectRequirementSetId)
values
--谒见厅余粮
	('GOV_TALL_GROWTH_RATE',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH',						NULL),
--谒见厅奇观、建筑加速
	('GOV_TALL_BUILDING_PRODUCTION',			'MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER',		NULL),
	('GOV_TALL_WONDER_PRODUCTION',				'MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION',					NULL),
--谒见厅区域加速
	('GOV_TALL_DISTRICT_PRODUCTION',			'MODIFIER_CITY_INCREASE_DISTRICT_PRODUCTION_RATE',					NULL),
--谒见厅区域使者
	('GOV_TALL_DISTRICT_ENVOY',					'MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER',							'DISTRICT_IS_SPECIALTY_DISTRICT_REQUIREMENTS'),
	('GOV_TALL_DISTRICT_ENVOY_MODIFIER',		'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',							NULL),
--谒见厅额外区域
	('GOV_TALL_EXTRA_DISTRICT',					'MODIFIER_PLAYER_CITIES_EXTRA_DISTRICT',							'CITY_HAS_BUILDING_GOV_TALL_REQUIREMENTS'),
--军阀宝座劫掠加成
	('GOV_CONQUEST_DOUBLEPILLAGEDISTRICT',		'MODIFIER_PLAYER_ADJUST_DISTRICT_PILLAGE',							NULL),
	('GOV_CONQUEST_DOUBLEPILLAGEIMPROVE',		'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_PILLAGE',						NULL),
--军阀宝座锤军事单位加速
	('GOV_CONQUEST_MILITARY_UNIT_PRODUCTION',	'MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION',			NULL);

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
--谒见厅余粮
	('GOV_TALL_GROWTH_RATE',					'Amount',		15),
--谒见厅奇观、建筑加速
	('GOV_TALL_BUILDING_PRODUCTION',			'Amount',		20),
	('GOV_TALL_BUILDING_PRODUCTION',			'IsWonder',		0),
	('GOV_TALL_WONDER_PRODUCTION',				'Amount',		20),
--谒见厅区域加速
	('GOV_TALL_DISTRICT_PRODUCTION',			'Amount',		20),
--谒见厅区域使者
	('GOV_TALL_DISTRICT_ENVOY',					'ModifierId',	'GOV_TALL_DISTRICT_ENVOY_MODIFIER'),
	('GOV_TALL_DISTRICT_ENVOY_MODIFIER',		'Amount',		1),
--谒见厅额外区域
	('GOV_TALL_EXTRA_DISTRICT',					'Amount',		1),
--军阀宝座劫掠加成
	('GOV_CONQUEST_DOUBLEPILLAGEDISTRICT',		'Amount',		100),
	('GOV_CONQUEST_DOUBLEPILLAGEIMPROVE',		'Amount',		100),
--军阀宝座锤军事单位加速
	('GOV_CONQUEST_MILITARY_UNIT_PRODUCTION',	'Amount',		20);
	-- ('GOV_CONQUEST_NAVAL_UNIT_PRODUCTION',	'Domain',		'DOMAIN_SEA'),
	-- ('GOV_CONQUEST_NAVAL_UNIT_PRODUCTION',	'Amount',		30),
	-- ('GOV_CONQUEST_GDR_PRODUCTION',				'UnitType',		'UNIT_GIANT_DEATH_ROBOT'),
	-- ('GOV_CONQUEST_GDR_PRODUCTION',				'Amount',		30);

--二级政体建筑
--删除原效果
--中书省
delete from BuildingModifiers where BuildingType = 'BUILDING_GOV_CITYSTATES';
--主教座堂
delete from BuildingModifiers where BuildingType = 'BUILDING_GOV_FAITH';

--中书省额外总督点
--update ModifierArguments set Value = 2 where ModifierId = 'GOV_BUILDING_CITYSTATES_GRANT_GOVERNOR_POINTS';
--中书省要求
insert or ignore into RequirementSetRequirements
	(RequirementSetId, 						RequirementId)
values
	('GOV_GH_REQUIREMENT',					'REQUIRES_CITY_HAS_GOVERNOR'),
	('GOV_GH_REQUIREMENT',					'REQUIRES_PLOT_IS_OWNER_CAPITAL_CONTINENT');
insert or ignore into RequirementSets
	(RequirementSetId,						RequirementSetType)
values
	('GOV_GH_REQUIREMENT',					'REQUIREMENTSET_TEST_ALL');

--新增效果
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
--中书省
	('BUILDING_GOV_CITYSTATES',				'GOV_CITYSTATES_CITY_YIELD'),
	('BUILDING_GOV_CITYSTATES',				'GOV_CITYSTATES_CITY_YIELD_G');
--情报局
--	('BUILDING_GOV_SPIES',					'GOV_SPIES_OFFENSIVESPYTIME'),
--	('BUILDING_GOV_SPIES',					'GOV_SPIES_SPYPRODUCTION'),
--	('BUILDING_GOV_SPIES',					'GOV_SPIES_SPY_UNLIMITED_PROMOTION');
insert or replace into Modifiers
	(ModifierId,							ModifierType,															SubjectRequirementSetId)
values
--中书省
--所有城市加产
	('GOV_CITYSTATES_CITY_YIELD',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'THE_HOME_CONTINENT_NEW_REQUIREMENT'),
	('GOV_CITYSTATES_CITY_YIELD_G',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'GOV_GH_REQUIREMENT');
--情报局
--	('GOV_SPIES_OFFENSIVESPYTIME',			'MODIFIER_PLAYER_UNITS_ADJUST_SPY_OFFENSIVE_OPERATION_TIME',			NULL),
--	('GOV_SPIES_SPYPRODUCTION',				'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',							NULL),
--	('GOV_SPIES_SPY_UNLIMITED_PROMOTION',   'MODIFIER_PLAYER_UNIT_GRANT_UNLIMITED_PROMOTION_CHOICES',				NULL);

insert or replace into ModifierArguments
	(ModifierId,							Name,				Value)
values
--中书省
	('GOV_CITYSTATES_CITY_YIELD',			'YieldType',		'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD'),
	('GOV_CITYSTATES_CITY_YIELD',			'Amount',			'7, 7, 7'),
	('GOV_CITYSTATES_CITY_YIELD_G',			'YieldType',		'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD'),
	('GOV_CITYSTATES_CITY_YIELD_G',			'Amount',			'7, 7, 7');
--情报局
--	('GOV_SPIES_OFFENSIVESPYTIME',			'ReductionPercent',	25),
--	('GOV_SPIES_SPYPRODUCTION',				'UnitType',			'UNIT_SPY');
--	('GOV_SPIES_SPYPRODUCTION',				'Amount',			100),
--	('GOV_SPIES_SPY_UNLIMITED_PROMOTION',	'UnitType',			'UNIT_SPY');

--主教座堂
--移除信仰加成
delete from Building_YieldChanges where BuildingType = 'BUILDING_GOV_FAITH';
--宗教单位加力前置
insert or replace into BuildingModifiers
	(BuildingType,									ModifierId)
values
--鸽转瓶琴
	('BUILDING_GOV_FAITH',							'GOV_FAITH_INTO_SCIENCE'),
	('BUILDING_GOV_FAITH',							'GOV_FAITH_INTO_CULTURE'),
--宗教单位折扣
	('BUILDING_GOV_FAITH',							'GOV_FAITH_MISSIONARY_DISCOUNT'),
	('BUILDING_GOV_FAITH',							'GOV_FAITH_APOSTLE_DISCOUNT'),
	('BUILDING_GOV_FAITH',							'GOV_FAITH_INQUISITOR_DISCOUNT'),
-- 外国信教城市瓶琴
	('BUILDING_GOV_FAITH',							'GOV_FAITH_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION'),
	('BUILDING_GOV_FAITH',							'GOV_FAITH_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION'),
--宗教单位加力
	('BUILDING_GOV_FAITH',							'GOV_FAITH_COMBAT_BUFF');

insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
--鸽转瓶琴
	('GOV_FAITH_INTO_SCIENCE',						'MODIFIER_PLAYER_CITIES_ADJUST_YIELD_MODIFIER_FROM_FAITH'),
	('GOV_FAITH_INTO_CULTURE',						'MODIFIER_PLAYER_CITIES_ADJUST_YIELD_MODIFIER_FROM_FAITH'),
--宗教单位折扣
	('GOV_FAITH_MISSIONARY_DISCOUNT',				'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST'),
	('GOV_FAITH_APOSTLE_DISCOUNT',					'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST'),
	('GOV_FAITH_INQUISITOR_DISCOUNT',				'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST'),
-- 外国信教城市瓶琴
	('GOV_FAITH_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'MODIFIER_PLAYER_RELIGION_ADD_PLAYER_BELIEF_YIELD'),
	('GOV_FAITH_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'MODIFIER_PLAYER_RELIGION_ADD_PLAYER_BELIEF_YIELD'),
--宗教单位加力
	('GOV_FAITH_COMBAT_BUFF',						'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

insert or replace into ModifierArguments
	(ModifierId,									Name,							Value)
values
--鸽转瓶琴
	('GOV_FAITH_INTO_SCIENCE',						'YieldType',					'YIELD_SCIENCE'),
	('GOV_FAITH_INTO_SCIENCE',						'Amount',						10),
	('GOV_FAITH_INTO_CULTURE',						'YieldType',					'YIELD_CULTURE'),
	('GOV_FAITH_INTO_CULTURE',						'Amount',						10),
--宗教单位折扣
	('GOV_FAITH_MISSIONARY_DISCOUNT',				'UnitType',						'UNIT_MISSIONARY'),
	('GOV_FAITH_MISSIONARY_DISCOUNT',				'Amount',						20),
	('GOV_FAITH_APOSTLE_DISCOUNT',					'UnitType',						'UNIT_APOSTLE'),
	('GOV_FAITH_APOSTLE_DISCOUNT',					'Amount',						20),
	('GOV_FAITH_INQUISITOR_DISCOUNT',				'UnitType',						'UNIT_INQUISITOR'),
	('GOV_FAITH_INQUISITOR_DISCOUNT',				'Amount',						20),
-- 外国信教城市瓶琴
	('GOV_FAITH_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'BeliefYieldType',	'BELIEF_YIELD_PER_FOREIGN_CITY'),
	('GOV_FAITH_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'YieldType',			'YIELD_SCIENCE'),
	('GOV_FAITH_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'Amount',				2),
	('GOV_FAITH_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'PerXItems',			1),
	('GOV_FAITH_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'BeliefYieldType',	'BELIEF_YIELD_PER_FOREIGN_CITY'),
	('GOV_FAITH_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'YieldType',			'YIELD_CULTURE'),
	('GOV_FAITH_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'Amount',				2),
	('GOV_FAITH_CULTURE_PER_FOREIGN_CITY_FOLLOWING_RELIGION', 'PerXItems',			1),
--宗教单位加力
	('GOV_FAITH_COMBAT_BUFF',						'AbilityType',					'ABILITY_GOV_FAITH_COMBAT_STRENGTH');

--三级政体建筑
--删除原效果
--作战部
delete from BuildingModifiers where ModifierId = 'GOV_HEAL_AFTER_DEFEATING_UNIT';

--作战部
--新增效果
insert or replace into BuildingModifiers
	(BuildingType,										ModifierId)
values
--军事单位加移速
	('BUILDING_GOV_MILITARY',							'GOV_MILITARY_MOVEMENT'),
--军事单位加力
	('BUILDING_GOV_MILITARY',							'GOV_MILITARY_COMBAT_STRENTH'),
--军事升级消耗减少
	('BUILDING_GOV_MILITARY',							'GOV_MILITARY_GOLD_DISCOUNT'),
	('BUILDING_GOV_MILITARY',							'GOV_MILITARY_RESOURCE_DISCOUNT'),
--军事单位减维护费
	('BUILDING_GOV_MILITARY',							'GOV_MILITARY_MOBILISATION');

insert or replace into Modifiers	
	(ModifierId,										ModifierType)
values
--军事单位加移速
	('GOV_MILITARY_MOVEMENT',							'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
--军事单位加力
	('GOV_MILITARY_COMBAT_STRENTH',						'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
--军事升级消耗减少
	('GOV_MILITARY_GOLD_DISCOUNT',						'MODIFIER_PLAYER_ADJUST_UNIT_UPGRADE_DISCOUNT_PERCENT'),
	('GOV_MILITARY_RESOURCE_DISCOUNT',					'MODIFIER_PLAYER_ADJUST_UNIT_UPGRADE_RESOURCE_COST_MODIFIER'),
--军事单位减维护费
	('GOV_MILITARY_MOBILISATION',						'MODIFIER_PLAYER_ADJUST_UNIT_MAINTENANCE_DISCOUNT');

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
values
--军事单位加移速
	('GOV_MILITARY_MOVEMENT',							'AbilityType',		'ABILITY_GOV_MILITARY_MOVEMENT'),
	('ABILITY_GOV_MILITARY_MOVEMENT_MODIFIER',			'Amount',			1),
--军事单位加力
	('GOV_MILITARY_COMBAT_STRENTH',						'AbilityType',		'ABILITY_GOV_MILITARY_COMBAT_STRENGTH'),
	('ABILITY_GOV_MILITARY_COMBAT_STRENGTH_MODIFIER',	'Amount',			3),
--军事升级消耗减少
	('GOV_MILITARY_GOLD_DISCOUNT',						'Amount',			25),
	('GOV_MILITARY_RESOURCE_DISCOUNT',					'Amount',			25),
--军事单位减维护费
	('GOV_MILITARY_MOBILISATION',						'Amount',			2);

--shipyard and seaport
delete from BuildingModifiers where ModifierId = 'SHIPYARD_UNIMPROVED_COAST_PRODUCTION';

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('BUILDING_SHIPYARD',				'SHIPYARD_ALL_COAST_PRODUCTION');

insert or replace into Modifiers	
	(ModifierId,					ModifierType,									SubjectRequirementSetId)
values
	('SHIPYARD_ALL_COAST_PRODUCTION','MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD','PLOT_HAS_COAST_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,							Name,				Value)
values
	('SHIPYARD_ALL_COAST_PRODUCTION',	'YieldType','YIELD_PRODUCTION'),
	('SHIPYARD_ALL_COAST_PRODUCTION',	'Amount',	1);

insert or replace into Building_YieldDistrictCopies
	(BuildingType,OldYieldType,NewYieldType)
values
	('BUILDING_SEAPORT','YIELD_GOLD','YIELD_FOOD');

update Building_YieldChanges set YieldChange = 10 where BuildingType = 'BUILDING_SEAPORT' and YieldType = 'YIELD_GOLD';
delete from Building_YieldChanges where BuildingType = 'BUILDING_SEAPORT' and YieldType = 'YIELD_FOOD';

----------------------------------------------------------------------------------------------------------------------
-- nianshi
-- new Buildings
--市中心改动（训练营,图腾,集市降价65->55）（图腾法典解锁）（工官,凯旋,测量额外产出+1->+2）（坎儿井住房变为基础产出）By Kekeya


insert or replace into Building_GreatPersonPoints
	(BuildingType,		GreatPersonClassType,			PointsPerTurn)
values
	('BUILDING_TOTEMS',	'GREAT_PERSON_CLASS_PROPHET',	2);

insert or replace into Building_YieldChanges 
	(BuildingType,													YieldType,					YieldChange)
values 
	('BUILDING_NILOMETER_HD',										'YIELD_SCIENCE',			2),
	('BUILDING_TRIUMPHAL_ARCH',										'YIELD_CULTURE',			2),
	('BUILDING_KAREZ',												'YIELD_FOOD',				3),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',								'YIELD_PRODUCTION',			2),
	('BUILDING_BOOTCAMP',											'YIELD_PRODUCTION',			2),
	('BUILDING_FAIR',												'YIELD_GOLD',				6),
	('BUILDING_TOTEMS',												'YIELD_FAITH',				1);

insert or replace into BuildingModifiers 
 	(BuildingType,													ModifierId)
values 
 	('BUILDING_NILOMETER_HD',										'NILOMETER_SCIENCE'),
 	('BUILDING_TRIUMPHAL_ARCH',										'TRIUMPHAL_ARCH_CULTURE'),
 	('BUILDING_KAREZ',												'KAREZ_FOOD'),
 	('BUILDING_OFFICIAL_RUN_HANDCRAFT',								'HANDCRAFT_BUILDING_PRODUCTION'),
 	('BUILDING_OFFICIAL_RUN_HANDCRAFT',								'HANDCRAFT_DISTRICT_PRODUCTION'),
 	('BUILDING_BOOTCAMP',											'BOOTCAMP_UNIT_PRODUCTION'),
 	('BUILDING_FAIR',												'FAIR_GOLD'),
 	('BUILDING_TOTEMS',												'TOTEMS_FAITH_HD');

insert or replace into Modifiers
	(ModifierId,							ModifierType,											SubjectRequirementSetId)
values
	('NILOMETER_SCIENCE',					'MODIFIER_BUILDING_YIELD_CHANGE',						'PLOT_FLOODPLAINS_REQUIREMENTS'),
 	('TRIUMPHAL_ARCH_CULTURE',				'MODIFIER_BUILDING_YIELD_CHANGE',						'DL_CITY_HAS_WONDER_REQUIREMENTS'),
 	('KAREZ_FOOD',							'MODIFIER_BUILDING_YIELD_CHANGE',						'PLOT_IS_HILLS_OR_ADJACENT_TO_MOUNTAIN'),
 	('HANDCRAFT_BUILDING_PRODUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_CHANGE', 'OFFICIAL_RUN_HANDCRAFT_REQUIREMENT'),
 	('HANDCRAFT_DISTRICT_PRODUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_CHANGE', 'OFFICIAL_RUN_HANDCRAFT_REQUIREMENT'),
 	('BOOTCAMP_UNIT_PRODUCTION',			'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_CHANGE',	'BOOTCAMP_REQUIREMENT'),
 	('FAIR_GOLD',							'MODIFIER_BUILDING_YIELD_CHANGE',						'FAIR_REQUIREMENT'),
 	('TOTEMS_FAITH_HD',						'MODIFIER_BUILDING_YIELD_CHANGE',						'TOTEMS_ADJACENT_REQUIREMENT');

insert or replace into ModifierArguments
	(ModifierId,							Name,												Value)
values
	('NILOMETER_SCIENCE',					'BuildingType',										'BUILDING_NILOMETER_HD'),
	('NILOMETER_SCIENCE',					'YieldType',										'YIELD_SCIENCE'),
	('NILOMETER_SCIENCE',					'Amount',											2),
	('TRIUMPHAL_ARCH_CULTURE',				'BuildingType',										'BUILDING_TRIUMPHAL_ARCH'),
	('TRIUMPHAL_ARCH_CULTURE',				'YieldType',										'YIELD_CULTURE'),
	('TRIUMPHAL_ARCH_CULTURE',				'Amount',											2),
	('KAREZ_FOOD',							'BuildingType',										'BUILDING_KAREZ'),
	('KAREZ_FOOD',							'YieldType',										'YIELD_FOOD'),
	('KAREZ_FOOD',							'Amount',											1),
	('HANDCRAFT_BUILDING_PRODUCTION',		'Amount',											2),
	('HANDCRAFT_DISTRICT_PRODUCTION',		'Amount',											2),
	('BOOTCAMP_UNIT_PRODUCTION',			'Amount',											2),
	('FAIR_GOLD',							'BuildingType',										'BUILDING_FAIR'),
	('FAIR_GOLD',							'YieldType',										'YIELD_GOLD'),
	('FAIR_GOLD',							'Amount',											2),
	('TOTEMS_FAITH_HD',						'BuildingType',										'BUILDING_TOTEMS'),
	('TOTEMS_FAITH_HD',						'YieldType',										'YIELD_FAITH'),
	('TOTEMS_FAITH_HD',						'Amount',											2);


-- Outer Defense
update Buildings set OuterDefenseHitPoints = 75 where BuildingType = 'BUILDING_WALLS';
----------------------------------------------------------------------------------------------------------------------

insert or replace into Types
	(Type,									Kind)
values
	-- Buildings
	('BUILDING_WALLS_EARLY',				'KIND_BUILDING');

insert or replace into Buildings 
	(BuildingType, 						Name, 									Cost, 	Description,								InternalOnly,	OuterDefenseHitPoints) 
values
	('BUILDING_WALLS_EARLY', 			'LOC_BUILDING_WALLS_EARLY_NAME', 		1, 		'LOC_BUILDING_WALLS_EARLY_DESCRIPTION',		1,				25);

----------------------------------------------------------------------------------------------------------------------

-- from tech testing
update Buildings set Cost = 360 where BuildingType = 'BUILDING_FACTORY';
update Buildings_XP2 set RequiredPower = 0 where BuildingType = 'BUILDING_FACTORY';

delete from Building_YieldChangesBonusWithPower where BuildingType = 'BUILDING_FACTORY';

update Building_YieldChangesBonusWithPower set YieldChange = 3 where BuildingType = 'BUILDING_ELECTRONICS_FACTORY' and YieldType = 'YIELD_PRODUCTION';
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'BUILDING_ELECTRONICS_FACTORY' and YieldType = 'YIELD_PRODUCTION';
-- from tech testing


Insert or replace into BuildingModifiers 
 	(BuildingType,									ModifierId)
values
 	('BUILDING_MARAE',								'MARAE_COAST_CULTURE');

Insert or replace into Modifiers
	(ModifierId,									ModifierType,											SubjectRequirementSetId)
values
	('MARAE_COAST_CULTURE',							'MODIFIER_CITY_ADJUST_CITY_YIELD_PER_TERRAIN_TYPE',		null);

insert or replace into ModifierArguments
	(ModifierId,									Name,				Value)
values	
	('MARAE_COAST_CULTURE',              			'TerrainType',      'TERRAIN_COAST'),
    ('MARAE_COAST_CULTURE',               			'YieldType',        'YIELD_CULTURE'),
    ('MARAE_COAST_CULTURE',               			'Amount',          	0.34);

-- 动物园 by xhh
delete from BuildingModifiers where ModifierId = 'ZOO_RAINFOREST_SCIENCE';
delete from BuildingModifiers where ModifierId = 'ZOO_MARSH_SCIENCE';

insert or replace into BuildingModifiers
	(BuildingType,									ModifierId)
values
	('BUILDING_ZOO',								'HD_ZOO_ADD_RESOURCE_CAMP_PASTURE_BOOST'),
	('BUILDING_ZOO',								'HD_ZOO_ADD_RESOURCE_CAMP_PASTURE_BOOST2');

insert or replace into Modifiers
	(ModifierId,												ModifierType,											SubjectRequirementSetId)
values
	('HD_ZOO_ADD_RESOURCE_CAMP_PASTURE_BOOST',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'HD_PLOT_HAS_CAMP_OR_PASTURE'),
	('HD_ZOO_ADD_RESOURCE_CAMP_PASTURE_BOOST2',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'HD_PLOT_HAS_CAMP_PASTURE_BIOLOGY');

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
values
	('HD_ZOO_ADD_RESOURCE_CAMP_PASTURE_BOOST',			'YieldType',		'YIELD_FOOD,YIELD_CULTURE,YIELD_GOLD'),
	('HD_ZOO_ADD_RESOURCE_CAMP_PASTURE_BOOST',			'Amount',			'1,1,3'),
	('HD_ZOO_ADD_RESOURCE_CAMP_PASTURE_BOOST2',			'YieldType',		'YIELD_FOOD,YIELD_CULTURE,YIELD_GOLD'),
	('HD_ZOO_ADD_RESOURCE_CAMP_PASTURE_BOOST2',			'Amount',			'1,1,3');

insert or ignore into RequirementSets
	(RequirementSetId,									RequirementSetType)
values
	('HD_PLOT_HAS_CAMP_PASTURE_BIOLOGY',				'REQUIREMENTSET_TEST_ALL'),
	('HD_PLOT_HAS_CAMP_OR_PASTURE',						'REQUIREMENTSET_TEST_ANY');

insert or ignore into Requirements
	(RequirementId,										RequirementType)
values
	('HD_PLOT_HAS_CAMP_OR_PASTURE_MET',					'REQUIREMENT_REQUIREMENTSET_IS_MET');

insert or ignore into RequirementArguments
	(RequirementId,										Name,					Value)
values
	('HD_PLOT_HAS_CAMP_OR_PASTURE_MET',					'RequirementSetId',		'HD_PLOT_HAS_CAMP_OR_PASTURE');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,									RequirementId)
values
	('HD_PLOT_HAS_CAMP_OR_PASTURE',						'HD_PLOT_HAS_RESOURCE_CAMP'),
	('HD_PLOT_HAS_CAMP_OR_PASTURE',						'REQUIRES_PLOT_HAS_PASTURE'),
	('HD_PLOT_HAS_CAMP_PASTURE_BIOLOGY',				'HD_PLOT_HAS_CAMP_OR_PASTURE_MET'),
	('HD_PLOT_HAS_CAMP_PASTURE_BIOLOGY',				'HD_REQUIRES_PLAYER_HAS_TECH_BIOLOGY_HD');

-- 水族馆 by xhh
delete from BuildingModifiers where ModifierId = 'AQUARIUM_SEARESOURCE_SCIENCE';
delete from BuildingModifiers where ModifierId = 'AQUARIUM_REEF_SCIENCE';

insert or replace into BuildingModifiers
	(BuildingType,									ModifierId)
values
	('BUILDING_AQUARIUM',							'HD_AQUARIUM_ADD_RESOURCE_FISHING_BOATS_BOOST'),
	('BUILDING_AQUARIUM',							'HD_AQUARIUM_ADD_RESOURCE_FISHING_BOATS_BOOST2');
	-- ('BUILDING_AQUARIUM',							'HD_AQUARIUM_ADD_SEA_FEATURE_BOOST'),
	-- ('BUILDING_AQUARIUM',							'HD_AQUARIUM_ADD_SEA_FEATURE_BOOST2');

insert or replace into Modifiers
	(ModifierId,													ModifierType,											SubjectRequirementSetId)
values
	('HD_AQUARIUM_ADD_RESOURCE_FISHING_BOATS_BOOST',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'HD_PLOT_HAS_FISH_IMPROVEMENT'),
	('HD_AQUARIUM_ADD_RESOURCE_FISHING_BOATS_BOOST2',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'HD_PLOT_HAS_FISH_IMPROVEMENT_BIOLOGY');
	-- ('HD_AQUARIUM_ADD_SEA_FEATURE_BOOST',							'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'HD_PLOT_HAS_SEA_FEATURE'),
	-- ('HD_AQUARIUM_ADD_SEA_FEATURE_BOOST2',							'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'HD_PLOT_HAS_SEA_FEATURE_BIOLOGY');

insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
values
	('HD_AQUARIUM_ADD_RESOURCE_FISHING_BOATS_BOOST',				'YieldType',		'YIELD_FOOD,YIELD_PRODUCTION,YIELD_GOLD'),
	('HD_AQUARIUM_ADD_RESOURCE_FISHING_BOATS_BOOST',				'Amount',			'1,1,3'),
	-- ('HD_AQUARIUM_ADD_SEA_FEATURE_BOOST',							'YieldType',		'YIELD_FOOD,YIELD_PRODUCTION,YIELD_GOLD'),
	-- ('HD_AQUARIUM_ADD_SEA_FEATURE_BOOST',							'Amount',			'1,1,3'),
	('HD_AQUARIUM_ADD_RESOURCE_FISHING_BOATS_BOOST2',				'YieldType',		'YIELD_FOOD,YIELD_PRODUCTION,YIELD_GOLD'),
	('HD_AQUARIUM_ADD_RESOURCE_FISHING_BOATS_BOOST2',				'Amount',			'1,1,3');
	-- ('HD_AQUARIUM_ADD_SEA_FEATURE_BOOST2',							'YieldType',		'YIELD_FOOD,YIELD_PRODUCTION,YIELD_GOLD'),
	-- ('HD_AQUARIUM_ADD_SEA_FEATURE_BOOST2',							'Amount',			'1,1,3');

insert or ignore into RequirementSets
	(RequirementSetId,										RequirementSetType)
values
	('HD_PLOT_HAS_FISH_IMPROVEMENT',						'REQUIREMENTSET_TEST_ANY'),
	('HD_PLOT_HAS_FISH_IMPROVEMENT_BIOLOGY',				'REQUIREMENTSET_TEST_ALL'),
	('HD_PLOT_HAS_SEA_FEATURE_BIOLOGY',						'REQUIREMENTSET_TEST_ALL'),
	('HD_PLOT_HAS_SEA_FEATURE',								'REQUIREMENTSET_TEST_ANY');

insert or ignore into Requirements
	(RequirementId,											RequirementType)
values
	('HD_PLOT_HAS_FISH_IMPROVEMENT_MET',					'REQUIREMENT_REQUIREMENTSET_IS_MET'),
	('HD_PLOT_HAS_SEA_FEATURE_MET',							'REQUIREMENT_REQUIREMENTSET_IS_MET');

insert or ignore into RequirementArguments
	(RequirementId,											Name,					Value)
values
	('HD_PLOT_HAS_FISH_IMPROVEMENT_MET',					'RequirementSetId',		'HD_PLOT_HAS_FISH_IMPROVEMENT'),
	('HD_PLOT_HAS_SEA_FEATURE_MET',							'RequirementSetId',		'HD_PLOT_HAS_SEA_FEATURE');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
select
	'HD_PLOT_HAS_SEA_FEATURE',								'HD_REQUIRES_PLOT_HAS_' || i.FeatureType
from Feature_ValidTerrains i, Features j
where i.FeatureType = j.FeatureType and (i.TerrainType = 'TERRAIN_COAST' and j.Impassable = 0 and j.NaturalWonder = 0);

insert or ignore into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
values
	('HD_PLOT_HAS_FISH_IMPROVEMENT',						'REQUIRES_PLOT_HAS_FISHINGBOATS'),
	('HD_PLOT_HAS_FISH_IMPROVEMENT',						'HD_REQUIRES_PLOT_HAS_FISHERY'),
	('HD_PLOT_HAS_FISH_IMPROVEMENT_BIOLOGY',				'HD_PLOT_HAS_FISH_IMPROVEMENT_MET'),
	('HD_PLOT_HAS_FISH_IMPROVEMENT_BIOLOGY',				'HD_REQUIRES_PLAYER_HAS_TECH_BIOLOGY_HD'),
	('HD_PLOT_HAS_SEA_FEATURE_BIOLOGY',						'HD_PLOT_HAS_SEA_FEATURE_MET'),
	('HD_PLOT_HAS_SEA_FEATURE_BIOLOGY',						'HD_REQUIRES_PLAYER_HAS_TECH_BIOLOGY_HD');

-- 温泉浴场 by xhh
delete from BuildingModifiers where ModifierId = 'THERMALBATH_ADDTOURISM' and BuildingType = 'BUILDING_THERMAL_BATH';
delete from BuildingModifiers where ModifierId = 'THERMALBATH_ADDAMENITIES' and BuildingType = 'BUILDING_THERMAL_BATH';

insert or replace into BuildingModifiers
	(BuildingType,									ModifierId)
values
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_ADD_GEOTHERMAL_FISSURE_BOOST'),
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_ADD_GEOTHERMAL_FISSURE_BOOST_CHEMISTRY'),
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_GEOTHERMAL_FISSURE_FAITH_ADJACENCY'),
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY'),
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY2'),
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_GEOTHERMAL_FISSURE_SCIENCE_ADJACENCY'),
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_GEOTHERMAL_FISSURE_CULTURE_ADJACENCY'),
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY'),
	('BUILDING_THERMAL_BATH',						'HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY2');

insert or replace into Modifiers
	(ModifierId,														ModifierType,											SubjectRequirementSetId)
values
	('HD_THERMAL_BATH_ADD_GEOTHERMAL_FISSURE_BOOST',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'HD_PLOT_HAS_GEOTHERMAL_FISSURE'),
	('HD_THERMAL_BATH_ADD_GEOTHERMAL_FISSURE_BOOST_CHEMISTRY',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'HD_PLOT_HAS_GEOTHERMAL_FISSURE_CHEMISTRY'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_FAITH_ADJACENCY',				'MODIFIER_SINGLE_CITY_FEATURE_ADJACENCY',				NULL),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY',				'MODIFIER_SINGLE_CITY_FEATURE_ADJACENCY',				NULL),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY2',				'MODIFIER_SINGLE_CITY_FEATURE_ADJACENCY',				NULL),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_SCIENCE_ADJACENCY',			'MODIFIER_SINGLE_CITY_FEATURE_ADJACENCY',				NULL),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_CULTURE_ADJACENCY',			'MODIFIER_SINGLE_CITY_FEATURE_ADJACENCY',				NULL),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY',			'MODIFIER_SINGLE_CITY_FEATURE_ADJACENCY',				NULL),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY2',		'MODIFIER_SINGLE_CITY_FEATURE_ADJACENCY',				NULL);

insert or replace into ModifierArguments
	(ModifierId,														Name,				Value)
values
	('HD_THERMAL_BATH_ADD_GEOTHERMAL_FISSURE_BOOST',					'YieldType',		'YIELD_FAITH,YIELD_CULTURE'),
	('HD_THERMAL_BATH_ADD_GEOTHERMAL_FISSURE_BOOST',					'Amount',			'2,2'),
	('HD_THERMAL_BATH_ADD_GEOTHERMAL_FISSURE_BOOST_CHEMISTRY',			'YieldType',		'YIELD_SCIENCE'),
	('HD_THERMAL_BATH_ADD_GEOTHERMAL_FISSURE_BOOST_CHEMISTRY',			'Amount',			2),
	
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_FAITH_ADJACENCY',				'DistrictType',		'DISTRICT_HOLY_SITE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_FAITH_ADJACENCY',				'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_FAITH_ADJACENCY',				'YieldType',		'YIELD_FAITH'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_FAITH_ADJACENCY',				'Amount',			2),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_FAITH_ADJACENCY',				'Description',		'LOC_THERMAL_BATH_FAITH'),
	
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY',				'DistrictType',		'DISTRICT_COMMERCIAL_HUB'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY',				'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY',				'YieldType',		'YIELD_GOLD'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY',				'Amount',			2),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY',				'Description',		'LOC_THERMAL_BATH_GOLD'),
	
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY2',				'DistrictType',		'DISTRICT_HARBOR'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY2',				'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY2',				'YieldType',		'YIELD_GOLD'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY2',				'Amount',			2),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_GOLD_ADJACENCY2',				'Description',		'LOC_THERMAL_BATH_GOLD'),
	
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_SCIENCE_ADJACENCY',			'DistrictType',		'DISTRICT_CAMPUS'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_SCIENCE_ADJACENCY',			'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_SCIENCE_ADJACENCY',			'YieldType',		'YIELD_SCIENCE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_SCIENCE_ADJACENCY',			'Amount',			2),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_SCIENCE_ADJACENCY',			'Description',		'LOC_THERMAL_BATH_SCIENCE'),
	
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_CULTURE_ADJACENCY',			'DistrictType',		'DISTRICT_THEATER'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_CULTURE_ADJACENCY',			'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_CULTURE_ADJACENCY',			'YieldType',		'YIELD_CULTURE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_CULTURE_ADJACENCY',			'Amount',			2),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_CULTURE_ADJACENCY',			'Description',		'LOC_THERMAL_BATH_CULTURE'),
	
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY',			'DistrictType',		'DISTRICT_INDUSTRIAL_ZONE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY',			'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY',			'YieldType',		'YIELD_PRODUCTION'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY',			'Amount',			2),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY',			'Description',		'LOC_THERMAL_BATH_PRODUCTION'),
	
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY2',		'DistrictType',		'DISTRICT_ENCAMPMENT'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY2',		'FeatureType',		'FEATURE_GEOTHERMAL_FISSURE'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY2',		'YieldType',		'YIELD_PRODUCTION'),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY2',		'Amount',			2),
	('HD_THERMAL_BATH_GEOTHERMAL_FISSURE_PRODUCTION_ADJACENCY2',		'Description',		'LOC_THERMAL_BATH_PRODUCTION');

insert or ignore into RequirementSets
	(RequirementSetId,											RequirementSetType)
values
	('HD_PLOT_HAS_GEOTHERMAL_FISSURE',							'REQUIREMENTSET_TEST_ALL'),
	('HD_PLOT_HAS_GEOTHERMAL_FISSURE_CHEMISTRY',				'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('HD_PLOT_HAS_GEOTHERMAL_FISSURE',							'REQUIRES_PLOT_HAS_GEOTHERMAL_FIISSURE'),
	('HD_PLOT_HAS_GEOTHERMAL_FISSURE_CHEMISTRY',				'REQUIRES_PLOT_HAS_GEOTHERMAL_FIISSURE'),
	('HD_PLOT_HAS_GEOTHERMAL_FISSURE_CHEMISTRY',				'HD_REQUIRES_PLAYER_HAS_TECH_CHEMISTRY');

--by yt
--市场调整 
update Buildings set Cost = 100 where BuildingType = 'BUILDING_MARKET';
--大小庙
update Building_YieldChanges set YieldChange = 5 where BuildingType = 'BUILDING_SHRINE';
update Building_YieldChanges set YieldChange = 10 where BuildingType = 'BUILDING_TEMPLE';
update Building_YieldChanges set YieldChange = 10 where BuildingType = 'BUILDING_STAVE_CHURCH';
update Building_YieldChanges set YieldChange = 12 where BuildingType = 'BUILDING_PRASAT';

-- 木板教堂
delete from BuildingModifiers where ModifierId = 'STAVECHURCH_SEARESOURCE_PRODUCTION';
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_STAVE_CHURCH',		'STAVE_CHURCH_FOREST_FOOD');

insert or replace into Modifiers
	(ModifierId,					ModifierType,									SubjectRequirementSetId)
values
	('STAVE_CHURCH_FOREST_FOOD',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HD_PLOT_HAS_FOREST_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,                                    Name,               Value)
values
	('STAVE_CHURCH_FOREST_FOOD',					'YieldType',		'YIELD_FOOD'),
	('STAVE_CHURCH_FOREST_FOOD',					'Amount',			1);

	-- 机场
update Buildings set Description = 'LOC_BUILDING_AIRPORT_DESCRIPTION_PRODUCT'	where BuildingType = 'BUILDING_AIRPORT'
	and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into BuildingModifiers
	(BuildingType,			ModifierId)
values
	('BUILDING_AIRPORT',	'AIRPORT_IMPROVEMENT_TOURISM_BONUS_ATTACH'),
	('BUILDING_AIRPORT',	'AIRPORT_WONDER_TOURISM_BONUS_ATTACH');

insert or replace into Modifiers
    (ModifierId,                       				ModifierType,                                               OwnerRequirementSetId,  SubjectRequirementSetId,	SubjectStackLimit)
values
	('AIRPORT_IMPROVEMENT_TOURISM_BONUS_ATTACH',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',					'CITY_IS_POWERED',		'HD_OBJECT_WITHIN_5_TILES',	1),
	('AIRPORT_IMPROVEMENT_TOURISM_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_TOURISM',			NULL,					NULL,						NULL),
	('AIRPORT_WONDER_TOURISM_BONUS_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',					'CITY_IS_POWERED',		'HD_OBJECT_WITHIN_5_TILES',	1),
	('AIRPORT_WONDER_TOURISM_BONUS',				'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',						NULL,					NULL,						NULL);

insert or replace into ModifierArguments
    (ModifierId,                       		 		Name,           	Value)
values
	('AIRPORT_IMPROVEMENT_TOURISM_BONUS_ATTACH',	'ModifierId',		'AIRPORT_IMPROVEMENT_TOURISM_BONUS'),
	('AIRPORT_IMPROVEMENT_TOURISM_BONUS',			'Amount',			50),
	('AIRPORT_WONDER_TOURISM_BONUS_ATTACH',			'ModifierId',		'AIRPORT_WONDER_TOURISM_BONUS'),
	('AIRPORT_WONDER_TOURISM_BONUS',				'BoostsWonders',	1),
	('AIRPORT_WONDER_TOURISM_BONUS',				'ScalingFactor',	200);

insert or replace into BuildingModifiers
	(BuildingType,			ModifierId)
select
	'BUILDING_AIRPORT',		'AIRPORT_' || GreatWorkObjectType || '_TOURISM_BONUS'
from GreatWorkObjectTypes;

insert or replace into Modifiers
	(ModifierId,												ModifierType,									OwnerRequirementSetId,	SubjectRequirementSetId,	SubjectStackLimit)
select
	'AIRPORT_' || GreatWorkObjectType || '_TOURISM_BONUS',		'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',		'CITY_IS_POWERED',		'HD_OBJECT_WITHIN_5_TILES',	1
from GreatWorkObjectTypes;

insert or replace into ModifierArguments
	(ModifierId,												Name,					Value)
select
	'AIRPORT_' || GreatWorkObjectType || '_TOURISM_BONUS',		'GreatWorkObjectType',	GreatWorkObjectType
from GreatWorkObjectTypes;

insert or replace into ModifierArguments
	(ModifierId,												Name,					Value)
select
	'AIRPORT_' || GreatWorkObjectType || '_TOURISM_BONUS',		'ScalingFactor',		150
from GreatWorkObjectTypes;

-- 女王图书馆
update Building_GreatWorks set 
	NonUniquePersonYield = 1,
	NonUniquePersonTourism = 1
where BuildingType ='BUILDING_QUEENS_BIBLIOTHEQUE' and GreatWorkSlotType = 'GREATWORKSLOT_ART';

-- 食品市场 购物商城
update Buildings_XP2 set RequiredPower = 4 where BuildingType = 'BUILDING_SHOPPING_MALL' or BuildingType = 'BUILDING_FOOD_MARKET';
update Buildings set Description = 'LOC_BUILDING_FOOD_MARKET_DESCRIPTION_CORP' where BuildingType = 'BUILDING_FOOD_MARKET'
	and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');
update Buildings set Description = 'LOC_BUILDING_SHOPPING_MALL_DESCRIPTION_CORP' where BuildingType = 'BUILDING_SHOPPING_MALL'
	and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');
    --造价
update Buildings set Cost = 360 where BuildingType = 'BUILDING_FOOD_MARKET';
update Buildings set Cost = 360 where BuildingType = 'BUILDING_SHOPPING_MALL';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
select
	'BUILDING_FOOD_MARKET',			'HD_FOOD_MARKET_PRODUCT_FOOD_BOOST'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
select
	'BUILDING_FOOD_MARKET',			'HD_FOOD_MARKET_PRODUCT_PRODUCTION_BOOST'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Modifiers
	(ModifierId,							ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId,		SubjectStackLimit)
select
	'HD_FOOD_MARKET_PRODUCT_FOOD_BOOST',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',	'CITY_IS_POWERED',			'HD_OBJECT_WITHIN_6_TILES',	1
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Modifiers
	(ModifierId,								ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId,		SubjectStackLimit)
select
	'HD_FOOD_MARKET_PRODUCT_PRODUCTION_BOOST',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',	'CITY_IS_POWERED',			'HD_OBJECT_WITHIN_6_TILES',	1
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_FOOD_MARKET_PRODUCT_FOOD_BOOST',	'GreatWorkObjectType',	'GREATWORKOBJECT_PRODUCT'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_FOOD_MARKET_PRODUCT_FOOD_BOOST',	'YieldType',			'YIELD_FOOD'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_FOOD_MARKET_PRODUCT_FOOD_BOOST',	'ScalingFactor',		200
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_FOOD_MARKET_PRODUCT_PRODUCTION_BOOST',	'GreatWorkObjectType',	'GREATWORKOBJECT_PRODUCT'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_FOOD_MARKET_PRODUCT_PRODUCTION_BOOST',	'YieldType',			'YIELD_PRODUCTION'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_FOOD_MARKET_PRODUCT_PRODUCTION_BOOST',	'ScalingFactor',		200
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

--------------------------

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
select
	'BUILDING_SHOPPING_MALL',			'HD_SHOPPING_MALL_PRODUCT_GOLD_BOOST'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
select
	'BUILDING_SHOPPING_MALL',			'HD_SHOPPING_MALL_PRODUCT_SCIENCE_BOOST'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
select
	'BUILDING_SHOPPING_MALL',			'HD_SHOPPING_MALL_PRODUCT_CULTURE_BOOST'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Modifiers
	(ModifierId,							ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId,		SubjectStackLimit)
select
	'HD_SHOPPING_MALL_PRODUCT_GOLD_BOOST',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',	'CITY_IS_POWERED',			'HD_OBJECT_WITHIN_6_TILES',	1
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Modifiers
	(ModifierId,								ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId,		SubjectStackLimit)
select
	'HD_SHOPPING_MALL_PRODUCT_SCIENCE_BOOST',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',	'CITY_IS_POWERED',			'HD_OBJECT_WITHIN_6_TILES',	1
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Modifiers
	(ModifierId,								ModifierType,										OwnerRequirementSetId,		SubjectRequirementSetId,		SubjectStackLimit)
select
	'HD_SHOPPING_MALL_PRODUCT_CULTURE_BOOST',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',	'CITY_IS_POWERED',			'HD_OBJECT_WITHIN_6_TILES',	1
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_GOLD_BOOST',	'GreatWorkObjectType',	'GREATWORKOBJECT_PRODUCT'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_GOLD_BOOST',	'YieldType',			'YIELD_GOLD'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_GOLD_BOOST',	'ScalingFactor',		200
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_SCIENCE_BOOST',	'GreatWorkObjectType',	'GREATWORKOBJECT_PRODUCT'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_SCIENCE_BOOST',	'YieldType',			'YIELD_SCIENCE'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_SCIENCE_BOOST',	'ScalingFactor',		150
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_CULTURE_BOOST',	'GreatWorkObjectType',	'GREATWORKOBJECT_PRODUCT'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_CULTURE_BOOST',	'YieldType',			'YIELD_CULTURE'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
select
	'HD_SHOPPING_MALL_PRODUCT_CULTURE_BOOST',	'ScalingFactor',		150
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

	-- 水磨
delete from BuildingModifiers where BuildingType = 'BUILDING_WATER_MILL';

insert or replace into BuildingModifiers
	(BuildingType,								ModifierId)
values
	('BUILDING_WATER_MILL',						'WATERMILL_ADDFARMBONUSRESOURCEFOOD');

insert or replace into Modifiers
	(ModifierId,								ModifierType,										SubjectRequirementSetId)
values
	('WATERMILL_ADDFARMBONUSRESOURCEFOOD',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('WATERMILL_ADDFARMBONUSRESOURCEFOOD',		'YieldType',	'YIELD_FOOD'),
	('WATERMILL_ADDFARMBONUSRESOURCEFOOD',		'Amount',		1);

insert or ignore into RequirementSets
	(RequirementSetId,				RequirementSetType)
values
	('FARM_BONUS_RESOURCE',			'REQUIREMENTSET_TEST_ANY');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,				RequirementId)
select
	'FARM_BONUS_RESOURCE',			'REQUIRES_' || Improvement_ValidResources.ResourceType || '_IN_PLOT'
from Improvement_ValidResources
inner join Resources
on Improvement_ValidResources.ResourceType = Resources.ResourceType
where Resources.ResourceClassType = 'RESOURCECLASS_BONUS' and Improvement_ValidResources.ImprovementType = 'IMPROVEMENT_FARM';


--删除情报局原效果，赋予贸易本埠形态效果
delete from BuildingModifiers where BuildingType = 'BUILDING_GOV_SPIES';
insert or replace into BuildingModifiers
    (BuildingType,          ModifierId)
values
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_TRADE_ROUTE_CAPACITY'),
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_TRADE_ROUTE_YIELD');
insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                                                           SubjectRequirementSetId)
values
    ('GOV_SPIES_TRADE_ROUTE_CAPACITY',              'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',                          null),
    ('GOV_SPIES_TRADE_ROUTE_YIELD',                 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_POST_IN_FOREIGN_CITY',    null);
insert or replace into ModifierArguments
    (ModifierId,                                    Name,           Value)
values
    ('GOV_SPIES_TRADE_ROUTE_CAPACITY',              'Amount',       1),
    ('GOV_SPIES_TRADE_ROUTE_YIELD',                 'YieldType',    'YIELD_GOLD'),
    ('GOV_SPIES_TRADE_ROUTE_YIELD',                 'Amount',       3);
create temporary table GovSpiesBuffedBuildings (BuildingType text not null primary key);
insert or ignore into GovSpiesBuffedBuildings (BuildingType) select BuildingType from Buildings where (PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' or PrereqDistrict = 'DISTRICT_HARBOR') and BuildingType not like 'BUILDING_MARACANA_DUMMY_%' and IsWonder = 0 and InternalOnly = 0;
insert or replace into BuildingModifiers
    (BuildingType,          ModifierId)
select
    'BUILDING_GOV_SPIES',   'GOV_SPIES_' || BuildingType || '_GRANT_GOLD_PERCENTAGE'
from GovSpiesBuffedBuildings;
insert or replace into Modifiers
    (ModifierId,                                                ModifierType,                                       SubjectRequirementSetId)
select
    'GOV_SPIES_' || BuildingType || '_GRANT_GOLD_PERCENTAGE',  'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 'CITY_HAS_' || BuildingType || '_REQUIREMENTS'
from GovSpiesBuffedBuildings;
insert or replace into ModifierArguments
    (ModifierId,                                                Name,           Value)
select
    'GOV_SPIES_' || BuildingType || '_GRANT_GOLD_PERCENTAGE',   'Amount',       4
from GovSpiesBuffedBuildings;
insert or replace into ModifierArguments
    (ModifierId,                                                Name,           Value)
select
    'GOV_SPIES_' || BuildingType || '_GRANT_GOLD_PERCENTAGE',   'YieldType',    'YIELD_GOLD'
from GovSpiesBuffedBuildings;
insert or replace into Building_YieldChanges
	(BuildingType,						YieldType,				YieldChange)
values
    ('BUILDING_HD_TAVERN',        		'YIELD_CULTURE',        4),
    ('BUILDING_HD_TAVERN',        		'YIELD_GOLD',           8),
    ('BUILDING_HD_INN',    				'YIELD_FOOD',     		2),
    ('BUILDING_HD_INN',    				'YIELD_PRODUCTION',     2),
    ('BUILDING_HD_INN',    				'YIELD_GOLD',           8);
insert or replace into Building_CitizenYieldChanges
	(BuildingType,						YieldType,				YieldChange)
values
	('BUILDING_HD_TAVERN',				'YIELD_GOLD',			3),
	('BUILDING_HD_INN',					'YIELD_GOLD',			3);
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_HD_INN',				'HD_INN_INFLUENCE_POINTS');
insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	('HD_INN_INFLUENCE_POINTS',		'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN');
insert or replace into ModifierArguments
	(ModifierId,					Name,		Value)
values
	('HD_INN_INFLUENCE_POINTS',		'Amount',	2);
--瑞典ub
delete from MutuallyExclusiveBuildings where Building = 'BUILDING_QUEENS_BIBLIOTHEQUE' or MutuallyExclusiveBuilding = 'BUILDING_QUEENS_BIBLIOTHEQUE';
delete from BuildingPrereqs where PrereqBuilding = 'BUILDING_QUEENS_BIBLIOTHEQUE';
delete from Building_GreatWorks where BuildingType = 'BUILDING_QUEENS_BIBLIOTHEQUE';
insert or replace into Building_GreatWorks
	(BuildingType,						GreatWorkSlotType,				NumSlots)
values
	('BUILDING_QUEENS_BIBLIOTHEQUE',	'GREATWORKSLOT_PALACE',			6);