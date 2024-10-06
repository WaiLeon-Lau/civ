--------------------------------
--  Civilization Bias by xhh  --
--------------------------------
CREATE TABLE 'HD_StartBiasTerrains'(
	'CivilizationType' TEXT NOT NULL,
    'TerrainType' TEXT NOT NULL,
    'Tier' INTEGER NOT NULL
);

CREATE TABLE 'HD_StartBiasFeatures'(
	'CivilizationType' TEXT NOT NULL,
    'FeatureType' TEXT NOT NULL,
    'Tier' INTEGER NOT NULL
);

CREATE TABLE 'HD_StartBiasResources'(
	'CivilizationType' TEXT NOT NULL,
    'ResourceType' TEXT NOT NULL,
    'Tier' INTEGER NOT NULL
);

CREATE TABLE 'HD_StartBiasRivers'(
	'CivilizationType' TEXT NOT NULL,
    'Tier' INTEGER NOT NULL
);

insert or ignore into HD_StartBiasTerrains
    (CivilizationType,					TerrainType,                       	Tier)
values
	('CIVILIZATION_AMERICA',			'TERRAIN_GRASS_MOUNTAIN',			3),
	('CIVILIZATION_AMERICA',			'TERRAIN_PLAINS_MOUNTAIN',			3),
	('CIVILIZATION_ENGLAND',			'TERRAIN_COAST',					3),
	('CIVILIZATION_GREECE',				'TERRAIN_GRASS_HILLS',				2),
	('CIVILIZATION_GREECE',				'TERRAIN_PLAINS_HILLS',				2),
	('CIVILIZATION_JAPAN',				'TERRAIN_COAST',					2),
	('CIVILIZATION_NORWAY',				'TERRAIN_COAST',					2),
	('CIVILIZATION_RUSSIA',				'TERRAIN_TUNDRA',					1),
	('CIVILIZATION_RUSSIA',				'TERRAIN_TUNDRA_HILLS',				1),
	('CIVILIZATION_RUSSIA',				'TERRAIN_TUNDRA_MOUNTAIN',			1),	
	('CIVILIZATION_SCYTHIA',			'TERRAIN_GRASS',					2),
	('CIVILIZATION_SCYTHIA',			'TERRAIN_PLAINS',					2),
	('CIVILIZATION_SUMERIA',			'TERRAIN_GRASS',					3),
	('CIVILIZATION_SUMERIA',			'TERRAIN_PLAINS',					3),
	('CIVILIZATION_INDONESIA',			'TERRAIN_COAST',					2),
--	('CIVILIZATION_NUBIA',				'TERRAIN_DESERT',					3),
	('CIVILIZATION_NUBIA',				'TERRAIN_DESERT_HILLS',				2),
	('CIVILIZATION_MAPUCHE',			'TERRAIN_GRASS_MOUNTAIN',			1),
	('CIVILIZATION_MAPUCHE',			'TERRAIN_PLAINS_MOUNTAIN',			1),
	('CIVILIZATION_NETHERLANDS',		'TERRAIN_COAST',					2),
	('CIVILIZATION_CANADA',				'TERRAIN_TUNDRA',					1),
	('CIVILIZATION_CANADA',				'TERRAIN_TUNDRA_HILLS',				1),
	('CIVILIZATION_CANADA',				'TERRAIN_TUNDRA_MOUNTAIN',			2),		
	('CIVILIZATION_INCA',				'TERRAIN_PLAINS_MOUNTAIN',			1),
	('CIVILIZATION_INCA',				'TERRAIN_GRASS_MOUNTAIN',			1),
	('CIVILIZATION_INCA',				'TERRAIN_GRASS_HILLS',				3),
	('CIVILIZATION_INCA',				'TERRAIN_PLAINS_HILLS',				3),
	('CIVILIZATION_INCA',				'TERRAIN_DESERT_HILLS',				5),
	('CIVILIZATION_INCA',				'TERRAIN_DESERT_MOUNTAIN',			5),
	('CIVILIZATION_MALI',				'TERRAIN_DESERT_HILLS',				1),
	('CIVILIZATION_MALI',				'TERRAIN_DESERT',					1),
	('CIVILIZATION_PHOENICIA',			'TERRAIN_COAST',					2),
	('CIVILIZATION_ETHIOPIA',			'TERRAIN_DESERT_HILLS',				1),
	('CIVILIZATION_ETHIOPIA',			'TERRAIN_GRASS_HILLS',				1),
	('CIVILIZATION_ETHIOPIA',			'TERRAIN_PLAINS_HILLS',				1),
	('CIVILIZATION_PORTUGAL',			'TERRAIN_COAST',					2);

