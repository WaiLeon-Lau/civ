-- New City Center buildings
insert or replace into Types
	(Type,										Kind)
values
	('BUILDING_NILOMETER_HD',					'KIND_BUILDING'),
	('BUILDING_TRIUMPHAL_ARCH',					'KIND_BUILDING'),
	('BUILDING_KAREZ',							'KIND_BUILDING'),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',			'KIND_BUILDING'),
	('BUILDING_BOOTCAMP',						'KIND_BUILDING'),
	('BUILDING_FAIR',							'KIND_BUILDING'),
	('BUILDING_TOTEMS',							'KIND_BUILDING');

insert or replace into Buildings
	(BuildingType, 						Name, 										Cost, 		Description,										
		PrereqTech,						PrereqCivic,								PrereqDistrict,			PurchaseYield,			Housing) 
values
	('BUILDING_NILOMETER_HD',			'LOC_BUILDING_NILOMETER_HD_NAME', 			65,			'LOC_BUILDING_NILOMETER_HD_DESCRIPTION',				
	'TECH_IRRIGATION',					null,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_TRIUMPHAL_ARCH',			'LOC_BUILDING_TRIUMPHAL_ARCH_NAME', 		65,			'LOC_BUILDING_TRIUMPHAL_ARCH_DESCRIPTION',			
	null,								'CIVIC_EARLY_EMPIRE',						'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_KAREZ',					'LOC_BUILDING_KAREZ_NAME',					65,			'LOC_BUILDING_KAREZ_DESCRIPTION',	
	'TECH_POTTERY',						null,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			1),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',	'LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_NAME', 70,			'LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_DESCRIPTION',	
	'TECH_MINING',						null,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_BOOTCAMP',				'LOC_BUILDING_BOOTCAMP_NAME',				60,			'LOC_BUILDING_BOOTCAMP_DESCRIPTION',	
	'TECH_ANIMAL_HUSBANDRY',			null,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_FAIR',					'LOC_BUILDING_FAIR_NAME', 					55,			'LOC_BUILDING_FAIR_DESCRIPTION',
	null,								'CIVIC_FOREIGN_TRADE',						'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_TOTEMS',					'LOC_BUILDING_TOTEMS_NAME', 				55,			'LOC_BUILDING_TOTEMS_DESCRIPTION',
	'TECH_ASTROLOGY',					NULL,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null);

insert or replace into MutuallyExclusiveBuildings
	(Building,								MutuallyExclusiveBuilding)
values
	('BUILDING_NILOMETER_HD',				'BUILDING_TRIUMPHAL_ARCH'),
	('BUILDING_TRIUMPHAL_ARCH',				'BUILDING_NILOMETER_HD'),
	('BUILDING_KAREZ',						'BUILDING_OFFICIAL_RUN_HANDCRAFT'),
	('BUILDING_KAREZ',						'BUILDING_BOOTCAMP'),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',		'BUILDING_KAREZ'),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',		'BUILDING_BOOTCAMP'),
	('BUILDING_BOOTCAMP',					'BUILDING_KAREZ'),
	('BUILDING_BOOTCAMP',					'BUILDING_OFFICIAL_RUN_HANDCRAFT'),
	('BUILDING_FAIR',						'BUILDING_TOTEMS'),
	('BUILDING_TOTEMS',						'BUILDING_FAIR');

-- New Neighborhood buildings
insert or ignore into Types
	(Type,								Kind)
values
	('BUILDING_HD_TAVERN',				'KIND_BUILDING'),
	('BUILDING_HD_INN',					'KIND_BUILDING');

insert or ignore into Buildings
	(BuildingType,			PrereqDistrict,				PrereqCivic,								Cost,	Maintenance,	CitizenSlots,	Entertainment,		PurchaseYield,		AdvisorType,			Name,								Description)
values
	('BUILDING_HD_TAVERN',	'DISTRICT_NEIGHBORHOOD',	'CIVIC_MEDIEVAL_FAIRES',					120,	1,				1,				1,					'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_TAVERN_NAME',		null),
	('BUILDING_HD_INN',		'DISTRICT_NEIGHBORHOOD',	'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		120,	1,				1,				0,					'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_INN_NAME',			'LOC_BUILDING_HD_INN_DESCRIPTION');

insert or ignore into MutuallyExclusiveBuildings
	(Building,							MutuallyExclusiveBuilding)
values
	('BUILDING_HD_TAVERN',				'BUILDING_HD_INN'),
	('BUILDING_HD_INN',					'BUILDING_HD_TAVERN');

insert or ignore into BuildingPrereqs
	(Building,							PrereqBuilding)
values
	('BUILDING_FOOD_MARKET',			'BUILDING_HD_TAVERN'),
	('BUILDING_SHOPPING_MALL',			'BUILDING_HD_TAVERN'),
	('BUILDING_FOOD_MARKET',			'BUILDING_HD_INN'),
	('BUILDING_SHOPPING_MALL',			'BUILDING_HD_INN');

-- Seadog
insert or ignore into Types
	(Type,						Kind)
values
	('UNIT_ANCIENT_SEADOG',		'KIND_UNIT'),
	('SEADOG_LESS_STRENGTH',	'KIND_ABILITY');
insert or ignore into Units
    (UnitType,                  Name,                               Description,                    TraitType,  PrereqTech,     MandatoryObsoleteTech,
    BaseSightRange, BaseMoves,   Combat, RangedCombat,   Range,  Cost,   ZoneOfControl, PurchaseYield, Domain,
    FormationClass,             PromotionClass,                 PseudoYieldType,                    AdvisorType)
values
    ('UNIT_ANCIENT_SEADOG', 'LOC_UNIT_ANCIENT_SEADOG_NAME', 'LOC_UNIT_ANCIENT_SEADOG_DESCRIPTION',  NULL,       NULL,           'TECH_COMPASS_HD',
    2,              3,           15,     10,             1,      30,    1,              'YIELD_GOLD',  'DOMAIN_SEA',
    'FORMATION_CLASS_NAVAL',    'PROMOTION_CLASS_NAVAL_RAIDER', 'PSEUDOYIELD_UNIT_NAVAL_COMBAT',    'ADVISOR_CONQUEST');
insert or ignore into TypeTags
    (Type,  Tag)
values
    ('UNIT_ANCIENT_SEADOG',    'CLASS_NAVAL_RAIDER'),
    ('UNIT_ANCIENT_SEADOG',    'CLASS_NAVAL_RANGED'),
    ('UNIT_ANCIENT_SEADOG',    'CLASS_STEALTH'),
    ('UNIT_ANCIENT_SEADOG',    'CLASS_REVEAL_STEALTH'),
    ('UNIT_ANCIENT_SEADOG',    'CLASS_SEADOG'),
    ('SEADOG_LESS_STRENGTH',   'CLASS_SEADOG');
insert or ignore into UnitUpgrades (Unit,  UpgradeUnit) values ('UNIT_ANCIENT_SEADOG', 'UNIT_DL_MEDIEVAL_PIRATE');
insert or ignore into UnitUpgrades (Unit,  UpgradeUnit) values ('UNIT_ANCIENT_SEADOG', 'UNIT_PRIVATEER');
insert or ignore into UnitReplaces (CivUniqueUnitType,  ReplacesUnitType) values ('UNIT_HD_BARBARIAN_GALLEY', 'UNIT_ANCIENT_SEADOG');