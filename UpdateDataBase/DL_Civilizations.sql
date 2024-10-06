-------------------------------------
--     Civilization Adjustment     --
-------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- 秦始皇
-- update TraitModifiers set TraitType = 'TRAIT_CIVILIZATION_DYNASTIC_CYCLE' where ModifierId = 'TRAIT_CANAL_UNLOCK_MASONRY';
delete from TraitModifiers where TraitType = 'FIRST_EMPEROR_TRAIT' and ModifierId = 'TRAIT_CANAL_UNLOCK_MASONRY';

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'TRAIT_CANAL_UNLOCK_MASONRY');
--	('FIRST_EMPEROR_TRAIT',					'TRAIT_ADJUST_BUILDER_MOVEMENT_HD');

insert or replace into Modifiers
	(ModifierId,							ModifierType,								SubjectRequirementSetId)
values
	('TRAIT_ADJUST_BUILDER_MOVEMENT_HD',	'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',	'UNIT_IS_BUILDER');

insert or replace into ModifierArguments
	(ModifierId,							Name,		Value)
values
	('TRAIT_ADJUST_BUILDER_MOVEMENT_HD',    'Amount',	1);

-- Eleanor 
update ModifierArguments set Value = 2 where ModifierId = 'IDENTITY_NEARBY_GREATWORKS' and Name = 'Amount';
--additonal theater project
insert or replace into Types
	(Type,								Kind)
values
	('PROJECT_CIRCUSES_AND_BREAD',		'KIND_PROJECT');

insert or replace into Projects 
	(ProjectType,					Name,										ShortName,										Description,	
	Cost,	CostProgressionModel,				CostProgressionParam1,	PrereqDistrict,	UnlocksFromEffect)
values 
	('PROJECT_CIRCUSES_AND_BREAD',	'LOC_PROJECT_CIRCUSES_AND_BREAD_HD_NAME',	'LOC_PROJECT_CIRCUSES_AND_BREAD_HD_SHORT_NAME',	'LOC_PROJECT_CIRCUSES_AND_BREAD_HD_DESCRIPTION',
	50,		'COST_PROGRESSION_GAME_PROGRESS',	800,					'DISTRICT_THEATER',	1);
/*
insert or replace into Projects_XP1
	(ProjectType,					IdentityPerCitizenChange,	UnlocksFromEffect)
values
	('PROJECT_CIRCUSES_AND_BREAD',	2,							1);

insert or replace into ProjectCompletionModifiers 
	(ProjectType,					ModifierId)
values
	('PROJECT_CIRCUSES_AND_BREAD',	'PROJECT_COMPLETION_LOYALTY');
*/
insert or replace into TraitModifiers (TraitType,	ModifierId)
values
	('TRAIT_LEADER_ELEANOR_LOYALTY',	'ELEANOR_ALLOW_PROJECT'),
	('TRAIT_LEADER_ELEANOR_LOYALTY',	'DOUBLE_ARCHAEOLOGY_SLOTS'),
	('TRAIT_LEADER_ELEANOR_LOYALTY',	'DOUBLE_ART_SLOTS'),
	('TRAIT_LEADER_ELEANOR_LOYALTY',	'AUTO_THEME_AT_LEAST_6_SLOTS');
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'DOUBLE_ARCHAEOLOGY_SLOTS1'),
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'DOUBLE_ART_SLOTS1'),
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'TRAIT_SUPPORT_TWO_ARCHAEOLOGISTS'),
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'TRAIT_AUTO_THEME_ARCHAEOLOGY_MUSEUM'),
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'TRAIT_AUTO_THEME_ART_MUSEUM');

insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	('ELEANOR_ALLOW_PROJECT',		'MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE'),
	('DOUBLE_ARCHAEOLOGY_SLOTS',	'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS'),
	('DOUBLE_ART_SLOTS',			'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS'),
	--('DOUBLE_ARCHAEOLOGY_SLOTS1',	'MODIFIER_PLAYER_CAPTURED_CITY_ADJUST_EXTRA_GREAT_WORK_SLOTS'),
	--('DOUBLE_ART_SLOTS1',			'MODIFIER_PLAYER_CAPTURED_CITY_ADJUST_EXTRA_GREAT_WORK_SLOTS'),
	('AUTO_THEME_AT_LEAST_6_SLOTS',	'MODIFIER_PLAYER_ADJUST_AUTO_THEME_BUILDINGS_WITH_X_SLOTS');
	--('TRAIT_AUTO_THEME_ARCHAEOLOGY_MUSEUM',	'MODIFIER_PLAYER_ADJUST_AUTO_THEMED_BUILDING'),
	--('TRAIT_AUTO_THEME_ART_MUSEUM',	'MODIFIER_PLAYER_ADJUST_AUTO_THEMED_BUILDING');

insert or replace into ModifierArguments
	(ModifierId,								Name,				 	Value)
values
	('ELEANOR_ALLOW_PROJECT',     				'ProjectType',			'PROJECT_CIRCUSES_AND_BREAD'),
	--('TRAIT_DOUBLE_ARCHAEOLOGY_SLOTS_MODIFIER',	'ModifierId',			'DOUBLE_ARCHAEOLOGY_SLOTS'),
	--('TRAIT_DOUBLE_ART_SLOTS_MODIFIER',			'ModifierId',			'DOUBLE_ART_SLOTS'),
	('DOUBLE_ARCHAEOLOGY_SLOTS',				'BuildingType',			'BUILDING_MUSEUM_ARTIFACT'),
	('DOUBLE_ARCHAEOLOGY_SLOTS',				'GreatWorkSlotType',	'GREATWORKSLOT_ARTIFACT'),
	('DOUBLE_ARCHAEOLOGY_SLOTS',				'Amount',				3),
	('DOUBLE_ART_SLOTS',						'BuildingType',			'BUILDING_MUSEUM_ART'),
	('DOUBLE_ART_SLOTS',						'GreatWorkSlotType',	'GREATWORKSLOT_ART'),
	('DOUBLE_ART_SLOTS',						'Amount',				3),
	('AUTO_THEME_AT_LEAST_6_SLOTS',				'Amount',				6),
	('AUTO_THEME_AT_LEAST_6_SLOTS',				'IsWonder',				0);
	/*('DOUBLE_ARCHAEOLOGY_SLOTS1',				'BuildingType',			'BUILDING_MUSEUM_ARTIFACT'),
	('DOUBLE_ARCHAEOLOGY_SLOTS1',				'GreatWorkSlotType',	'GREATWORKSLOT_ARTIFACT'),
	('DOUBLE_ARCHAEOLOGY_SLOTS1',				'Amount',				3),
	('DOUBLE_ART_SLOTS1',						'BuildingType',			'BUILDING_MUSEUM_ART'),
	('DOUBLE_ART_SLOTS1',						'GreatWorkSlotType',	'GREATWORKSLOT_ART'),
	('DOUBLE_ART_SLOTS1',						'Amount',				3),
	('TRAIT_AUTO_THEME_ARCHAEOLOGY_MUSEUM',		'BuildingType',			'BUILDING_MUSEUM_ARTIFACT'),
	('TRAIT_AUTO_THEME_ART_MUSEUM',				'BuildingType',			'BUILDING_MUSEUM_ART');*/

-- England by 先驱
/*
英国
Ua世界工厂：
建造工业区及其中建筑时+25%生产力。每座工业区及其中建筑+2生产力+2科技。已改良的煤和铁资源+1生产力，+2资源产量。 
*/
update Types set Kind = 'KIND_TRAIT' where Type = 'TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION';
update ModifierArguments set Value = 25 where ModifierId ='TRAIT_ADJUST_INDUSTRIAL_ZONE_BUILDINGS_PRODUCTION' and Name = 'Amount';

delete from TraitModifiers where 
	TraitType = 'TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION' and ModifierId like 'TRAIT_POWERED_BUILDINGS_MORE_%';
delete from TraitModifiers where 
	TraitType = 'TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION' and ModifierId like 'TRAIT_ADJUST_MILITARY_ENGINEER_%';
delete from TraitModifiers where 
	TraitType = 'TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION' and ModifierId like 'TRAIT_ADJUST_%_STOCKPILE_CAP';

insert or replace into TraitModifiers
	(TraitType,												ModifierId)
values
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',			'TRAIT_ADJUST_INDUSTRIAL_ZONE_DISTRICTS_PRODUCTION'),
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',			'TRAIT_IRON_PRODUCTION'),
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',			'TRAIT_COAL_PRODUCTION'),
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',			'HD_INDUSTRIAL_SCIENCE'),
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',			'HD_INDUSTRIAL_PRODUCTION');

insert or replace into Modifiers
	(ModifierId, 											ModifierType,												SubjectRequirementSetId)
