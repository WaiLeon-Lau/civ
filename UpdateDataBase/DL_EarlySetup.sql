-------------------------------------
--          Early Setup            --
-------------------------------------

-- Influence Bonus
--delete from TraitModifiers where
--    (TraitType in (select TraitType from CSE_ClassTypes)) and 
--    (ModifierId like '%_SMALL_INFLUENCE_%' or 
--    ModifierId like '%_MEDIUM_INFLUENCE_%' or 
--    ModifierId like '%_LARGE_INFLUENCE_%' or 
--    ModifierId like '%_LARGEST_INFLUENCE_%' or
--    ModifierId like 'MODIFIER_CSE_%');

create table if not exists CityStateInfluenceBonus_HD(
    Type                TEXT    not NULL,
    TraitType           TEXT    not NULL,
    Level               TEXT    not NULL,
    YieldType           TEXT    not NULL,
    Tier                INT     DEFAULT 0,
    Amount              INT     DEFAULT 0,
    AttachModifierId    TEXT    DEFAULT NULL,
    ModifierId          TEXT    DEFAULT NULL,
    ModifierType        TEXT    DEFAULT NULL,
    RequirementSetId    TEXT    DEFAULT NULL,
    IsYieldChange       INT     DEFAULT 0,
    PRIMARY KEY('Type', 'Level', 'YieldType'));

insert or replace into CityStateInfluenceBonus_HD (Type, TraitType, Tier, Level, YieldType, Amount)
select Type, TraitType, 0, 'SMALL',     'YIELD_FOOD', 1 from CSE_ClassTypes;
insert or replace into CityStateInfluenceBonus_HD (Type, TraitType, Tier, Level, YieldType, Amount)
select Type, TraitType, 1, 'MEDIUM',    'YIELD_FOOD', 1 from CSE_ClassTypes;
insert or replace into CityStateInfluenceBonus_HD (Type, TraitType, Tier, Level, YieldType, Amount)
select Type, TraitType, 2, 'LARGE',     'YIELD_FOOD', 2 from CSE_ClassTypes;
insert or replace into CityStateInfluenceBonus_HD (Type, TraitType, Tier, Level, YieldType, Amount)
select Type, TraitType, 3, 'LARGEST',   'YIELD_FOOD', 3 from CSE_ClassTypes;
update CityStateInfluenceBonus_HD set YieldType = 'YIELD_SCIENCE'       where Type = 'SCIENTIFIC';
update CityStateInfluenceBonus_HD set YieldType = 'YIELD_FAITH'         where Type = 'RELIGIOUS';
update CityStateInfluenceBonus_HD set YieldType = 'YIELD_GOLD'          where Type = 'TRADE';
update CityStateInfluenceBonus_HD set YieldType = 'YIELD_CULTURE'       where Type = 'CULTURAL';
update CityStateInfluenceBonus_HD set YieldType = 'YIELD_PRODUCTION'    where Type = 'MILITARISTIC';
update CityStateInfluenceBonus_HD set YieldType = 'YIELD_PRODUCTION'    where Type = 'INDUSTRIAL';
-- 
update CityStateInfluenceBonus_HD set YieldType = 'YIELD_GOLD'          where Type = 'CSE_MARITIME';

insert or replace into CityStateInfluenceBonus_HD
    (Type,          TraitType,                      Tier,   Level,      YieldType,              Amount)
values
    ('INDUSTRIAL',  'MINOR_CIV_INDUSTRIAL_TRAIT',   0,      'SMALL',    'BUILDING_PRODUCTION',  1),
    ('INDUSTRIAL',  'MINOR_CIV_INDUSTRIAL_TRAIT',   1,      'MEDIUM',   'BUILDING_PRODUCTION',  1),
    ('INDUSTRIAL',  'MINOR_CIV_INDUSTRIAL_TRAIT',   2,      'LARGE',    'BUILDING_PRODUCTION',  2),
    ('INDUSTRIAL',  'MINOR_CIV_INDUSTRIAL_TRAIT',   3,      'LARGEST',  'BUILDING_PRODUCTION',  3);

