-- Basic Yield
insert or replace into Improvement_YieldChanges
	(ImprovementType,					YieldType,				YieldChange)
values
	('IMPROVEMENT_FISHING_BOATS',		'YIELD_FOOD',			0),
	('IMPROVEMENT_FISHING_BOATS',		'YIELD_PRODUCTION',		1),
	('IMPROVEMENT_FISHING_BOATS',		'YIELD_GOLD',			0),

	('IMPROVEMENT_PLANTATION',			'YIELD_FOOD',			1),
	('IMPROVEMENT_PLANTATION',			'YIELD_PRODUCTION',		0),
	('IMPROVEMENT_PLANTATION',			'YIELD_GOLD',			0),

	('IMPROVEMENT_CAMP',				'YIELD_FOOD',			1),
	('IMPROVEMENT_CAMP',				'YIELD_PRODUCTION',		0),
	('IMPROVEMENT_CAMP',				'YIELD_GOLD',			0),

	('IMPROVEMENT_PASTURE',				'YIELD_FOOD',			0),
	('IMPROVEMENT_PASTURE',				'YIELD_PRODUCTION',		1),
	('IMPROVEMENT_PASTURE',				'YIELD_GOLD',			0),

	('IMPROVEMENT_LUMBER_MILL',			'YIELD_PRODUCTION',		1),

	('IMPROVEMENT_OIL_WELL',			'YIELD_PRODUCTION',		3),
	('IMPROVEMENT_OIL_WELL',			'YIELD_SCIENCE',		1),
	('IMPROVEMENT_OFFSHORE_OIL_RIG',	'YIELD_PRODUCTION',		3),
	('IMPROVEMENT_OFFSHORE_OIL_RIG',	'YIELD_SCIENCE',		1),
	
	('IMPROVEMENT_COLOSSAL_HEAD',		'YIELD_FAITH',			2),
	('IMPROVEMENT_MOAI',				'YIELD_CULTURE',		2),
	
	('IMPROVEMENT_ZIGGURAT',			'YIELD_SCIENCE',		2),
	('IMPROVEMENT_MEKEWAP',				'YIELD_GOLD',			2),
	('IMPROVEMENT_MEKEWAP',				'YIELD_PRODUCTION',		0),
	('IMPROVEMENT_GREAT_WALL',			'YIELD_FOOD',			1),
	('IMPROVEMENT_CHATEAU',				'YIELD_CULTURE',		1),
	('IMPROVEMENT_CHATEAU',				'YIELD_GOLD',			2),
	('IMPROVEMENT_LAND_POLDER',			'YIELD_FOOD',			1),
	('IMPROVEMENT_LAND_POLDER',			'YIELD_PRODUCTION',		1),
	('IMPROVEMENT_LAND_POLDER',			'YIELD_GOLD',			0),
	('IMPROVEMENT_MISSION',				'YIELD_FOOD',			0),
	('IMPROVEMENT_MISSION',				'YIELD_PRODUCTION',		0),
	('IMPROVEMENT_ICE_HOCKEY_RINK',		'YIELD_FOOD',			2);

-- Bonus Yield
delete from Improvement_BonusYieldChanges where ImprovementType in (
	'IMPROVEMENT_FARM',
	'IMPROVEMENT_PLANTATION',
	'IMPROVEMENT_CAMP',
	'IMPROVEMENT_PASTURE',
	'IMPROVEMENT_QUARRY',
	'IMPROVEMENT_MINE',
	'IMPROVEMENT_LUMBER_MILL',
	'IMPROVEMENT_FISHING_BOATS');
insert or replace into Improvement_BonusYieldChanges
	(Id,	ImprovementType,						YieldType,				BonusYieldChange,	PrereqCivic,					PrereqTech)
values
	(600,	'IMPROVEMENT_FARM',						'YIELD_FOOD',			1,					null,							'TECH_CALENDAR_HD'),

	(610,	'IMPROVEMENT_PLANTATION',				'YIELD_FOOD',			1,					null,							'TECH_PAPER_MAKING_HD'),
	(611,	'IMPROVEMENT_PLANTATION',				'YIELD_GOLD',			2,					'CIVIC_FEUDALISM',				null),
	(612,	'IMPROVEMENT_PLANTATION',				'YIELD_GOLD',			2,					'CIVIC_MERCANTILISM',			null),
	(613,	'IMPROVEMENT_PLANTATION',				'YIELD_GOLD',			2,					'CIVIC_GLOBALIZATION',			null),

	(620,	'IMPROVEMENT_CAMP',						'YIELD_PRODUCTION',		1,					null,							'TECH_CONSTRUCTION'),
	(621,	'IMPROVEMENT_CAMP',						'YIELD_PRODUCTION',		1,					'CIVIC_MEDIEVAL_FAIRES',		null),
	(622,	'IMPROVEMENT_CAMP',						'YIELD_FOOD',			1,					'CIVIC_EVOLUTION_THEORY_HD',	null),
	(623,	'IMPROVEMENT_CAMP',						'YIELD_GOLD',			2,					null,							'TECH_SYNTHETIC_MATERIALS'),

	(630,	'IMPROVEMENT_PASTURE',					'YIELD_PRODUCTION',		1,					null,							'TECH_HORSEBACK_RIDING'),
	(631,	'IMPROVEMENT_PASTURE',					'YIELD_PRODUCTION',		1,					'CIVIC_FEUDALISM',				null),
	(632,	'IMPROVEMENT_PASTURE',					'YIELD_FOOD',			1,					null,							'TECH_MASS_PRODUCTION'),
	(633,	'IMPROVEMENT_PASTURE',					'YIELD_FOOD',			1,					null,							'TECH_ROBOTICS'),

	(640,	'IMPROVEMENT_QUARRY',					'YIELD_PRODUCTION',		1,					null,							'TECH_GUNPOWDER'),
	(641,	'IMPROVEMENT_QUARRY',					'YIELD_PRODUCTION',		1,					null,							'TECH_ENGINEERING'),
	(642,	'IMPROVEMENT_QUARRY',					'YIELD_PRODUCTION',		1,					null,							'TECH_PREDICTIVE_SYSTEMS'),

	(650,	'IMPROVEMENT_MINE',						'YIELD_PRODUCTION',		1,					null,							'TECH_ENGINEERING'),
	(651,	'IMPROVEMENT_MINE',						'YIELD_PRODUCTION',		1,					null,							'TECH_APPRENTICESHIP'),
	(652,	'IMPROVEMENT_MINE',						'YIELD_PRODUCTION',		1,					null,							'TECH_INDUSTRIALIZATION'),
	(653,	'IMPROVEMENT_MINE',						'YIELD_PRODUCTION',		1,					null,							'TECH_SMART_MATERIALS'),

	(660,	'IMPROVEMENT_LUMBER_MILL',				'YIELD_PRODUCTION',		1,					null,							'TECH_CONSTRUCTION'),
	(661,	'IMPROVEMENT_LUMBER_MILL',				'YIELD_PRODUCTION',		1,					null,							'TECH_MACHINERY'),
	(662,	'IMPROVEMENT_LUMBER_MILL',				'YIELD_PRODUCTION',		1,					null,							'TECH_CIVIL_ENGINEERING_HD'),
	(663,	'IMPROVEMENT_LUMBER_MILL',				'YIELD_PRODUCTION',		1,					null,							'TECH_CYBERNETICS'),

	(670,	'IMPROVEMENT_FISHING_BOATS',			'YIELD_PRODUCTION',		1,					null,							'TECH_COMPASS_HD'),
	(671,	'IMPROVEMENT_FISHING_BOATS',			'YIELD_GOLD',			2,					null,							'TECH_STEAM_POWER'),
	(672,	'IMPROVEMENT_FISHING_BOATS',			'YIELD_FOOD',			1,					null,							'TECH_PLASTICS'),

	(700,	'IMPROVEMENT_OIL_WELL',					'YIELD_PRODUCTION',		2,					null,							'TECH_REFINING'),
	(701,	'IMPROVEMENT_OIL_WELL',					'YIELD_SCIENCE',		2,					null,							'TECH_REFINING'),
	(702,	'IMPROVEMENT_OFFSHORE_OIL_RIG',			'YIELD_PRODUCTION',		2,					null,							'TECH_REFINING'),
	(703,	'IMPROVEMENT_OFFSHORE_OIL_RIG',			'YIELD_SCIENCE',		2,					null,							'TECH_REFINING');

-- Adjacency Yield
delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_ICE_HOCKEY_RINK'
	or (ImprovementType = 'IMPROVEMENT_TERRACE_FARM' and YieldChangeId = 'Terrace_AqueductAdjacency')
	or (ImprovementType = 'IMPROVEMENT_CHATEAU' and YieldChangeId = 'Chateau_River')
	or (ImprovementType = 'IMPROVEMENT_CHATEAU' and YieldChangeId = 'Chateau_WonderEarly');
delete from Adjacency_YieldChanges where ID in(
    'Mekewap_FirstBonusAdjacency',
    'Mekewap_SecondBonusAdjacency',
    'Mekewap_ThirdBonusAdjacency');
insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values
	('IMPROVEMENT_LUMBER_MILL',		'Lumber_Mill_River_Production'),
	('IMPROVEMENT_LUMBER_MILL',		'Lumber_Mill_Industrial_Production'),
	('IMPROVEMENT_MINE',			'Mine_Industrial_Production'),
	('IMPROVEMENT_QUARRY',			'Quarry_Industrial_Production'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Commercial_Gold'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Suguba_Gold'),
	('IMPROVEMENT_PASTURE',			'Pasture_Commercial_Gold'),
	('IMPROVEMENT_PASTURE',			'Pasture_Suguba_Gold'),
	('IMPROVEMENT_CAMP',			'Camp_Commercial_Gold'),
	('IMPROVEMENT_CAMP',			'Camp_Suguba_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Harbor_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Royal_Navy_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Cothon_Gold'),

	('IMPROVEMENT_MEKEWAP',			'Mekewap_Luxury_Production_Tier1'),
	('IMPROVEMENT_MEKEWAP',			'Mekewap_Luxury_Production_Tier2'),
	('IMPROVEMENT_MEKEWAP',			'Mekewap_Strategic_Production_Tier1'),
	('IMPROVEMENT_MEKEWAP',		    'Mekewap_Strategic_Production_Tier2'),
	('IMPROVEMENT_MEKEWAP',		    'Mekewap_Bonus_Food_Tier1'),
	('IMPROVEMENT_MEKEWAP',		    'Mekewap_Bonus_Food_Tier2'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_GrassMountainAdjacency_Late'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_PlainsMountainAdjacency_Late'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_DesertMountainAdjacency_Late'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_TundraMountainAdjacency_Late'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_SnowMountainAdjacency_Late'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_ConstructionAdjacency'),
	('IMPROVEMENT_CHATEAU',			'Chateau_Bonus_Gold'),
	('IMPROVEMENT_CHATEAU',			'Chateau_Luxury_Culture'),
	('IMPROVEMENT_CHATEAU',			'Chateau_Luxury_Gold'),
	('IMPROVEMENT_MISSION',			'Mission_Neighborhood_Food'),
	('IMPROVEMENT_MISSION',			'Mission_Neighborhood_Production'),
	('IMPROVEMENT_MISSION',			'Mission_Mbanza_Food'),
	('IMPROVEMENT_MISSION',			'Mission_Mbanza_Production'),
	('IMPROVEMENT_GOLF_COURSE',		'Golf_District_Culture');
