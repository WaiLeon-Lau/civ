-------------------------------------
--         Boosts Adjustment       --
-------------------------------------

update Boosts set NumItems = 2 where TechnologyType = 'TECH_BRONZE_WORKING';

update Boosts set ImprovementType = 'IMPROVEMENT_PASTURE' where TechnologyType = 'TECH_THE_WHEEL';
update Boosts set BoostClass = 'BOOST_TRIGGER_IMPROVE_SPECIFIC_RESOURCE', ResourceType = 'RESOURCE_HORSES' where TechnologyType = 'TECH_HORSEBACK_RIDING';
update Boosts set NumItems = 2 where TechnologyType = 'TECH_MASS_PRODUCTION';
-- update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', ImprovementType = NULL, NumItems = 0, BoostingCivicType = 'CIVIC_NAVAL_TRADITION' where TechnologyType = 'TECH_MASS_PRODUCTION';
update Boosts set BoostClass = 'BOOST_TRIGGER_OWN_X_UNITS_OF_TYPE', NumItems = 1 where CivicType = 'CIVIC_NAVAL_TRADITION';
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_IMPROVEMENTS', NumItems = 2, ImprovementType = 'IMPROVEMENT_CAMP' where CivicType = 'CIVIC_GAMES_RECREATION';

update Boosts set NumItems = 3 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Boosts set NumItems = 1, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', DistrictType = NULL, BuildingType = 'BUILDING_LIBRARY' where CivicType = 'CIVIC_RECORDED_HISTORY';
update Boosts set NumItems = 2, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', Unit1Type = NULL, BuildingType = 'BUILDING_AMPHITHEATER' where CivicType = 'CIVIC_HUMANISM';

update Boosts set NumItems = 1, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', Unit1Type = NULL, BuildingType = 'BUILDING_MONUMENT' where TechnologyType = 'TECH_WRITING';
update Boosts set NumItems = 0, Unit1Type = 'UNIT_SCOUT', BoostClass = 'BOOST_TRIGGER_MEET_CIV' where CivicType = 'CIVIC_FOREIGN_TRADE';

-- update Boosts set NumItems = 2, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS' where TechnologyType = 'TECH_ENGINEERING';

-- update Boosts set NumItems = 0, Unit1Type = 'UNIT_SPEARMAN', BoostClass = 'BOOST_TRIGGER_KILL_WITH' where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
update Boosts set Unit1Type = null, BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', BoostingCivicType = 'CIVIC_DEFENSIVE_TACTICS' where TechnologyType = 'TECH_MILITARY_TACTICS';

update Boosts set NumItems = 1, BoostClass = 'BOOST_TRIGGER_HAVE_X_DISTRICTS', Unit1Type = NULL, DistrictType = 'DISTRICT_DAM',
    TriggerDescription = 'LOC_BOOST_TRIGGER_ELECTRICITY_HD', TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_ELECTRICITY_HD' where TechnologyType = 'TECH_ELECTRICITY';

update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', BoostingCivicType = 'CIVIC_MILITARY_TRAINING',
    Unit1Type = NULL, NumItems = 0 where TechnologyType = 'TECH_METAL_CASTING';
update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', BoostingCivicType = 'CIVIC_DEFENSIVE_TACTICS',
    Unit1Type = NULL, NumItems = 0 where TechnologyType = 'TECH_CASTLES';
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_GREAT_GENERAL', NumItems = 0
    where TechnologyType = 'TECH_MILITARY_TACTICS';

-- 设定市政的鼓舞
insert or replace into Boosts
    (BoostID,   CivicType,                                  Boost,  TriggerDescription,                                     TriggerLongDescription,                                             Unit1Type,      BoostClass,                                         Unit2Type,      BuildingType,   ImprovementType,        BoostingTechType,           ResourceType,   NumItems,   DistrictType,           RequiresResource)