update CityStateInfluenceBonus_HD set Amount = Amount * 2 where YieldType = 'YIELD_GOLD';
update CityStateInfluenceBonus_HD set IsYieldChange = YieldType in (select YieldType from Yields);
update CityStateInfluenceBonus_HD set ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE' where IsYieldChange = 1;
update CityStateInfluenceBonus_HD set ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_'||YieldType||'_CHANGE' where IsYieldChange = 0;
update CityStateInfluenceBonus_HD set ModifierType = 'MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_YIELD_CHANGE' where Level = 'SMALL' and IsYieldChange = 1;
update CityStateInfluenceBonus_HD set ModifierType = 'MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_'||YieldType where Level = 'SMALL' and IsYieldChange = 0;
update CityStateInfluenceBonus_HD set RequirementSetId = 'HD_CITY_HAS_'||Type||'_TIER_'||Tier||'_BUILDING_REQUIREMENTS' where Level != 'SMALL';
update CityStateInfluenceBonus_HD set ModifierId = TraitType || '_' || Level || '_INFLUENCE_' || YieldType || '_HD';
update CityStateInfluenceBonus_HD set AttachModifierId = ModifierId || '_ATTACH';

--insert or replace into TraitModifiers (TraitType, ModifierId) select TraitType, AttachModifierId from CityStateInfluenceBonus_HD;
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select AttachModifierId, 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_'||Level||'_INFLUENCE' from CityStateInfluenceBonus_HD;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select AttachModifierId, 'ModifierId', ModifierId from CityStateInfluenceBonus_HD;
insert or ignore into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId, ModifierType, RequirementSetId from CityStateInfluenceBonus_HD;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId, 'Amount', Amount from CityStateInfluenceBonus_HD;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId, 'YieldType', YieldType from CityStateInfluenceBonus_HD where IsYieldChange = 1;

insert or ignore into RequirementSets (RequirementSetId, RequirementSetType)
select RequirementSetId, 'REQUIREMENTSET_TEST_ANY' from CityStateInfluenceBonus_HD where Level != 'SMALL';
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                          RequirementId)
values
    ('HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_LIBRARY'),
    ('HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_RESEARCH_LAB'),
    ('HD_CITY_HAS_RELIGIOUS_TIER_1_BUILDING_REQUIREMENTS',      'REQUIRES_CITY_HAS_BUILDING_SHRINE'),
    ('HD_CITY_HAS_RELIGIOUS_TIER_2_BUILDING_REQUIREMENTS',      'REQUIRES_CITY_HAS_BUILDING_TEMPLE'),
    ('HD_CITY_HAS_TRADE_TIER_1_BUILDING_REQUIREMENTS',          'REQUIRES_CITY_HAS_BUILDING_MARKET'),
    ('HD_CITY_HAS_TRADE_TIER_2_BUILDING_REQUIREMENTS',          'REQUIRES_CITY_HAS_BUILDING_BANK'),
    ('HD_CITY_HAS_TRADE_TIER_3_BUILDING_REQUIREMENTS',          'REQUIRES_CITY_HAS_BUILDING_STOCK_EXCHANGE'),
    ('HD_CITY_HAS_TRADE_TIER_1_BUILDING_REQUIREMENTS',          'REQUIRES_CITY_HAS_BUILDING_LIGHTHOUSE'),
    ('HD_CITY_HAS_TRADE_TIER_2_BUILDING_REQUIREMENTS',          'REQUIRES_CITY_HAS_BUILDING_SHIPYARD'),
    ('HD_CITY_HAS_TRADE_TIER_3_BUILDING_REQUIREMENTS',          'REQUIRES_CITY_HAS_BUILDING_SEAPORT'),
    ('HD_CITY_HAS_CULTURAL_TIER_1_BUILDING_REQUIREMENTS',       'REQUIRES_CITY_HAS_BUILDING_AMPHITHEATER'),
    ('HD_CITY_HAS_CULTURAL_TIER_2_BUILDING_REQUIREMENTS',       'REQUIRES_CITY_HAS_BUILDING_MUSEUM_ART'),
    ('HD_CITY_HAS_CULTURAL_TIER_2_BUILDING_REQUIREMENTS',       'REQUIRES_CITY_HAS_BUILDING_MUSEUM_ARTIFACT'),
    ('HD_CITY_HAS_CULTURAL_TIER_3_BUILDING_REQUIREMENTS',       'REQUIRES_CITY_HAS_BUILDING_BROADCAST_CENTER'),
    ('HD_CITY_HAS_MILITARISTIC_TIER_1_BUILDING_REQUIREMENTS',   'REQUIRES_CITY_HAS_BUILDING_BARRACKS'),
    ('HD_CITY_HAS_MILITARISTIC_TIER_1_BUILDING_REQUIREMENTS',   'REQUIRES_CITY_HAS_BUILDING_STABLE'),
    ('HD_CITY_HAS_MILITARISTIC_TIER_2_BUILDING_REQUIREMENTS',   'REQUIRES_CITY_HAS_BUILDING_ARMORY'),
    ('HD_CITY_HAS_MILITARISTIC_TIER_3_BUILDING_REQUIREMENTS',   'REQUIRES_CITY_HAS_BUILDING_MILITARY_ACADEMY'),
    ('HD_CITY_HAS_INDUSTRIAL_TIER_1_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_WORKSHOP'),
    ('HD_CITY_HAS_INDUSTRIAL_TIER_2_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_FACTORY'),
    ('HD_CITY_HAS_INDUSTRIAL_TIER_3_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_POWER_PLANT'),
    ('HD_CITY_HAS_INDUSTRIAL_TIER_3_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_COAL_POWER_PLANT'),
    ('HD_CITY_HAS_INDUSTRIAL_TIER_3_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_FOSSIL_FUEL_POWER_PLANT');