insert or replace into Adjacency_YieldChanges
	(ID,										Description,	YieldType,			YieldChange,	AdjacentDistrict)
values
	('Lumber_Mill_Industrial_Production',		'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_INDUSTRIAL_ZONE'),
	('Mine_Industrial_Production',				'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_INDUSTRIAL_ZONE'),
	('Quarry_Industrial_Production',			'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_INDUSTRIAL_ZONE'),
	('Plantation_Commercial_Gold', 				'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_COMMERCIAL_HUB'),
	('Plantation_Suguba_Gold', 					'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_SUGUBA'),
	('Pasture_Commercial_Gold', 				'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_COMMERCIAL_HUB'),
	('Pasture_Suguba_Gold', 					'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_SUGUBA'),
	('Camp_Commercial_Gold', 					'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_COMMERCIAL_HUB'),
	('Camp_Suguba_Gold', 						'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_SUGUBA'),
	('Fishing_Boats_Harbor_Gold', 				'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_HARBOR'),
	('Fishing_Boats_Royal_Navy_Gold', 			'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_ROYAL_NAVY_DOCKYARD'),
	('Fishing_Boats_Cothon_Gold', 				'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_COTHON'),
	
	('Mission_Neighborhood_Food',				'Placeholder',	'YIELD_FOOD',		1,				'DISTRICT_NEIGHBORHOOD'),
	('Mission_Neighborhood_Production',			'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_NEIGHBORHOOD'),
	('Mission_Mbanza_Food',						'Placeholder',	'YIELD_FOOD',		1,				'DISTRICT_MBANZA'),
	('Mission_Mbanza_Production',				'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_MBANZA');
insert or replace into Adjacency_YieldChanges
	(ID,										Description,	YieldType,			YieldChange,	AdjacentRiver,	PrereqTech,				ObsoleteTech)
values
	('Lumber_Mill_River_Production', 			'Placeholder',	'YIELD_PRODUCTION',	1,				1,				'TECH_BRONZE_WORKING',	'TECH_MACHINERY');
insert or replace into Adjacency_YieldChanges
	(ID,										Description,	YieldType,			YieldChange,	AdjacentResourceClass,		PrereqTech,		        PrereqCivic,            ObsoleteTech,           ObsoleteCivic)
values
	('Mekewap_Luxury_Production_Tier1', 		'Placeholder',	'YIELD_PRODUCTION',	1,				'RESOURCECLASS_LUXURY',		null,			        null,                   'TECH_MASS_PRODUCTION', null),
	('Mekewap_Luxury_Production_Tier2', 		'Placeholder',	'YIELD_PRODUCTION',	2,				'RESOURCECLASS_LUXURY',		'TECH_MASS_PRODUCTION',	null,                   null,                   null),
	('Mekewap_Strategic_Production_Tier1', 		'Placeholder',	'YIELD_PRODUCTION',	1,				'RESOURCECLASS_STRATEGIC',	null,			        null,                   'TECH_MASS_PRODUCTION', null),
	('Mekewap_Strategic_Production_Tier2', 		'Placeholder',	'YIELD_PRODUCTION',	2,				'RESOURCECLASS_STRATEGIC',	'TECH_MASS_PRODUCTION',	null,                   null,                   null),
	('Mekewap_Bonus_Food_Tier1',                'PlaceHolder',  'YIELD_FOOD',       1,              'RESOURCECLASS_BONUS',      null,                   null,                   null,                   'CIVIC_CIVIL_SERVICE'),
	('Mekewap_Bonus_Food_Tier2',                'PlaceHolder',  'YIELD_FOOD',       2,              'RESOURCECLASS_BONUS',      null,                   'CIVIC_CIVIL_SERVICE',  null,                   null),
	('Chateau_Bonus_Gold', 						'Placeholder',	'YIELD_GOLD',		2,				'RESOURCECLASS_BONUS',		null,			        null,                   null,                   null),
	('Chateau_Luxury_Culture', 					'Placeholder',	'YIELD_CULTURE',	1,				'RESOURCECLASS_LUXURY',		'TECH_CASTLES',	        null,                   null,                   null),
	('Chateau_Luxury_Gold', 					'Placeholder',	'YIELD_GOLD',		2,				'RESOURCECLASS_LUXURY',		null,			        'CIVIC_GUILDS',         null,                   null);
insert or replace into Adjacency_YieldChanges
	(ID,										Description,	YieldType,			YieldChange,	OtherDistrictAdjacent,	PrereqCivic)
values
	('Golf_District_Culture',					'Placeholder',	'YIELD_CULTURE',	1, 				1,						'CIVIC_HUMANISM');
insert or replace into Adjacency_YieldChanges
	(ID,										Description,	YieldType,			YieldChange,	AdjacentTerrain,			PrereqTech)
values
	('Terrace_GrassMountainAdjacency_Late',		'Placeholder',	'YIELD_FOOD',		2,				'TERRAIN_GRASS_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_PlainsMountainAdjacency_Late',	'Placeholder',	'YIELD_FOOD',		2,				'TERRAIN_PLAINS_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_DesertMountainAdjacency_Late',	'Placeholder',	'YIELD_FOOD',		2,				'TERRAIN_DESERT_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_TundraMountainAdjacency_Late',	'Placeholder',	'YIELD_FOOD',		2,				'TERRAIN_TUNDRA_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_SnowMountainAdjacency_Late',		'Placeholder',	'YIELD_FOOD',		2,				'TERRAIN_SNOW_MOUNTAIN',	'TECH_ENGINEERING');
insert or replace into Adjacency_YieldChanges
	(ID,										Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement,		PrereqTech)
values
	('Terrace_ConstructionAdjacency',			'Placeholder',	'YIELD_PRODUCTION',	1,				2,				'IMPROVEMENT_TERRACE_FARM',	'TECH_CONSTRUCTION');

-- Prereq Tech / Civic
update Improvements set PrereqTech = 'TECH_POTTERY'					where ImprovementType = 'IMPROVEMENT_PLANTATION';
update Improvements set PrereqTech = 'TECH_MINING'					where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';
update Improvements set PrereqTech = 'TECH_MILITARY_ENGINEERING'	where ImprovementType = 'IMPROVEMENT_FORT';
update Improvements set PrereqTech = 'TECH_BIOLOGY_HD'				where ImprovementType = 'IMPROVEMENT_OIL_WELL';
update Improvements set PrereqTech = 'TECH_SYNTHETIC_MATERIALS'		where ImprovementType = 'IMPROVEMENT_OFFSHORE_WIND_FARM';

-- Valid Features
insert or replace into Improvement_ValidFeatures
	(ImprovementType,				FeatureType,					PrereqTech,			PrereqCivic)
values
	('IMPROVEMENT_CAMP',			'FEATURE_FOREST',				'TECH_ARCHERY',		null),
	('IMPROVEMENT_CAMP',			'FEATURE_JUNGLE',				null,				'CIVIC_GUILDS'),
	('IMPROVEMENT_LUMBER_MILL',		'FEATURE_JUNGLE',				null,				'CIVIC_GUILDS'),
	('IMPROVEMENT_MINE',			'FEATURE_GEOTHERMAL_FISSURE',	'TECH_ENGINEERING',	null),
	('IMPROVEMENT_FISHERY',			'FEATURE_REEF',					null,				null),

	('IMPROVEMENT_COLOSSAL_HEAD',	'FEATURE_FOREST',				null,				null),
	('IMPROVEMENT_COLOSSAL_HEAD',	'FEATURE_JUNGLE',				null,				null),

	('IMPROVEMENT_MEKEWAP',			'FEATURE_FOREST',				'TECH_MINING',		null);

with I(ImprovementType) as (select ImprovementType from Improvements where ImprovementType in (
	'IMPROVEMENT_GREAT_WALL',
	'IMPROVEMENT_MISSION',
	'IMPROVEMENT_FORT',
	'IMPROVEMENT_ROMAN_FORT',
	'IMPROVEMENT_GOLF_COURSE',
	'IMPROVEMENT_MEKEWAP',
	'IMPROVEMENT_MOAI',
	'IMPROVEMENT_OPEN_AIR_MUSEUM',
	'IMPROVEMENT_MAHAVIHARA', 
	'IMPROVEMENT_BATEY',
	'IMPROVEMENT_HACIENDA',
	'IMPROVEMENT_PAIRIDAEZA',
	'IMPROVEMENT_MONASTERY',
	'IMPROVEMENT_ALCAZAR',
	'IMPROVEMENT_STEPWELL'
	)),
F(FeatureType) as (select FeatureType from Features where FeatureType in (
	'FEATURE_FLOODPLAINS',
	'FEATURE_FLOODPLAINS_GRASSLAND',
	'FEATURE_FLOODPLAINS_PLAINS'))
insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType,					PrereqTech)
select
	ImprovementType,			FeatureType,					'TECH_BUTTRESS'
from I cross join F;
update Improvements set Description = '{' || Description || '}{LOC_IMPROVEMENT_BUTTRESS_ON_FLOODLANDS}'	where ImprovementType in (
	'IMPROVEMENT_GREAT_WALL',
	'IMPROVEMENT_MISSION',
	'IMPROVEMENT_FORT',
	'IMPROVEMENT_ROMAN_FORT',
	'IMPROVEMENT_GOLF_COURSE',
	'IMPROVEMENT_MEKEWAP',
	'IMPROVEMENT_MOAI',
	'IMPROVEMENT_OPEN_AIR_MUSEUM',
	'IMPROVEMENT_MAHAVIHARA',
	'IMPROVEMENT_BATEY',
	'IMPROVEMENT_HACIENDA',
	'IMPROVEMENT_PAIRIDAEZA',
	'IMPROVEMENT_MONASTERY',
	'IMPROVEMENT_ALCAZAR',
	'IMPROVEMENT_STEPWELL'
);