insert or ignore into HD_StartBiasFeatures
    (CivilizationType,					FeatureType,                       	Tier)
values
	('CIVILIZATION_AMERICA',			'FEATURE_FOREST',					2),
	('CIVILIZATION_POLAND',				'FEATURE_FOREST',					2),
	('CIVILIZATION_BRAZIL',				'FEATURE_JUNGLE',					1),
	('CIVILIZATION_EGYPT',				'FEATURE_FLOODPLAINS',				2),
	('CIVILIZATION_EGYPT',				'FEATURE_FLOODPLAINS_GRASSLAND',	3),
	('CIVILIZATION_EGYPT',				'FEATURE_FLOODPLAINS_PLAINS',		1),

	('CIVILIZATION_NUBIA',				'FEATURE_FLOODPLAINS',				1),
	--海文明补齐
	('CIVILIZATION_ENGLAND',			'FEATURE_REEF',						2),	
	('CIVILIZATION_JAPAN',				'FEATURE_REEF',						2),	
	('CIVILIZATION_NORWAY',				'FEATURE_REEF',						2),	
	('CIVILIZATION_INDONESIA',			'FEATURE_REEF',						2),	
	('CIVILIZATION_SPAIN',				'FEATURE_REEF',						2),	
	('CIVILIZATION_AUSTRALIA',			'FEATURE_REEF',						2),	
	('CIVILIZATION_NETHERLANDS',		'FEATURE_REEF',						2),	
	('CIVILIZATION_PORTUGAL',			'FEATURE_REEF',						2),	

	('CIVILIZATION_JAPAN',				'FEATURE_VOLCANO',					2),
	('CIVILIZATION_INCA',				'FEATURE_VOLCANO',					2),
	--('CIVILIZATION_RUSSIA',				'FEATURE_FOREST',					3),
	--('CIVILIZATION_CANADA',				'FEATURE_FOREST',					3),
	('CIVILIZATION_KONGO',				'FEATURE_FOREST',					3),
	('CIVILIZATION_KONGO',				'FEATURE_JUNGLE',					1),
--	('CIVILIZATION_NORWAY',				'FEATURE_FOREST',					3),
	('CIVILIZATION_PHOENICIA',			'FEATURE_REEF',						2),	
	('CIVILIZATION_SPAIN',				'FEATURE_GEOTHERMAL_FISSURE',		1),
	('CIVILIZATION_HUNGARY',			'FEATURE_GEOTHERMAL_FISSURE',		1),
	('CIVILIZATION_MALI',				'FEATURE_FLOODPLAINS',				2),
	('CIVILIZATION_VIETNAM',			'FEATURE_JUNGLE',					1),
	('CIVILIZATION_VIETNAM',			'FEATURE_FOREST',					1),
	('CIVILIZATION_VIETNAM',			'FEATURE_MARSH',					1);
--	('CIVILIZATION_VIETNAM',			'FEATURE_HD_SWAMP',					1);
insert or ignore into HD_StartBiasFeatures
    (CivilizationType,					FeatureType,                       	Tier)
select
	'CIVILIZATION_VIETNAM',				'FEATURE_HD_SWAMP',					1
where exists (select FeatureType from Features where FeatureType = 'FEATURE_HD_SWAMP');
--挪威海藻森林
insert or ignore into HD_StartBiasFeatures
    (CivilizationType,					FeatureType,                       	Tier)
select
	'CIVILIZATION_NORWAY',				'FEATURE_SUK_KELP',					4
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');

insert or ignore into HD_StartBiasResources
    (CivilizationType,					ResourceType,                      	Tier)