insert or replace into RequirementSetRequirements (RequirementSetId,    RequirementId)
select 'HD_CITY_HAS_CSE_AGRICULTURAL_TIER_1_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_GRANARY'
from CSE_ClassTypes where Type = 'CSE_AGRICULTURAL';
insert or replace into RequirementSetRequirements (RequirementSetId,    RequirementId)
select 'HD_CITY_HAS_CSE_AGRICULTURAL_TIER_2_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_DISTRICT_AQUEDUCT'
from CSE_ClassTypes where Type = 'CSE_AGRICULTURAL';
insert or replace into RequirementSetRequirements (RequirementSetId,    RequirementId)
select 'HD_CITY_HAS_CSE_AGRICULTURAL_TIER_3_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_SEWER'
from CSE_ClassTypes where Type = 'CSE_AGRICULTURAL';

-- Assume Maritime is enabled when CIVITAS enabled.
update RequirementSetRequirements set RequirementSetId = 'HD_CITY_HAS_CSE_MARITIME_TIER_1_BUILDING_REQUIREMENTS'
where exists (select Type from CSE_ClassTypes where Type = 'CSE_MARITIME') and 
    (RequirementSetId = 'HD_CITY_HAS_TRADE_TIER_1_BUILDING_REQUIREMENTS' and RequirementId = 'REQUIRES_CITY_HAS_BUILDING_LIGHTHOUSE');
update RequirementSetRequirements set RequirementSetId = 'HD_CITY_HAS_CSE_MARITIME_TIER_2_BUILDING_REQUIREMENTS'
where exists (select Type from CSE_ClassTypes where Type = 'CSE_MARITIME') and 
    (RequirementSetId = 'HD_CITY_HAS_TRADE_TIER_2_BUILDING_REQUIREMENTS' and RequirementId = 'REQUIRES_CITY_HAS_BUILDING_SHIPYARD');
update RequirementSetRequirements set RequirementSetId = 'HD_CITY_HAS_CSE_MARITIME_TIER_3_BUILDING_REQUIREMENTS'
where exists (select Type from CSE_ClassTypes where Type = 'CSE_MARITIME') and 
    (RequirementSetId = 'HD_CITY_HAS_TRADE_TIER_3_BUILDING_REQUIREMENTS' and RequirementId = 'REQUIRES_CITY_HAS_BUILDING_SEAPORT');