values
    (201,       'CIVIC_LITERARY_TRADITION_HD',              40,     'LOC_BOOST_TRIGGER_LITERARY_TRADITION_HD',              'LOC_BOOST_TRIGGER_LONGDESC_LITERARY_TRADITION_HD',                 NULL,           'BOOST_TRIGGER_RESEARCH_TECH',                      NULL,           NULL,           NULL,                   'TECH_PAPER_MAKING_HD',     NULL,           0,          NULL,                   0),
    (202,       'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',     40,     'LOC_BOOST_TRIGGER_IMPERIAL_EXAMINATION_SYSTEM_HD',     'LOC_BOOST_TRIGGER_LONGDESC_IMPERIAL_EXAMINATION_SYSTEM_HD',        NULL,           'BOOST_TRIGGER_HAVE_X_DISTRICTS',                   NULL,           NULL,           NULL,                   NULL,                       NULL,           2,          'DISTRICT_CAMPUS',      0),
    (203,       'CIVIC_EVOLUTION_THEORY_HD',                40,     'LOC_BOOST_TRIGGER_EVOLUTION_THEORY_HD',                'LOC_BOOST_TRIGGER_LONGDESC_EVOLUTION_THEORY_HD',                   NULL,           'BOOST_TRIGGER_NONE_LATE_GAME_CRITICAL_TECH',       NULL,           NULL,           NULL,                   NULL,                       NULL,           1,          NULL,                   0),
    (204,       'CIVIC_HISTORICAL_PHILOSOPHY_HD',           40,     'LOC_BOOST_TRIGGER_HISTORICAL_PHILOSOPHY_HD',           'LOC_BOOST_TRIGGER_LONGDESC_HISTORICAL_PHILOSOPHY_HD',              NULL,           'BOOST_TRIGGER_HAVE_X_DISTRICTS',                   NULL,           NULL,           NULL,                   NULL,                       NULL,           3,          'DISTRICT_THEATER',     0),
    (205,       'CIVIC_ETHICS_HD',                          40,     'LOC_BOOST_TRIGGER_ETHICS_HD',                          'LOC_BOOST_TRIGGER_LONGDESC_ETHICS_HD',                             NULL,           'BOOST_TRIGGER_RESEARCH_TECH',                      NULL,           NULL,           NULL,                   'TECH_PRINTING',            NULL,           0,          NULL,                   0),
    (206,       'CIVIC_SOCIAL_SCIENCE_HD',                  40,     'LOC_BOOST_TRIGGER_SOCIAL_SCIENCE_HD',                  'LOC_BOOST_TRIGGER_LONGDESC_SOCIAL_SCIENCE_HD',                     NULL,           'BOOST_TRIGGER_HAVE_X_UNIQUE_SPECIALTY_DISTRICTS',  NULL,           NULL,           NULL,                   NULL,                       NULL,           7,          NULL,                   0);

-- 设定科技的尤里卡
insert or replace into Boosts
    (BoostID,   TechnologyType,                             Boost,  TriggerDescription,                                     TriggerLongDescription,                                             Unit1Type,                   BoostClass,                                         Unit2Type,      BuildingType,       ImprovementType,              BoostingTechType,        BoostingCivicType,          ResourceType,   NumItems,   DistrictType,           RequiresResource)
