--建表克利欧佩特拉建筑，列能力类型/建筑类型（含有区域拓展建筑，用select表方式避免无区域拓展的报错）(因为加载顺序问题单独放置)
CREATE TEMPORARY TABLE 'CleopatraGrace_Buildings'  
	('TraitType' TEXT NOT NULL,  'BuildingType' TEXT NOT NULL);
/*
insert or replace into CleopatraGrace_Buildings
    (TraitType,        				BuildingType)
values
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_FAIR'),--集市
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_WHARF_TRADE'),--贸易港市
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_MBARI'),--姆巴里
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_TOURNEY'),--勾栏瓦舍
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_LIGHTHOUSE_TRADE'),--贸易码头
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_FREEPORT'),--商港
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_SHIPYARD'),--造船厂
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_SEAPORT'),--海港
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_CRUISE_TERMINAL'),--游轮码头
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_MARKET'),--市场
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_MINT'),--铸币厂
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_WAYSTATION'),--货栈
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_GUILDHALL'),--工商会馆
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_MERCHANT_QUARTER'),--商人中心
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_BANK'),--银行
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_JNR_MARKETING_AGENCY'),--市场部
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_STOCK_EXCHANGE'),--证券交易所
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_HD_TAVERN'),--酒楼
    ('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_HD_INN'),--客栈
	('TRAIT_LEADER_MEDITERRANEAN',  'BUILDING_SHOPPING_MALL');--购物商场
*/
insert or replace into CleopatraGrace_Buildings
	(TraitType,						BuildingType)
select
	'TRAIT_LEADER_MEDITERRANEAN',	BuildingType
from Building_YieldChanges where (YieldType = 'YIELD_GOLD' and BuildingType != 'BUILDING_PALACE');
--埃及女王 影响力
insert or replace into TraitModifiers
	(TraitType,						ModifierId)
select
	'TRAIT_LEADER_MEDITERRANEAN',	'MEDITERRANEAN_ISIS_' || BuildingType || '_CURRENCY_MAJESTY'
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);
insert or replace into Modifiers
	(ModifierId,													ModifierType,								SubjectRequirementSetId)
select
	'MEDITERRANEAN_ISIS_' || BuildingType || '_CURRENCY_MAJESTY',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'HD_ISIS_CITY_HAS_' || BuildingType
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

insert or replace into ModifierArguments
	(ModifierId,													Name,			Value)
select
	'MEDITERRANEAN_ISIS_' || BuildingType || '_CURRENCY_MAJESTY',	'ModifierId',	'MEDITERRANEAN_ISIS_' || BuildingType || '_CM'
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

insert or replace into Modifiers
	(ModifierId,													ModifierType,										SubjectRequirementSetId,	RunOnce)
select
	'MEDITERRANEAN_ISIS_' || BuildingType || '_CM',					'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',	NULL,						0
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'MEDITERRANEAN_ISIS_' || BuildingType || '_CM',					'Amount',				2
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

--埃及女王 外交支持
insert or replace into TraitModifiers
	(TraitType,						ModifierId)
select
	'TRAIT_LEADER_MEDITERRANEAN',	'MEDITERRANEAN_ISIS_' || BuildingType || '_DIPLOMATIC_ALLIANCE'
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

insert or replace into Modifiers
	(ModifierId,													ModifierType,								SubjectRequirementSetId)
select
	'MEDITERRANEAN_ISIS_' || BuildingType || '_DIPLOMATIC_ALLIANCE','MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'HD_ISIS_CITY_HAS_' || BuildingType
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

insert or replace into ModifierArguments
	(ModifierId,													Name,			Value)
select
	'MEDITERRANEAN_ISIS_' || BuildingType || '_DIPLOMATIC_ALLIANCE','ModifierId',	'MEDITERRANEAN_ISIS_' || BuildingType || '_DA'
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

insert or replace into Modifiers
	(ModifierId,													ModifierType,									SubjectRequirementSetId,	RunOnce)
select
	'MEDITERRANEAN_ISIS_' || BuildingType || '_DA',					'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN',	NULL,						0
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
select
	'MEDITERRANEAN_ISIS_' || BuildingType || '_DA',					'Amount',				1
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

--补REQ
insert or replace into RequirementSets
	(RequirementSetId,							RequirementSetType)
select
	'HD_ISIS_CITY_HAS_' || BuildingType,		'REQUIREMENTSET_TEST_ALL'
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);

insert or replace into RequirementSetRequirements
	(RequirementSetId,							RequirementId)
select
	'HD_ISIS_CITY_HAS_' || BuildingType,		'REQUIRES_CITY_HAS_' || BuildingType
from CleopatraGrace_Buildings where BuildingType in (select BuildingType from HD_BuildingTiers);
--调整埃及女王原LA数值
update ModifierArguments set value = 6 where ModifierId ='TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD' and Name = 'Amount';
update ModifierArguments set value = 3 where ModifierId ='TRAIT_INCOMING_TRADE_GAIN_GOLD' and Name = 'Amount';
update ModifierArguments set value = 3 where ModifierId ='TRAIT_INCOMING_TRADE_OFFER_FOOD' and Name = 'Amount';
update ModifierArguments set value = 2 where ModifierId ='TRAIT_ALLIANCE_POINTS_FROM_TRADE' and Name = 'Amount';

insert or replace into TraitModifiers 
	(TraitType,								ModifierId) 
values
--新增：外来商路从埃及女王处获得粮食外，也获得3金币
	('TRAIT_LEADER_MEDITERRANEAN',			'TRAIT_INCOMING_TRADE_GAIN_FOOD'),
--新增：埃及女王从外来商路得3粮
	('TRAIT_LEADER_MEDITERRANEAN',			'TRAIT_INCOMING_TRADE_OFFER_GOLD');
insert or replace into Modifiers
	(ModifierId,							ModifierType,													Permanent)
values
	('TRAIT_INCOMING_TRADE_GAIN_FOOD',		'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',	0),
	('TRAIT_INCOMING_TRADE_OFFER_GOLD',		'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS',	0);
insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
values
	('TRAIT_INCOMING_TRADE_GAIN_FOOD',		'YieldType',			'YIELD_FOOD'),
	('TRAIT_INCOMING_TRADE_GAIN_FOOD',		'Amount',				3),
	('TRAIT_INCOMING_TRADE_OFFER_GOLD',		'YieldType',			'YIELD_GOLD'),
	('TRAIT_INCOMING_TRADE_OFFER_GOLD',		'Amount',				3);