-- moved from DistrictExpansionHD, by xhh
insert or ignore into RequirementSets
	(RequirementSetId,												RequirementSetType)
values
	('HD_CITY_HAS_COMMERCIAL_TIER_1_BUILDING_REQUIREMENTS',		    'REQUIREMENTSET_TEST_ANY'),
	('HD_CITY_HAS_COMMERCIAL_TIER_2_BUILDING_REQUIREMENTS',		    'REQUIREMENTSET_TEST_ANY'),
    ('HD_CITY_HAS_COMMERCIAL_TIER_3_BUILDING_REQUIREMENTS',		    'REQUIREMENTSET_TEST_ANY'),

    ('HD_CITY_HAS_HARBOR_TIER_1_BUILDING_REQUIREMENTS',      		'REQUIREMENTSET_TEST_ANY'),
    ('HD_CITY_HAS_HARBOR_TIER_2_BUILDING_REQUIREMENTS',      		'REQUIREMENTSET_TEST_ANY'),
    ('HD_CITY_HAS_HARBOR_TIER_3_BUILDING_REQUIREMENTS',      		'REQUIREMENTSET_TEST_ANY');

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                          RequirementId)
values
    ('HD_CITY_HAS_COMMERCIAL_TIER_1_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_MARKET'),
    ('HD_CITY_HAS_COMMERCIAL_TIER_2_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_BANK'),
    ('HD_CITY_HAS_COMMERCIAL_TIER_3_BUILDING_REQUIREMENTS',     'REQUIRES_CITY_HAS_BUILDING_STOCK_EXCHANGE'),
    ('HD_CITY_HAS_HARBOR_TIER_1_BUILDING_REQUIREMENTS',         'REQUIRES_CITY_HAS_BUILDING_LIGHTHOUSE'),
    ('HD_CITY_HAS_HARBOR_TIER_2_BUILDING_REQUIREMENTS',         'REQUIRES_CITY_HAS_BUILDING_SHIPYARD'),
    ('HD_CITY_HAS_HARBOR_TIER_3_BUILDING_REQUIREMENTS',         'REQUIRES_CITY_HAS_BUILDING_SEAPORT');

insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
select 'HD_CITY_HAS_RELIGIOUS_TIER_3_BUILDING_REQUIREMENTS', 'REQUIRES_CITY_HAS_'||BuildingType from Buildings where EnabledByReligion = 1;

-- 
insert or ignore into Requirements
    (RequirementId,                                     RequirementType)
values
    ('REQUIRES_HD_CITY_HAS_HARBOR_TIER_2_BUILDING',     'REQUIREMENT_REQUIREMENTSET_IS_MET'),
    ('REQUIRES_HD_CITY_HAS_COMMERCIAL_TIER_2_BUILDING', 'REQUIREMENT_REQUIREMENTSET_IS_MET'),
    ('REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING', 'REQUIREMENT_REQUIREMENTSET_IS_MET'),
    ('REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING', 'REQUIREMENT_REQUIREMENTSET_IS_MET'),
    ('REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING', 'REQUIREMENT_REQUIREMENTSET_IS_MET');

insert or ignore into RequirementArguments
    (RequirementId,                                     Name,               Value)
values
    ('REQUIRES_HD_CITY_HAS_HARBOR_TIER_2_BUILDING',     'RequirementSetId', 'HD_CITY_HAS_HARBOR_TIER_2_BUILDING_REQUIREMENTS'),
    ('REQUIRES_HD_CITY_HAS_COMMERCIAL_TIER_2_BUILDING', 'RequirementSetId', 'HD_CITY_HAS_COMMERCIAL_TIER_2_BUILDING_REQUIREMENTS'),
    ('REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING', 'RequirementSetId', 'HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING_REQUIREMENTS'),
    ('REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING', 'RequirementSetId', 'HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING_REQUIREMENTS'),
    ('REQUIRES_HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING', 'RequirementSetId', 'HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING_REQUIREMENTS');