values
	('CIVILIZATION_RUSSIA',				'RESOURCE_BARLEY',					1),
	('CIVILIZATION_CANADA',				'RESOURCE_BARLEY',					1),
	('CIVILIZATION_ARABIA',				'RESOURCE_SUK_CAMEL',				5),
	('CIVILIZATION_BRAZIL',				'RESOURCE_SANDALWOOD',				2),
	('CIVILIZATION_BRAZIL',				'RESOURCE_RUBBER',					2),
	('CIVILIZATION_BRAZIL',				'RESOURCE_EBONY',					2),
	('CIVILIZATION_CHINA',				'RESOURCE_STONE',					3),
	('CIVILIZATION_CREE',				'RESOURCE_FISH',					3),	
	('CIVILIZATION_CREE',				'RESOURCE_MAIZE',					4),	
--	('CIVILIZATION_CHINA',				'RESOURCE_BAMBOO',					3),
	('CIVILIZATION_ENGLAND',			'RESOURCE_IRON',					2),
--	('CIVILIZATION_ENGLAND',			'RESOURCE_COAL',					5),--提纯出生点删去

--努比亚
	('CIVILIZATION_NUBIA',				'RESOURCE_SUK_CAMEL',				4),
	('CIVILIZATION_NUBIA',				'RESOURCE_IVORY',					4),
	('CIVILIZATION_NUBIA',				'RESOURCE_DIAMONDS',				2),
	('CIVILIZATION_NUBIA',				'RESOURCE_SALT',					2),
	('CIVILIZATION_NUBIA',				'RESOURCE_SILVER',					2),
	('CIVILIZATION_NUBIA',				'RESOURCE_GOLD',					2),
	('CIVILIZATION_NUBIA',				'RESOURCE_IRON',					3),
	('CIVILIZATION_NUBIA',				'RESOURCE_DATES',					3),


	('CIVILIZATION_NORWAY',				'RESOURCE_WHALES',					3),
	('CIVILIZATION_NORWAY',				'RESOURCE_SALMON',					3),
	('CIVILIZATION_NORWAY',				'RESOURCE_COD',						3),
	('CIVILIZATION_NORWAY',				'RESOURCE_SUK_SHARK',				3),
	('CIVILIZATION_NORWAY',				'RESOURCE_SUK_CORAL',				3),
	('CIVILIZATION_NORWAY',				'RRESOURCE_SUK_SEALS',				3),
	('CIVILIZATION_NORWAY',				'RESOURCE_SUK_SQUID',				3),
	('CIVILIZATION_NORWAY',				'RESOURCE_CRABS',					3),
	('CIVILIZATION_SCYTHIA',			'RESOURCE_HORSES',					1),
	('CIVILIZATION_AZTEC',				'RESOURCE_SUK_OBSIDIAN',			2),
	('CIVILIZATION_MACEDON',			'RESOURCE_IRON',					3),
	('CIVILIZATION_MACEDON',			'RESOURCE_COPPER',					3),
	('CIVILIZATION_MACEDON',			'RESOURCE_LEAD',					3),
	('CIVILIZATION_PERSIA',				'RESOURCE_IRON',					2),
	('CIVILIZATION_MAPUCHE',			'RESOURCE_LEU_P0K_POTATOES',		4),
	('CIVILIZATION_MAPUCHE',			'RESOURCE_SHEEP',					4),
	('CIVILIZATION_MAPUCHE',			'RESOURCE_SUK_CHEESE',				4),
	('CIVILIZATION_MAPUCHE',			'RESOURCE_LEU_P0K_LLAMAS',			4),
	('CIVILIZATION_MAPUCHE',			'RESOURCE_HORSES',					3),	
	('CIVILIZATION_MAPUCHE',			'RESOURCE_CASHMERE',				4),
	('CIVILIZATION_PHOENICIA',			'RESOURCE_PEARLS',					4),	
	('CIVILIZATION_PHOENICIA',			'RESOURCE_SEASHELLS',				4),	
	('CIVILIZATION_PHOENICIA',			'RESOURCE_SUK_CORAL',				4),	
	('CIVILIZATION_ZULU',				'RESOURCE_HORSES',					3),
	('CIVILIZATION_ZULU',				'RESOURCE_IRON',					3),
	('CIVILIZATION_INCA',				'RESOURCE_LEU_P0K_LLAMAS',			4),
	('CIVILIZATION_INCA',				'RESOURCE_MAIZE',					4),
	('CIVILIZATION_OTTOMAN',			'RESOURCE_IRON',					5),
	('CIVILIZATION_BYZANTIUM',			'RESOURCE_HORSES',					2);

insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_FRANCE', a.ResourceType, 1
	from Resources a inner join Improvement_ValidResources b on a.ResourceType = b.ResourceType
	where a.ResourceClassType = 'RESOURCECLASS_LUXURY' and b.ImprovementType = 'IMPROVEMENT_PLANTATION';

insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_SCYTHIA', ResourceType, 2
	from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_PASTURE' and ResourceType != 'RESOURCE_HORSES';

--insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
--	select 'CIVILIZATION_NUBIA', ResourceType, 2
--	from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in ('RESOURCE_COAL','RESOURCE_URANIUM','RESOURCE_NITER','RESOURCE_ALUMINUM');

insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_AUSTRALIA', ResourceType, 1
	from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_PASTURE';

insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_CREE', ResourceType, 2
	from Improvement_ValidResources where ImprovementType in ('IMPROVEMENT_CAMP','IMPROVEMENT_PASTURE');


insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_GEORGIA', ResourceType, 3
	from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_QUARRY';

insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_MONGOLIA', ResourceType, 2
	from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_PASTURE';

insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_MALI', a.ResourceType, 3
	from Resources a inner join Improvement_ValidResources b on a.ResourceType = b.ResourceType
	where a.ResourceClassType = 'RESOURCECLASS_LUXURY' and b.ImprovementType = 'IMPROVEMENT_MINE';

insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_GRAN_COLOMBIA', ResourceType, 2
	from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_PLANTATION';
--玛雅
delete from StartBiasTerrains where CivilizationType = 'CIVILIZATION_MAYA' and TerrainType not in ('TERRAIN_GRASS', 'TERRAIN_GRASS_HILLS', 'TERRAIN_PLAINS', 'TERRAIN_PLAINS_HILLS');
update StartBiasTerrains set Tier = 3 where CivilizationType = 'CIVILIZATION_MAYA';
delete from StartBiasResources where CivilizationType = 'CIVILIZATION_MAYA';
insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_MAYA', ResourceType, 2
	from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_FARM' and ResourceType != 'RESOURCE_BARLEY';
--高卢矿和采石
insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_GAUL', ResourceType, 2
	from Improvement_ValidResources where ImprovementType  = 'IMPROVEMENT_MINE' and ResourceType not in ('RESOURCE_COAL','RESOURCE_URANIUM','RESOURCE_NITER','RESOURCE_ALUMINUM');

insert or replace into HD_StartBiasResources (CivilizationType, ResourceType, Tier)
	select 'CIVILIZATION_GAUL', ResourceType, 4
	from Improvement_ValidResources where ImprovementType  = 'IMPROVEMENT_QUARRY'; 

insert or ignore into HD_StartBiasRivers
    (CivilizationType,					Tier)
values
--	('CIVILIZATION_CHINA',				3),
	('CIVILIZATION_FRANCE',				3),
	('CIVILIZATION_GERMANY',			1),
	('CIVILIZATION_INDIA',				3),
	('CIVILIZATION_SUMERIA',			3),
	('CIVILIZATION_KHMER',				1),
	('CIVILIZATION_NETHERLANDS',		5),
	('CIVILIZATION_HUNGARY',			1),
	('CIVILIZATION_BABYLON_STK',		3);

delete from HD_StartBiasTerrains where CivilizationType not in (select CivilizationType from Civilizations);
delete from HD_StartBiasFeatures where CivilizationType not in (select CivilizationType from Civilizations);
delete from HD_StartBiasFeatures where FeatureType not in (select FeatureType from Features);
delete from HD_StartBiasResources where CivilizationType not in (select CivilizationType from Civilizations);
delete from HD_StartBiasResources where ResourceType not in (select ResourceType from Resources);
delete from HD_StartBiasRivers where CivilizationType not in (select CivilizationType from Civilizations);

insert or replace into StartBiasTerrains (CivilizationType, TerrainType, Tier)
	select CivilizationType, TerrainType, Tier from HD_StartBiasTerrains;
insert or replace into StartBiasFeatures (CivilizationType, FeatureType, Tier)
	select CivilizationType, FeatureType, Tier from HD_StartBiasFeatures;
insert or replace into StartBiasResources (CivilizationType, ResourceType, Tier)
	select CivilizationType, ResourceType, Tier from HD_StartBiasResources;
insert or replace into StartBiasRivers (CivilizationType, Tier)
	select CivilizationType, Tier from HD_StartBiasRivers;