with I(ImprovementType) as (select ImprovementType from Improvements where ImprovementType in (
	'IMPROVEMENT_BATEY',
	'IMPROVEMENT_MAHAVIHARA',
	'IMPROVEMENT_CITY_PARK',
	'IMPROVEMENT_MEKEWAP',
	'IMPROVEMENT_ALCAZAR',
	'IMPROVEMENT_MOUND',
	'IMPROVEMENT_MAORI_PA',
	'IMPROVEMENT_CHEMAMULL',
	'IMPROVEMENT_PAIRIDAEZA',
	'IMPROVEMENT_GREAT_WALL',
	'IMPROVEMENT_GOLF_COURSE',
	'IMPROVEMENT_MISSION',
	'IMPROVEMENT_ROMAN_FORT',
	'IMPROVEMENT_FORT',
	'IMPROVEMENT_OPEN_AIR_MUSEUM',
	'IMPROVEMENT_ZIGGURAT'))
insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType)
select
	ImprovementType,			'FEATURE_VOLCANIC_SOIL'
from I;

-- Plunder Yield
update Improvements set PlunderType = 'PLUNDER_GOLD', PlunderAmount = 50 where ImprovementType = 'IMPROVEMENT_PLANTATION';
update Improvements set PlunderType = 'PLUNDER_GOLD', PlunderAmount = 50 where ImprovementType = 'IMPROVEMENT_QUARRY';
update Improvements set PlunderType = 'PLUNDER_HEAL' where ImprovementType = 'IMPROVEMENT_PASTURE';

-- Improvement Tourism
delete from Improvement_Tourism where ImprovementType in (
	'IMPROVEMENT_MINE',
	'IMPROVEMENT_ZIGGURAT',
	'IMPROVEMENT_SEASTEAD',
	'IMPROVEMENT_PASTURE',
	'IMPROVEMENT_PLANTATION'
);
insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech)
values
	('IMPROVEMENT_FORT',		'TOURISMSOURCE_CULTURE',	'TECH_FLIGHT');

insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqCivic)
select
	ImprovementType, 			'TOURISMSOURCE_GOLD',		'CIVIC_CAPITALISM'
from Improvements where ImprovementType in (
	'IMPROVEMENT_PLANTATION',
	'IMPROVEMENT_CAMP',
	'IMPROVEMENT_PASTURE',
	'IMPROVEMENT_LUMBER_MILL',
	'IMPROVEMENT_FISHING_BOATS',
	'IMPROVEMENT_MEKEWAP',
	'IMPROVEMENT_POLDER',
	'IMPROVEMENT_LAND_POLDER',
	'IMPROVEMENT_TRADING_DOME'
);
insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech)
select
	ImprovementType, 			'TOURISMSOURCE_SCIENCE',	'TECH_FLIGHT'
from Improvements where ImprovementType in (
	'IMPROVEMENT_MAHAVIHARA',
	'IMPROVEMENT_ALCAZAR',
	'IMPROVEMENT_MISSION',
	'IMPROVEMENT_ZIGGURAT'
);
insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech)
select
	ImprovementType, 			'TOURISMSOURCE_FAITH',		'TECH_FLIGHT'
from Improvements where ImprovementType in (
	'IMPROVEMENT_PYRAMID',
	'IMPROVEMENT_MONASTERY'
);
insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech)
select
	ImprovementType, 			'TOURISMSOURCE_PRODUCTION',	'TECH_FLIGHT'
from Improvements where ImprovementType in (
	'IMPROVEMENT_OUTBACK_STATION',
	'IMPROVEMENT_HACIENDA',
	'IMPROVEMENT_SEASTEAD'
);

-- Common Improvements
-- Farm
update Adjacency_YieldChanges set PrereqTech = 'TECH_BIOLOGY_HD' where ID = 'Farms_MechanizedAdjacency' or ID = 'Terrace_MechanizedAdjacency';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_BIOLOGY_HD' where ID = 'Farms_MedievalAdjacency' or ID = 'Terrace_MedievalAdjacency';

-- Plantation
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierID)
values
	('IMPROVEMENT_PLANTATION',	'PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_GOLD'),
	('IMPROVEMENT_PLANTATION',	'PLANTATION_AQUEDUCT_NO_FEUDALISM_GOLD');
insert or replace into Modifiers
	(ModifierId,											ModifierType,								SubjectRequirementSetId)
values
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_GOLD',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM'),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_GOLD',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'IS_ADJACENT_TO_AQUEDUCT_NO_FEUDALISM');
insert or replace into ModifierArguments
	(ModifierId,											Name,		Value)
values
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_GOLD',	'YieldType',	'YIELD_GOLD'),
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_GOLD',	'Amount',		2),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_GOLD',				'YieldType',	'YIELD_GOLD'),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_GOLD',				'Amount',		2);

-- Mine
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierID)
values
	('IMPROVEMENT_MINE',		'MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION');
insert or replace into Modifiers
	(ModifierId,											ModifierType,								SubjectRequirementSetId)
values
	('MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_MOUNTAIN_NO_APPRENTICESHIP');

insert or replace into ModifierArguments
	(ModifierId,											Name,		Value)
values
	('MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION',	'Amount',		1);

-- Quarry
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierID)
values
	('IMPROVEMENT_QUARRY',		'QUARRY_ADJUST_ANCIENT_AND_CLASSICAL_WONDER_PRODUCTION'),
	('IMPROVEMENT_QUARRY',		'QUARRY_ADJUST_MEDIEVAL_AND_RENAISSANCE_WONDER_PRODUCTION');
insert or replace into Modifiers
	(ModifierId,													ModifierType)
values
	('QUARRY_ADJUST_ANCIENT_AND_CLASSICAL_WONDER_PRODUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_WONDER_ERA_PRODUCTION'),
	('QUARRY_ADJUST_MEDIEVAL_AND_RENAISSANCE_WONDER_PRODUCTION',	'MODIFIER_SINGLE_CITY_ADJUST_WONDER_ERA_PRODUCTION');
insert or replace into ModifierArguments
	(ModifierId,													Name,			Value)
values
	('QUARRY_ADJUST_ANCIENT_AND_CLASSICAL_WONDER_PRODUCTION',		'IsWonder',		1),
	('QUARRY_ADJUST_ANCIENT_AND_CLASSICAL_WONDER_PRODUCTION',		'Amount',		10),
	('QUARRY_ADJUST_ANCIENT_AND_CLASSICAL_WONDER_PRODUCTION',		'StartEra',		'ERA_ANCIENT'),
	('QUARRY_ADJUST_ANCIENT_AND_CLASSICAL_WONDER_PRODUCTION',		'EndEra',		'ERA_CLASSICAL'),
	('QUARRY_ADJUST_MEDIEVAL_AND_RENAISSANCE_WONDER_PRODUCTION',	'IsWonder',		1),
	('QUARRY_ADJUST_MEDIEVAL_AND_RENAISSANCE_WONDER_PRODUCTION',	'Amount',		5),
	('QUARRY_ADJUST_MEDIEVAL_AND_RENAISSANCE_WONDER_PRODUCTION',	'StartEra',		'ERA_MEDIEVAL'),
	('QUARRY_ADJUST_MEDIEVAL_AND_RENAISSANCE_WONDER_PRODUCTION',	'EndEra',		'ERA_RENAISSANCE');

-- City State UI
-- Cahokia Mounds
update Modifiers set SubjectRequirementSetId = null, SubjectStackLimit = 2 where ModifierId = 'MOUND_AMENITY_MAX_ONE';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_MOUND' and (ModifierId = 'MOUND_AMENITY_MAX_TWO' or ModifierId = 'MOUND_HOUSING');
update Adjacency_YieldChanges set TilesRequired = 1, PrereqCivic = null, ObsoleteTech = null, ObsoleteCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD' where ID = 'Mound_MedievalAdjacency';
update Adjacency_YieldChanges set YieldChange = 2, PrereqTech = null, PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD' where ID = 'Mound_MechanizedAdjacency';

-- Alcázar
update Improvements set YieldFromAppealPercent = 100 where ImprovementType ='IMPROVEMENT_ALCAZAR';

-- Nazca Line
update Improvements set SameAdjacentValid = 0 where ImprovementType = 'IMPROVEMENT_NAZCA_LINE';
update ModifierArguments set Value = 'YIELD_FOOD' where ModifierId = 'NAZCA_LINE_ADJACENCY_FAITH' and Name = 'YieldType';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_NAZCA_LINE' and ModifierId in (
	'NAZCA_LINE_ADJACENCY_FOOD_DESERT_CIVIL_SERVICE',
	'NAZCA_LINE_ADJACENCY_FOOD_DESERT_HILLS_CIVIL_SERVICE',
	'NAZCA_LINE_ADJACENCY_PRODUCTION_FLAT_MASS_PRODUCTION');
insert or replace into ImprovementModifiers
 	(ImprovementType,			ModifierId)
values
	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_FRESH_WATER'),
	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_ENGINEERING_ADJACENCY_FOOD'),
	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_MASS_PRODUCTION_ADJACENCY_PRODUCTION');
insert or replace into GameModifiers
	(ModifierId)