values
	('TRAIT_ADJUST_INDUSTRIAL_ZONE_DISTRICTS_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',		NULL),
	('TRAIT_IRON_PRODUCTION',								'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'HAS_IMPROVED_IRON'),
	('TRAIT_COAL_PRODUCTION',								'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'HAS_IMPROVED_COAL'),
	('HD_INDUSTRIAL_SCIENCE', 								'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',			'DISTRICT_IS_DISTRICT_INDUSTRIAL_ZONE_REQUIREMENTS'),
	('HD_INDUSTRIAL_PRODUCTION',							'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',			'DISTRICT_IS_DISTRICT_INDUSTRIAL_ZONE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('TRAIT_ADJUST_INDUSTRIAL_ZONE_DISTRICTS_PRODUCTION',	'DistrictType',	'DISTRICT_INDUSTRIAL_ZONE'),
	('TRAIT_ADJUST_INDUSTRIAL_ZONE_DISTRICTS_PRODUCTION',	'Amount',		25),
	('TRAIT_IRON_PRODUCTION',								'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_IRON_PRODUCTION',								'Amount',		1),
	('TRAIT_COAL_PRODUCTION',								'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_COAL_PRODUCTION',								'Amount',		1),
	('HD_INDUSTRIAL_SCIENCE',								'YieldType',	'YIELD_SCIENCE'),
	('HD_INDUSTRIAL_SCIENCE',								'Amount',		2),
	('HD_INDUSTRIAL_PRODUCTION',							'YieldType',	'YIELD_PRODUCTION'),
	('HD_INDUSTRIAL_PRODUCTION',							'Amount',		2);

create temporary table EnglandBuildings (BuildingType text);
insert or ignore into EnglandBuildings (BuildingType) select BuildingType from Buildings where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE';
create temporary table EnglandYields (YieldType text);
insert or ignore into EnglandYields (YieldType) values ('YIELD_SCIENCE'), ('YIELD_PRODUCTION');
insert or replace into TraitModifiers
	(TraitType, 									ModifierId)
select
	'TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION', 	'HD_ENGLAND_' || BuildingType || '_' || YieldType
from EnglandBuildings left outer join EnglandYields;

insert or replace into Modifiers
	(ModifierId,										ModifierType)
select
	'HD_ENGLAND_' || BuildingType || '_' || YieldType,	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
from EnglandBuildings left outer join EnglandYields;

insert or replace into ModifierArguments
	(ModifierId, 										Name, 			Value)
select
	'HD_ENGLAND_' || BuildingType || '_' || YieldType,	'BuildingType', BuildingType
from EnglandBuildings left outer join EnglandYields;

insert or replace into ModifierArguments
	(ModifierId, 										Name, 			Value)
select
	'HD_ENGLAND_' || BuildingType || '_' || YieldType,	'YieldType', 	YieldType
from EnglandBuildings left outer join EnglandYields;

insert or replace into ModifierArguments
	(ModifierId, 										Name, 			Value)
select
	'HD_ENGLAND_' || BuildingType || '_' || YieldType,	'Amount', 		2
from EnglandBuildings left outer join EnglandYields;

/*
Ud皇家海军船坞：
港口通用效果略。本城训练的海军单位+1移动力，陆地单位上下船时不再花费行动力。额外+3海军统帅点数。
*/
delete from DistrictModifiers where ModifierId = 'ROYAL_NAVY_DOCKYARD_GOLD_FROM_FOREIGN_CONTINENT';
delete from DistrictModifiers where ModifierId = 'ROYAL_NAVY_DOCKYARD_IDENTITY_PER_TURN_MODIFIER';

insert or replace into DistrictModifiers
	(DistrictType,						ModifierId)
values
	('DISTRICT_ROYAL_NAVY_DOCKYARD',	'ROYAL_NAVY_DOCKYARD_IGNORE_EMBARK_DISEMBARK_COST');

insert or replace into Modifiers
	(ModifierId,													ModifierType)
values
	('ROYAL_NAVY_DOCKYARD_IGNORE_EMBARK_DISEMBARK_COST',			'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER'),
	('ROYAL_NAVY_DOCKYARD_IGNORE_EMBARK_DISEMBARK_COST_MODIFIER',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS'),
	('ENGLAND_IGNORE_EMBARK_DISEMBARK_COST',						'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_SHORES');

insert or replace into ModifierArguments
	(ModifierId,													Name,			Value)
values
	('ROYAL_NAVY_DOCKYARD_IGNORE_EMBARK_DISEMBARK_COST',			'ModifierId',	'ROYAL_NAVY_DOCKYARD_IGNORE_EMBARK_DISEMBARK_COST_MODIFIER'),
	('ROYAL_NAVY_DOCKYARD_IGNORE_EMBARK_DISEMBARK_COST_MODIFIER',	'AbilityType',	'ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST'),
	('ENGLAND_IGNORE_EMBARK_DISEMBARK_COST',						'Ignore',		1);

insert or replace into Types
	(Type,												Kind)
values
	('ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST',	'KIND_ABILITY');

insert or replace into UnitAbilities
	(UnitAbilityType,									Name,														Description,													Inactive,	ShowFloatTextWhenEarned,	Permanent)
values
	('ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST',	'LOC_ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST_NAME',	'LOC_ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST_DESCRIPTION',	1,			0,							1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,									ModifierId)
values
	('ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST',	'ENGLAND_IGNORE_EMBARK_DISEMBARK_COST');

insert or replace into TypeTags
	(Type,												Tag)
values
	('ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST',	'CLASS_ALL_COMBAT_UNITS'),
	('ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST',	'CLASS_LANDCIVILIAN'),
	('ABILITY_ENGLAND_IGNORE_EMBARK_DISEMBARK_COST',	'CLASS_SUPPORT');
/*
不列颠治世维多利亚 La不列颠治世（只更改中文文本）：
建成皇家海军船坞时，获得一个免费的海军近战单位。海军近战单位与陆地单位编队时共享移动力。每招募一名海军统帅获得一个使者。首都的皇家海军船坞及其中建筑提供额外+1贸易路线容量。解锁“军事学”科技后获得特色单位红衫军。 
*/
delete from TraitModifiers where ModifierId = 'TRAIT_FOREIGN_CONTINENT_MELEE_UNIT';
delete from TraitModifiers where ModifierId = 'TRAIT_FOREIGN_CONTINENT_TRADE_ROUTE';

insert or replace into TraitModifiers
	(TraitType,							ModifierId)
values
	('TRAIT_LEADER_PAX_BRITANNICA',		'TRAIT_LEADER_PAX_BRITANNICA_SHARED_MOVEMENT'),
	('TRAIT_LEADER_PAX_BRITANNICA',		'CAPITAL_DISTRICT_ROYAL_NAVY_DOCKYARD_TRADE_ROUTE'),
	('TRAIT_LEADER_PAX_BRITANNICA',		'CAPITAL_HARBOR_TIER_1_TRADE_ROUTE'),
	('TRAIT_LEADER_PAX_BRITANNICA',		'CAPITAL_HARBOR_TIER_2_TRADE_ROUTE'),
	('TRAIT_LEADER_PAX_BRITANNICA',		'CAPITAL_HARBOR_TIER_3_TRADE_ROUTE');

insert or replace into Modifiers
	(ModifierId,												ModifierType)
values
	('TRAIT_LEADER_PAX_BRITANNICA_SHARED_MOVEMENT',				'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
	('TRAIT_LEADER_PAX_BRITANNICA_SHARED_MOVEMENT_MODIFIER',	'MODIFIER_UNIT_ADJUST_ESCORT_MOBILITY'),
	('HD_VICTORIA_GRANT_ENVOY',									'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN'),
	('CAPITAL_DISTRICT_ROYAL_NAVY_DOCKYARD_TRADE_ROUTE',		'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
	('CAPITAL_HARBOR_TIER_1_TRADE_ROUTE',						'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
	('CAPITAL_HARBOR_TIER_2_TRADE_ROUTE',						'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
	('CAPITAL_HARBOR_TIER_3_TRADE_ROUTE',						'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER');

insert or replace into Modifiers
	(ModifierId,													ModifierType,									SubjectRequirementSetId)
values
	('CAPITAL_DISTRICT_ROYAL_NAVY_DOCKYARD_TRADE_ROUTE_MODIFIER',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	'PALACE_AND_ROYAL_NAVY_DOCKYARD_REQUIREMENTS'),
	('CAPITAL_HARBOR_TIER_1_TRADE_ROUTE_MODIFIER',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	'PALACE_AND_HARBOR_TIER_1_REQUIREMENTS'),
	('CAPITAL_HARBOR_TIER_2_TRADE_ROUTE_MODIFIER',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	'PALACE_AND_HARBOR_TIER_2_REQUIREMENTS'),
	('CAPITAL_HARBOR_TIER_3_TRADE_ROUTE_MODIFIER',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	'PALACE_AND_HARBOR_TIER_3_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
values
	('TRAIT_LEADER_PAX_BRITANNICA_SHARED_MOVEMENT',					'AbilityType',		'ABILITY_SHARED_MOVEMENT'),
	('TRAIT_LEADER_PAX_BRITANNICA_SHARED_MOVEMENT_MODIFIER',		'EscortMobility',	1),
	('HD_VICTORIA_GRANT_ENVOY',										'Amount',			1),
	('CAPITAL_DISTRICT_ROYAL_NAVY_DOCKYARD_TRADE_ROUTE',			'ModifierId',		'CAPITAL_DISTRICT_ROYAL_NAVY_DOCKYARD_TRADE_ROUTE_MODIFIER'),
	('CAPITAL_DISTRICT_ROYAL_NAVY_DOCKYARD_TRADE_ROUTE_MODIFIER',	'Amount',			1),
	('CAPITAL_HARBOR_TIER_1_TRADE_ROUTE',							'ModifierId',		'CAPITAL_HARBOR_TIER_1_TRADE_ROUTE_MODIFIER'),
	('CAPITAL_HARBOR_TIER_1_TRADE_ROUTE_MODIFIER',					'Amount',			1),
	('CAPITAL_HARBOR_TIER_2_TRADE_ROUTE',							'ModifierId',		'CAPITAL_HARBOR_TIER_2_TRADE_ROUTE_MODIFIER'),
	('CAPITAL_HARBOR_TIER_2_TRADE_ROUTE_MODIFIER',					'Amount',			1),
	('CAPITAL_HARBOR_TIER_3_TRADE_ROUTE',							'ModifierId',		'CAPITAL_HARBOR_TIER_3_TRADE_ROUTE_MODIFIER'),
	('CAPITAL_HARBOR_TIER_3_TRADE_ROUTE_MODIFIER',					'Amount',			1);

insert or replace into Types
	(Type,							Kind)
values
	('ABILITY_SHARED_MOVEMENT',		'KIND_ABILITY');

insert or replace into UnitAbilities
	(UnitAbilityType,			Name,	Description,								Inactive,	ShowFloatTextWhenEarned,	Permanent)
values
	('ABILITY_SHARED_MOVEMENT',	NULL,	'LOC_ABILITY_SHARED_MOVEMENT_DESCRIPTION',	1,			0,							1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,			ModifierId)
values
	('ABILITY_SHARED_MOVEMENT',	'TRAIT_LEADER_PAX_BRITANNICA_SHARED_MOVEMENT_MODIFIER');

insert or replace into TypeTags
	(Type,						Tag)
values
	('ABILITY_SHARED_MOVEMENT',	'CLASS_NAVAL_MELEE');

-- Arabia
update ModifierArguments set Value = 4 where ModifierId = 'TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION' and Name = 'Amount';

-- Maori
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_MAORI_MANA' and ModifierId = 'TRAIT_MAORI_PREVENT_HARVEST';
insert or replace into Building_YieldChanges 
	(BuildingType, 		YieldType,			YieldChange) 
values
	('BUILDING_MARAE', 	'YIELD_CULTURE',	2);
update ModifierArguments set Value = 2 where ModifierId = 'MARAE_FAITH_FEATURES' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'MARAE_CULTURE_FEATURES' and Name = 'Amount';

insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE'),
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE'),
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_RAINFOREST_ENVIRONMENTALISM'),
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_WOODS_ENVIRONMENTALISM');

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) values
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_JUNGLE_CIVIL_SERVICE_REQUIREMENTS'),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_FOREST_CIVIL_SERVICE_REQUIREMENTS'),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_ENVIRONMENTALISM', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_JUNGLE_ENVIRONMENTALISM_REQUIREMENTS'),
	('TRAIT_MAORI_PRODUCTION_WOODS_ENVIRONMENTALISM', 		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_FOREST_ENVIRONMENTALISM_REQUIREMENTS');

insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 	'YieldType', 	'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 	'Amount', 		1),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 			'YieldType', 	'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 			'Amount',		1),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_ENVIRONMENTALISM', 	'YieldType', 	'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_ENVIRONMENTALISM', 	'Amount', 		1),
	('TRAIT_MAORI_PRODUCTION_WOODS_ENVIRONMENTALISM', 		'YieldType', 	'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_WOODS_ENVIRONMENTALISM', 		'Amount',		1);

update ModifierArguments set Value = 1 where
	ModifierId = 'TRAIT_MAORI_PRODUCTION_RAINFOREST_CONSERVATION' and Name = 'Amount';
update ModifierArguments set Value = 1 where
	ModifierId = 'TRAIT_MAORI_PRODUCTION_WOODS_CONSERVATION' and Name = 'Amount';

-------------------------------------------------------------------------------------------------
-- Kongo

-- Kongo all land units receive ability to move on forest and jungles without movement penalty
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_NKISI', 'TRAIT_ALL_LAND_UNITS_IGNORE_WOODS');

insert or replace into Modifiers
	(ModifierId,			ModifierType)
values
	('TRAIT_ALL_LAND_UNITS_IGNORE_WOODS',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('TRAIT_ALL_LAND_UNITS_IGNORE_WOODS',	'AbilityType',	'ABILITY_KONGO_IGNORE_WOODS');
-- 拥有姆班赞的城市享受神权的人头鸽收益
insert or replace into Requirements
    (RequirementId,                             RequirementType)
values
    ('REQUIRES_CITY_HAS_DISTRICT_MBANZA_FIXED', 'REQUIREMENT_REQUIREMENTSET_IS_MET');
    insert or replace into RequirementArguments
    (RequirementId,                             Name,               Value)
values
    ('REQUIRES_CITY_HAS_DISTRICT_MBANZA_FIXED', 'RequirementSetId', 'CITY_HAS_DISTRICT_MBANZA_FIXED');
insert or replace into RequirementSets
    (RequirementSetId,                  RequirementSetType)
values
    ('CITY_HAS_HOLY_SITE_OR_MBANZA',    'REQUIREMENTSET_TEST_ANY'),
    ('CITY_HAS_DISTRICT_MBANZA_FIXED',  'REQUIREMENTSET_TEST_ALL');
insert or replace into RequirementSetRequirements
    (RequirementSetId,                  RequirementId)
values
    ('CITY_HAS_HOLY_SITE_OR_MBANZA',    'REQUIRES_CITY_HAS_DISTRICT_HOLY_SITE'),
    ('CITY_HAS_HOLY_SITE_OR_MBANZA',    'REQUIRES_CITY_HAS_DISTRICT_MBANZA_FIXED'),
    ('CITY_HAS_DISTRICT_MBANZA_FIXED',  'REQUIRES_CITY_HAS_DISTRICT_MBANZA'),
    ('CITY_HAS_DISTRICT_MBANZA_FIXED',  'PLAYER_IS_CIVILIZATION_KONGO');

-- GreatWorks Yield
delete from TraitModifiers where ModifierId like 'TRAIT_GREAT_WORK_%' and TraitType = 'TRAIT_CIVILIZATION_NKISI';

insert or replace into TraitModifiers
	(TraitType,				 			ModifierId) 
select
	'TRAIT_CIVILIZATION_NKISI' , 		'TRAIT_NKISI_GREAT_WORK_FOOD_' || GreatWorkObjectType
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into TraitModifiers
	(TraitType,				 			ModifierId) 
select
	'TRAIT_CIVILIZATION_NKISI' , 		'TRAIT_NKISI_GREAT_WORK_PRODUCTION_' || GreatWorkObjectType
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into TraitModifiers
	(TraitType,				 			ModifierId) 
select
	'TRAIT_CIVILIZATION_NKISI' , 		'TRAIT_NKISI_GREAT_WORK_GOLD_' || GreatWorkObjectType
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into TraitModifiers
	(TraitType,				 			ModifierId) 
select
	'TRAIT_CIVILIZATION_NKISI' , 		'TRAIT_NKISI_GREAT_WORK_FAITH_' || GreatWorkObjectType
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into Modifiers
	(ModifierId,						ModifierType) 
select
	ModifierId,							'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD'
from TraitModifiers	where ModifierId like 'TRAIT_NKISI_GREAT_WORK_%';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_FOOD_' || GreatWorkObjectType,			'GreatWorkObjectType',	GreatWorkObjectType
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_PRODUCTION_' || GreatWorkObjectType,	'GreatWorkObjectType',	GreatWorkObjectType
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_GOLD_' || GreatWorkObjectType,			'GreatWorkObjectType',	GreatWorkObjectType
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_FAITH_' || GreatWorkObjectType,			'GreatWorkObjectType',	GreatWorkObjectType
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_FOOD_' || GreatWorkObjectType,			'YieldType',			'YIELD_FOOD'
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_PRODUCTION_' || GreatWorkObjectType,	'YieldType',			'YIELD_PRODUCTION'
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_GOLD_' || GreatWorkObjectType,			'YieldType',			'YIELD_GOLD'
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_FAITH_' || GreatWorkObjectType,			'YieldType',			'YIELD_FAITH'
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_FOOD_' || GreatWorkObjectType,			'YieldChange',			3
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT' and GreatWorkObjectType != 'GREATWORKOBJECT_WRITING';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_PRODUCTION_' || GreatWorkObjectType,	'YieldChange',			3
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT' and GreatWorkObjectType != 'GREATWORKOBJECT_WRITING';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_GOLD_' || GreatWorkObjectType,			'YieldChange',			6
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT' and GreatWorkObjectType != 'GREATWORKOBJECT_WRITING';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'TRAIT_NKISI_GREAT_WORK_FAITH_' || GreatWorkObjectType,			'YieldChange',			3
from GreatWorkObjectTypes where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT' and GreatWorkObjectType != 'GREATWORKOBJECT_WRITING';

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
values
	('TRAIT_NKISI_GREAT_WORK_FOOD_GREATWORKOBJECT_WRITING',			'YieldChange',			2),
	('TRAIT_NKISI_GREAT_WORK_PRODUCTION_GREATWORKOBJECT_WRITING',	'YieldChange',			2),
	('TRAIT_NKISI_GREAT_WORK_GOLD_GREATWORKOBJECT_WRITING',			'YieldChange',			3),
	('TRAIT_NKISI_GREAT_WORK_FAITH_GREATWORKOBJECT_WRITING',		'YieldChange',			2);

------------------------------------------------------------------------------------------------------------------
-- Mali
delete from TraitModifiers where ModifierId = 'TRAIT_LESS_UNIT_PRODUCTION';
insert or replace into TraitModifiers
	(TraitType,										ModifierId)
select
	'TRAIT_CIVILIZATION_MALI_GOLD_DESERT',			'TRAIT_CIVILIZATION_MALI_' || UnitType || '_PRODUCTION'
from Units where CanTrain = 1;
insert or replace into Modifiers
	(ModifierId,													ModifierType)
select
	'TRAIT_CIVILIZATION_MALI_' || UnitType || '_PRODUCTION',		'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION'
from Units where CanTrain = 1;
insert or replace into ModifierArguments
	(ModifierId,													Name,			Value)
select
	'TRAIT_CIVILIZATION_MALI_' || UnitType || '_PRODUCTION',		'UnitType',		UnitType
from Units where CanTrain = 1;
insert or replace into ModifierArguments
	(ModifierId,													Name,			Value)
select
	'TRAIT_CIVILIZATION_MALI_' || UnitType || '_PRODUCTION',		'Amount',		-30
from Units where CanTrain = 1;
insert or replace into TraitModifiers 
	(TraitType, 							ModifierId) 
values
	('TRAIT_CIVILIZATION_UNIT_MALI_MANDEKALU_CAVALRY',	'MALI_MANDEKALU_CAVALRY_DISCOUNT');
	-- ('TRAIT_LEADER_SAHEL_MERCHANTS', 		'DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN'),
	-- ('TRAIT_LEADER_SAHEL_MERCHANTS', 		'DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN'),
--	('TRAIT_LEADER_SAHEL_MERCHANTS', 		'INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN');
	-- ('TRAIT_CIVILIZATION_MALI_GOLD_DESERT',	'TRAIT_BONUS_MINE_GOLD'),
--	('TRAIT_CIVILIZATION_MALI_GOLD_DESERT',	'HD_LUXURY_MINE_GOLD');
	-- ('TRAIT_LEADER_SAHEL_MERCHANTS',		'MALI_ALLOW_PROJECT');

insert or replace into Modifiers 
	(ModifierId, 											ModifierType) 
values
	('MALI_MANDEKALU_CAVALRY_DISCOUNT',						'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN', 			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_DOMESTIC'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN', 		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_DOMESTIC'),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN', 	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_INTERNATIONAL');
	-- ('MALI_ALLOW_PROJECT',									'MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE');

insert or replace into Modifiers 
	(ModifierId, 				ModifierType,							SubjectRequirementSetId) 
values
	('HD_LUXURY_MINE_GOLD',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_LUXURY_MINE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('MALI_MANDEKALU_CAVALRY_DISCOUNT',						'UnitType',		'UNIT_MALI_MANDEKALU_CAVALRY'),
	('MALI_MANDEKALU_CAVALRY_DISCOUNT',						'Amount',		20),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',				'YieldType',	'YIELD_GOLD'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',				'TerrainType',	'TERRAIN_DESERT'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',				'Origin',		1),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',				'Amount',		1),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',		'YieldType',	'YIELD_GOLD'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',		'TerrainType',	'TERRAIN_DESERT_HILLS'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',		'Origin',		1),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',		'Amount',		1),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',	'YieldType',	'YIELD_GOLD'),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',	'TerrainType',	'TERRAIN_DESERT_HILLS'),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',	'Origin',		1),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',	'Amount',		1),
	('HD_LUXURY_MINE_GOLD',									'YieldType',	'YIELD_GOLD'),
	('HD_LUXURY_MINE_GOLD',									'Amount',		2);
	-- ('MALI_ALLOW_PROJECT',     								'ProjectType',	'PROJECT_ENDLESS_MONEY');
--每个奢侈矿为本城国际商路+1食物。
-- insert or replace into ImprovementModifiers
-- 	(ImprovementType,						ModifierID)
-- values
-- 	('IMPROVEMENT_MINE',					'MALI_DESERT_HILLS_INTERNATIONAL_TRADE_ROUTE_FOOD');

-- insert or replace into Modifiers
-- 	(ModifierId,											ModifierType,															OwnerRequirementSetId,					SubjectRequirementSetId)
-- values
-- 	('MALI_DESERT_HILLS_INTERNATIONAL_TRADE_ROUTE_FOOD',	'MODIFIER_CITY_OWNER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',		'PLOT_HAS_LUXURY_MINE_REQUIREMENTS',	'MALI_REQUIREMENTS');

-- insert or replace into ModifierArguments
-- 	(ModifierId,											Name,			Value)
-- values
-- 	('MALI_DESERT_HILLS_INTERNATIONAL_TRADE_ROUTE_FOOD',	'YieldType',	'YIELD_FOOD'),
-- 	('MALI_DESERT_HILLS_INTERNATIONAL_TRADE_ROUTE_FOOD',	'Amount',		1);

-- insert or replace into RequirementSets
-- 	(RequirementSetId,						RequirementSetType)
-- values
-- 	('MALI_REQUIREMENTS',					'REQUIREMENTSET_TEST_ALL'),
-- 	('MALI_DESERT_HILLS_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL');

-- insert or replace into RequirementSetRequirements
-- 	(RequirementSetId,						RequirementId)
-- values
-- 	('MALI_REQUIREMENTS',					'PLAYER_IS_CIVILIZATION_MALI'),
-- 	('MALI_DESERT_HILLS_REQUIREMENTS',		'REQUIRES_PLOT_HAS_DESERT_HILLS');

-- insert or replace into TraitModifiers (TraitType, ModifierId) 
-- select 'TRAIT_CIVILIZATION_MALI_GOLD_DESERT', 'BONUS_LUXURY_GOLD_PERCENTAGE' || ResourceType from Improvement_ValidResources 
-- where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in (select ResourceType from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC' or ResourceClassType = 'RESOURCECLASS_BONUS');

-- insert or replace into Modifiers (ModifierId,  		ModifierType,											SubjectRequirementSetId)
-- select 'BONUS_LUXURY_GOLD_PERCENTAGE' || ResourceType,	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'HD_CITY_HAS_IMPROVED_' || ResourceType || '_REQUIRMENTS' from Improvement_ValidResources 
-- where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in (select ResourceType from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC' or ResourceClassType = 'RESOURCECLASS_BONUS');

-- insert or replace into ModifierArguments	(ModifierId,	Name,			Value)
-- select 'BONUS_LUXURY_GOLD_PERCENTAGE' || ResourceType,		'YieldType',    'YIELD_GOLD' from Improvement_ValidResources 
-- where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in (select ResourceType from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC' or ResourceClassType = 'RESOURCECLASS_BONUS');

-- insert or replace into ModifierArguments	(ModifierId,	Name,			Value)
-- select 'BONUS_LUXURY_GOLD_PERCENTAGE' || ResourceType,		'Amount',       10	from Improvement_ValidResources 
-- where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in (select ResourceType from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC' or ResourceClassType = 'RESOURCECLASS_BONUS');

-- ud
-- update Districts set Entertainment = 1 where DistrictType = 'DISTRICT_SUGUBA';
insert or replace into DistrictModifiers(DistrictType,ModifierId)values
	('DISTRICT_SUGUBA','SUGUBA_ALLOW_PURCHASE_DISTRICT');
insert or replace into Modifiers(ModifierID,ModifierType)values
	('SUGUBA_ALLOW_PURCHASE_DISTRICT','MODIFIER_CITY_ADJUST_CAN_PURCHASE_DISTRICTS');
insert or replace into ModifierArguments(ModifierID, Name, Value)values
	('SUGUBA_ALLOW_PURCHASE_DISTRICT','CanPurchase',1);
update Modifiers set SubjectStackLimit = 1 where ModifierId in(
	'SUGUBA_CHEAPER_BUILDING_PURCHASE',
	'SUGUBA_CHEAPER_DISTRICT_PURCHASE',
	'SUGUBA_CHEAPER_UNIT_PURCHASE'
);
update ModifierArguments set Value = 15 where Name = 'Amount' and ModifierId in(
	'SUGUBA_CHEAPER_BUILDING_PURCHASE',
	'SUGUBA_CHEAPER_DISTRICT_PURCHASE',
	'SUGUBA_CHEAPER_UNIT_PURCHASE'
);
--additonal SUGUBA project
-- insert or replace into Types
-- 	(Type,								Kind)
-- values
-- 	('PROJECT_ENDLESS_MONEY',			'KIND_PROJECT');

-- insert or replace into Projects 
-- 	(ProjectType,				Name,										ShortName,								Description,	
-- 	Cost,	CostProgressionModel,				CostProgressionParam1,	PrereqDistrict,	UnlocksFromEffect)
-- values 
-- 	('PROJECT_ENDLESS_MONEY',	'LOC_PROJECT_ENDLESS_MONEY_HD_NAME',	'LOC_PROJECT_ENDLESS_MONEY_HD_SHORT_NAME',	'LOC_PROJECT_ENDLESS_MONEY_HD_DESCRIPTION',
-- 	40,		'COST_PROGRESSION_GAME_PROGRESS',	1100,					'DISTRICT_SUGUBA',	1);

-- insert or replace into Project_YieldConversions
-- 	(ProjectType,				YieldType,		PercentOfProductionRate)
-- values 
-- 	('PROJECT_ENDLESS_MONEY',	'YIELD_GOLD',	250);
------------------------------------------------------------------------------------------------------------------
-- Rome
delete from TraitModifiers where TraitType = 'TRAJANS_COLUMN_TRAIT' and ModifierId = 'TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING';
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAJANS_COLUMN_TRAIT', 'TRAIT_GRANT_BUILDING_MONUMENT_MODIFIER'),
	('TRAJANS_COLUMN_TRAIT', 'TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION');
insert or replace into Modifiers (ModifierId, ModifierType) values
	('TRAIT_GRANT_BUILDING_MONUMENT_MODIFIER', 			'GRANT_BUILDING_TO_ALL_CITIES_IGNORE'),
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('TRAIT_GRANT_BUILDING_MONUMENT_MODIFIER', 			'BuildingType', 'BUILDING_MONUMENT'),
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 	'DistrictType', 'DISTRICT_CITY_CENTER'),
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 	'Amount', 100);

-- update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_GOLD_FROM_DOMESTIC_TRADING_POSTS' and Name = 'Amount';

---------------------------------------------------------------------------------------------------------------------------
-- Ethiopia
-- update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_FAITH_INTO_SCIENCE_HILLS' and Name = 'Amount';
-- update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_FAITH_INTO_CULTURE_HILLS' and Name = 'Amount';

--------------------------------------------------------------------------------------------------------------------
--Egypt埃及
--泛滥上的资源1粮
--奇观区域沿河加速改为20%
--删除埃及标签下的弯刀战士
--delete from CivilizationTraits where CivilizationType = 'CIVILIZATION_EGYPT' and TraitType = 'TRAIT_CIVILIZATION_UNIT_EGYPTIAN_KHOPESH';

--UI为相邻泛滥田+1粮（删除）

--la商路翻倍

--泛滥上的资源1粮
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_ITERU',			'HD_CIVILIZATION_ITERU_RESOURCE_YIELD');

insert or replace into Modifiers
	(ModifierId,								ModifierType,										SubjectRequirementSetId)
values
	('HD_CIVILIZATION_ITERU_RESOURCE_YIELD',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_RESOURCE_AND_ON_ALL_FLOODPLAINS');

insert or replace into ModifierArguments
	(ModifierId,									Name,						Value)
values

	('HD_CIVILIZATION_ITERU_RESOURCE_YIELD',			'Amount',					1),
	('HD_CIVILIZATION_ITERU_RESOURCE_YIELD',			'YieldType',				'YIELD_FOOD');
--奇观区域沿河加速改为20%
update ModifierArguments set Value = '20' where ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_DISTRICT' and Name = 'Amount';
update ModifierArguments set Value = '20' where ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_WONDER' and Name = 'Amount';

--学院剧院相邻河边大加成
--建造完奇观以后送工人
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_ITERU',			'TRAIT_CAMPUS_RIVER_ADJACENCY'),
	('TRAIT_CIVILIZATION_ITERU',			'TRAIT_THEATER_DISTRICT_RIVER_ADJACENCY'),
	('TRAIT_CIVILIZATION_ITERU',			'TRAIT_WONDER_GRANT_BUILDER');

insert or replace into Modifiers 
	(ModifierId, 									ModifierType,													RunOnce,	Permanent,	SubjectRequirementSetId)
values
	('TRAIT_WONDER_GRANT_BUILDER',					'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',					0,0,'PLOT_HAS_COMPLETE_WONDER'),
	('TRAIT_WONDER_GRANT_BUILDER_MODIFIER',			'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',						1,1,null);

insert or replace into ModifierArguments 
	(ModifierId, 											Name,				 Value) 
values
	('TRAIT_WONDER_GRANT_BUILDER',							'ModifierId',		'TRAIT_WONDER_GRANT_BUILDER_MODIFIER'),
	('TRAIT_WONDER_GRANT_BUILDER_MODIFIER',					'UnitType',			'UNIT_BUILDER'),
	('TRAIT_WONDER_GRANT_BUILDER_MODIFIER',					'Amount',			1);



-- 埃及区域奇观加速适配大浴场
-- insert or replace into Requirements
-- 	(RequirementId,									RequirementType,					Inverse)
-- values
-- 	('REQUIRES_PLAYER_DOES_NOT_HAVE_GREAT_BATH',	'REQUIREMENT_PLAYER_HAS_BUILDING',	1);
-- insert or replace into RequirementArguments
-- 	(RequirementId,									Name,				Value)
-- values
-- 	('REQUIRES_PLAYER_DOES_NOT_HAVE_GREAT_BATH',	'BuildingType',		'BUILDING_GREAT_BATH');
-- insert or replace into RequirementSets
-- 	(RequirementSetId,									RequirementSetType)
-- values
-- 	('PLAYER_DOES_NOT_HAVE_GREAT_BATH_REQUIREMENTS',	'REQUIREMENTSET_TEST_ANY');
-- insert or replace into RequirementSetRequirements
-- 	(RequirementSetId,									RequirementId)
-- values
-- 	('PLAYER_DOES_NOT_HAVE_GREAT_BATH_REQUIREMENTS',	'REQUIRES_PLAYER_DOES_NOT_HAVE_GREAT_BATH');
-- update Modifiers set SubjectRequirementSetId = 'PLAYER_DOES_NOT_HAVE_GREAT_BATH_REQUIREMENTS'
-- 	where ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_WONDER' or ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_DISTRICT';
-- insert or replace into TraitModifiers
-- 	(TraitType,								ModifierId)
-- values
-- 	('TRAIT_CIVILIZATION_ITERU',			'TRAIT_FASTER_BUILDTIME_WONDER'),
-- 	('TRAIT_CIVILIZATION_ITERU',			'TRAIT_FASTER_BUILDTIME_DISTRICT');
-- insert or replace into Modifiers 
-- 	(ModifierId, 						ModifierType,												SubjectRequirementSetId)
-- values
-- 	('TRAIT_FASTER_BUILDTIME_WONDER',	'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_PRODUCTION',			'PLAYER_HAS_BUILDING_GREAT_BATH_REQUIREMENTS'),
-- 	('TRAIT_FASTER_BUILDTIME_DISTRICT',	'MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PRODUCTION',	'PLAYER_HAS_BUILDING_GREAT_BATH_REQUIREMENTS');
-- insert or replace into ModifierArguments
-- 	(ModifierId, 						Name,		Value)
-- values
-- 	('TRAIT_FASTER_BUILDTIME_WONDER',	'Amount',	15),
-- 	('TRAIT_FASTER_BUILDTIME_DISTRICT',	'Amount',	15);


---------------------------------------------------------------------------------------------------------------------------
-- Gaul can now build all districts near City Center
delete from TraitModifiers where ModifierId ='TRAIT_CIVILIZATION_GAUL_CITY_NO_ADJACENT_DISTRICT';

-----------------------------------------------------------------------------------------------------------------------------
-- Hungary
update ModifierArguments set value = 50 where ModifierId ='LEVY_UNITUPGRADEDISCOUNT' and Name = 'Amount';

-------------------------------------------------------------------------------------------------------------------------------
--Mapuche
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierId)
values
	('IMPROVEMENT_PASTURE',		'PASTURE_HOUSING_WITH_MAPUCHE_TRAIT');

insert or replace into Modifiers
	(ModifierId,								ModifierType,											SubjectRequirementSetId)
values
	('PASTURE_HOUSING_WITH_MAPUCHE_TRAIT',		'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING',		'PLAYER_IS_MAPUCHE');

insert or replace into ModifierArguments
	(ModifierId,								Name,		Value)
values
	('PASTURE_HOUSING_WITH_MAPUCHE_TRAIT',		'Amount',	1);

insert or replace into RequirementSetRequirements 
	(RequirementSetId,			RequirementId)	
values
	('PLAYER_IS_MAPUCHE',		'PLAYER_IS_CIVILIZATION_MAPUCHE');

insert or replace into RequirementSets (RequirementSetId,	RequirementSetType)	
values
	('PLAYER_IS_MAPUCHE',		'REQUIREMENTSET_TEST_ALL');

insert or replace into Improvement_ValidFeatures (ImprovementType, FeatureType) values
	('IMPROVEMENT_CHEMAMULL', 'FEATURE_FOREST');
--------------------------------------------------------------------------------------------------------------------------
-- Georgia
-- Resume ability (April Update)
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_LEADER_RELIGION_CITY_STATES',	'TRAIT_PROTECTORATE_WAR_FAITH');
-- delete from TraitModifiers where TraitType = 'TRAIT_LEADER_RELIGION_CITY_STATES' and ModifierId = 'TRAIT_LEADER_FAITH_KILLS';
update ModifierArguments set Value = 100 where ModifierId = 'TRAIT_LEADER_FAITH_KILLS' and Name = 'PercentDefeatedStrength';

--UB ajustment for BUILDING_TSIKHE
--adjust Ub base tourism to 5
insert or replace into CivicModifiers (CivicType, ModifierId) values
	('CIVIC_CONSERVATION', 'CONSERVATION_TSIKHE_TOURISM');

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) values
	('CONSERVATION_TSIKHE_TOURISM', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_CHANGE',	'DISTRICT_IS_CITY_CENTER_TSIKHE');

insert or replace into ModifierArguments 	(ModifierId, Name, Value) values
	('CONSERVATION_TSIKHE_TOURISM', 'Amount', 2);

insert or replace into RequirementSetRequirements(RequirementSetId, RequirementId) values
	('DISTRICT_IS_CITY_CENTER_TSIKHE', 'REQUIRES_DISTRICT_IS_CITY_CENTER'),
	('DISTRICT_IS_CITY_CENTER_TSIKHE', 'REQUIRES_CITY_HAS_TSIKHE');

insert or replace into RequirementSets (RequirementSetId, RequirementSetType) values
	('DISTRICT_IS_CITY_CENTER_TSIKHE', 'REQUIREMENTSET_TEST_ALL');

update BuildingReplaces set ReplacesBuildingType = 'BUILDING_CASTLE' where CivUniqueBuildingType = 'BUILDING_TSIKHE';
update BuildingPrereqs set PrereqBuilding = 'BUILDING_WALLS' where Building = 'BUILDING_TSIKHE';

---GOLDEN AGE TOURISM AND FAITH +300%
update ModifierArguments set Value = 12 where ModifierId = 'TSIKHE_FAITH_GOLDEN_AGE' and Name = 'Amount';
update ModifierArguments set Value = 15 where ModifierId = 'CONSERVATION_TSIKHE_TOURISM_GOLDEN_AGE' and Name = 'Amount';

-- LA : each level of walls +1 culture and +1 faith
insert or replace into TraitModifiers	(TraitType,	ModifierId)
select 'TRAIT_LEADER_RELIGION_CITY_STATES',	BuildingType || '_TAMAR_CULTURE' from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into TraitModifiers	(TraitType,	ModifierId)
select 'TRAIT_LEADER_RELIGION_CITY_STATES',	BuildingType || '_TAMAR_FAITH' from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select BuildingType || '_TAMAR_CULTURE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_' || BuildingType || '_REQUIREMENTS' from Buildings
where  BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select BuildingType || '_TAMAR_FAITH',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_' || BuildingType || '_REQUIREMENTS' from Buildings
where  BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
-- insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
-- select BuildingType || '_TAMAR_CULTURE',	'BuildingType',	BuildingType	from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select BuildingType || '_TAMAR_CULTURE',	'YieldType',	'YIELD_CULTURE'	from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select BuildingType || '_TAMAR_CULTURE',	'Amount',    	1				from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
-- insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
-- select BuildingType || '_TAMAR_FAITH',		'BuildingType',	BuildingType	from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select BuildingType || '_TAMAR_FAITH',		'YieldType',	'YIELD_FAITH'	from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select BuildingType || '_TAMAR_FAITH',		'Amount',    	1				from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;

insert or replace into RequirementSets	(RequirementSetId,	RequirementSetType)
select 'CITY_HAS_' || BuildingType || '_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL' from Buildings
where  BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;

insert or replace into RequirementSetRequirements	(RequirementSetId,	RequirementId)
select 'CITY_HAS_' || BuildingType || '_REQUIREMENTS', 'REQUIRES_CITY_HAS_' || BuildingType from Buildings
where  BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;

-- UA 
update ModifierArguments set Value = 100 where Name = 'Amount' and (ModifierId = 'TRAIT_WALLS_PRODUCTION' or ModifierId = 'TRAIT_CASTLE_PRODUCTION' or ModifierId = 'TRAIT_TSIKHE_PRODUCTION' or ModifierId = 'TRAIT_STAR_FORT_PRODUCTION');

insert or replace into TraitModifiers
	(TraitType,									ModifierId)
select
	'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS',	'TRAIT_GOLDEN_AGE_WILDCARD_SLOT'
where exists (select TraitType from Traits where TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS');

insert or replace into TraitModifiers
	(TraitType,									ModifierId)
select
	'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS',	'TRAIT_GOLDEN_AGE_UNLOCK_DARK_POLICIES'
where exists (select TraitType from Traits where TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS');

insert or ignore into Modifiers
    (ModifierId,                            	ModifierType,												Permanent,	SubjectRequirementSetId,	SubjectStackLimit)
values
    ('TRAIT_GOLDEN_AGE_WILDCARD_SLOT',			'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	1,			'PLAYER_HAS_GOLDEN_AGE',	1),
	('TRAIT_GOLDEN_AGE_UNLOCK_DARK_POLICIES',	'MODIFIER_PLAYER_ADJUST_PROPERTY',							0,			'PLAYER_HAS_GOLDEN_AGE',	NULL);

insert or ignore into ModifierArguments
    (ModifierId,                            	Name,          			 Value)
values
    ('TRAIT_GOLDEN_AGE_WILDCARD_SLOT',			'GovernmentSlotType',	'SLOT_WILDCARD'),
	('TRAIT_GOLDEN_AGE_UNLOCK_DARK_POLICIES',	'Key',					'CanSlotDarkPolicies'),
	('TRAIT_GOLDEN_AGE_UNLOCK_DARK_POLICIES',	'Amount',				1);
----------------------------------------------------------------------------------------------------------------------------

update ModifierArguments set Value = 3 where ModifierId = 'TRAIT_PRODUCTION_MOUNTAIN' and Name = 'Amount';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_GREAT_MOUNTAINS' and (ModifierId = 'TRAIT_PRODUCTION_MOUNTAIN_LATE' or ModifierId like 'TRAIT_TERRACE_%_MOUNTAIN');
/*
insert or replace into DistrictModifiers
	(DistrictType,			ModifierId)
values
	('DISTRICT_AQUEDUCT',	'TERRACE_FARM_PRODUCTION');
insert or replace into BuildingModifiers
	(BuildingType,			ModifierId)
select
	BuildingType,			'TERRACE_FARM_PRODUCTION'
from Buildings where BuildingType in ('BUILDING_JNR_BATHHOUSE', 'BUILDING_JNR_ORCHARD', 'BUILDING_JNR_HAMMER_WORKS');
*/
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_GREAT_MOUNTAINS',	'TERRACE_FARM_AQUEDUCT_ATTACH');
insert or replace into Modifiers
	(ModifierId,								ModifierType,									SubjectRequirementSetId)
values
	('TERRACE_FARM_AQUEDUCT_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',		'CITY_HAS_DISTRICT_AQUEDUCT_REQUIREMENTS'),
	('TERRACE_FARM_PRODUCTION',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PLOT_HAS_IMPROVEMENT_TERRACE_FARM_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,						Name,			Value)
values
	('TERRACE_FARM_AQUEDUCT_ATTACH',	'ModifierId',	'TERRACE_FARM_PRODUCTION'),
	('TERRACE_FARM_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('TERRACE_FARM_PRODUCTION',			'Amount',		1);

-- inca all land units receive ability to move on hills without movement penalty
insert or replace into TraitModifiers
	(TraitType,						ModifierId)
values
	-- ('TRAIT_CIVILIZATION_GREAT_MOUNTAINS',	'TRAIT_ALL_LAND_UNITS_IGNORE_HILLS');
	('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN',	'TRAIT_ALL_LAND_UNITS_IGNORE_HILLS');

insert or replace into Modifiers
	(ModifierId,							ModifierType)
values
	('TRAIT_ALL_LAND_UNITS_IGNORE_HILLS',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

insert or replace into ModifierArguments
	(ModifierId,							Name,				Value)
values
	('TRAIT_ALL_LAND_UNITS_IGNORE_HILLS',	'AbilityType',		'ABILITY_INCA_IGNORE_HILLS');

-- inca ：Reduces the purchase cost of mountain tiles by 50%
insert or replace into TraitModifiers   
    (TraitType,	                            ModifierId)
select  'TRAIT_CIVILIZATION_GREAT_MOUNTAINS',   TerrainType || 'PLOT_COST' from Terrains 
where TerrainType like 'TERRAIN_%_MOUNTAIN';

insert or replace into Modifiers
	(ModifierId,			        ModifierType)
select TerrainType || 'PLOT_COST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'  from Terrains 
where TerrainType like 'TERRAIN_%_MOUNTAIN';

insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
select TerrainType || 'PLOT_COST',  'TerrainType',  TerrainType   from Terrains 
where TerrainType like 'TERRAIN_%_MOUNTAIN';

insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
select TerrainType || 'PLOT_COST',  'Amount',       -50   from Terrains 
where TerrainType like 'TERRAIN_%_MOUNTAIN';

-----------------------------------------------------------------------------------------------------------------
-- Russia, Resume the ability
-- TRAIT_CIVILIZATION_DISTRICT_LAVRA
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_DISTRICT_LAVRA' and ModifierId = 'TRAIT_SHRINE_WRITING_POINTS';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_DISTRICT_LAVRA' and ModifierId = 'TRAIT_TEMPLE_ARTIST_POINTS';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_DISTRICT_LAVRA' and ModifierId = 'TRAIT_TIER3_MUSICIAN_POINTS';

-- Doubles because all GP doulbes.
insert or replace into District_GreatPersonPoints
	(DistrictType,		GreatPersonClassType,			PointsPerTurn)
values
	('DISTRICT_LAVRA',	'GREAT_PERSON_CLASS_WRITER',	2),
	('DISTRICT_LAVRA',	'GREAT_PERSON_CLASS_ARTIST',	2),
	('DISTRICT_LAVRA',	'GREAT_PERSON_CLASS_MUSICIAN',	2);

update ModifierArguments set Value = 8 where ModifierId = 'TRAIT_INCREASED_TILES' and Name = 'Amount';

--NEW UA AND LA
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_GRAND_EMBASSY' and ModifierId = 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS';

insert or replace into TraitModifiers
	(TraitType,							ModifierId)
values
	('TRAIT_LEADER_GRAND_EMBASSY',		'TRAIT_GREAT_PERSON_DISCOUNT'),
	-- ('TRAIT_LEADER_GRAND_EMBASSY',		'TRAIT_CAN_PURCHASE_HOLYSITE_BUILDING'),
	('TRAIT_LEADER_GRAND_EMBASSY',		'TRAIT_CAN_PURCHASE_INDUSTRIAL_BUILDING'),
	('TRAIT_CIVILIZATION_MOTHER_RUSSIA','TRAIT_TUNDRA_DISTRICT_FOOD');

insert or replace into Modifiers
	(ModifierId,								ModifierType,														SubjectRequirementSetId)
values
	('TRAIT_GREAT_PERSON_DISCOUNT',				'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_PATRONAGE_DISCOUNT_PERCENT',	NULL),
	('TRAIT_CAN_PURCHASE_HOLYSITE_BUILDING',	'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE',			NULL),
	('TRAIT_CAN_PURCHASE_INDUSTRIAL_BUILDING',	'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE',			NULL),
	('TRAIT_TUNDRA_DISTRICT_FOOD',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',					'DISTRICTS_ON_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,								Name,				Value)
values
	('TRAIT_GREAT_PERSON_DISCOUNT',				'YieldType',		'YIELD_FAITH'),
	('TRAIT_GREAT_PERSON_DISCOUNT',				'Amount',			8),
	('TRAIT_CAN_PURCHASE_HOLYSITE_BUILDING',	'DistrictType',		'DISTRICT_HOLY_SITE'),
	('TRAIT_CAN_PURCHASE_INDUSTRIAL_BUILDING',	'DistrictType',		'DISTRICT_INDUSTRIAL_ZONE'),
	('TRAIT_TUNDRA_DISTRICT_FOOD',				'YieldType',		'YIELD_FOOD'),
	('TRAIT_TUNDRA_DISTRICT_FOOD',				'Amount',			1);

-----------------------------------------------------------------------------------------------------------------

-- Brazil 
-- lumber mill +1 adjacency bonus to IZ
-- IZ +1 production to adjacent rainforest
-- + 2 culture if lumber mill is built on rainforest +100% tourism = culture if flight is researched
-- districts do not remove rainforest
-- + 1 faith in each rainforest tiles after recruit a great person
-- + 1 faith if city is near rainforest999

insert or replace into Modifiers
	(ModifierId,							ModifierType,							SubjectRequirementSetId)
values
	('TRAIT_GREAT_PEOPLE_JUNGLE_FAITH',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_JUNGLE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('TRAIT_GREAT_PEOPLE_JUNGLE_FAITH',		'YieldType',	'YIELD_FAITH'),
	('TRAIT_GREAT_PEOPLE_JUNGLE_FAITH',		'Amount',		1);

insert or replace into TraitModifiers
	(TraitType,						ModifierId)
values
	('TRAIT_CIVILIZATION_AMAZON',	'BRAZIL_RAINFOREST_CULTURE'),
	('TRAIT_CIVILIZATION_AMAZON',	'TRAIT_AMAZON_RAINFOREST_INDUSTRIAL_ZONE_ADJACENCY'),
	('TRAIT_CIVILIZATION_AMAZON',	'TRAIT_AMAZON_RAINFOREST_ENCAMPMENT_ADJACENCY'),
	('TRAIT_CIVILIZATION_AMAZON',	'TRAIT_AMAZON_RAINFOREST_HARBOR_ADJACENCY');

insert or replace into Modifiers
	(ModifierId,											ModifierType,									SubjectRequirementSetId)
values
	('BRAZIL_RAINFOREST_CULTURE',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'PLOT_HAS_IMPROVED_AND_RAINFOREST_REQUIREMENTS'),
	('TRAIT_AMAZON_RAINFOREST_INDUSTRIAL_ZONE_ADJACENCY',	'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',		NULL),
	('TRAIT_AMAZON_RAINFOREST_ENCAMPMENT_ADJACENCY',		'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',		NULL),
	('TRAIT_AMAZON_RAINFOREST_HARBOR_ADJACENCY',			'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY',		NULL);

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('BRAZIL_RAINFOREST_CULTURE',							'YieldType',	'YIELD_CULTURE'),
	('BRAZIL_RAINFOREST_CULTURE',							'Amount',		1),
	('TRAIT_AMAZON_RAINFOREST_INDUSTRIAL_ZONE_ADJACENCY',	'Amount',		1),
	('TRAIT_AMAZON_RAINFOREST_INDUSTRIAL_ZONE_ADJACENCY',	'Description',	'LOC_DISTRICT_JUNGLE_2_PRODUCTION'),
	('TRAIT_AMAZON_RAINFOREST_INDUSTRIAL_ZONE_ADJACENCY',	'DistrictType',	'DISTRICT_INDUSTRIAL_ZONE'),
	('TRAIT_AMAZON_RAINFOREST_INDUSTRIAL_ZONE_ADJACENCY',	'FeatureType',	'FEATURE_JUNGLE'),
	('TRAIT_AMAZON_RAINFOREST_INDUSTRIAL_ZONE_ADJACENCY',	'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_AMAZON_RAINFOREST_ENCAMPMENT_ADJACENCY',		'Amount',		1),
	('TRAIT_AMAZON_RAINFOREST_ENCAMPMENT_ADJACENCY',		'Description',	'LOC_DISTRICT_JUNGLE_2_PRODUCTION'),
	('TRAIT_AMAZON_RAINFOREST_ENCAMPMENT_ADJACENCY',		'DistrictType',	'DISTRICT_ENCAMPMENT'),
	('TRAIT_AMAZON_RAINFOREST_ENCAMPMENT_ADJACENCY',		'FeatureType',	'FEATURE_JUNGLE'),
	('TRAIT_AMAZON_RAINFOREST_ENCAMPMENT_ADJACENCY',		'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_AMAZON_RAINFOREST_HARBOR_ADJACENCY',			'Amount',		1),
	('TRAIT_AMAZON_RAINFOREST_HARBOR_ADJACENCY',			'Description',	'LOC_DISTRICT_JUNGLE_2_GOLD'),
	('TRAIT_AMAZON_RAINFOREST_HARBOR_ADJACENCY',			'DistrictType',	'DISTRICT_HARBOR'),
	('TRAIT_AMAZON_RAINFOREST_HARBOR_ADJACENCY',			'FeatureType',	'FEATURE_JUNGLE'),
	('TRAIT_AMAZON_RAINFOREST_HARBOR_ADJACENCY',			'YieldType',	'YIELD_GOLD');

insert or replace into TraitModifiers (TraitType,	ModifierId) 
	select 'TRAIT_CIVILIZATION_AMAZON', 'TRAIT_JUNGLE_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

insert or replace into Modifiers    (ModifierId, ModifierType)
    select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'DistrictType', DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'FeatureType', 'FEATURE_JUNGLE'
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

insert or ignore into RequirementSets
	(RequirementSetId,										RequirementSetType)
values
	('PLOT_HAS_IMPROVED_AND_RAINFOREST_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
values
	('PLOT_HAS_IMPROVED_AND_RAINFOREST_REQUIREMENTS',		'REQUIRES_PLOT_IS_IMPROVED'),
	('PLOT_HAS_IMPROVED_AND_RAINFOREST_REQUIREMENTS',		'REQUIRES_PLOT_HAS_JUNGLE');

--------------------------------------------------------------------------------------------------------------------------
--Scotland
--Happy city recives an additional 10% science and 10% production.
update ModifierArguments set Value = 8 where ModifierId = 'TRAIT_SCIENCE_HAPPY'and Name = 'Amount';
update ModifierArguments set Value = 8 where ModifierId = 'TRAIT_PRODUCTION_HAPPY'and Name = 'Amount';
update ModifierArguments set Value = 24 where ModifierId = 'TRAIT_SCIENCE_ECSTATIC' and Name = 'Amount';
update ModifierArguments set Value = 24 where ModifierId = 'TRAIT_PRODUCTION_ECSTATIC' and Name = 'Amount';

update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_SCIENTIST_HAPPY' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'TRAIT_SCIENTIST_ECSTATIC' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_ENGINEER_HAPPY' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'TRAIT_ENGINEER_ECSTATIC' and Name = 'Amount';

-- untested
insert or replace into TraitModifiers
	(TraitType,											ModifierId)
values
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_SCIENCE_JOYFUL'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_PRODUCTION_JOYFUL'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_SCIENTIST_JOYFUL'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_ENGINEER_JOYFUL'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_LIBRARY_SCIENTIST_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_UNIVERSITY_SCIENTIST_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_RESEARCHLAB_SCIENTIST_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_WORKSHOP_ENGINEER_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_FACTORY_ENGINEER_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_COALPLANT_ENGINEER_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_OILPLANT_ENGINEER_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_NUCLEARPLANT_ENGINEER_POINT'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_CAMPUS_AMENITY'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_INDUSTRIAL_ZONE_AMENITY'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_FACTORY_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_COALPLANT_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_OILPLANT_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_NUCLEARPLANT_SCIENTIST_POINT_ECSTATIC'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_ADJACENT_DISTRICTS_CAMPUS_ADJACENCYSCIENCE'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_ADJACENT_DISTRICTS_INDUSTRIALZONE_ADJACENCYPRODUCTION'),
	('TRAIT_LEADER_BANNOCKBURN',						'SCOTLAND_TERRITORY_COMBAT');

insert or replace into Modifiers
	(ModifierId,												ModifierType,													SubjectRequirementSetId)
values
	('TRAIT_SCIENCE_JOYFUL',									'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD',				NULL),
	('TRAIT_PRODUCTION_JOYFUL',									'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD',				NULL),
	('TRAIT_SCIENTIST_JOYFUL',									'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_CAMPUS_HAPPY_REQUIREMENTS'),
	('TRAIT_ENGINEER_JOYFUL',									'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_INDUSTRIAL_ZONE_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT',							'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_LIBRARY_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT',						'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_UNIVERSITY_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT',						'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_RESEARCHLAB_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT',							'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_WORKSHOP_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT',							'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_FACTORY_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_COALPLANT_ENGINEER_POINT',							'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_PLANT_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC',					'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_LIBRARY_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC',				'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_UNIVERSITY_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC',				'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_RESEARCHLAB_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC',					'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_WORKSHOP_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT_ECSTATIC',					'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_FACTORY_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_COALPLANT_ENGINEER_POINT_ECSTATIC',					'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_PLANT_ECSTATIC_REQUIREMENTS'),
	('TRAIT_CAMPUS_AMENITY',									'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',					'HD_CITY_HAS_CAMPUS_REQUIREMENTS'),
	('TRAIT_INDUSTRIAL_ZONE_AMENITY',							'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',					'HD_CITY_HAS_INDUSTRIAL_ZONE_REQUIREMENTS'),
	('SCOTLAND_TERRITORY_COMBAT',								'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',							NULL),
	('SCOTLAND_FRIENDLY_COMBAT',								'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',							'HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS');

insert or replace into ExcludedAdjacencies (TraitType,	YieldChangeId)values
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'District_Science'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'District_Production');

insert or replace into ModifierArguments
	(ModifierId,									Name,							Value)
values
	('TRAIT_SCIENCE_JOYFUL',						'YieldType',					'YIELD_SCIENCE'),
	('TRAIT_SCIENCE_JOYFUL',						'HappinessType',				'HAPPINESS_JOYFUL'),
	('TRAIT_SCIENCE_JOYFUL',						'Amount',						16),
	('TRAIT_PRODUCTION_JOYFUL',						'YieldType',					'YIELD_PRODUCTION'),
	('TRAIT_PRODUCTION_JOYFUL',						'HappinessType',				'HAPPINESS_JOYFUL'),
	('TRAIT_PRODUCTION_JOYFUL',						'Amount',						16),
	('TRAIT_SCIENTIST_JOYFUL',						'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
	('TRAIT_SCIENTIST_JOYFUL',						'HappinessType',				'HAPPINESS_JOYFUL'),
	('TRAIT_SCIENTIST_JOYFUL',						'Amount',						4),
	('TRAIT_ENGINEER_JOYFUL',						'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
	('TRAIT_ENGINEER_JOYFUL',						'HappinessType',				'HAPPINESS_JOYFUL'),
	('TRAIT_ENGINEER_JOYFUL',						'Amount',						4),
	-- 
	('TRAIT_CAMPUS_AMENITY',						'Amount',						1),
	('TRAIT_INDUSTRIAL_ZONE_AMENITY',				'Amount',						1),
	('SCOTLAND_TERRITORY_COMBAT',					'AbilityType',					'ABILITY_TERRITORY_COMBAT'),
	('SCOTLAND_FRIENDLY_COMBAT',					'Amount',						4);

insert or replace into ModifierStrings
	(ModifierId,									Context,	Text)
values
	('SCOTLAND_FRIENDLY_COMBAT',					'Preview',	'+{1_Amount} {LOC_TRAIT_LEADER_BANNOCKBURN_NAME}');

-- 	('TRAIT_LIBRARY_SCIENTIST_POINT',				'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT',				'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT',				'Amount',						2),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT',			'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT',			'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT',			'Amount',						2),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT',			'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT',			'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT',			'Amount',						2),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT',				'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT',				'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT',				'Amount',						2),
-- 	('TRAIT_FACTORY_ENGINEER_POINT'					'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT'					'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT'					'Amount',						2),
-- 	('TRAIT_PLANT_ENGINEER_POINT',					'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_PLANT_ENGINEER_POINT',					'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_PLANT_ENGINEER_POINT',					'Amount',						2),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC',		'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC',		'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC',		'Amount',						4),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC',	'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC',	'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC',	'Amount',						4),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC',	'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC',	'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC',	'Amount',						4),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC',		'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC',		'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC',		'Amount',						4),
-- 	('TRAIT_FACTORY_ENGINEER_POINT_ECSTATIC'		'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT_ECSTATIC'		'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT_ECSTATIC'		'Amount',						4),
-- 	('TRAIT_PLANT_ENGINEER_POINT_ECSTATIC',			'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_PLANT_ENGINEER_POINT_ECSTATIC',			'HappinessType',				'HAPPINESS_ECSTATIC');

insert or ignore into Requirements
	(RequirementId,							RequirementType)
values
	('UNIT_IN_OWNER_TERRITORY_REQUIREMENT',	'REQUIREMENT_UNIT_IN_OWNER_TERRITORY');

insert or replace into RequirementSets
	(RequirementSetId,										RequirementSetType)
values
	('HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
values
	('HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS',	'PLAYER_IS_DEFENDER_REQUIREMENTS'),
	('HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS',	'UNIT_IN_OWNER_TERRITORY_REQUIREMENT');

---------------------------------------------------------------------------------------------------------------------
--SCYTHIA
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY','TRAIT_YIELD_MORE_HORSE'),
	('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY','TRAIT_TECH_ANIMAL_HUSBANDRY'),
	('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY','TRAIT_PASTURE_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,						ModifierType,															SubjectRequirementSetId)
values
	('TRAIT_YIELD_MORE_HORSE',			'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_ACCUMULATION_SPECIFIC_RESOURCE',	NULL),
	('TRAIT_TECH_ANIMAL_HUSBANDRY',		'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',							NULL),
	('TRAIT_PASTURE_PRODUCTION',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',									'PLOT_HAS_PASTURE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
values
	('TRAIT_YIELD_MORE_HORSE',		'ResourceType',	'RESOURCE_HORSES'),
	('TRAIT_YIELD_MORE_HORSE',		'Amount',		3),
	('TRAIT_TECH_ANIMAL_HUSBANDRY',	'TechType',		'TECH_ANIMAL_HUSBANDRY'	),
	('TRAIT_PASTURE_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_PASTURE_PRODUCTION',	'Amount',		1);
---------------------------------------------------------------------------------------------------------------------------
-- Spainish
update ModifierArguments set Value = 'CIVIC_EXPLORATION' where ModifierId = 'TRAIT_NAVAL_CORPS_EARLY' and Name= 'CivicType';

---------------------------------------------------------------------------------------------------------------------------
--Gilgamesh
--Sumerian war cart can attack wall 
insert or replace into TypeTags
	(Type,									Tag)
values
	('UNIT_SUMERIAN_WAR_CART',				'CLASS_HEAVY_CAVALRY'),
	('UNIT_SUMERIAN_WAR_CART',				'CLASS_WALL_ATTACK'),
	('ABILITY_ENABLE_WALL_ATTACK',			'CLASS_WALL_ATTACK');

insert or replace into Tags
	(Tag,					Vocabulary)
values
	('CLASS_WALL_ATTACK',	'ABILITY_CLASS');

----------------------------------------------------------------------------------------------------------------------------------
-- France
update ModifierArguments set Value = 300 where ModifierId = 'TRAIT_WONDER_DOUBLETOURISM' and Name = 'ScalingFactor';
insert or replace into GlobalParameters
	(Name,										Value)
values
	('FRANCE_WONDER_GREATPEOPLE_PERCENTAGE',	20),
	('FRANCE_GREATPEOPLE_WONDER_PERCENTAGE',	10),
	('ALEXANDER_WONDER_PERCENTAGE',				10);

----------------------------------------------------------------------------------------------------------------------------------
--India
---------------------------------------------------------------------------------------------------------------------------------
--Gandhi
insert or replace into TraitModifiers 
	(TraitType,					ModifierId)
values
	('TRAIT_LEADER_SATYAGRAHA',	'PEACE_ADDGROWTH'),
	('TRAIT_LEADER_SATYAGRAHA',	'PEACE_ADDFAITH'),
	('TRAIT_LEADER_SATYAGRAHA',	'PEACE_ADDAMENITY');

insert or replace into Modifiers
	(ModifierId,				ModifierType,											SubjectRequirementSetId)
values
	('PEACE_ADDGROWTH',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH',			'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('PEACE_ADDFAITH',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('PEACE_ADDAMENITY',		'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',			'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS');

insert or replace into ModifierArguments
	(ModifierId,				Name,			Value)
values
	('PEACE_ADDGROWTH',			'Amount',		15),
	('PEACE_ADDFAITH',			'YieldType',	'YIELD_FAITH'),
	('PEACE_ADDFAITH',			'Amount',		15),
	('PEACE_ADDAMENITY',		'Amount',		1);
-------------------------------------------------------------------------------------------------

insert or replace into TraitModifiers
	(TraitType,										ModifierId)
values
	('TRAIT_CIVILIZATION_CREE_TRADE_GAIN_TILES',	'TRAIT_STATE_WORKFORCE_TRADE_ROUTE'),
	('TRAIT_CIVILIZATION_CREE_TRADE_GAIN_TILES',	'TRAIT_STATE_WORKFORCE_ADD_TRADER');

insert or replace into Modifiers
	(ModifierId,							ModifierType,									OwnerRequirementSetId,						SubjectRequirementSetId)
values
	('TRAIT_STATE_WORKFORCE_TRADE_ROUTE',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	NULL,										'PLAYER_HAS_STATE_WORKFORCE_AND_CAPITAL'),
	('TRAIT_STATE_WORKFORCE_ADD_TRADER',	'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',		'PLAYER_HAS_STATE_WORKFORCE_AND_CAPITAL',	NULL);

update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'TRAIT_STATE_WORKFORCE_ADD_TRADER';

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
values
	('TRAIT_STATE_WORKFORCE_TRADE_ROUTE',	'Amount',				1),
	('TRAIT_STATE_WORKFORCE_ADD_TRADER',	'UnitType',				'UNIT_TRADER'),
	('TRAIT_STATE_WORKFORCE_ADD_TRADER',	'AllowUniqueOverride',	0),
	('TRAIT_STATE_WORKFORCE_ADD_TRADER',	'Amount',				1);

insert or ignore into RequirementSets
	(RequirementSetId,							RequirementSetType)
values
	('PLAYER_HAS_STATE_WORKFORCE_AND_CAPITAL',	'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,							RequirementId)
values
	('PLAYER_HAS_STATE_WORKFORCE_AND_CAPITAL',	'REQUIRES_PLAYER_HAS_CIVIC_STATE_WORKFORCE'),
	('PLAYER_HAS_STATE_WORKFORCE_AND_CAPITAL',	'REQUIRES_CAPITAL_CITY');

----------------------------------------------------------------------------------------------------------------------
-- Germany
-- UA: TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES
-- LA: TRAIT_LEADER_HOLY_ROMAN_EMPEROR
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_HOLY_ROMAN_EMPEROR' and ModifierId = 'TRAIT_COMBAT_BONUS_CITY_STATES';
insert or replace into TraitModifiers
	(TraitType,										ModifierId)
values
	('TRAIT_LEADER_HOLY_ROMAN_EMPEROR',				'HD_HOLY_ROMAN_DOUBLE_INFLUENCE_POINTS');
	-- ('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',		'HD_SCIENCE_BONUS_WITH_SPECILTY_DISTRICT'),
	-- ('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',		'HD_CULTURE_BONUS_WITH_SPECILTY_DISTRICT');

insert or replace into Modifiers
	(ModifierId,									ModifierType,										SubjectRequirementSetId)
values
	('HD_HOLY_ROMAN_DOUBLE_INFLUENCE_POINTS',		'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',			NULL),
	('HD_SCIENCE_BONUS_WITH_SPECILTY_DISTRICT',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_1_SPECIALTY_DISTRICT'),
	('HD_CULTURE_BONUS_WITH_SPECILTY_DISTRICT',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_1_SPECIALTY_DISTRICT');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('HD_HOLY_ROMAN_DOUBLE_INFLUENCE_POINTS',		'BonusType',	'GOVERNMENTBONUS_ENVOYS'),
	('HD_HOLY_ROMAN_DOUBLE_INFLUENCE_POINTS',		'Amount',		100),
	('HD_SCIENCE_BONUS_WITH_SPECILTY_DISTRICT',		'YieldType',	'YIELD_SCIENCE'),
	('HD_SCIENCE_BONUS_WITH_SPECILTY_DISTRICT',		'Amount',		1),
	('HD_CULTURE_BONUS_WITH_SPECILTY_DISTRICT',		'YieldType',	'YIELD_CULTURE'),
	('HD_CULTURE_BONUS_WITH_SPECILTY_DISTRICT',		'Amount',		1);

----------------------------------------------------------------------------------------------------------------------
-- Canada
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_FACES_OF_PEACE' and ModifierId = 'TRAIT_TOURISM_INTO_FAVOR';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_FACES_OF_PEACE' and ModifierId = 'TRAIT_EMERGENCY_FAVOR_MODIFIER';

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_FACES_OF_PEACE',	'PEACE_ADD_CULTURE'),
	('TRAIT_CIVILIZATION_FACES_OF_PEACE',	'PEACE_ADD_TOURISM'),
	('TRAIT_CIVILIZATION_FACES_OF_PEACE',	'TRAIT_BARBARIAN_CAMP_BUILDER_HD');

insert or replace into Modifiers
	(ModifierId,							ModifierType,											SubjectRequirementSetId)
values
	('PEACE_ADD_CULTURE',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('PEACE_ADD_TOURISM',					'MODIFIER_PLAYER_ADJUST_TOURISM',						'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('TRAIT_BARBARIAN_CAMP_BUILDER_HD',		'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT',			NULL);

insert or replace into ModifierArguments
	(ModifierId,							Name,						Value)
values
	('PEACE_ADD_CULTURE',					'YieldType',				'YIELD_CULTURE'),
	('PEACE_ADD_CULTURE',					'Amount',					15),
	('PEACE_ADD_TOURISM',					'Amount',					25),
	('TRAIT_BARBARIAN_CAMP_BUILDER_HD',		'ImprovementType',			'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_BUILDER_HD',		'GoodyHutImprovementType',	'IMPROVEMENT_GOODY_BUILDER');

update ModifierArguments set Value = 2 where ModifierId = 'SNOW_MINES_PRODUCTION' and Name = 'Amount';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_LAST_BEST_WEST' and ModifierId like 'TUNDRA%_FOOD';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_LAST_BEST_WEST' and ModifierId like 'TUNDRA%_PRODUCTION';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_LAST_BEST_WEST' and ModifierId like 'SNOW_%_FOOD';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_LAST_BEST_WEST' and ModifierId like 'SNOW_%_PRODUCTION';

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_LEADER_LAST_BEST_WEST',			'TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_PRODUCTION'),
	('TRAIT_LEADER_LAST_BEST_WEST',			'TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_FOOD');

insert or replace into Modifiers
	(ModifierId,										ModifierType,							SubjectRequirementSetId)
values
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'HD_IS_TUNDRA_SNOW_PRODUCTION_IMPROVEMENTS_REQUIREMENTS'),
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_FOOD',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'HD_IS_TUNDRA_SNOW_FOOD_IMPROVEMENTS_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_PRODUCTION',	'Amount',		2),
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_FOOD',		'YieldType',	'YIELD_FOOD'),
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_FOOD',		'Amount',		2);

------------------------------------------------------------------------------------------------
-- Korea ability updated
delete from TraitModifiers where ModifierId = 'TRAIT_ADJUST_CITY_CULTURE_PER_GOVERNOR_TITLE_MODIFIER';
delete from TraitModifiers where ModifierId = 'TRAIT_ADJUST_CITY_SCIENCE_PER_GOVERNOR_TITLE_MODIFIER';  
delete from Adjacency_YieldChanges where ID = 'Mine_ScienceSeowonAdjacency';
delete from Adjacency_YieldChanges where ID = 'Farm_FoodSeowonAdjacency';

insert or replace into TraitModifiers (TraitType,   ModifierId)
select  'TRAIT_LEADER_HWARANG', 'HWARANG_RESEARCHLAB_POP' || YieldType from Yields;
insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 'HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING_REQUIREMENTS' from Yields;
insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'YieldType', YieldType from Yields;
insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'Amount', 1 from Yields;

insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('TRAIT_LEADER_HWARANG',                'HWARANG_ALLBUFF'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_HOUSING'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_LOYALTY'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_LOYALTY_DEBUFF'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_ALLDEBUFF'),
    ('TRAIT_LEADER_HWARANG',                'SEWON_FOOD'),
    ('TRAIT_LEADER_HWARANG',                'SEWON_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'LIBRARY_DISTRICT_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'LIBRARY_BUILDING_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_CAMPUS_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_THEATER_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_COMMEICIAL_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_HARBOR_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_INDUSTRIAL_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_HOLY_SITE_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_ENCAMPMENT_ADJACENCY'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_SEWON_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_LIBRARY_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_UNIVERSITY_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_RESERCHLAB_TITLE');

insert or replace into Modifiers
    (ModifierId,                        ModifierType,                                                       SubjectRequirementSetId)
values
    ('HWARANG_ALLBUFF',                 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING_REQUIREMENTS'),
    ('HWARANG_HOUSING',                 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',                     'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_LOYALTY',                 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',                  'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_AMENITY',                 'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',                      'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_LOYALTY_DEBUFF',          'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',                  'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('HWARANG_AMENITY_DEBUFF',          'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',                      'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('HWARANG_ALLDEBUFF',               'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('SEWON_FOOD',                      'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING_REQUIREMENTS'), --TODO
    ('SEWON_PRODUCTION',                'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING_REQUIREMENTS'), --TODO
    ('LIBRARY_DISTRICT_PRODUCTION',     'MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PRODUCTION',           'CITY_HAS_DISTRICT_SEOWON'), --TODO
    ('LIBRARY_BUILDING_PRODUCTION',     'MODIFIER_PLAYER_CITIES_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER',    'CITY_HAS_DISTRICT_SEOWON'), --TODO
    ('UNIVERSITY_CAMPUS_ADJACENCY',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_CAMPUS_REQUIRMENTS'),
    ('UNIVERSITY_THEATER_ADJACENCY',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_THEATER_REQUIRMENTS'),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS'),
    ('UNIVERSITY_HARBOR_ADJACENCY',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_HARBOR_REQUIRMENTS'),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS'),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_HOLYSITE_REQUIRMENTS'),
    ('UNIVERSITY_ENCAMPMENT_ADJACENCY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_ENCAMPMENT_REQUIRMENTS');
update Modifiers set OwnerRequirementSetId = 'PLAYER_IS_HUMAN' where ModifierId like 'HWARANG_%DEBUFF';

insert or replace into Modifiers
    (ModifierId,                    ModifierType)
values
    ('CAPITAL_SEWON_TITLE',         'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_LIBRARY_TITLE',       'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_UNIVERSITY_TITLE',    'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_RESERCHLAB_TITLE',    'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                               SubjectRequirementSetId,        RunOnce,    Permanent)
values
    ('CAPITAL_SEWON_TITLE_MODIFIER',        'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_SEOWON_REQUIREMENTS',       1,  1),
    ('CAPITAL_LIBRARY_TITLE_MODIFIER',      'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_LIBRARY_REQUIREMENTS',      1,  1),
    ('CAPITAL_UNIVERSITY_TITLE_MODIFIER',   'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_UNIVERSITY_REQUIREMENTS',   1,  1),
    ('CAPITAL_RESERCHLAB_TITLE_MODIFIER',   'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_REEARCHLAB_REQUIREMENTS',   1,  1);

insert or replace into ModifierArguments
    (ModifierId,                            Name,           Value)
values
    ('HWARANG_ALLBUFF',                     'YieldType',    'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'),
    ('HWARANG_ALLBUFF',                     'Amount',       '10,10,10,10,10,10'),
    ('HWARANG_HOUSING',                     'Amount',       5),
    ('HWARANG_LOYALTY',                     'Amount',       20),
    ('HWARANG_AMENITY',                     'Amount',       3),
    ('HWARANG_LOYALTY_DEBUFF',              'Amount',       -8),
    ('HWARANG_AMENITY_DEBUFF',              'Amount',       -2),
    ('HWARANG_ALLDEBUFF',                   'YieldType',    'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE,YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'),
    ('HWARANG_ALLDEBUFF',                   'Amount',       '-50,-50,-50,-50,-50,-50'),
    -- 
    ('SEWON_FOOD',                          'YieldType',    'YIELD_FOOD'),
    ('SEWON_FOOD',                          'Amount',       15),
    ('SEWON_PRODUCTION',                    'YieldType',    'YIELD_PRODUCTION'),
    ('SEWON_PRODUCTION',                    'Amount',       15),
    -- 
    ('LIBRARY_DISTRICT_PRODUCTION',         'Amount',       25),
    ('LIBRARY_BUILDING_PRODUCTION',         'IsWonder',     0),
    ('LIBRARY_BUILDING_PRODUCTION',         'Amount',       25),
    -- 
    ('UNIVERSITY_CAMPUS_ADJACENCY',         'YieldType',    'YIELD_SCIENCE'),
    ('UNIVERSITY_CAMPUS_ADJACENCY',         'Amount',       100),
    ('UNIVERSITY_THEATER_ADJACENCY',        'YieldType',    'YIELD_CULTURE'),
    ('UNIVERSITY_THEATER_ADJACENCY',        'Amount',       100),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY',     'YieldType',    'YIELD_GOLD'),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY',     'Amount',       100),
    ('UNIVERSITY_HARBOR_ADJACENCY',         'YieldType',    'YIELD_GOLD'),
    ('UNIVERSITY_HARBOR_ADJACENCY',         'Amount',       100),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY',     'YieldType',    'YIELD_PRODUCTION'),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY',     'Amount',       100),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',      'YieldType',    'YIELD_FAITH'),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',      'Amount',       100),
    ('UNIVERSITY_ENCAMPMENT_ADJACENCY',     'YieldType',    'YIELD_PRODUCTION'),
    ('UNIVERSITY_ENCAMPMENT_ADJACENCY',     'Amount',       100),
    -- 
    ('CAPITAL_SEWON_TITLE',                 'ModifierId',   'CAPITAL_SEWON_TITLE_MODIFIER'),
    ('CAPITAL_LIBRARY_TITLE',               'ModifierId',   'CAPITAL_LIBRARY_TITLE_MODIFIER'),
    ('CAPITAL_UNIVERSITY_TITLE',            'ModifierId',   'CAPITAL_UNIVERSITY_TITLE_MODIFIER'),
    ('CAPITAL_RESERCHLAB_TITLE',            'ModifierId',   'CAPITAL_RESERCHLAB_TITLE_MODIFIER'),
    ('CAPITAL_SEWON_TITLE_MODIFIER',        'Delta',        1),
    ('CAPITAL_LIBRARY_TITLE_MODIFIER',      'Delta',        1),
    ('CAPITAL_UNIVERSITY_TITLE_MODIFIER',   'Delta',        1),
    ('CAPITAL_RESERCHLAB_TITLE_MODIFIER',   'Delta',        1);

insert or replace into Requirements
    (RequirementId,                             RequirementType,                        Inverse)
values
    ('REQUIRES_CITY_NON_CAPITAL',               'REQUIREMENT_CITY_HAS_BUILDING',        1),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'REQUIREMENT_PLOT_PROPERTY_MATCHES',    0),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'REQUIREMENT_PLOT_PROPERTY_MATCHES',    1);

insert or replace into RequirementArguments
    (RequirementId,                             Name,               Value)
values
    ('REQUIRES_CITY_NON_CAPITAL',               'BuildingType',     'BUILDING_PALACE'),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'PropertyName',     'HD_HasAssignedGovernor'),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'PropertyMinimum',  1),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'PropertyName',     'HD_HasAssignedGovernor'),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'PropertyMinimum',  1);

insert or replace into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
values
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL'),
	('PALACE_AND_ROYAL_NAVY_DOCKYARD_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL'),
	('PALACE_AND_HARBOR_TIER_1_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
	('PALACE_AND_HARBOR_TIER_2_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
	('PALACE_AND_HARBOR_TIER_3_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIREMENTSET_TEST_ANY'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_DISTRICT_SEOWON',                        'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_BUILDING_LIBRARY',                       'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_ENCAMPMENT_REQUIRMENTS',           'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_BUILDING_RESEARCH_LAB',                  'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIRES_CITY_HAS_DISTRICT_SEOWON'),
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_PALACE'),
	('PALACE_AND_ROYAL_NAVY_DOCKYARD_REQUIREMENTS',		'REQUIRES_CITY_HAS_DISTRICT_ROYAL_NAVY_DOCKYARD'),
	('PALACE_AND_ROYAL_NAVY_DOCKYARD_REQUIREMENTS',		'REQUIRES_CITY_HAS_BUILDING_PALACE'),
	('PALACE_AND_HARBOR_TIER_1_REQUIREMENTS',			'REQUIRES_CITY_HAS_DISTRICT_HARBOR_TIER_1_BUILDING'),
	('PALACE_AND_HARBOR_TIER_1_REQUIREMENTS',			'REQUIRES_CITY_HAS_BUILDING_PALACE'),
	('PALACE_AND_HARBOR_TIER_2_REQUIREMENTS',			'REQUIRES_CITY_HAS_DISTRICT_HARBOR_TIER_2_BUILDING'),
	('PALACE_AND_HARBOR_TIER_2_REQUIREMENTS',			'REQUIRES_CITY_HAS_BUILDING_PALACE'),
	('PALACE_AND_HARBOR_TIER_3_REQUIREMENTS',			'REQUIRES_CITY_HAS_DISTRICT_HARBOR_TIER_3_BUILDING'),
	('PALACE_AND_HARBOR_TIER_3_REQUIREMENTS',			'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    -- 
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIRES_CITY_NON_CAPITAL'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD'),
    -- 
    ('CITY_HAS_DISTRICT_SEOWON',                        'REQUIRES_CITY_HAS_DISTRICT_SEOWON'),
    ('CITY_HAS_BUILDING_LIBRARY',                       'REQUIRES_CITY_HAS_BUILDING_LIBRARY'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIRES_DISTRICT_IS_DISTRICT_CAMPUS'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIRES_DISTRICT_IS_DISTRICT_THEATER'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIRES_DISTRICT_IS_DISTRICT_COMMERCIAL_HUB'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIRES_DISTRICT_IS_DISTRICT_HARBOR'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIRES_DISTRICT_IS_DISTRICT_INDUSTRIAL_ZONE'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIRES_DISTRICT_IS_DISTRICT_HOLY_SITE'),
    ('UNIVERSITY_AND_ENCAMPMENT_REQUIRMENTS',           'REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING'),
    ('UNIVERSITY_AND_ENCAMPMENT_REQUIRMENTS',           'REQUIRES_DISTRICT_IS_DISTRICT_ENCAMPMENT'),
    ('CITY_HAS_BUILDING_RESEARCH_LAB',                  'REQUIRES_CITY_HAS_BUILDING_RESEARCH_LAB');

delete from District_ValidTerrains where DistrictType = 'DISTRICT_SEOWON';

----------------------------------------------------------------------------------------------------------------------
-- Qin

----------------------------------------------------------------------------------------------------------------------
-- Phoenicia
-- LA
insert or replace into TraitModifiers (TraitType,	ModifierId)
select 'TRAIT_LEADER_FOUNDER_CARTHAGE',		'PRODUCTION_DIP_DISTRICT'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into TraitModifiers (TraitType,	ModifierId)
select 'TRAIT_LEADER_FOUNDER_CARTHAGE',		'TRADE_ROUTE_DIP_DISTRICT'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into TraitModifiers (TraitType,	ModifierId)
select 'TRAIT_LEADER_FOUNDER_CARTHAGE',		'TRADE_ROUTE_CONSULATE'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into TraitModifiers (TraitType,	ModifierId)
select 'TRAIT_LEADER_FOUNDER_CARTHAGE',		'TRADE_ROUTE_CHANCERY'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');

insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select 'PRODUCTION_DIP_DISTRICT',	'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION_MODIFIER',	'CITY_HAS_DIP_DISTRICT'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select 'TRADE_ROUTE_DIP_DISTRICT',	'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_CAPACITY',	'CITY_HAS_DIP_DISTRICT'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select 'TRADE_ROUTE_CONSULATE',		'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_CAPACITY',	'BUILDING_IS_CONSULATE'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select 'TRADE_ROUTE_CHANCERY',		'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_CAPACITY',	'BUILDING_IS_CHANCERY'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');

insert or replace into ModifierArguments (ModifierId,						Name,			Value)
select 'PRODUCTION_DIP_DISTRICT',		'Amount',		50
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into ModifierArguments (ModifierId,						Name,			Value)
select 'TRADE_ROUTE_DIP_DISTRICT',		'Amount',		1
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into ModifierArguments (ModifierId,						Name,			Value)
select 'TRADE_ROUTE_CONSULATE',			'Amount',		1
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into ModifierArguments (ModifierId,						Name,			Value)
select 'TRADE_ROUTE_CHANCERY',			'Amount',		1
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');

-- UA
insert or replace into TraitModifiers
	(TraitType,										ModifierId)
values
	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_INTERNATIONAL_TRADE_ROUTE_CULTURE'),
	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_INTERNATIONAL_TRADE_ROUTE_GOLD'),
	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_SUZERAIN_TRADE_ROUTE_CULTURE'),
	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_SUZERAIN_TRADE_ROUTE_GOLD');
--	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_FOREIGN_TRADE_INFLUENCE_TOKEN'),
--	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_WRITING_INFLUENCE_TOKEN');

insert or replace into Modifiers
    (ModifierId,                            			ModifierType)
values
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_CULTURE',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_GOLD',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_CULTURE',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE'),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_GOLD',  			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE');

--insert or replace into Modifiers
--    (ModifierId,                            			ModifierType,								SubjectRequirementSetId)
--values
--	('PHOENICIA_FOREIGN_TRADE_INFLUENCE_TOKEN',			'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',	'HD_PLAYER_HAS_TECH_WRITING'),
--	('PHOENICIA_WRITING_INFLUENCE_TOKEN',				'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',	'HD_PLAYER_HAS_CIVIC_FOREIGN_TRADE');

--update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'PHOENICIA_FOREIGN_TRADE_INFLUENCE_TOKEN';
--update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'PHOENICIA_WRITING_INFLUENCE_TOKEN';

insert or replace into ModifierArguments
    (ModifierId,                            			Name,           Value)
values
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_CULTURE',  	'YieldType',    'YIELD_CULTURE'),
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_CULTURE',  	'Amount',       1),
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_GOLD',    	'YieldType',    'YIELD_GOLD'),
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_GOLD',    	'Amount',       2),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_CULTURE',   		'YieldType',    'YIELD_CULTURE'),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_CULTURE',   		'Amount',       2),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_GOLD',				'YieldType',    'YIELD_GOLD'),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_GOLD',				'Amount',       4);
--    ('PHOENICIA_FOREIGN_TRADE_INFLUENCE_TOKEN',  		'Amount',       1),
--    ('PHOENICIA_WRITING_INFLUENCE_TOKEN',  				'Amount',       1);
insert or ignore into TypeTags
	(Type,								Tag)
values
	('ABILITY_MEDITERRANEAN_COLONIES',	'CLASS_SETTLER');
-- UD
insert or replace into DistrictModifiers 
	(DistrictType,				ModifierId)
values
	('DISTRICT_COTHON',			'COTHON_ADDGROWTH');

insert or replace into Modifiers
	(ModifierId,				ModifierType)
values
	('COTHON_ADDGROWTH',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH');

insert or replace into ModifierArguments
	(ModifierId,				Name,			Value)
values
	('COTHON_ADDGROWTH',		'Amount',		15);

----------------------------------------------------------------------------------------------------------------------
-- Cree
-- LA : add fishing boats
insert or replace into TraitModifiers
	(TraitType,							ModifierId)
values
	('TRAIT_LEADER_ALLIANCE_AND_TRADE',	'POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS'),
	('TRAIT_LEADER_ALLIANCE_AND_TRADE',	'POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS');

insert or replace into Modifiers
    (ModifierId,                            		ModifierType)
values
    ('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_IMPROVEMENT_IN_TARGET'),
    ('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_IMPROVEMENT_IN_TARGET');

insert or replace into ModifierArguments
    (ModifierId,                            	Name,           Value)
values
    ('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',  	'YieldType',    	'YIELD_FOOD'),
	('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',  	'Amount',    		1),
	('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',  	'ImprovementType',	'IMPROVEMENT_FISHING_BOATS'),
	('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',  	'Origin',    		1),
    ('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',  	'YieldType',    	'YIELD_GOLD'),
	('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',  	'Amount',    		1),
	('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',  	'ImprovementType',	'IMPROVEMENT_FISHING_BOATS'),
	('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',  	'Destination',    	1);

----------------------------------------------------------------------------------------------------------------------

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_LEADER_SURROUNDED_BY_GLORY',	'ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN'),
	('CULTURE_KILLS_TRAIT',					'ACROPOLIS_GRANT_FREE_ANTI_CAVALRY');

insert or replace into Modifiers
	(ModifierId,											ModifierType,												RunOnce,	Permanent,	SubjectRequirementSetId,			SubjectStackLimit)
values
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN',			'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',				0,			0,			'DISTRICT_IS_DISTRICT_ACROPOLIS',	NULL),
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER',	'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER',				0,			0,			NULL,								1),
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER1',	'MODIFIER_PLAYER_ADJUST_DUPLICATE_FIRST_INFLUENCE_TOKEN',	0,			0,			NULL,								NULL),
	('ACROPOLIS_GRANT_FREE_ANTI_CAVALRY',					'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',				0,			0,			'DISTRICT_IS_DISTRICT_ACROPOLIS',	NULL),
	('ACROPOLIS_GRANT_FREE_ANTI_CAVALRY_MODIFIER',			'MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER',		1,			1,			NULL,								NULL);

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN',			'ModifierId',	'ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER'),
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER',	'ModifierId',	'ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER1'),
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER1',	'Amount',		1),
	('ACROPOLIS_GRANT_FREE_ANTI_CAVALRY',					'ModifierId',	'ACROPOLIS_GRANT_FREE_ANTI_CAVALRY_MODIFIER'),
	('ACROPOLIS_GRANT_FREE_ANTI_CAVALRY_MODIFIER',			'UnitPromotionClassType',	'PROMOTION_CLASS_ANTI_CAVALRY');

insert or replace into RequirementSetRequirements
    (RequirementSetId,              	RequirementId)
values
    ('DISTRICT_IS_DISTRICT_ACROPOLIS',  'REQUIRES_DISTRICT_IS_DISTRICT_ACROPOLIS');

insert or replace into RequirementSets
    (RequirementSetId,                  RequirementSetType)
values
    ('DISTRICT_IS_DISTRICT_ACROPOLIS',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------
--Catherine De Medici alt 寻欢作乐额外文化

--------------------------------------------------------------------------
--Catherine De Medici 黑王后额外视野
-- delete from TraitModifiers where TraitType = 'FLYING_SQUADRON_TRAIT' and ModifierId = 'UNIQUE_LEADER_SPIES_START_PROMOTED';
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('FLYING_SQUADRON_TRAIT',				'SPY_BONUS_SIGHT');

insert or replace into Modifiers
	(ModifierId,							ModifierType,					Permanent)
values
	('SPY_BONUS_SIGHT',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		1);

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('SPY_BONUS_SIGHT',			 			'AbilityType',	'ABILITY_SPY_BONUS_SIGHT');
--

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('FLYING_SQUADRON_TRAIT',				'CIVILIAN_AND_RECON_BONUS_SIGHT');

insert or replace into Modifiers
	(ModifierId,							ModifierType,								Permanent)
values
	('CIVILIAN_AND_RECON_BONUS_SIGHT',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		1);

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('CIVILIAN_AND_RECON_BONUS_SIGHT',	    'AbilityType',	'ABILITY_CIVILIAN_AND_RECON_BONUS_SIGHT');	

------------------------------------------------------------------------------------------------
--Catherine De Medici 黑王后额外间谍

insert or replace into TraitModifiers
	(TraitType,										ModifierId)
values
	('FLYING_SQUADRON_TRAIT',						'TRAIT_POLITICAL_PHILOSOPHY_SPY_CAPACITY'),
	('FLYING_SQUADRON_TRAIT',						'TRAIT_POLITICAL_PHILOSOPHY_ADD_SPY'),
	('FLYING_SQUADRON_TRAIT',						'TRAIT_DEFENSIVE_TACTICS_SPY_CAPACITY'),
	('FLYING_SQUADRON_TRAIT',						'TRAIT_DEFENSIVE_TACTICS_ADD_SPY');
insert or replace into Modifiers
	(ModifierId,								ModifierType,								OwnerRequirementSetId,									SubjectRequirementSetId)
values
	('TRAIT_POLITICAL_PHILOSOPHY_SPY_CAPACITY',	'MODIFIER_PLAYER_GRANT_SPY',				'PLAYER_HAS_CIVIC_POLITICAL_PHILOSOPHY_REQUIREMENTS',	NULL),
	('TRAIT_POLITICAL_PHILOSOPHY_ADD_SPY',		'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',	'PLAYER_HAS_CIVIC_POLITICAL_PHILOSOPHY_REQUIREMENTS',	NULL),
	('TRAIT_DEFENSIVE_TACTICS_SPY_CAPACITY',	'MODIFIER_PLAYER_GRANT_SPY',				'PLAYER_HAS_CIVIC_DEFENSIVE_TACTICS_REQUIREMENTS',		NULL),
	('TRAIT_DEFENSIVE_TACTICS_ADD_SPY',			'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',	'PLAYER_HAS_CIVIC_DEFENSIVE_TACTICS_REQUIREMENTS',		NULL);

update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'TRAIT_POLITICAL_PHILOSOPHY_SPY_CAPACITY';

insert or replace into ModifierArguments
	(ModifierId,									Name,					Value)
values
	('TRAIT_POLITICAL_PHILOSOPHY_SPY_CAPACITY',		'Amount',				1),
	('TRAIT_POLITICAL_PHILOSOPHY_ADD_SPY',			'UnitType',				'UNIT_SPY'),
	('TRAIT_POLITICAL_PHILOSOPHY_ADD_SPY',			'Amount',				1),
	('TRAIT_DEFENSIVE_TACTICS_SPY_CAPACITY',		'Amount',				1),
	('TRAIT_DEFENSIVE_TACTICS_ADD_SPY',				'UnitType',				'UNIT_SPY'),
	('TRAIT_DEFENSIVE_TACTICS_ADD_SPY',				'Amount',				1);


------------------------------------------------------------------------------------------------------------
-- Ikanda bug in captured cities 
-- delete from TraitModifiers where ModifierId like 'TRAIT_IKANDA_%';

--insert or ignore into DistrictModifiers	(DistrictType,	ModifierId)
--select	'DISTRICT_IKANDA',	'TRAIT_IKANDA_' || BuildingType || '_GOLD' from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or ignore into DistrictModifiers	(DistrictType,	ModifierId)
--select	'DISTRICT_IKANDA',	'TRAIT_IKANDA_' || BuildingType || '_SCIENCE' from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
--select	'TRAIT_IKANDA_' || BuildingType || '_GOLD',	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',	'CITY_HAS_' || BuildingType from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
--select	'TRAIT_IKANDA_' || BuildingType || '_SCIENCE',	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',	'CITY_HAS_' || BuildingType from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
--select	'TRAIT_IKANDA_' || BuildingType || '_GOLD',	'YieldType',	'YIELD_GOLD' from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
--select	'TRAIT_IKANDA_' || BuildingType || '_GOLD',	'Amount',	2 from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
--select	'TRAIT_IKANDA_' || BuildingType || '_SCIENCE',	'YieldType',	'YIELD_SCIENCE' from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
--select	'TRAIT_IKANDA_' || BuildingType || '_SCIENCE',	'Amount',	1 from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or replace into RequirementSets	(RequirementSetId,	RequirementSetType)
--select	'CITY_HAS_' || BuildingType, 'REQUIREMENTSET_TEST_ALL' from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

--insert or replace into RequirementSetRequirements	(RequirementSetId,	RequirementId)
--select	'CITY_HAS_' || BuildingType, 'REQUIRES_CITY_HAS_' || BuildingType	from Buildings 
--where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

------------------------------------------------------------------------------------------------
-- America
insert or replace into Modifiers
	(ModifierId,							ModifierType)
values
	('HD_AMERICA_PLAIN_PURCHASE',			'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'),
	('HD_AMERICA_PLAIN_HILLS_PURCHASE',		'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'),
	('HD_AMERICA_GRASS_PURCHASE',			'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'),
	('HD_AMERICA_GRASS_HILLS_PURCHASE',		'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
values
	('HD_AMERICA_PLAIN_PURCHASE',			'TerrainType',			'TERRAIN_PLAINS'),
	('HD_AMERICA_PLAIN_PURCHASE',			'Amount',				-50),
	('HD_AMERICA_PLAIN_HILLS_PURCHASE',		'TerrainType',			'TERRAIN_PLAINS_HILLS'),
	('HD_AMERICA_PLAIN_HILLS_PURCHASE',		'Amount',				-50),
	('HD_AMERICA_GRASS_PURCHASE',			'TerrainType',			'TERRAIN_GRASS'),
	('HD_AMERICA_GRASS_PURCHASE',			'Amount',				-50),
	('HD_AMERICA_GRASS_HILLS_PURCHASE',		'TerrainType',			'TERRAIN_GRASS_HILLS'),
	('HD_AMERICA_GRASS_HILLS_PURCHASE',		'Amount',				-50);

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_FOUNDING_FATHERS',	'HD_AMERICA_PLAIN_PURCHASE'),
	('TRAIT_CIVILIZATION_FOUNDING_FATHERS',	'HD_AMERICA_PLAIN_HILLS_PURCHASE'),
	('TRAIT_CIVILIZATION_FOUNDING_FATHERS',	'HD_AMERICA_GRASS_PURCHASE'),
	('TRAIT_CIVILIZATION_FOUNDING_FATHERS',	'HD_AMERICA_GRASS_HILLS_PURCHASE');

-- Netherlands la

delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_GROTE_RIVIEREN' and ModifierId = 'TRAIT_CAMPUS_RIVER_ADJACENCY';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_GROTE_RIVIEREN' and ModifierId = 'TRAIT_INDUSTRIAL_ZONE_RIVER_ADJACENCY';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_GROTE_RIVIEREN' and ModifierId = 'TRAIT_THEATER_DISTRICT_RIVER_ADJACENCY';
delete from TraitModifiers where TraitType = 'TRAIT_RADIO_ORANJE';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_GROTE_RIVIEREN' and ModifierId = 'TRAIT_HARBOR_CULTURE_BOMB';
insert or replace into TraitModifiers
	(TraitType, 								ModifierId)
values
	('TRAIT_RADIO_ORANJE',						'TRAIT_SHIPYARD_TRADE_ROUTE'),
	('TRAIT_RADIO_ORANJE',						'TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE'),
	('TRAIT_RADIO_ORANJE',						'TRAIT_INCOMING_TRADE_GAIN_SCIENCE'),
	('TRAIT_RADIO_ORANJE',						'TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE_DARK'),
	('TRAIT_RADIO_ORANJE',						'TRAIT_INCOMING_TRADE_GAIN_SCIENCE_DARK'),
	('TRAIT_CIVILIZATION_GROTE_RIVIEREN',		'POLDER_HARBOR_TIER_1_BUILDING_ATTACH'),
	('TRAIT_CIVILIZATION_GROTE_RIVIEREN',		'POLDER_HARBOR_TIER_2_BUILDING_ATTACH'),
	('TRAIT_CIVILIZATION_GROTE_RIVIEREN',		'POLDER_HARBOR_TIER_3_BUILDING_ATTACH'),
	('TRAIT_CIVILIZATION_GROTE_RIVIEREN',		'LAND_POLDER_COMMERCIAL_HUB_TIER_1_BUILDING_ATTACH'),
	('TRAIT_CIVILIZATION_GROTE_RIVIEREN',		'LAND_POLDER_COMMERCIAL_HUB_TIER_2_BUILDING_ATTACH'),
	('TRAIT_CIVILIZATION_GROTE_RIVIEREN',		'LAND_POLDER_COMMERCIAL_HUB_TIER_3_BUILDING_ATTACH');

insert or replace into Modifiers
	(ModifierId, 										ModifierType, 													SubjectRequirementSetId)
values
	('TRAIT_SHIPYARD_TRADE_ROUTE',							'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',						NULL),
	('TRAIT_SHIPYARD_TRADE_ROUTE_MODIFIER',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',					'BUILDING_IS_SHIPYARD'),
	('TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	NULL),
	('TRAIT_INCOMING_TRADE_GAIN_SCIENCE',					'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',	NULL),
	('TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE_DARK',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	'PLAYER_HAS_DARK_AGE'),
	('TRAIT_INCOMING_TRADE_GAIN_SCIENCE_DARK',				'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',	'PLAYER_HAS_DARK_AGE'),
	('POLDER_HARBOR_TIER_1_BUILDING_ATTACH',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',						'CITY_HAS_DISTRICT_HARBOR_TIER_1_BUILDING_REQUIREMENTS'),
	('POLDER_HARBOR_TIER_2_BUILDING_ATTACH',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',						'CITY_HAS_DISTRICT_HARBOR_TIER_2_BUILDING_REQUIREMENTS'),
	('POLDER_HARBOR_TIER_3_BUILDING_ATTACH',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',						'CITY_HAS_DISTRICT_HARBOR_TIER_3_BUILDING_REQUIREMENTS'),
	('POLDER_PRODUCTION',									'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'PLOT_HAS_IMPROVEMENT_POLDER_REQUIREMENTS'),
	('LAND_POLDER_COMMERCIAL_HUB_TIER_1_BUILDING_ATTACH',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',						'CITY_HAS_DISTRICT_COMMERCIAL_HUB_TIER_1_BUILDING_REQUIREMENTS'),
	('LAND_POLDER_COMMERCIAL_HUB_TIER_2_BUILDING_ATTACH',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',						'CITY_HAS_DISTRICT_COMMERCIAL_HUB_TIER_2_BUILDING_REQUIREMENTS'),
	('LAND_POLDER_COMMERCIAL_HUB_TIER_3_BUILDING_ATTACH',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',						'CITY_HAS_DISTRICT_COMMERCIAL_HUB_TIER_3_BUILDING_REQUIREMENTS'),
	('LAND_POLDER_PRODUCTION',								'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',					'PLOT_HAS_IMPROVEMENT_LAND_POLDER_REQUIREMENTS');

insert or replace into Modifiers
	(ModifierId, 				ModifierType,									RunOnce)
values
	('HD_CONSTRUCTION_BOOST',	'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',	1);

insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
values
	('TRAIT_SHIPYARD_TRADE_ROUTE',							'ModifierId',		'TRAIT_SHIPYARD_TRADE_ROUTE_MODIFIER'),
	('TRAIT_SHIPYARD_TRADE_ROUTE_MODIFIER', 				'Amount',			1),
	('TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE',				'YieldType',		'YIELD_SCIENCE'),
	('TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE',				'Amount',			2),
	('TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE',				'Intercontinental',	0),
	('TRAIT_INCOMING_TRADE_GAIN_SCIENCE',					'YieldType',		'YIELD_SCIENCE'),
	('TRAIT_INCOMING_TRADE_GAIN_SCIENCE',					'Amount',			2),
	('TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE_DARK',			'YieldType',		'YIELD_SCIENCE'),
	('TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE_DARK',			'Amount',			2),
	('TRAIT_INTERNATIONAL_TRADE_GAIN_SCIENCE_DARK',			'Intercontinental',	0),
	('TRAIT_INCOMING_TRADE_GAIN_SCIENCE_DARK',				'YieldType',		'YIELD_SCIENCE'),
	('TRAIT_INCOMING_TRADE_GAIN_SCIENCE_DARK',				'Amount',			2),
	('POLDER_HARBOR_TIER_1_BUILDING_ATTACH',				'ModifierId',		'POLDER_PRODUCTION'),
	('POLDER_HARBOR_TIER_2_BUILDING_ATTACH',				'ModifierId',		'POLDER_PRODUCTION'),
	('POLDER_HARBOR_TIER_3_BUILDING_ATTACH',				'ModifierId',		'POLDER_PRODUCTION'),
	('POLDER_PRODUCTION',									'YieldType',		'YIELD_PRODUCTION,YIELD_GOLD'),
	('POLDER_PRODUCTION',									'Amount',			'1,2'),
	('LAND_POLDER_COMMERCIAL_HUB_TIER_1_BUILDING_ATTACH',	'ModifierId',		'LAND_POLDER_PRODUCTION'),
	('LAND_POLDER_COMMERCIAL_HUB_TIER_2_BUILDING_ATTACH',	'ModifierId',		'LAND_POLDER_PRODUCTION'),
	('LAND_POLDER_COMMERCIAL_HUB_TIER_3_BUILDING_ATTACH',	'ModifierId',		'LAND_POLDER_PRODUCTION'),
	('LAND_POLDER_PRODUCTION',								'YieldType',		'YIELD_PRODUCTION,YIELD_GOLD'),
	('LAND_POLDER_PRODUCTION',								'Amount',			'1,2');

insert or replace into GlobalParameters
	(Name,							Value)
values 
	('NETHERLANDS_EXPLORATION',		1);
-- insert or replace into TraitModifiers
-- 	(TraitType, 								ModifierId)
-- select
-- 	'TRAIT_CIVILIZATION_GROTE_RIVIEREN',		'TRAIT_HARBOR_' || BuildingType || '_PURCHASE_CHEAPER_MODIFIER'
-- from Buildings where PrereqDistrict = 'DISTRICT_HARBOR';

-- insert or replace into Modifiers
-- 	(ModifierId,																ModifierType,											SubjectRequirementSetId)
-- select
-- 	'TRAIT_HARBOR_' || BuildingType || '_PURCHASE_CHEAPER_MODIFIER',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PURCHASE_COST',	NULL
-- from Buildings where PrereqDistrict = 'DISTRICT_HARBOR';

-- insert or replace into ModifierArguments
-- 	(ModifierId,																Name,					Value)
-- select
-- 	'TRAIT_HARBOR_' || BuildingType || '_PURCHASE_CHEAPER_MODIFIER',			'BuildingType',			BuildingType
-- from Buildings where PrereqDistrict = 'DISTRICT_HARBOR';


    insert or replace into ModifierArguments
	    (ModifierId,					            				Name,				Value)
    values
	  	--('POLDER_HARBOR_ATTACH',	                				'ModifierId',		'POLDER_PRODUCTION'),
        ('POLDER_HARBOR_TIER_1_BUILDING_ATTACH',					'ModifierId',		'POLDER_PRODUCTION'),
	    ('POLDER_HARBOR_TIER_2_BUILDING_ATTACH',					'ModifierId',		'POLDER_PRODUCTION'),
        ('POLDER_HARBOR_TIER_3_BUILDING_ATTACH',					'ModifierId',		'POLDER_PRODUCTION'),
	    ('POLDER_PRODUCTION',			            				'YieldType',		'YIELD_PRODUCTION,YIELD_GOLD'),
	    ('POLDER_PRODUCTION',			            				'Amount',			'1,2'),
		--('LAND_POLDER_COMMERCIAL_HUB_ATTACH',	                	'ModifierId',		'LAND_POLDER_PRODUCTION'),
        ('LAND_POLDER_COMMERCIAL_HUB_TIER_1_BUILDING_ATTACH',		'ModifierId',		'LAND_POLDER_PRODUCTION'),
	    ('LAND_POLDER_COMMERCIAL_HUB_TIER_2_BUILDING_ATTACH',		'ModifierId',		'LAND_POLDER_PRODUCTION'),
        ('LAND_POLDER_COMMERCIAL_HUB_TIER_3_BUILDING_ATTACH',		'ModifierId',		'LAND_POLDER_PRODUCTION'),
	    ('LAND_POLDER_PRODUCTION',			            			'YieldType',		'YIELD_PRODUCTION,YIELD_GOLD'),
	    ('LAND_POLDER_PRODUCTION',			            			'Amount',			'1,2');
		--
		--('NETHERLANDS_HARBOR_PRODUCTION',                     	'DistrictType',     'DISTRICT_HARBOR'),
    	--('NETHERLANDS_HARBOR_PRODUCTION',                     	'Amount',           30),
    	--('NETHERLANDS_HARBOR_BUILDING_PRODUCTION',           		'DistrictType',     'DISTRICT_HARBOR'),
   	 	--('NETHERLANDS_HARBOR_BUILDING_PRODUCTION',            	'Amount',           30),
		--('NETHERLANDS_COMMERCIAL_HUB_PRODUCTION',                 'DistrictType',     'DISTRICT_COMMERCIAL_HUB'),
    	--('NETHERLANDS_COMMERCIAL_HUB_PRODUCTION',                 'Amount',           30),
    	--('NETHERLANDS_COMMERCIAL_HUB_BUILDING_PRODUCTION',        'DistrictType',     'DISTRICT_COMMERCIAL_HUB'),
   	 	--('NETHERLANDS_COMMERCIAL_HUB_BUILDING_PRODUCTION',        'Amount',           30);

	
	insert or replace into RequirementSets
		(RequirementSetId,											RequirementSetType)
	values
		('HD_PLOT_IS_COAST_OR_OCEAN_AND_PLAYER_HAS_CONSTRUCTION',	'REQUIREMENTSET_TEST_ALL'),
		('HD_PLOT_IS_COAST_OR_OCEAN',								'REQUIREMENTSET_TEST_ANY');

	insert or replace into RequirementSetRequirements
		(RequirementSetId,											RequirementId)
	values
		('HD_PLOT_IS_COAST_OR_OCEAN_AND_PLAYER_HAS_CONSTRUCTION',	'REQUIRES_HD_PLOT_IS_COAST_OR_OCEAN'),
		('HD_PLOT_IS_COAST_OR_OCEAN_AND_PLAYER_HAS_CONSTRUCTION',	'HD_REQUIRES_PLAYER_HAS_TECH_CONSTRUCTION'),
		('HD_PLOT_IS_COAST_OR_OCEAN',								'REQUIRES_TERRAIN_COAST'),
		('HD_PLOT_IS_COAST_OR_OCEAN',								'REQUIRES_TERRAIN_OCEAN');


	insert or replace into Requirements
		(RequirementId,								RequirementType)
	VALUES
		('REQUIRES_HD_PLOT_IS_COAST_OR_OCEAN',		'REQUIREMENT_REQUIREMENTSET_IS_MET');
	insert or replace into RequirementArguments
		(RequirementId,								Name,					Value)
	values
		('REQUIRES_HD_PLOT_IS_COAST_OR_OCEAN',		'RequirementSetId',		'HD_PLOT_IS_COAST_OR_OCEAN');


-- Norway
delete from TraitModifiers where ModifierId = 'TRAIT_EARLY_OCEAN_NAVIGATION';
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'TRAIT_LEADER_PILLAGE_SCIENCE_FARMS'),
	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS'),
	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'TRAIT_LEADER_PILLAGE_MOVEMENT'),
	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'TRAIT_LEADER_COASTAL_RAID_MOVEMENT'),
	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'TRAIT_EARLY_OCEAN_NAVIGATION'),
	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'NORWAY_EXTRA_MOVEMENT'),
	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'TRAIT_LEADER_PILLAGE_FISHING_BOATS_SCIENCE'),
	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'TRAIT_LEADER_PILLAGE_FISHERY_CULTURE');

insert or replace into Modifiers
    (ModifierId,                                    ModifierType)
values
	('TRAIT_LEADER_PILLAGE_SCIENCE_FARMS',			'MODIFIER_PLAYER_ADJUST_ADDITIONAL_PILLAGING'),
	('TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS',	'MODIFIER_PLAYER_ADJUST_ADDITIONAL_PILLAGING'),
	('TRAIT_LEADER_PILLAGE_MOVEMENT',				'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER'),
	('TRAIT_LEADER_COASTAL_RAID_MOVEMENT',			'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER'),
	('TRAIT_LEADER_PILLAGE_MOVEMENT_MODIFIER',		'MODIFIER_PLAYER_UNIT_ADJUST_ADVANCED_PILLAGING'),
	('TRAIT_LEADER_COASTAL_RAID_MOVEMENT_MODIFIER',	'MODIFIER_PLAYER_UNIT_ADJUST_ADVANCED_COASTAL_RAID'),
	('TRAIT_LEADER_PILLAGE_FISHING_BOATS_SCIENCE',	'MODIFIER_PLAYER_ADJUST_ADDITIONAL_PILLAGING'),
	('TRAIT_LEADER_PILLAGE_FISHERY_CULTURE',		'MODIFIER_PLAYER_ADJUST_ADDITIONAL_PILLAGING');

insert or replace into ModifierArguments
    (ModifierId,                                    Name,               		Value)
values
	('TRAIT_LEADER_PILLAGE_SCIENCE_FARMS',			'PlunderType',				'PLUNDER_SCIENCE'),
	('TRAIT_LEADER_PILLAGE_SCIENCE_FARMS',			'ImprovementType',			'IMPROVEMENT_FARM'),
	('TRAIT_LEADER_PILLAGE_SCIENCE_FARMS',			'Amount',					15),
	('TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS',	'PlunderType',				'PLUNDER_SCIENCE'),
	('TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS',	'ImprovementType',			'IMPROVEMENT_LUMBER_MILL'),
	('TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS',	'Amount',					15),
	('TRAIT_LEADER_PILLAGE_MOVEMENT',				'ModifierId',				'TRAIT_LEADER_PILLAGE_MOVEMENT_MODIFIER'),
	('TRAIT_LEADER_COASTAL_RAID_MOVEMENT',			'ModifierId',				'TRAIT_LEADER_COASTAL_RAID_MOVEMENT_MODIFIER'),
	('TRAIT_LEADER_PILLAGE_MOVEMENT_MODIFIER',		'UseAdvancedPillaging',		1),
	('TRAIT_LEADER_COASTAL_RAID_MOVEMENT_MODIFIER',	'UseAdvancedCoastalRaid',	1),
	('TRAIT_LEADER_PILLAGE_FISHING_BOATS_SCIENCE',	'PlunderType',				'PLUNDER_SCIENCE'),
	('TRAIT_LEADER_PILLAGE_FISHING_BOATS_SCIENCE',	'ImprovementType',			'IMPROVEMENT_FISHING_BOATS'),
	('TRAIT_LEADER_PILLAGE_FISHING_BOATS_SCIENCE',	'Amount',					25),
	('TRAIT_LEADER_PILLAGE_FISHERY_CULTURE',		'PlunderType',				'PLUNDER_CULTURE'),
	('TRAIT_LEADER_PILLAGE_FISHERY_CULTURE',		'ImprovementType',			'IMPROVEMENT_FISHERY'),
	('TRAIT_LEADER_PILLAGE_FISHERY_CULTURE',		'Amount',					25);

insert or replace into TraitModifiers
	(TraitType,										ModifierId)
values
--	('TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION',	'NORWAY_LUMBER_MILL_PRODUCTION'),
	('TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION',	'NORWAY_FISHING_BOATS_PRODUCTION');
--	('TRAIT_LEADER_UNIT_NORWEGIAN_LONGSHIP',		'UNIT_NORWEGIAN_LONGSHIP_COASTAL_RAID');
--	('TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION',	'NORWAY_EXTRA_MOVEMENT');

insert or replace into Modifiers
	(ModifierId,									ModifierType,										SubjectRequirementSetId)
values
	('NORWAY_LUMBER_MILL_PRODUCTION',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_LUMBER_MILL_REQUIREMENTS'),
	('NORWAY_FISHING_BOATS_PRODUCTION',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
	('NORWAY_EXTRA_MOVEMENT',						'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',			'NORWAY_EXTRA_MOVEMENT_REQUIREMENTS'),
	('UNIT_NORWEGIAN_LONGSHIP_COASTAL_RAID',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',				NULL);

insert or replace into ModifierArguments
	(ModifierId,									Name,				Value)
values
	('NORWAY_LUMBER_MILL_PRODUCTION',				'YieldType',		'YIELD_PRODUCTION'),
	('NORWAY_LUMBER_MILL_PRODUCTION',				'Amount',			1),
	('NORWAY_FISHING_BOATS_PRODUCTION',				'YieldType',		'YIELD_PRODUCTION'),
	('NORWAY_FISHING_BOATS_PRODUCTION',				'Amount',			1),
	('NORWAY_EXTRA_MOVEMENT',						'Amount',			1),
	('UNIT_NORWEGIAN_LONGSHIP_COASTAL_RAID',		'AbilityType',		'ABILITY_LONGSHIP_COASTAL_RAID');
/*
挪威长船改为uu
狂暴武士改为老挪威lu
挪威单位加速新增海军袭击者（传统挪威la）
*/
delete from CivilizationTraits where TraitType = 'TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER';
delete from LeaderTraits where TraitType = 'TRAIT_LEADER_UNIT_NORWEGIAN_LONGSHIP';
insert or replace into CivilizationTraits
	(CivilizationType,					TraitType)
values
	('CIVILIZATION_NORWAY',				'TRAIT_LEADER_UNIT_NORWEGIAN_LONGSHIP');
insert or replace into LeaderTraits
	(LeaderType,						TraitType)
values
	('LEADER_HARDRADA',					'TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER');

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
select
	'TRAIT_LEADER_MELEE_COASTAL_RAIDS',		'TRAIT_' || EraType ||'_NAVAL_RAIDER_PRODUCTION'
from Eras;

insert or replace into Modifiers
	(ModifierId,											ModifierType)
select
	'TRAIT_' || EraType ||'_NAVAL_RAIDER_PRODUCTION',		'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'
from Eras;

insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'TRAIT_' || EraType ||'_NAVAL_RAIDER_PRODUCTION',		'Amount',			50
from Eras;

insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'TRAIT_' || EraType ||'_NAVAL_RAIDER_PRODUCTION',		'EraType',			EraType
from Eras;

insert or replace into ModifierArguments
	(ModifierId,											Name,							Value)
select
	'TRAIT_' || EraType ||'_NAVAL_RAIDER_PRODUCTION',		'UnitPromotionClass',			'PROMOTION_CLASS_NAVAL_RAIDER'
from Eras;
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_MELEE_COASTAL_RAIDS' and ModifierId like '%_PRODUCTION';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_MELEE_COASTAL_RAIDS' and ModifierId like 'TRAIT_LEADER_PILLAGE_CULTURE_%';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_MELEE_COASTAL_RAIDS' and ModifierId like 'TRAIT_LEADER_PILLAGE_SCIENCE_%';
insert or replace into TypeTags
	(Type,								Tag)
values
	('ABILITY_MELEE_COASTAL_RAID',		'CLASS_NAVAL_RANGED');
-- 日本
delete from TraitModifiers where ModifierId = 'TRAIT_HURRICANE_PREVENTION_CAT_4';
delete from TraitModifiers where ModifierId = 'TRAIT_HURRICANE_PREVENTION_CAT_5';
delete from TraitModifiers where ModifierId = 'TRAIT_HURRICANE_DOUBLE_DAMAGE_CAT_4';
delete from TraitModifiers where ModifierId = 'TRAIT_HURRICANE_DOUBLE_DAMAGE_CAT_5';

update ModifierArguments set Value = 'DISTRICT_HARBOR' where ModifierId = 'TRAIT_BOOST_ENCAMPMENT_PRODUCTION' and Name = 'DistrictType';
update ModifierArguments set Value = 50 where ModifierId = 'TRAIT_BOOST_ENCAMPMENT_PRODUCTION' and Name = 'Amount';
update ModifierArguments set Value = 50 where ModifierId = 'TRAIT_BOOST_HOLY_SITE_PRODUCTION' and Name = 'Amount';
update ModifierArguments set Value = 50 where ModifierId = 'TRAIT_BOOST_THEATER_DISTRICT_PRODUCTION' and Name = 'Amount';

-- 蒙古: 商路每经过一个贸易站+1瓶
-- 成吉思汗: 牧场给圣地和商业提供标准加成
-- by xiaoxiao
insert or replace into TraitModifiers
	(TraitType, 							ModifierId)
values
	('TRAIT_CIVILIZATION_MONGOLIAN_ORTOO',	'HD_MONGOLIA_TRADE_ROUTE_SCIENCE_FOR_POST_OWN'),
	('TRAIT_CIVILIZATION_MONGOLIAN_ORTOO',	'HD_MONGOLIA_TRADE_ROUTE_SCIENCE_FOR_POST_FOREIGN'),
--	('TRAIT_LEADER_GENGHIS_KHAN_ABILITY',	'HD_GENGHIS_KHAN_PASTURE_HOLY_SITE_ADJACENCY'),
	('TRAIT_LEADER_GENGHIS_KHAN_ABILITY',	'HD_GENGHIS_KHAN_PASTURE_COMMERCIAL_HUB_ADJACENCY'),
	('TRAIT_LEADER_GENGHIS_KHAN_ABILITY',	'HD_GENGHIS_KHAN_PASTURE_COMBAT_SCIENCE');
insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	('HD_MONGOLIA_TRADE_ROUTE_SCIENCE_FOR_POST_OWN', 		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_POST_IN_OWN_CITY'),
	('HD_MONGOLIA_TRADE_ROUTE_SCIENCE_FOR_POST_FOREIGN', 	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_POST_IN_FOREIGN_CITY'),
	('HD_GENGHIS_KHAN_PASTURE_HOLY_SITE_ADJACENCY',			'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY'),
	('HD_GENGHIS_KHAN_PASTURE_COMMERCIAL_HUB_ADJACENCY',	'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY'),
	('HD_GENGHIS_KHAN_PASTURE_COMBAT_SCIENCE',				'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD');
insert or replace into ModifierArguments
	(ModifierId, 											Name, 						Value)
values
	('HD_MONGOLIA_TRADE_ROUTE_SCIENCE_FOR_POST_OWN', 		'YieldType', 				'YIELD_SCIENCE'),
	('HD_MONGOLIA_TRADE_ROUTE_SCIENCE_FOR_POST_OWN', 		'Amount', 					1),
	('HD_MONGOLIA_TRADE_ROUTE_SCIENCE_FOR_POST_FOREIGN', 	'YieldType', 				'YIELD_SCIENCE'),
	('HD_MONGOLIA_TRADE_ROUTE_SCIENCE_FOR_POST_FOREIGN', 	'Amount', 					1),
	('HD_GENGHIS_KHAN_PASTURE_HOLY_SITE_ADJACENCY', 		'DistrictType',				'DISTRICT_HOLY_SITE'),
	('HD_GENGHIS_KHAN_PASTURE_HOLY_SITE_ADJACENCY', 		'ImprovementType',			'IMPROVEMENT_PASTURE'),
	('HD_GENGHIS_KHAN_PASTURE_HOLY_SITE_ADJACENCY', 		'YieldType',				'YIELD_FAITH'),
	('HD_GENGHIS_KHAN_PASTURE_HOLY_SITE_ADJACENCY', 		'Amount',					1),
	('HD_GENGHIS_KHAN_PASTURE_HOLY_SITE_ADJACENCY', 		'Description',				'LOC_GENGHIS_KHAN_PASTURE_HOLY_SITE'),
	('HD_GENGHIS_KHAN_PASTURE_COMMERCIAL_HUB_ADJACENCY', 	'DistrictType',				'DISTRICT_COMMERCIAL_HUB'),
	('HD_GENGHIS_KHAN_PASTURE_COMMERCIAL_HUB_ADJACENCY', 	'ImprovementType',			'IMPROVEMENT_PASTURE'),
	('HD_GENGHIS_KHAN_PASTURE_COMMERCIAL_HUB_ADJACENCY', 	'YieldType',				'YIELD_GOLD'),
	('HD_GENGHIS_KHAN_PASTURE_COMMERCIAL_HUB_ADJACENCY', 	'Amount',					2),
	('HD_GENGHIS_KHAN_PASTURE_COMMERCIAL_HUB_ADJACENCY', 	'Description',				'LOC_GENGHIS_KHAN_PASTURE_COMMERCIAL_HUB'),
	('HD_GENGHIS_KHAN_PASTURE_COMBAT_SCIENCE',				'PercentDefeatedStrength',	50),
	('HD_GENGHIS_KHAN_PASTURE_COMBAT_SCIENCE',				'YieldType',				'YIELD_SCIENCE');

-- 祖鲁: 拥有驻军的城市+1琴
-- UD伊坎达: 文化炸弹, 地基和其中建筑+2瓶+2锤
-- by xiaoxiao
insert or replace into TraitModifiers
	(TraitType, 							ModifierId)
values
	('TRAIT_CIVILIZATION_ZULU_ISIBONGO',	'HD_ZULU_GARRISON_CULTURE'),
	('TRAIT_CIVILIZATION_ZULU_ISIBONGO',	'HD_IKANDA_CULTURE_BOMB'),
	('TRAIT_CIVILIZATION_ZULU_ISIBONGO',	'HD_IKANDA_SCIENCE'),
	('TRAIT_CIVILIZATION_ZULU_ISIBONGO',	'HD_IKANDA_PRODUCTION');
insert or replace into Modifiers
	(ModifierId,							ModifierType, 										SubjectRequirementSetId)
values
	('HD_ZULU_GARRISON_CULTURE',		 	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	-- ('HD_ZULU_GARRISON_CULTURE_MODIFIER', 	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',			null),
	('HD_IKANDA_CULTURE_BOMB', 				'MODIFIER_ALL_PLAYERS_ADD_CULTURE_BOMB_TRIGGER',	null),
	('HD_IKANDA_SCIENCE', 					'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'HD_DISTRICT_IS_IKANDA'),
	('HD_IKANDA_PRODUCTION', 				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'HD_DISTRICT_IS_IKANDA');
insert or replace into ModifierArguments
	(ModifierId, 							Name, 			Value)
values
	-- ('HD_ZULU_GARRISON_CULTURE',		 	'ModifierId',	'HD_ZULU_GARRISON_CULTURE_MODIFIER'),
	('HD_ZULU_GARRISON_CULTURE', 			'YieldType', 	'YIELD_CULTURE'),
	('HD_ZULU_GARRISON_CULTURE', 			'Amount', 		1),
	('HD_IKANDA_CULTURE_BOMB', 				'DistrictType',	'DISTRICT_IKANDA'),
	('HD_IKANDA_SCIENCE', 					'YieldType', 	'YIELD_SCIENCE'),
	('HD_IKANDA_SCIENCE', 					'Amount', 		2),
	('HD_IKANDA_PRODUCTION', 				'YieldType', 	'YIELD_PRODUCTION'),
	('HD_IKANDA_PRODUCTION', 				'Amount', 		2);
insert or replace into RequirementSets
	(RequirementSetId,			RequirementSetType)
values
	('HD_DISTRICT_IS_IKANDA',	'REQUIREMENTSET_TEST_ALL');
insert or replace into RequirementSetRequirements
	(RequirementSetId,			RequirementId)
values
	('HD_DISTRICT_IS_IKANDA',	'REQUIRES_DISTRICT_IS_DISTRICT_IKANDA');

-- 伊坎达建筑+2瓶+2锤
delete from TraitModifiers where ModifierId like 'TRAIT_IKANDA_%';
create temporary table IkandaBuildings (BuildingType text);
insert or ignore into IkandaBuildings (BuildingType) select BuildingType from Buildings where PrereqDistrict = 'DISTRICT_ENCAMPMENT';
create temporary table IkandaYields (YieldType text);
insert or ignore into IkandaYields (YieldType) values ('YIELD_SCIENCE'), ('YIELD_PRODUCTION');
insert or replace into DistrictModifiers
	(DistrictType, 		ModifierId)
select
	'DISTRICT_IKANDA', 	'HD_IKANDA_' || BuildingType || '_' || YieldType
from IkandaBuildings left outer join IkandaYields;

insert or replace into Modifiers
	(ModifierId,										ModifierType)
select
	'HD_IKANDA_' || BuildingType || '_' || YieldType,	'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_YIELD'
from IkandaBuildings left outer join IkandaYields;

insert or replace into ModifierArguments
	(ModifierId, 										Name, 			Value)
select
	'HD_IKANDA_' || BuildingType || '_' || YieldType,	'BuildingType', BuildingType
from IkandaBuildings left outer join IkandaYields;

insert or replace into ModifierArguments
	(ModifierId, 										Name, 			Value)
select
	'HD_IKANDA_' || BuildingType || '_' || YieldType,	'YieldType', 	YieldType
from IkandaBuildings left outer join IkandaYields;

insert or replace into ModifierArguments
	(ModifierId, 										Name, 			Value)
select
	'HD_IKANDA_' || BuildingType || '_' || YieldType,	'Amount', 		2
from IkandaBuildings left outer join IkandaYields;

update Technologies set Description = NULL where TechnologyType = 'TECH_CASTLES';

-- Japan
delete from ExcludedAdjacencies where TraitType = 'TRAIT_CIVILIZATION_ADJACENT_DISTRICTS';

--刚果UA
delete from TraitModifiers where ModifierId like 'TRAIT_NKISI_GREAT_WORK_GOLD_GREATWORKOBJECT_%';
delete from TraitModifiers where ModifierId like 'TRAIT_NKISI_GREAT_WORK_FAITH_GREATWORKOBJECT_%';
delete from TraitModifiers where ModifierId like 'TRAIT_DOUBLE_%' and TraitType = 'TRAIT_CIVILIZATION_NKISI';
update ModifierArguments set Value = 4 where Name = 'YieldChange' and (ModifierId like 'TRAIT_NKISI_GREAT_WORK_FOOD_GREATWORKOBJECT_%' or ModifierId like 'TRAIT_NKISI_GREAT_WORK_PRODUCTION_GREATWORKOBJECT_%') and not(ModifierId = 'TRAIT_NKISI_GREAT_WORK_FOOD_GREATWORKOBJECT_WRITING' or ModifierId = 'TRAIT_NKISI_GREAT_WORK_PRODUCTION_GREATWORKOBJECT_WRITING');
--男刚果LA
delete from TraitModifiers where ModifierId = 'TRAIT_FREE_APOSTLE_FINISH_MBANZA' or ModifierId = 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT';
delete from ExcludedDistricts where TraitType = 'TRAIT_LEADER_RELIGIOUS_CONVERT';
insert or replace into TraitModifiers
	(TraitType,							ModifierId)
values
	('TRAIT_LEADER_RELIGIOUS_CONVERT',	'TRAIT_DOUBLE_ARTIST_POINTS'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT',	'TRAIT_DOUBLE_MUSICIAN_POINTS'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT',	'TRAIT_DOUBLE_MERCHANT_POINTS'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT',	'TRAIT_DOUBLE_WRITER_POINTS');
update ModifierArguments set Value = 50 where
	ModifierId = 'TRAIT_DOUBLE_WRITER_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 50 where
	ModifierId = 'TRAIT_DOUBLE_ARTIST_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 50 where
	ModifierId = 'TRAIT_DOUBLE_MUSICIAN_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 50 where
	ModifierId = 'TRAIT_DOUBLE_MERCHANT_POINTS' and Name = 'Amount';
--萨拉丁LU变UU
delete from LeaderTraits where LeaderType = 'LEADER_SALADIN' and TraitType = 'TRAIT_CIVILIZATION_UNIT_ARABIAN_MAMLUK';
insert or replace into CivilizationTraits
	(CivilizationType,					TraitType)
values 
	('CIVILIZATION_ARABIA',				'TRAIT_CIVILIZATION_UNIT_ARABIAN_MAMLUK');
--萨拉丁增加攻占的城市
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_LAST_PROPHET',		'TRAIT_SCIENCE_PER_CITY_NOT_FOUNDED');
insert or replace into Modifiers
	(ModifierId,									ModifierType,								SubjectRequirementSetId)
values
	('TRAIT_SCIENCE_PER_CITY_NOT_FOUNDED',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'CITY_NOT_FOUNDED'),
	('TRAIT_SCIENCE_PER_CITY_NOT_FOUNDED_MODIFIER',	'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE',		NULL);
insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('TRAIT_SCIENCE_PER_CITY_NOT_FOUNDED',			'ModifierId',	'TRAIT_SCIENCE_PER_CITY_NOT_FOUNDED_MODIFIER'),
	('TRAIT_SCIENCE_PER_CITY_NOT_FOUNDED_MODIFIER',	'Amount',		4),
	('TRAIT_SCIENCE_PER_CITY_NOT_FOUNDED_MODIFIER',	'YieldType',	'YIELD_SCIENCE');
--马普切
--ua所有靠山的区域（不包含奇观）+1 [ICON_FOOD] 食物和+1 [ICON_FAITH] 信仰值，相邻山脉单元格的改良设施+1 [ICON_FOOD] 食物和+1 [ICON_FAITH] 信仰值。单位如果相邻山脉单元格开始一个回合，会获得1 [ICON_MOVEMENT] 移动力加成。
--la与自由城市或处在黄金/英雄时代中的文明作战时+5 [ICON_STRENGTH] 战斗力。[ICON_GOVERNOR] 总督就职城市中生产的所有单位的战斗经验值+50%。
update ModifierArguments set Value = 5 where ModifierId = 'TRAIT_TOQUI_COMBAT_BONUS_VS_GOLDEN_AGE_CIV';
delete from TraitModifiers where ModifierId = 'TRAIT_DIMINISH_LOYALTY_IN_ENEMY_CITY';
update ModifierArguments set Value = 50 where ModifierId = 'TOQUI_GOVERNOR_UNIT_EXPERIENCE';
delete from TraitModifiers where ModifierId in(
	'TOQUI_CULTURE_FROM_GOVERNOR',
	'TOQUI_CULTURE_GOVERNOR_NOT_FOUNDED',
	'TOQUI_DOMESTIC_LOYALTY',
	'TOQUI_FOREIGN_LOYALTY',
	'TOQUI_PRODUCTION_FROM_GOVERNOR',
	'TOQUI_PRODUCTION_GOVERNOR_NOT_FOUNDED',
	'TRAIT_TOQUI_UNIT_EXPERIENCE_FROM_GOVERNOR',
	'TRAIT_TOQUI_UNIT_EXPERIENCE_FROM_GOVERNOR_NOT_FOUNDED'
);

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_MAPUCHE_TOQUI',	'TOQUI_DISTRICT_FOOD'),
	('TRAIT_CIVILIZATION_MAPUCHE_TOQUI',	'TOQUI_DISTRICT_FAITH'),
	('TRAIT_CIVILIZATION_MAPUCHE_TOQUI',	'TOQUI_PLOT_FOOD'),
	('TRAIT_CIVILIZATION_MAPUCHE_TOQUI',	'TOQUI_PLOT_FAITH'),
	('TRAIT_CIVILIZATION_MAPUCHE_TOQUI',	'TOQUI_MOUNTAIN_MOVEMENT'),
	('TRAIT_LEADER_LAUTARO_ABILITY',		'TRAIT_TOQUI_UNIT_EXPERIENCE_FROM_GOVERNOR');

insert or replace into Modifiers
	(ModifierId,							ModifierType,										SubjectRequirementSetId)
values
	('TOQUI_DISTRICT_FOOD',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'PLOT_ADJACENT_TO_MOUNTAIN_IS_NOT_WONDER_REQUIREMENTS'),
	('TOQUI_DISTRICT_FAITH',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'PLOT_ADJACENT_TO_MOUNTAIN_IS_NOT_WONDER_REQUIREMENTS'),
	('TOQUI_PLOT_FOOD',						'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_ADJACENT_TO_MOUNTAIN_IS_IMPROVED_REQUIREMENTS'),
	('TOQUI_PLOT_FAITH',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_ADJACENT_TO_MOUNTAIN_IS_IMPROVED_REQUIREMENTS'),
	('TOQUI_MOUNTAIN_MOVEMENT',				'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',			'PLOT_ADJACENT_TO_MOUNTAIN_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,							Name,						Value)
values
	('TOQUI_DISTRICT_FOOD',					'Amount',					1),
	('TOQUI_DISTRICT_FOOD',					'YieldType',				'YIELD_FOOD'),
	('TOQUI_DISTRICT_FAITH',				'Amount',					1),
	('TOQUI_DISTRICT_FAITH',				'YieldType',				'YIELD_FAITH'),
	('TOQUI_PLOT_FOOD',						'Amount',					1),
	('TOQUI_PLOT_FOOD',						'YieldType',				'YIELD_FOOD'),
	('TOQUI_PLOT_FAITH',					'Amount',					1),
	('TOQUI_PLOT_FAITH',					'YieldType',				'YIELD_FAITH'),
	('TOQUI_MOUNTAIN_MOVEMENT',				'Amount',					1);
--印度
update ModifierArguments set Value = 500 where ModifierId = 'TRAIT_ORIGIN_DESTINATION_RELIGIOUS_PRESSURE' and Name = 'Amount';
--阿兹特克
update ModifierArguments set Value = 30 where ModifierId = 'TRAIT_BUILDER_DISTRICT_PERCENT';
--瑞典
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_NOBEL_PRIZE';
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_NOBEL_PRIZE',		'TRAIT_NOBEL_PRIZE_GREAT_PERSON_DISCOUNT_HD');

insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
	('TRAIT_NOBEL_PRIZE_GREAT_PERSON_DISCOUNT_HD',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_PATRONAGE_DISCOUNT_PERCENT');

insert or replace into ModifierArguments
	(ModifierId,									Name,						Value)
values
	('TRAIT_NOBEL_PRIZE_GREAT_PERSON_DISCOUNT_HD',	'Amount',					8),
	('TRAIT_NOBEL_PRIZE_GREAT_PERSON_DISCOUNT_HD',	'YieldType',				'YIELD_GOLD');
--毛利
delete from TraitModifiers where ModifierId = 'BUILDER_PRESETTLEMENT'; 
delete from TraitModifiers where ModifierId like 'TRAIT_MAORI_PRODUCTION_%';
delete from ExcludedGreatPersonClasses where TraitType = 'TRAIT_CIVILIZATION_MAORI_MANA';
insert or replace into TraitModifiers
	(TraitType,							ModifierId)
values
	('TRAIT_CIVILIZATION_MAORI_MANA',	'TRAIT_MAORI_WOODS'),
--	('TRAIT_CIVILIZATION_MAORI_MANA',	'TRAIT_MAORI_SWAMP'),
	('TRAIT_CIVILIZATION_MAORI_MANA',	'TRAIT_MAORI_RAINFOREST'),
	('TRAIT_CIVILIZATION_MAORI_MANA',	'TRAIT_MAORI_MARSH');
insert or replace into TraitModifiers
	(TraitType,							ModifierId)
select
	'TRAIT_CIVILIZATION_MAORI_MANA',	'TRAIT_MAORI_SWAMP'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_HD_SWAMP');
insert or replace into Modifiers
	(ModifierId,						ModifierType,							SubjectRequirementSetId)
values
	('TRAIT_MAORI_WOODS',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_WOODS_TECH_ASTROLOGY_REQUIREMENTS'),
--	('TRAIT_MAORI_SWAMP',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_SWAMP_TECH_ASTROLOGY_REQUIREMENTS'),
	('TRAIT_MAORI_RAINFOREST',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_RAINFOREST_TECH_ASTROLOGY_REQUIREMENTS'),
	('TRAIT_MAORI_MARSH',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_MARSH_TECH_ASTROLOGY_REQUIREMENTS');
insert or replace into Modifiers
	(ModifierId,						ModifierType,							SubjectRequirementSetId)
select
	'TRAIT_MAORI_SWAMP',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_SWAMP_TECH_ASTROLOGY_REQUIREMENTS'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_HD_SWAMP');
insert or replace into ModifierArguments
	(ModifierId,						Name,				Value)
values
	('TRAIT_MAORI_WOODS',				'YieldType',		'YIELD_FOOD'),
	('TRAIT_MAORI_WOODS',				'Amount',			1),
--	('TRAIT_MAORI_SWAMP',				'YieldType',		'YIELD_FOOD'),
--	('TRAIT_MAORI_SWAMP',				'Amount',			1),
	('TRAIT_MAORI_RAINFOREST',			'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_MAORI_RAINFOREST',			'Amount',			1),
	('TRAIT_MAORI_MARSH',				'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_MAORI_MARSH',				'Amount',			1);
insert or replace into ModifierArguments
	(ModifierId,						Name,				Value)
select
	'TRAIT_MAORI_SWAMP',				'YieldType',		'YIELD_FOOD'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_HD_SWAMP');
insert or replace into ModifierArguments
	(ModifierId,						Name,				Value)
select
	'TRAIT_MAORI_SWAMP',				'Amount',			1
where exists (select FeatureType from Features where FeatureType = 'FEATURE_HD_SWAMP');
--武美
delete from TraitModifiers where ModifierId = 'TRAIT_ROOSEVELT_COROLLARY_TRADE_ROUTE_TOKEN';
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_LEADER_ROOSEVELT_COROLLARY',	'TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_SCIENCE'),
	('TRAIT_LEADER_ROOSEVELT_COROLLARY',	'TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_GOLD'),
	('TRAIT_LEADER_ROOSEVELT_COROLLARY',	'TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_ENVOY');
insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	('TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_STATE_TRADE_ROUTE_DISTRICT_YIELD'),
	('TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_GOLD',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_STATE_TRADE_ROUTE_DISTRICT_YIELD'),
	('TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_ENVOY',		'MODIFIER_PLAYER_ADJUST_TOKEN_ON_TRADE_ROUTE_STARTED');
insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
values
	('TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_SCIENCE',		'Amount',			1),
	('TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_SCIENCE',		'YieldType',		'YIELD_SCIENCE'),
	('TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_GOLD',			'Amount',			2),
	('TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_GOLD',			'YieldType',		'YIELD_GOLD'),
	('TRAIT_LEADER_ROOSEVELT_COROLLARY_TRADE_ENVOY',		'Amount',			1);
delete from LeaderTraits where LeaderType = 'LEADER_SULEIMAN' and TraitType = 'TRAIT_LEADER_UNIT_SULEIMAN_JANISSARY';
insert or replace into CivilizationTraits
	(CivilizationType,			TraitType)
values
	('CIVILIZATION_OTTOMAN',	'TRAIT_LEADER_UNIT_SULEIMAN_JANISSARY');
--武印度
--武印度la重做： 每解锁一级政体，为每个公民+0.5生产力，为所有军事单位+2力（酋邦不算，完成政治哲学吃第一次）。拥有市政广场的城市生产的单位+1移动力。解锁“军事传统”后获得领土扩张战争借口。宣布领土扩张战争后10回合内所有单位+1移动力。
update ModifierArguments set Value = 'CIVIC_MILITARY_TRADITION' where ModifierId = 'TRAIT_TERRITORIAL_WAR_PREREQ_OVERRIDE' and Name = 'CivicType';
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_TERRITORIAL_WAR_MOVEMENT' and Name = 'Amount';
delete from TraitModifiers where ModifierId = 'TRAIT_TERRITORIAL_WAR_COMBAT';
insert or replace into TraitModifiers
	(TraitType,							ModifierId)
values
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_MOVEMENT'),
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_1'),
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_2'),
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_3'),
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_4'),
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_1'),
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_2'),
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_3'),
	('TRAIT_LEADER_ARTHASHASTRA',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_4');
insert or replace into Modifiers
	(ModifierId,											ModifierType,															SubjectRequirementSetId)
values
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_MOVEMENT',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								'CITY_HAS_DISTRICT_GOVERNMENT_REQUIREMENTS'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_MOVEMENT_MODIFIER',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',					NULL),
	('ARTHASHASTRA_EXTRA_MOVEMENT',							'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',									NULL),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_1',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'PLAYER_HAS_GOVERNMENTS_TIER_1'),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_2',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'PLAYER_HAS_GOVERNMENTS_TIER_2'),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_3',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'PLAYER_HAS_GOVERNMENTS_TIER_3'),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_4',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'PLAYER_HAS_GOVERNMENTS_TIER_4'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_1',			'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER',								'PLAYER_HAS_GOVERNMENTS_TIER_1'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_2',			'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER',								'PLAYER_HAS_GOVERNMENTS_TIER_2'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_3',			'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER',								'PLAYER_HAS_GOVERNMENTS_TIER_3'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_4',			'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER',								'PLAYER_HAS_GOVERNMENTS_TIER_4'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									NULL);
insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
values
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_MOVEMENT',			'ModifierId',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_MOVEMENT_MODIFIER'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_MOVEMENT_MODIFIER',	'AbilityType',		'ABILITY_ARTHASHASTRA_EXTRA_MOVEMENT'),
	('ARTHASHASTRA_EXTRA_MOVEMENT',							'Amount',			1),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_1',			'Amount',			0.5),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_1',			'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_2',			'Amount',			0.5),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_2',			'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_3',			'Amount',			0.5),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_3',			'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_4',			'Amount',			0.5),
	('TRAIT_LEADER_ARTHASHASTRA_POP_PRODUCTION_4',			'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_1',			'ModifierId',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_2',			'ModifierId',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_3',			'ModifierId',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_4',			'ModifierId',		'TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH'),
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH',			'Amount',			2);
insert or replace into ModifierStrings
	(ModifierId,											Context,			Text)
values
	('TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH',			'Preview',			'+{1_Amount}{LOC_TRAIT_LEADER_ARTHASHASTRA_EXTRA_STRENGTH_PREVIEW_TEXT}');
--美国
delete from TraitModifiers where ModifierId = 'TRAIT_ANTIQUES_AND_PARKS_CULTURE_FORESTS_OR_WONDERS' or ModifierId = 'TRAIT_ANTIQUES_AND_PARKS_SCIENCE_NATIONAL_WONDERS_OR_MOUNTAINS';
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
select
	'TRAIT_LEADER_ANTIQUES_AND_PARKS',		'TRAIT_LEADER_ANTIQUES_AND_PARKS_BASE'
where exists (select TraitType from Traits where TraitType = 'TRAIT_LEADER_ANTIQUES_AND_PARKS');
insert or replace into Modifiers
	(ModifierId,														ModifierType,									SubjectRequirementSetId)
values
	('TRAIT_LEADER_ANTIQUES_AND_PARKS_BASE',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'PLOT_BREATHTAKING_APPEAL');
insert or replace into ModifierArguments
	(ModifierId,														Name,						Value)
values
	('TRAIT_LEADER_ANTIQUES_AND_PARKS_BASE',							'YieldType',				'YIELD_CULTURE,YIELD_SCIENCE'),
	('TRAIT_LEADER_ANTIQUES_AND_PARKS_BASE',							'Amount',					'1,1');