values
    (250,       'TECH_CALENDAR_HD',                         40,     'LOC_BOOST_TRIGGER_CALENDAR_HD',                       'LOC_BOOST_TRIGGER_LONGDESC_CALENDAR_HD',                            NULL,                        'BOOST_TRIGGER_HAVE_X_BUILDINGS',                   NULL,           'BUILDING_GRANARY', NULL,                         NULL,                    NULL,                       NULL,           1,          NULL,                   0),
    (251,       'TECH_PAPER_MAKING_HD',                     40,     'LOC_BOOST_TRIGGER_PAPER_MAKING_HD',                   'LOC_BOOST_TRIGGER_LONGDESC_PAPER_MAKING_HD',                        NULL,                        'BOOST_TRIGGER_HAVE_X_IMPROVEMENTS',                NULL,           NULL,               'IMPROVEMENT_PLANTATION',     NULL,                    NULL,                       NULL,           1,          NULL,                   0),
    (252,       'TECH_COMPASS_HD',                          40,     'LOC_BOOST_TRIGGER_COMPASS_HD',                        'LOC_BOOST_TRIGGER_LONGDESC_COMPASS_HD',                             NULL,                        'BOOST_TRIGGER_RESEARCH_TECH',                      NULL,           NULL,               NULL,                         'TECH_MATHEMATICS',      NULL,                       NULL,           0,          NULL,                   0),
    (253,       'TECH_PHYSICS_HD',                          40,     'LOC_BOOST_TRIGGER_PHYSICS_HD',                        'LOC_BOOST_TRIGGER_LONGDESC_PHYSICS_HD',                             'UNIT_GREAT_SCIENTIST',      'BOOST_TRIGGER_TRAIN_UNIT',                         NULL,           NULL,               NULL,                         NULL,                    NULL,                       NULL,           0,          NULL,                   0),
    (254,       'TECH_BIOLOGY_HD',                          40,     'LOC_BOOST_TRIGGER_BIOLOGY_HD',                        'LOC_BOOST_TRIGGER_LONGDESC_BIOLOGY_HD',                             NULL,                        'BOOST_TRIGGER_HAVE_X_BUILDINGS',                   NULL,           'BUILDING_ZOO',     NULL,                         NULL,                    NULL,                       NULL,           1,          NULL,                   0),
    (255,       'TECH_CIVIL_ENGINEERING_HD',                40,     'LOC_BOOST_TRIGGER_CIVIL_ENGINEERING_HD',              'LOC_BOOST_TRIGGER_LONGDESC_CIVIL_ENGINEERING_HD',                   NULL,                        'BOOST_TRIGGER_HAVE_X_BUILDINGS',                   NULL,           'BUILDING_WORKSHOP',NULL,                         NULL,                    NULL,                       NULL,           2,          NULL,                   0);

-- 新科文版本 原有科文尤里卡&鼓舞调整
    -- 【教育】科技尤里卡改为：拥有科举制市政
update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', Unit1Type = NULL, NumItems = 0,
    BoostingCivicType = 'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD' where TechnologyType = 'TECH_EDUCATION';
    -- 【军事工程学】科技尤里卡改为：训练2个石弩
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_CATAPULT', NumItems = 2,
    DistrictType = NULL where TechnologyType = 'TECH_MILITARY_ENGINEERING';
    -- 【王权神授】市政鼓舞改为：训练1个使徒
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_APOSTLE', NumItems = 1,
    BuildingType = NULL where CivicType = 'CIVIC_DIVINE_RIGHT';
    -- 【归正会】市政鼓舞改为：建造2座寺庙
--update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', NumItems = 2,
--    BuildingType = 'BUILDING_TEMPLE' where CivicType = 'CIVIC_REFORMED_CHURCH';
    -- 【后勤补给】市政鼓舞改为：拥有轮子科技
update Boosts set BoostClass = 'BOOST_TRIGGER_RESEARCH_TECH', Unit1Type = NULL, NumItems = 0,
    BoostingTechType = 'TECH_THE_WHEEL' where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
    -- 【飞行】科技尤里卡改为：训练2个观测气球
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_OBSERVATION_BALLOON',
    NumItems = 2 where TechnologyType = 'TECH_FLIGHT';
    -- 【无线电】科技尤里卡改为：拥有殖民主义市政
update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC',
    BoostingCivicType = 'CIVIC_COLONIALISM' where TechnologyType = 'TECH_RADIO';
    -- 【制导系统】科技尤里卡改为：训练2个战斗机
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_FIGHTER',
    NumItems = 2 where TechnologyType = 'TECH_GUIDANCE_SYSTEMS';
    -- 【封建主义】市政鼓舞改为：建造5个农场
update Boosts set NumItems = 5 where BoostID = 15;
    -- 【电脑】科技尤里卡改为：建造一座铝矿