values
	('NAZCA_LINE_HOLY_SITE_ADJACENCY'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE'),
	('NAZCA_LINE_THEATER_ADJACENCY'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE');
insert or replace into Modifiers
 	(ModifierId,											ModifierType,											SubjectRequirementSetId,									SubjectStackLimit)
values
	('NAZCA_LINE_FRESH_WATER',								'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_HOUSING',	'REQUIRE_PLOT_ADJACENT_TO_OWNER',							1),
	('NAZCA_LINE_ENGINEERING_ADJACENCY_FOOD',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	    			'PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_ENGINEERING',		null),
	('NAZCA_LINE_MASS_PRODUCTION_ADJACENCY_PRODUCTION',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_MASS_PRODUCTION',	null),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_NO_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_NO_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_THEATER_ADJACENCY',						'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_NO_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null);
insert or replace into ModifierArguments
	(ModifierId,											Name,			        Value)
values
	('NAZCA_LINE_FRESH_WATER',								'Amount',				2),
	('NAZCA_LINE_ENGINEERING_ADJACENCY_FOOD',				'YieldType',			'YIELD_FOOD'),
	('NAZCA_LINE_ENGINEERING_ADJACENCY_FOOD',				'Amount',				1),
	('NAZCA_LINE_MASS_PRODUCTION_ADJACENCY_PRODUCTION',		'YieldType',			'YIELD_PRODUCTION'),
	('NAZCA_LINE_MASS_PRODUCTION_ADJACENCY_PRODUCTION',		'Amount',				1),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'DistrictType',			'DISTRICT_HOLY_SITE'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'YieldType',			'YIELD_FAITH'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'Amount',				1),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'Description',			'LOC_NAZCA_LINE_HOLY_SITE_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'DistrictType',			'DISTRICT_HOLY_SITE'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'YieldType',			'YIELD_FAITH'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'Amount',				2),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'Description',			'LOC_NAZCA_LINE_HOLY_SITE_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'DistrictType',			'DISTRICT_CAMPUS'),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'YieldType',			'YIELD_SCIENCE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'Amount',				1),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'Description',			'LOC_NAZCA_LINE_CAMPUS_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'DistrictType',			'DISTRICT_CAMPUS'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'YieldType',			'YIELD_SCIENCE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'Amount',				2),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'Description',			'LOC_NAZCA_LINE_CAMPUS_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_THEATER_ADJACENCY',						'DistrictType',			'DISTRICT_THEATER'),
	('NAZCA_LINE_THEATER_ADJACENCY',						'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_THEATER_ADJACENCY',						'YieldType',			'YIELD_CULTURE'),
	('NAZCA_LINE_THEATER_ADJACENCY',						'Amount',				1),
	('NAZCA_LINE_THEATER_ADJACENCY',						'Description',			'LOC_NAZCA_LINE_THEATER_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'DistrictType',			'DISTRICT_THEATER'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'YieldType',			'YIELD_CULTURE'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'Amount',				2),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'Description',			'LOC_NAZCA_LINE_THEATER_ADJACENCY_DESCRIPTION');
insert or replace into RequirementSets
	(RequirementSetId,											RequirementSetType)
values
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_ENGINEERING',		'REQUIREMENTSET_TEST_ALL'),
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_MASS_PRODUCTION',	'REQUIREMENTSET_TEST_ALL');
insert or replace into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_ENGINEERING',		'ADJACENT_TO_OWNER'),
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_ENGINEERING',		'HD_REQUIRES_PLAYER_HAS_TECH_ENGINEERING'),
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_MASS_PRODUCTION',	'ADJACENT_TO_OWNER'),
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_MASS_PRODUCTION',	'HD_REQUIRES_PLAYER_HAS_TECH_MASS_PRODUCTION');

-- Mahavihara
delete from TraitModifiers where TraitType = 'MINOR_CIV_NALANDA_TRAIT' and ModifierId = 'MINOR_CIV_NALANDA_FREE_TECHNOLOGY';
update Adjacency_YieldChanges set PrereqTech = null, PrereqCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Mahavihara_Campus_Science_Late' or ID = 'Mahavihara_Observatory_Science_Late';
update Adjacency_YieldChanges set ObsoleteTech = null, ObsoleteCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Mahavihara_Campus_Science_Early' or ID = 'Mahavihara_Observatory_Science_Early';
update Adjacency_YieldChanges set YieldType = 'YIELD_SCIENCE', ObsoleteCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Mahavihara_Holy_Site_Faith';
update Adjacency_YieldChanges set YieldType = 'YIELD_SCIENCE', ObsoleteCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Mahavihara_Lavra_Faith';

-- Civilization UI
-- Mekewap (Cree)
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_MEKEWAP' and ModifierId = 'MEKEWAP_LUXURY_GOLD';
update ModifierArguments set Value = 'YIELD_PRODUCTION' where ModifierId = 'MEKEWAP_LUXURY_GOLD' and Name = 'YieldType';
insert or replace into Improvement_YieldChanges
	(ImprovementType,					YieldType,				YieldChange)
values
	('IMPROVEMENT_MEKEWAP',		        'YIELD_PRODUCTION',		1),
	('IMPROVEMENT_MEKEWAP',		        'YIELD_GOLD',			2);

-- Ziggurat (Sumeria)
insert or replace into ImprovementModifiers
	(ImprovementType,						ModifierID)
values
	('IMPROVEMENT_ZIGGURAT',				'ZIGGURAT_RIVERADJACENCY_FOOD');
insert or replace into Modifiers
	(ModifierId,							ModifierType,								SubjectRequirementSetId)
values
	('ZIGGURAT_RIVERADJACENCY_FOOD',		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('ZIGGURAT_RIVERADJACENCY_FOOD',		'YieldType',	'YIELD_FAITH'),
	('ZIGGURAT_RIVERADJACENCY_FOOD',		'Amount',		1);
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierID)
select
	'IMPROVEMENT_ZIGGURAT',		'ZIGGURAT_' || EraType || '_SCIENCE'
from Eras where EraType != 'ERA_ANCIENT';
insert or replace into Modifiers
	(ModifierId,							ModifierType,								SubjectRequirementSetId)
select
	'ZIGGURAT_' || EraType || '_SCIENCE',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'ZIGGURAT_' || EraType
from Eras where EraType != 'ERA_ANCIENT';
insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
select
	'ZIGGURAT_' || EraType || '_SCIENCE',	'YieldType',	'YIELD_SCIENCE'
from Eras where EraType != 'ERA_ANCIENT';
insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('ZIGGURAT_ERA_CLASSICAL_SCIENCE',		'Amount',		1),
	('ZIGGURAT_ERA_MEDIEVAL_SCIENCE',		'Amount',		1),
	('ZIGGURAT_ERA_RENAISSANCE_SCIENCE',	'Amount',		1),
	('ZIGGURAT_ERA_INDUSTRIAL_SCIENCE',		'Amount',		1),
	('ZIGGURAT_ERA_MODERN_SCIENCE',			'Amount',		1),
	('ZIGGURAT_ERA_ATOMIC_SCIENCE',			'Amount',		1),
	('ZIGGURAT_ERA_INFORMATION_SCIENCE',	'Amount',		1),
	('ZIGGURAT_ERA_FUTURE_SCIENCE',			'Amount',		1);

-- Kurgan (Scythia)
insert or replace into ImprovementModifiers
	(ImprovementType,		ModifierId)
values
	('IMPROVEMENT_KURGAN',	'KURGAN_PASTURE_FAITH'),
	('IMPROVEMENT_KURGAN',	'KURGAN_PURCHASE_LIGHT_CAVALRY'),
	('IMPROVEMENT_KURGAN',	'KURGAN_PURCHASE_HEAVY_CAVALRY');
insert or replace into Modifiers
	(ModifierId,						ModifierType,										SubjectRequirementSetId)
values
	('KURGAN_PASTURE_FAITH',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_IMPROVEMENT_PASTURE_AND_ADJACENT_TO_OWNER_REQUIREMENTS'),
	('KURGAN_PURCHASE_LIGHT_CAVALRY',	'MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',	null),
	('KURGAN_PURCHASE_HEAVY_CAVALRY',	'MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',	null),
	('KURGAN_GENERAL_FAITH',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_IMPROVEMENT_KURGAN_REQUIREMENTS'),
	('KURGAN_CAVALRY_FAITH',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_IMPROVEMENT_KURGAN_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,						Name,			Value)
values
	('KURGAN_PASTURE_FAITH',			'YieldType',	'YIELD_FAITH'),
	('KURGAN_PASTURE_FAITH',			'Amount',		1),
	('KURGAN_PURCHASE_LIGHT_CAVALRY',	'Tag',			'CLASS_LIGHT_CAVALRY'),
	('KURGAN_PURCHASE_HEAVY_CAVALRY',	'Tag',			'CLASS_HEAVY_CAVALRY'),
	('KURGAN_GENERAL_FAITH',			'YieldType',	'YIELD_FAITH'),
	('KURGAN_GENERAL_FAITH',			'Amount',		2),
	('KURGAN_CAVALRY_FAITH',			'YieldType',	'YIELD_FAITH'),
	('KURGAN_CAVALRY_FAITH',			'Amount',		1);

-- Terrace Farm (Inca)
insert or replace into Improvement_ValidTerrains
	(ImprovementType,				TerrainType)
values
	('IMPROVEMENT_TERRACE_FARM',	'TERRAIN_GRASS_MOUNTAIN'),
	('IMPROVEMENT_TERRACE_FARM',	'TERRAIN_PLAINS_MOUNTAIN'),
	('IMPROVEMENT_TERRACE_FARM',	'TERRAIN_DESERT_MOUNTAIN');
insert or replace into Improvement_ValidFeatures
	(ImprovementType,				FeatureType)
values
	('IMPROVEMENT_TERRACE_FARM',	'FEATURE_VOLCANO');
insert or replace into Improvements_XP2
	(ImprovementType,				BuildOnAdjacentPlot)
values
	('IMPROVEMENT_TERRACE_FARM',	1);
update Modifiers set SubjectRequirementSetId = 'PLOT_IS_FRESH_WATER_REQUIREMENTS' where ModifierId = 'TERRACE_FARM_PRODUCTION_FRESH_WATER_NO_AQUEDUCT';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_ENGINEERING' where ID like 'Terrace_%MountainAdjacency';
insert or replace into Improvement_ValidResources
	(ImprovementType,				ResourceType)
values
	('IMPROVEMENT_TERRACE_FARM',	'RESOURCE_SHEEP');
insert or replace into Improvement_ValidResources
	(ImprovementType,				ResourceType)
select
	'IMPROVEMENT_TERRACE_FARM',		'RESOURCE_STRAWBERRY'
where exists (select ResourceType from Resources where ResourceType = 'RESOURCE_STRAWBERRY');
insert or replace into Improvement_ValidResources
	(ImprovementType,				ResourceType)
select
	'IMPROVEMENT_TERRACE_FARM',		'RESOURCE_LEU_P0K_LLAMAS'
where exists (select ResourceType from Resources where ResourceType = 'RESOURCE_LEU_P0K_LLAMAS');
update Improvements set Housing = 1, TilesRequired = 1 where ImprovementType = 'IMPROVEMENT_TERRACE_FARM';

-- Sphinx (Egypt)
-- In order to adapt the wonder yield change made in UpdateDatabse/DL_Wonders.sql at LoadOrder 16010, Modifiers about adjacent wonders are written in UpdateDatabse/DL_PostProcess.sql, which is at LoadOrder 20000
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_SPHINX';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_SPHINX' and ModifierId = 'SPHINX_WONDERADJACENCY_FAITH';
insert or replace into Improvement_YieldChanges
	(ImprovementType,					YieldType,				YieldChange)
values
	('IMPROVEMENT_SPHINX',		        'YIELD_CULTURE',		1),
	('IMPROVEMENT_SPHINX',		        'YIELD_FAITH',			2);

--insert or replace into ImprovementModifiers
--	(ImprovementType,		ModifierId)
--values
--	('IMPROVEMENT_SPHINX',	'SPHINX_FARM_FOOD'),
--	('IMPROVEMENT_SPHINX',	'SPHINX_RIVER_FASTER_BUILDTIME_DISTRICT'),
--	('IMPROVEMENT_SPHINX',	'SPHINX_RIVER_FASTER_BUILDTIME_WONDER'),
--	('IMPROVEMENT_SPHINX',	'SPHINX_FASTER_BUILDTIME_DISTRICT'),
--	('IMPROVEMENT_SPHINX',	'SPHINX_FASTER_BUILDTIME_WONDER');
--insert or replace into Modifiers
--	(ModifierId,								ModifierType,												OwnerRequirementSetId,							SubjectRequirementSetId,						SubjectStackLimit)
--values
--	('SPHINX_FARM_FOOD',						'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						null,											'PLOT_HAS_IMPROVEMENT_FARM_AND_ADJACENT_TO_OWNER_REQUIREMENTS',			null),
--	('SPHINX_RIVER_FASTER_BUILDTIME_DISTRICT',	'MODIFIER_SINGLE_CITY_ADJUST_RIVER_DISTRICT_PRODUCTION',	'PLOT_IS_FLOODPLIANS_ADJACENT_TO_CITY_CENTER',	'PLAYER_DOES_NOT_HAVE_GREAT_BATH_REQUIREMENTS',	1),
--	('SPHINX_RIVER_FASTER_BUILDTIME_WONDER',	'MODIFIER_SINGLE_CITY_ADJUST_RIVER_WONDER_PRODUCTION',		'PLOT_IS_FLOODPLIANS_ADJACENT_TO_CITY_CENTER',	'PLAYER_DOES_NOT_HAVE_GREAT_BATH_REQUIREMENTS',	1),
--	('SPHINX_FASTER_BUILDTIME_DISTRICT',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'PLOT_IS_FLOODPLIANS_ADJACENT_TO_CITY_CENTER',	null,											1),
--	('SPHINX_FASTER_BUILDTIME_WONDER',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'PLOT_IS_FLOODPLIANS_ADJACENT_TO_CITY_CENTER',	null,											1);
--insert or replace into ModifierArguments
--	(ModifierId,								Name,			Value)
--values
--	('SPHINX_FARM_FOOD',						'YieldType',	'YIELD_FOOD'),
--	('SPHINX_FARM_FOOD',						'Amount',		1),
--	('SPHINX_RIVER_FASTER_BUILDTIME_DISTRICT',	'Amount',		15),
--	('SPHINX_RIVER_FASTER_BUILDTIME_WONDER',	'Amount',		15),
--	('SPHINX_FASTER_BUILDTIME_DISTRICT',		'Amount',		15),
--	('SPHINX_FASTER_BUILDTIME_WONDER',			'Amount',		15);
--insert or replace into RequirementSets
--	(RequirementSetId,								RequirementSetType)
--values
--	('PLOT_IS_FLOODPLIANS_ADJACENT_TO_CITY_CENTER',	'REQUIREMENTSET_TEST_ALL');
--insert or replace into RequirementSetRequirements
--	(RequirementSetId,								RequirementId)
--values
--	('PLOT_IS_FLOODPLIANS_ADJACENT_TO_CITY_CENTER',	'REQUIRES_PLOT_HAS_FLOODPLAINS_TAG'),
--	('PLOT_IS_FLOODPLIANS_ADJACENT_TO_CITY_CENTER',	'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_CITY_CENTER');

-- Chemamull (Mapuche)
update Improvements set MinimumAppeal = 2 where ImprovementType = 'IMPROVEMENT_CHEMAMULL';
update Improvements set YieldFromAppealPercent = 100 where ImprovementType = 'IMPROVEMENT_CHEMAMULL';

-- Stepwell (India)
update Improvement_BonusYieldChanges set PrereqCivic = null, PrereqTech = 'TECH_SANITATION' where ImprovementType = 'IMPROVEMENT_STEPWELL' and YieldType = 'YIELD_FOOD';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_STEPWELL' and ModifierId = 'STEPWELL_FARMADJACENCY_FOOD';
update Improvement_YieldChanges set YieldChange = 2 where ImprovementType = 'IMPROVEMENT_STEPWELL' and YieldType = 'YIELD_FOOD';
delete from ImprovementModifiers where ModifierId = 'STEPWELL_HOLYSITEADJACENCY_FAITH' or ModifierId = 'STEPWELL_HOUSING_WITHTECH';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_STEPWELL';
--adjacency
insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values
	('IMPROVEMENT_STEPWELL',		'STEPWELL_HOLY_SITE_ADJACENCY_FAITH_TIER1'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_HOLY_SITE_ADJACENCY_FAITH_TIER2'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_FARM_ADJACENCY_FAITH_TIER1'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_FARM_ADJACENCY_FAITH_TIER2'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_PLANTATION_ADJACENCY_FAITH_TIER1'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_PLANTATION_ADJACENCY_FAITH_TIER2');

insert or replace into Adjacency_YieldChanges
	(ID,											Description,		YieldType,			YieldChange,	AdjacentDistrict,		PrereqCivic,			ObsoleteCivic)
values
	('STEPWELL_HOLY_SITE_ADJACENCY_FAITH_TIER1',	'Placeholder',		'YIELD_FAITH',		2,				'DISTRICT_HOLY_SITE',	NULL,					'CIVIC_DIVINE_RIGHT'),
	('STEPWELL_HOLY_SITE_ADJACENCY_FAITH_TIER2',	'Placeholder',		'YIELD_FAITH',		4,				'DISTRICT_HOLY_SITE',	'CIVIC_DIVINE_RIGHT',	NULL);

insert or replace into Adjacency_YieldChanges
	(ID,											Description,		YieldType,			YieldChange,	AdjacentImprovement,			PrereqCivic,				ObsoleteCivic)
values
	('STEPWELL_FARM_ADJACENCY_FAITH_TIER1',			'Placeholder',		'YIELD_FAITH',		1,				'IMPROVEMENT_FARM',				NULL,						'CIVIC_REFORMED_CHURCH'),
	('STEPWELL_FARM_ADJACENCY_FAITH_TIER2',			'Placeholder',		'YIELD_FAITH',		2,				'IMPROVEMENT_FARM',				'CIVIC_REFORMED_CHURCH',	NULL),
	('STEPWELL_PLANTATION_ADJACENCY_FAITH_TIER1',	'Placeholder',		'YIELD_FAITH',		1,				'IMPROVEMENT_PLANTATION',		NULL,						'CIVIC_REFORMED_CHURCH'),
	('STEPWELL_PLANTATION_ADJACENCY_FAITH_TIER2',	'Placeholder',		'YIELD_FAITH',		2,				'IMPROVEMENT_PLANTATION',		'CIVIC_REFORMED_CHURCH',	NULL);
insert or replace into ImprovementModifiers
	(ImprovementType,				ModifierId)
values
	('IMPROVEMENT_STEPWELL',		'STEPWELL_ADD_CITY_POPULATION_FOOD'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_AMENITY_MAX_ONE'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_FARM_FOOD'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_PLANTATION_FOOD');
insert or replace into Modifiers
	(ModifierId,							ModifierType,										SubjectRequirementSetId,												SubjectStackLimit)
values
	('STEPWELL_ADD_CITY_POPULATION_FOOD',	'MODIFIER_CITY_OWNER_ADJUST_POP_YIELD',				null,																	1),
	('STEPWELL_AMENITY_MAX_ONE',			'MODIFIER_CITY_OWNER_ADJUST_IMPROVEMENT_AMENITY',	null,																	1),
	('STEPWELL_FARM_FOOD',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_IMPROVEMENT_FARM_AND_ADJACENT_TO_OWNER_REQUIREMENTS',			null),
	('STEPWELL_PLANTATION_FOOD',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_IMPROVEMENT_PLANTATION_AND_ADJACENT_TO_OWNER_REQUIREMENTS',	null);
insert or replace into ModifierArguments
	(ModifierId,									Name,				Value)
values
	('STEPWELL_ADD_CITY_POPULATION_FOOD',			'YieldType',		'YIELD_FOOD'),
	('STEPWELL_ADD_CITY_POPULATION_FOOD',			'Amount',			0.5),
	('STEPWELL_AMENITY_MAX_ONE',					'Amount',			1),
	('STEPWELL_FARM_FOOD',							'YieldType',		'YIELD_FOOD'),
	('STEPWELL_FARM_FOOD',							'Amount',			1),
	('STEPWELL_PLANTATION_FOOD',					'YieldType',		'YIELD_FOOD'),
	('STEPWELL_PLANTATION_FOOD',					'Amount',			1);

-- Great Wall (China)
update Improvements_XP2 set BuildOnAdjacentPlot = 1 where ImprovementType = 'IMPROVEMENT_GREAT_WALL';
update Adjacency_YieldChanges set PrereqTech = 'TECH_CASTLES' where ID = 'GreatWall_Gold';
update Adjacency_YieldChanges set PrereqTech = 'TECH_MASONRY' where ID = 'GreatWall_Culture';
insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType)
values
	('IMPROVEMENT_GREAT_WALL',	'FEATURE_FOREST');
insert or replace into Improvement_ValidTerrains
	(ImprovementType,			TerrainType)
values
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_GRASS_MOUNTAIN'),
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_PLAINS_MOUNTAIN'),
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_DESERT_MOUNTAIN'),
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_TUNDRA_MOUNTAIN'),
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_SNOW_MOUNTAIN');
insert or replace into ImprovementModifiers
	(ImprovementType,				ModifierId)
values
	('IMPROVEMENT_GREAT_WALL',		'GREAT_WALL_REDUCE_COMBAT');
insert or replace into Modifiers
	(ModifierId,							ModifierType,									SubjectRequirementSetId)
values
	('GREAT_WALL_REDUCE_COMBAT',			'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',			'VARU_ADJACENT_AT_WAR_REQUIREMENTS'),
	('GREAT_WALL_REDUCE_COMBAT_MODIFIER',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',			NULL);
insert or replace into ModifierArguments
	(ModifierId,							Name,				Value)
values
	('GREAT_WALL_REDUCE_COMBAT',			'ModifierId',		'GREAT_WALL_REDUCE_COMBAT_MODIFIER'),
	('GREAT_WALL_REDUCE_COMBAT_MODIFIER',	'Amount',			-2);
insert or replace into ModifierStrings
	(ModifierId,								Context,	Text)
values
	('GREAT_WALL_REDUCE_COMBAT_MODIFIER',		'Preview',	'{1_Amount} {LOC_GREAT_WALL_REDUCE_COMBAT_PREVIEW_TEXT}');

-- Château (France)
update Improvements set PrereqCivic = 'CIVIC_LITERARY_TRADITION_HD', Housing = 1 where ImprovementType = 'IMPROVEMENT_CHATEAU';
update Adjacency_YieldChanges set PrereqTech = null where ID = 'Chateau_WonderLate';

-- Coastal Polder (Netherlands)
update Improvements set MovementChange = 1, ValidAdjacentTerrainAmount = 1, PrereqTech = 'TECH_SAILING', PrereqCivic = null where ImprovementType = 'IMPROVEMENT_POLDER';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_POLDER';
delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_POLDER';
insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType)
values
	('IMPROVEMENT_POLDER',		'FEATURE_REEF');

insert or ignore into Types
	(Type,											Kind)
values
	('TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER',	'KIND_TRAIT'),
	('IMPROVEMENT_LAND_POLDER',						'KIND_IMPROVEMENT');
insert or replace into Traits
	(TraitType,										Name)
values
	('TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER',	'LOC_IMPROVEMENT_LAND_POLDER_NAME');
insert or replace into CivilizationTraits
	(CivilizationType,								TraitType)
values
	('CIVILIZATION_NETHERLANDS',					'TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER');

insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,			PrereqCivic,		PrereqTech,	ScalingFactor)
values
	('IMPROVEMENT_LAND_POLDER',	'TOURISMSOURCE_GOLD',	'CIVIC_CAPITALISM',	null,		100	);

insert or replace into Improvements
	(ImprovementType,			Name,								PrereqTech,				Description,								PlunderType,		PlunderAmount,	Icon,							TraitType,										Housing,	TilesRequired,	MovementChange)
values
	('IMPROVEMENT_LAND_POLDER',	'LOC_IMPROVEMENT_LAND_POLDER_NAME',	'TECH_IRRIGATION',		'LOC_IMPROVEMENT_LAND_POLDER_DESCRIPTION',	'PLUNDER_FAITH',	25,				'ICON_IMPROVEMENT_LAND_POLDER',	'TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER',	1,			2,				1);
insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType)
values
	('IMPROVEMENT_LAND_POLDER',	'FEATURE_FLOODPLAINS'),
	('IMPROVEMENT_LAND_POLDER',	'FEATURE_FLOODPLAINS_GRASSLAND'),
	('IMPROVEMENT_LAND_POLDER',	'FEATURE_FLOODPLAINS_PLAINS'),
	('IMPROVEMENT_LAND_POLDER',	'FEATURE_MARSH');
--resource
insert or replace into Improvement_ValidResources
	(ImprovementType,			ResourceType)
select
	'IMPROVEMENT_LAND_POLDER',	ResourceType
from Resources where ResourceType in (select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_FARM' or ImprovementType = 'IMPROVEMENT_PLANTATION');
insert or replace into Improvement_ValidBuildUnits
	(ImprovementType,			UnitType)
values
	('IMPROVEMENT_LAND_POLDER',	'UNIT_BUILDER');
insert or replace into MomentIllustrations
	(MomentIllustrationType,						MomentDataType,					GameDataType,					Texture)
values
	('MOMENT_ILLUSTRATION_UNIQUE_IMPROVEMENT',		'MOMENT_DATA_IMPROVEMENT',		'IMPROVEMENT_LAND_POLDER',		'Moment_Infrastructure_Netherlands.dds');
-- adjacency
insert or replace into Improvement_Adjacencies
	(ImprovementType,			YieldChangeId)
values
	('IMPROVEMENT_POLDER',		'P_POLDER_PRODUCTION_TIRE1'),
	('IMPROVEMENT_POLDER',		'P_POLDER_PRODUCTION_TIRE2'),
	('IMPROVEMENT_POLDER',		'P_POLDER_FOOD_TIRE1'),
	('IMPROVEMENT_POLDER',		'P_POLDER_FOOD_TIRE2'),
	('IMPROVEMENT_POLDER',		'P_LAND_POLDER_PRODUCTION_TIRE1'),
	('IMPROVEMENT_POLDER',		'P_LAND_POLDER_PRODUCTION_TIRE2'),
	('IMPROVEMENT_POLDER',		'P_LAND_POLDER_FOOD_TIRE1'),
	('IMPROVEMENT_POLDER',		'P_LAND_POLDER_FOOD_TIRE2');

-- yieldchange
insert or replace into Adjacency_YieldChanges
	(ID, 								Description,		YieldType, 				YieldChange, 	TilesRequired, 		AdjacentImprovement, 		PrereqTech, 				ObsoleteTech,				PrereqCivic,				ObsoleteCivic)
values
	('P_POLDER_PRODUCTION_TIRE1',		'Placeholder',		'YIELD_PRODUCTION',		1,				2,					'IMPROVEMENT_POLDER',		'TECH_SHIPBUILDING',		'TECH_MASS_PRODUCTION',		NULL,						NULL),
	('P_POLDER_PRODUCTION_TIRE2',		'Placeholder',		'YIELD_PRODUCTION',		1,				1,					'IMPROVEMENT_POLDER',		'TECH_MASS_PRODUCTION',		NULL,						NULL,						NULL),
	('P_POLDER_FOOD_TIRE1',				'Placeholder',		'YIELD_FOOD',			1,				2,					'IMPROVEMENT_POLDER',		NULL,						NULL,						NULL,						'CIVIC_FEUDALISM'),
	('P_POLDER_FOOD_TIRE2',				'Placeholder',		'YIELD_FOOD',			1,				1,					'IMPROVEMENT_POLDER',		NULL,						NULL,						'CIVIC_FEUDALISM',			NULL),
	('P_LAND_POLDER_PRODUCTION_TIRE1',	'Placeholder',		'YIELD_PRODUCTION',		1,				2,					'IMPROVEMENT_LAND_POLDER',	'TECH_SHIPBUILDING',		'TECH_MASS_PRODUCTION',		NULL,						NULL),
	('P_LAND_POLDER_PRODUCTION_TIRE2',	'Placeholder',		'YIELD_PRODUCTION',		1,				1,					'IMPROVEMENT_LAND_POLDER',	'TECH_MASS_PRODUCTION',		NULL,						NULL,						NULL),
	('P_LAND_POLDER_FOOD_TIRE1',		'Placeholder',		'YIELD_FOOD',			1,				2,					'IMPROVEMENT_LAND_POLDER',	NULL,						NULL,						NULL,						'CIVIC_FEUDALISM'),
	('P_LAND_POLDER_FOOD_TIRE2',		'Placeholder',		'YIELD_FOOD',			1,				1,					'IMPROVEMENT_LAND_POLDER',	NULL,						NULL,						'CIVIC_FEUDALISM',			NULL);
	
-- adjacency
insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values
	('IMPROVEMENT_LAND_POLDER',		'LP_POLDER_PRODUCTION_TIRE1'),
	('IMPROVEMENT_LAND_POLDER',		'LP_POLDER_PRODUCTION_TIRE2'),
	('IMPROVEMENT_LAND_POLDER',		'LP_POLDER_FOOD_TIRE1'),
	('IMPROVEMENT_LAND_POLDER',		'LP_POLDER_FOOD_TIRE2'),
	('IMPROVEMENT_LAND_POLDER',		'LP_LAND_POLDER_PRODUCTION_TIRE1'),
	('IMPROVEMENT_LAND_POLDER',		'LP_LAND_POLDER_PRODUCTION_TIRE2'),
	('IMPROVEMENT_LAND_POLDER',		'LP_LAND_POLDER_FOOD_TIRE1'),
	('IMPROVEMENT_LAND_POLDER',		'LP_LAND_POLDER_FOOD_TIRE2');

-- yieldchange
insert or replace into Adjacency_YieldChanges
	(ID, 								Description,		YieldType, 				YieldChange, 	TilesRequired, 		AdjacentImprovement, 		PrereqTech, 				ObsoleteTech,				PrereqCivic,				ObsoleteCivic)
values
	('LP_POLDER_PRODUCTION_TIRE1',		'Placeholder',		'YIELD_PRODUCTION',		1,				2,					'IMPROVEMENT_POLDER',		'TECH_CONSTRUCTION',		'TECH_MASS_PRODUCTION',		NULL,						NULL),
	('LP_POLDER_PRODUCTION_TIRE2',		'Placeholder',		'YIELD_PRODUCTION',		1,				1,					'IMPROVEMENT_POLDER',		'TECH_MASS_PRODUCTION',		NULL,						NULL,						NULL),
	('LP_POLDER_FOOD_TIRE1',			'Placeholder',		'YIELD_FOOD',			1,				2,					'IMPROVEMENT_POLDER',		NULL,						NULL,						NULL,						'CIVIC_FEUDALISM'),
	('LP_POLDER_FOOD_TIRE2',			'Placeholder',		'YIELD_FOOD',			1,				1,					'IMPROVEMENT_POLDER',		NULL,						NULL,						'CIVIC_FEUDALISM',			NULL),
	('LP_LAND_POLDER_PRODUCTION_TIRE1',	'Placeholder',		'YIELD_PRODUCTION',		1,				2,					'IMPROVEMENT_LAND_POLDER',	'TECH_CONSTRUCTION',		'TECH_MASS_PRODUCTION',		NULL,						NULL),
	('LP_LAND_POLDER_PRODUCTION_TIRE2',	'Placeholder',		'YIELD_PRODUCTION',		1,				1,					'IMPROVEMENT_LAND_POLDER',	'TECH_MASS_PRODUCTION',		NULL,						NULL,						NULL),
	('LP_LAND_POLDER_FOOD_TIRE1',		'Placeholder',		'YIELD_FOOD',			1,				2,					'IMPROVEMENT_LAND_POLDER',	NULL,						NULL,						NULL,						'CIVIC_FEUDALISM'),
	('LP_LAND_POLDER_FOOD_TIRE2',		'Placeholder',		'YIELD_FOOD',			1,				1,					'IMPROVEMENT_LAND_POLDER',	NULL,						NULL,						'CIVIC_FEUDALISM',			NULL);

-- Mission (Spain)
update Improvement_BonusYieldChanges set PrereqCivic = 'CIVIC_EXPLORATION' where ImprovementType = 'IMPROVEMENT_MISSION' and PrereqCivic = 'CIVIC_CULTURAL_HERITAGE';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_MISSION';
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierId)
values
	('IMPROVEMENT_MISSION',		'MISSION_HOLY_SITE_FAITH'),
	('IMPROVEMENT_MISSION',		'MISSION_CAMPUS_SCIENCE'),
	('IMPROVEMENT_MISSION',		'MISSION_HOLY_SITE_FAITH_FOREIGN'),
	('IMPROVEMENT_MISSION',		'MISSION_CAMPUS_SCIENCE_FOREIGN');
insert or replace into Modifiers
	(ModifierId,							ModifierType,												OwnerRequirementSetId,									SubjectRequirementSetId,					SubjectStackLimit)
values
	('MISSION_HOLY_SITE_FAITH',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'PLOT_ADJACENT_TO_DISTRICT_HOLY_SITE_REQUIREMENTS',		null,										1),
	('MISSION_CAMPUS_SCIENCE',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'PLOT_ADJACENT_TO_DISTRICT_CAMPUS_REQUIREMENTS',		null,										1),
	('MISSION_HOLY_SITE_FAITH_FOREIGN',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'PLOT_ADJACENT_TO_DISTRICT_HOLY_SITE_REQUIREMENTS',		'CITY_ON_FOREIGN_CONTINENT_OR_CAPTURED',	1),
	('MISSION_CAMPUS_SCIENCE_FOREIGN',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'PLOT_ADJACENT_TO_DISTRICT_CAMPUS_REQUIREMENTS',		'CITY_ON_FOREIGN_CONTINENT_OR_CAPTURED',	1);
insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('MISSION_HOLY_SITE_FAITH',				'YieldType',	'YIELD_FAITH'),
	('MISSION_HOLY_SITE_FAITH',				'Amount',		0.2),
	('MISSION_CAMPUS_SCIENCE',				'YieldType',	'YIELD_SCIENCE'),
	('MISSION_CAMPUS_SCIENCE',				'Amount',		0.2),
	('MISSION_HOLY_SITE_FAITH_FOREIGN',		'YieldType',	'YIELD_FAITH'),
	('MISSION_HOLY_SITE_FAITH_FOREIGN',		'Amount',		0.2),
	('MISSION_CAMPUS_SCIENCE_FOREIGN',		'YieldType',	'YIELD_SCIENCE'),
	('MISSION_CAMPUS_SCIENCE_FOREIGN',		'Amount',		0.2);
insert or replace into RequirementSets
	(RequirementSetId,							RequirementSetType)
values
	('CITY_ON_FOREIGN_CONTINENT_OR_CAPTURED',	'REQUIREMENTSET_TEST_ANY');
insert or replace into RequirementSetRequirements
	(RequirementSetId,							RequirementId)
values
	('CITY_ON_FOREIGN_CONTINENT_OR_CAPTURED',	'REQUIRES_CITY_IS_NOT_OWNER_CAPITAL_CONTINENT'),
	('CITY_ON_FOREIGN_CONTINENT_OR_CAPTURED',	'REQUIRES_CITY_WAS_NOT_FOUNDED');

-- Golf Course (Scotland)(fox)
	-- pre
		update Improvements 
			set 
				PrereqCivic = 'CIVIC_GAMES_RECREATION' 
			where 
				ImprovementType = 'IMPROVEMENT_GOLF_COURSE';

		delete from Improvement_YieldChanges 
			where 
				ImprovementType = 'IMPROVEMENT_GOLF_COURSE';
		
		delete from Improvement_BonusYieldChanges 
			where 
				ImprovementType = 'IMPROVEMENT_GOLF_COURSE';
	
		delete from Improvement_Adjacencies
			where 
				ImprovementType = 'IMPROVEMENT_GOLF_COURSE';

		delete from ImprovementModifiers
			where 
				ImprovementType = 'IMPROVEMENT_GOLF_COURSE';

	-- base yieldchange
	insert or replace into Improvement_YieldChanges
		(ImprovementType,				YieldType,				YieldChange)
	values
		('IMPROVEMENT_GOLF_COURSE',		'YIELD_GOLD',			0),
		('IMPROVEMENT_GOLF_COURSE',		'YIELD_CULTURE',		0);
	

	-- adjacency
		insert or replace into Improvement_Adjacencies
			(ImprovementType,				YieldChangeId)
		values
			('IMPROVEMENT_GOLF_COURSE',		'GOLF_DISTRICT_CULTURE');


	-- yieldchange
		insert or replace into Adjacency_YieldChanges
			(ID,							Description,		YieldType,			YieldChange,	TilesRequired,	OtherDistrictAdjacent,	PrereqCivic)
		values
			('GOLF_DISTRICT_CULTURE',		'Placeholder',		'YIELD_CULTURE',	1,				1,				1,						'CIVIC_HUMANISM');


	-- modifier
		insert or replace into ImprovementModifiers
			(ImprovementType,				ModifierID)
		values
			('IMPROVEMENT_GOLF_COURSE',		'GOLFCOURSE_AMENITY_TIER1'),
			('IMPROVEMENT_GOLF_COURSE',		'GOLFCOURSE_AMENITY_TIER2'),
			--
			('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_PRODUCTION_TIER1'),
			('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_PRODUCTION_TIER2'),
			('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_PRODUCTION_TIER3'),
			('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_PRODUCTION_TIER4'),
	--		('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_PRODUCTION_TIER5'),
			--
			('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_SCIENCE_TIER1'),
			('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_SCIENCE_TIER2'),
			('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_SCIENCE_TIER3'),
			('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_SCIENCE_TIER4');
	--		('IMPROVEMENT_GOLF_COURSE',		'GOLD_COURSE_SCIENCE_TIER5');

		insert or replace into Modifiers
			(ModifierId,					ModifierType,										SubjectRequirementSetId)
		values
			('GOLFCOURSE_AMENITY_TIER1',	'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',	NULL),
			('GOLFCOURSE_AMENITY_TIER2',	'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',	'PLAYER_HAS_CIVIC_HUMANISM_REQUIREMENTS'),
			--
			('GOLD_COURSE_PRODUCTION_TIER1','MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_INDUSTRIAL_ZONE_REQUIREMENTS'),
			('GOLD_COURSE_PRODUCTION_TIER2','MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_INDUSTRIAL_ZONE_TIER_1_BUILDING_REQUIREMENTS'),
			('GOLD_COURSE_PRODUCTION_TIER3','MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_INDUSTRIAL_ZONE_TIER_2_BUILDING_REQUIREMENTS'),
			('GOLD_COURSE_PRODUCTION_TIER4','MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_INDUSTRIAL_ZONE_TIER_3_BUILDING_REQUIREMENTS'),
	--		('GOLD_COURSE_PRODUCTION_TIER5','MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_INDUSTRIAL_ZONE_TIER_4_BUILDING_REQUIREMENTS'),
			('GOLD_COURSE_PRODUCTION',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_IMPROVEMENT_GOLD_COURSE_REQUIREMENTS'),
			--
			('GOLD_COURSE_SCIENCE_TIER1',	'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_CAMPUS_REQUIREMENTS'),
			('GOLD_COURSE_SCIENCE_TIER2',	'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_CAMPUS_TIER_1_BUILDING_REQUIREMENTS'),
			('GOLD_COURSE_SCIENCE_TIER3',	'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_CAMPUS_TIER_2_BUILDING_REQUIREMENTS'),
			('GOLD_COURSE_SCIENCE_TIER4',	'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_CAMPUS_TIER_3_BUILDING_REQUIREMENTS'),
	--		('GOLD_COURSE_SCIENCE_TIER5',	'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				'CITY_HAS_DISTRICT_CAMPUS_TIER_4_BUILDING_REQUIREMENTS'),
			('GOLD_COURSE_SCIENCE',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_IMPROVEMENT_GOLD_COURSE_REQUIREMENTS');

		insert or replace into ModifierArguments
			(ModifierId,						Name,				Value)
		values
			('GOLFCOURSE_AMENITY_TIER1',		'Type',				'ARGTYPE_IDENTITY'),
			('GOLFCOURSE_AMENITY_TIER1',		'Amount',			1),
			('GOLFCOURSE_AMENITY_TIER2',		'Type',				'ARGTYPE_IDENTITY'),
			('GOLFCOURSE_AMENITY_TIER2',		'Amount',			2),
			--
			('GOLD_COURSE_PRODUCTION_TIER1',	'ModifierId',		'GOLD_COURSE_PRODUCTION'),
			('GOLD_COURSE_PRODUCTION_TIER2',	'ModifierId',		'GOLD_COURSE_PRODUCTION'),
			('GOLD_COURSE_PRODUCTION_TIER3',	'ModifierId',		'GOLD_COURSE_PRODUCTION'),
			('GOLD_COURSE_PRODUCTION_TIER4',	'ModifierId',		'GOLD_COURSE_PRODUCTION'),
	--		('GOLD_COURSE_PRODUCTION_TIER5',	'ModifierId',		'GOLD_COURSE_PRODUCTION'),
			('GOLD_COURSE_PRODUCTION',			'YieldType',		'YIELD_PRODUCTION'),
			('GOLD_COURSE_PRODUCTION',			'Amount',			1),
			--
			('GOLD_COURSE_SCIENCE_TIER1',		'ModifierId',		'GOLD_COURSE_SCIENCE'),
			('GOLD_COURSE_SCIENCE_TIER2',		'ModifierId',		'GOLD_COURSE_SCIENCE'),
			('GOLD_COURSE_SCIENCE_TIER3',		'ModifierId',		'GOLD_COURSE_SCIENCE'),
			('GOLD_COURSE_SCIENCE_TIER4',		'ModifierId',		'GOLD_COURSE_SCIENCE'),
	--		('GOLD_COURSE_SCIENCE_TIER5',		'ModifierId',		'GOLD_COURSE_SCIENCE'),
			('GOLD_COURSE_SCIENCE',				'YieldType',		'YIELD_SCIENCE'),
			('GOLD_COURSE_SCIENCE',				'Amount',			1);


	-- requirements
		insert or replace into RequirementSets
			(RequirementSetId,									RequirementSetType)
		values
			('PLOT_HAS_IMPROVEMENT_GOLD_COURSE_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');
		
		insert or replace into RequirementSetRequirements
			(RequirementSetId,									RequirementId)
		values
			('PLOT_HAS_IMPROVEMENT_GOLD_COURSE_REQUIREMENTS',	'REQUIRES_PLOT_HAS_IMPROVEMENT_GOLF_COURSE');

-- Open-Air Museum (Sweden)
update Improvements set PrereqCivic = 'CIVIC_HUMANISM' where ImprovementType = 'IMPROVEMENT_OPEN_AIR_MUSEUM';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_OPEN_AIR_MUSEUM';
create temporary table Open_Air_Museum_ValidFeatures (
	ImprovementType text not null, 
	FeatureType text not null
);
insert or replace into Open_Air_Museum_ValidFeatures
	(ImprovementType,					FeatureType)
values
	('IMPROVEMENT_OPEN_AIR_MUSEUM',		'FEATURE_FOREST'),
	('IMPROVEMENT_OPEN_AIR_MUSEUM',		'FEATURE_JUNGLE'),
	('IMPROVEMENT_OPEN_AIR_MUSEUM',		'FEATURE_MARSH'),
	('IMPROVEMENT_OPEN_AIR_MUSEUM',		'FEATURE_GEOTHERMAL_FISSURE'),
	('IMPROVEMENT_OPEN_AIR_MUSEUM',		'FEATURE_OASIS');
insert or replace into Improvement_ValidFeatures
	(ImprovementType,					FeatureType)
select
	ImprovementType,					FeatureType
from Open_Air_Museum_ValidFeatures where FeatureType in (select FeatureType from Features);

create temporary table HD_OpenAirMuseumBonuses (
	ObjectType text not null primary key,
	YieldType text not null,
	AttachModifierId text,
	ModifierId text
);
insert or replace into HD_OpenAirMuseumBonuses
	(ObjectType,	YieldType)
select
	TerrainType,	'YIELD_CULTURE'
from Terrains;
insert or replace into HD_OpenAirMuseumBonuses
	(ObjectType,	YieldType)
select
	FeatureType,	'YIELD_SCIENCE'
from Features where FeatureType not in ('FEATURE_BURNING_FOREST', 'FEATURE_BURNT_FOREST', 'FEATURE_BURNING_JUNGLE', 'FEATURE_BURNT_JUNGLE');
update HD_OpenAirMuseumBonuses set ModifierId = 'OPEN_AIR_MUSEUM_' || ObjectType || '_' || YieldType;
update HD_OpenAirMuseumBonuses set AttachModifierId = ModifierId || '_ATTACH';
insert or replace into ImprovementModifiers
	(ImprovementType,		 			ModifierId)
select
	'IMPROVEMENT_OPEN_AIR_MUSEUM',		AttachModifierId
from HD_OpenAirMuseumBonuses;
insert or replace into Modifiers
	(ModifierId,		ModifierType,								SubjectRequirementSetId,			SubjectStackLimit)
select
	AttachModifierId,	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'HD_CITY_HAS_' || ObjectType,		1
from HD_OpenAirMuseumBonuses;
insert or replace into ModifierArguments
	(ModifierId,		Name,			Value)
select
	AttachModifierId,	'ModifierId',	ModifierId
from HD_OpenAirMuseumBonuses;
insert or replace into Modifiers
	(ModifierId,		ModifierType,								SubjectRequirementSetId,								SubjectStackLimit)
select
	ModifierId,			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		'PLOT_HAS_IMPROVEMENT_OPEN_AIR_MUSEUM_REQUIREMENTS',	1
from HD_OpenAirMuseumBonuses;
insert or replace into ModifierArguments
	(ModifierId,		Name,			Value)
select
	ModifierId,			'YieldType',	YieldType
from HD_OpenAirMuseumBonuses;
insert or replace into ModifierArguments
	(ModifierId,		Name,			Value)
select
	ModifierId,			'Amount',		1
from HD_OpenAirMuseumBonuses;

-- Ice Hockey Rink (Canada)
update Improvements set PrereqCivic = 'CIVIC_GAMES_RECREATION' where ImprovementType = 'IMPROVEMENT_ICE_HOCKEY_RINK';
update Improvement_YieldChanges set YieldChange = 0 where ImprovementType = 'IMPROVEMENT_ICE_HOCKEY_RINK' and YieldType = 'YIELD_FOOD';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_ICE_HOCKEY_RINK';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_ICE_HOCKEY_RINK' and ModifierId = 'ICEHOCKEYRINK_CULTURE_STADIUM';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_ICE_HOCKEY_RINK' and ModifierId = 'ICEHOCKEYRINK_AMENITY';
insert or replace into ImprovementModifiers
	(ImprovementType,					ModifierId)
values
	('IMPROVEMENT_ICE_HOCKEY_RINK',		'ICE_HOCKEY_RINK_CITY_CULTURE_ATTACH');
insert or replace into Modifiers
	(ModifierId,								ModifierType,								SubjectRequirementSetId,								SubjectStackLimit)
values
	('ICE_HOCKEY_RINK_CITY_CULTURE_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'PLOT_IS_TUNDRA_OR_SNOW_REQUIREMENTS',					1),
	('ICE_HOCKEY_RINK_CITY_CULTURE',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		'PLOT_HAS_IMPROVEMENT_ICE_HOCKEY_RINK_REQUIREMENTS',	null);
insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('ICE_HOCKEY_RINK_CITY_CULTURE_ATTACH',		'ModifierId',	'ICE_HOCKEY_RINK_CITY_CULTURE'),
	('ICE_HOCKEY_RINK_CITY_CULTURE',			'YieldType',	'YIELD_CULTURE'),
	('ICE_HOCKEY_RINK_CITY_CULTURE',			'Amount',		1);
create temporary table HD_IceHockeyRinkBonuses (
	DistrictType text not null primary key,
	AttachModifierId text,
	ModifierId text
);
insert or replace into HD_IceHockeyRinkBonuses (DistrictType) select DistrictType from Districts where RequiresPopulation = 1 and TraitType is null;
update HD_IceHockeyRinkBonuses set ModifierId = 'ICE_HOCKEY_RINK_' || DistrictType || '_PRODUCTION';
update HD_IceHockeyRinkBonuses set AttachModifierId = ModifierId || '_ATTACH';
insert or replace into ImprovementModifiers
	(ImprovementType,					ModifierId)
select
	'IMPROVEMENT_ICE_HOCKEY_RINK',		AttachModifierId
from HD_IceHockeyRinkBonuses;
insert or replace into Modifiers
	(ModifierId,			ModifierType,									SubjectRequirementSetId,								SubjectStackLimit)
select
	AttachModifierId,		'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'DISTRICT_IS_' || DistrictType || '_REQUIREMENTS',		1
from HD_IceHockeyRinkBonuses;
insert or replace into ModifierArguments
	(ModifierId,			Name,			Value)
select
	AttachModifierId,		'ModifierId',	ModifierId
from HD_IceHockeyRinkBonuses;
insert or replace into Modifiers
	(ModifierId,	ModifierType,							OwnerRequirementSetId,						SubjectRequirementSetId,								SubjectStackLimit)
select
	ModifierId,		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_IS_TUNDRA_OR_SNOW_REQUIREMENTS',		'PLOT_HAS_IMPROVEMENT_ICE_HOCKEY_RINK_REQUIREMENTS',	1
from HD_IceHockeyRinkBonuses;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'YieldType',	'YIELD_PRODUCTION'
from HD_IceHockeyRinkBonuses;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'Amount',		1
from HD_IceHockeyRinkBonuses;

-- Remove snow barbarian camp.
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW';
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW_HILLS';

insert or replace into Types (Type, Kind) values ('IMPROVEMENT_GOODY_BUILDER', 'KIND_IMPROVEMENT');
insert or replace into Improvements
	(ImprovementType,				Name,									Icon,							PlunderType,	RemoveOnEntry,	Goody,	GoodyNotify)
values
	('IMPROVEMENT_GOODY_BUILDER',	'LOC_IMPROVEMENT_GOODY_BUILDER_NAME',	'ICON_IMPROVEMENT_GOODY_HUT',	'NO_PLUNDER',	1,				1,		0);

insert or replace into GoodyHuts
	(GoodyHutType,				ImprovementType,				Weight,	ShowMoment)
values
	('DUMMY_GOODY_BUILDIER',	'IMPROVEMENT_GOODY_BUILDER',	100,	0);

insert or replace into GoodyHutSubTypes
	(GoodyHut,					SubTypeGoodyHut,		Description,										Weight, ModifierID)
values
	('DUMMY_GOODY_BUILDIER',	'DUMMY_GRANT_BUILDER',	'LOC_GOODYHUT_SURVIVORS_GRANT_UNIT_DESCRIPTION',	100,	'GOODY_SURVIVORS_GRANT_BUILDER');
--删除林肯种植园debuff
delete from ImprovementModifiers where ModifierId = 'PLANTATION_NEGATIVE_LOYALTY';
--巨神头像
update Adjacency_YieldChanges set TilesRequired = 1, ObsoleteCivic = NULL where ID = 'ColossalHead_FaithForestEarly';
update Adjacency_YieldChanges set TilesRequired = 1, ObsoleteCivic = NULL where ID = 'ColossalHead_FaithJungleEarly';
delete from Improvement_Adjacencies where YieldChangeId = 'ColossalHead_FaithForestLate' or YieldChangeId = 'ColossalHead_FaithJungleLate';
--摩艾石像
-- delete from Improvement_InvalidAdjacentFeatures where ImprovementType = 'IMPROVEMENT_MOAI';
--独石教堂相邻
insert or replace into Adjacency_YieldChanges
	(ID,										Description,				YieldType,					YieldChange,				TilesRequired,			AdjacentResourceClass)
values
	('LuxuryAdjacency_Faith',					'Placeholder',				'YIELD_FAITH',				1,							1,						'RESOURCECLASS_LUXURY'),
	('StrategicAdjacency_Faith',				'Placeholder',				'YIELD_FAITH',				1,							1,						'RESOURCECLASS_STRATEGIC'),
	('BounsAdjacency_Faith',					'Placeholder',				'YIELD_FAITH',				1,							1,						'RESOURCECLASS_BONUS');