update Boosts set BoostClass = 'BOOST_TRIGGER_IMPROVE_SPECIFIC_RESOURCE', ImprovementType = 'IMPROVEMENT_MINE', 
    ResourceType = 'RESOURCE_ALUMINUM', NumItems = 0, GovernmentTierType = NULL where TechnologyType = 'TECH_COMPUTERS';
    -- 【纳米技术】科技尤里卡改为：建造一座铝矿，训练一个直升机
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_UNIT_AND_IMPROVEMENT', 
    Unit1Type = 'UNIT_HELICOPTER' where TechnologyType = 'TECH_NANOTECHNOLOGY';
    -- 【工业化】科技尤里卡改为：建造4座工业区
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_DISTRICTS', BuildingType = NULL, 
    NumItems = 4, DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' where TechnologyType = 'TECH_INDUSTRIALIZATION';
    -- 【外交部门】市政鼓舞改为：2级同盟
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_ALLIANCE_LEVEL_X', NumItems = 2 where CivicType = 'CIVIC_DIPLOMATIC_SERVICE';
    -- 【化学】科技尤里卡改为：大科或间谍触发
update Boosts set BoostClass = 'BOOST_TRIGGER_NONE_LATE_GAME_CRITICAL_TECH', NumItems = 0, TriggerDescription = 'LOC_BOOST_TRIGGER_MUST_STEAL_NO_GREAT_SCIENTIST', 
    TriggerLongDescription = 'Critical late game tech - boost description not needed' where TechnologyType = 'TECH_CHEMISTRY';
    -- 【横帆装置】科技尤里卡改为：建造一座硝石矿，训练一个轻快帆船
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_UNIT_AND_IMPROVEMENT', ImprovementType = 'IMPROVEMENT_MINE', 
    ResourceType = 'RESOURCE_NITER', Unit1Type = 'UNIT_CARAVEL' where TechnologyType = 'TECH_SQUARE_RIGGING';
    -- 【膛线】科技尤里卡改为：用火枪手击杀一个单位
--update Boosts set BoostClass = 'BOOST_TRIGGER_KILL_WITH', ImprovementType = NULL, 
--    ResourceType = NULL, Unit1Type = 'UNIT_MUSKETMAN' where TechnologyType = 'TECH_RIFLING';
--膛线尤里卡改为生产两个射石炮
--by 先驱
update Boosts set BoostClass = "BOOST_TRIGGER_TRAIN_UNIT", NumItems = 2, Unit1Type = "UNIT_BOMBARD",
    ImprovementType = NULL, ResourceType = NULL where TechnologyType ="TECH_RIFLING";

-- update boost ratio at last
update Boosts set Boost = 34 where Boost = 40;
--卫星远程通信ulk更改
update Boosts set TriggerDescription = 'LOC_BOOST_TECH_TELECOMMUNICATIONS_HD', TriggerLongDescription = 'LOC_BOOST_TECH_TELECOMMUNICATIONS_HD_LONG', BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', BuildingType = 'BUILDING_BROADCAST_CENTER', NumItems = 2 where TechnologyType = 'TECH_TELECOMMUNICATIONS';
update Boosts set TriggerDescription = 'LOC_BOOST_TECH_SATELLITES_HD', TriggerLongDescription = 'LOC_BOOST_TECH_SATELLITES_HD_LONG', BoostClass = 'BOOST_TRIGGER_RESEARCH_TECH', BoostingTechType = 'TECH_FUTURE_TECH', BuildingType = NULL, NumItems = 0 where TechnologyType = 'TECH_SATELLITES';
insert or replace into ProjectCompletionModifiers
	(ProjectType,						ModifierId)
values
	('PROJECT_LAUNCH_EARTH_SATELLITE',	'TECH_SATELLITES_BOOST');
insert or replace into Modifiers
	(ModifierId,						ModifierType)
values
	('TECH_SATELLITES_BOOST',			'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST');
insert or replace into ModifierArguments
	(ModifierId,						Name,			Value)
values
	('TECH_SATELLITES_BOOST',			'TechType',		'TECH_SATELLITES');
