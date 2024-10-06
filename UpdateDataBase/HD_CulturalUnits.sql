delete from UnitPromotions where UnitPromotionType="PROMOTION_ALBUM_COVER_ART";
delete from UnitPromotions where UnitPromotionType="PROMOTION_ARENA_ROCK";
delete from UnitPromotions where UnitPromotionType="PROMOTION_GLAM_ROCK";
delete from UnitPromotions where UnitPromotionType="PROMOTION_GOES_TO";
delete from UnitPromotions where UnitPromotionType="PROMOTION_INDIE";
delete from UnitPromotions where UnitPromotionType="PROMOTION_MUSIC_FESTIVAL";
delete from UnitPromotions where UnitPromotionType="PROMOTION_POP";
delete from UnitPromotions where UnitPromotionType="PROMOTION_REGGAE_ROCK";
delete from UnitPromotions where UnitPromotionType="PROMOTION_RELIGIOUS_ROCK";
delete from UnitPromotions where UnitPromotionType="PROMOTION_ROADIES";
delete from UnitPromotions where UnitPromotionType="PROMOTION_SPACE_ROCK";
delete from UnitPromotions where UnitPromotionType="PROMOTION_SURF_ROCK";

update Units set Maintenance="32" where UnitType = "UNIT_ROCK_BAND";
update Units set MustPurchase=0 where UnitType = "UNIT_ROCK_BAND";
update Units set CostProgressionParam1=200 where UnitType = "UNIT_ROCK_BAND";
update Units set NumRandomChoices=5 where UnitType = "UNIT_ROCK_BAND";
update Units set PurchaseYield="YIELD_GOLD" where UnitType = "UNIT_ROCK_BAND";
update Units_XP2 set TourismBomb="400" where UnitType = "UNIT_ROCK_BAND";
update GlobalParameters set Value="800" where Name = "TOURISM_BOMB_WONDER_ADDITIONAL";
update GlobalParameters set Value=6 where Name = "ROCK_BAND_MAX_LEVEL";
update GlobalParameters set Value=6 where Name = "ROCK_BAND_MAX_PROMOTIONS";

insert or replace into Requirements
    (RequirementId,                                     RequirementType)
values
	("REQUIRES_ROCK_BOMB_AOE_HD",						"REQUIREMENT_PLOT_ADJACENT_TO_OWNER");

insert or replace into RequirementArguments
    (RequirementId,                                     Name,                       Value)
values
	('REQUIRES_ROCK_BOMB_AOE_HD',						'MinDistance',			    0),
	('REQUIRES_ROCK_BOMB_AOE_HD',						'MaxDistance',			    6);

insert or replace into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
values
    ("REQUIRESETS_ROCK_BOMB_AOE_HD",                    "REQUIREMENTSET_TEST_ALL");

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values
    ("REQUIRESETS_ROCK_BOMB_AOE_HD",                    "REQUIRES_ROCK_BOMB_AOE_HD");

insert or replace into UnitAbilities
    (UnitAbilityType,                                   Name,                                           Description)
values
    ("ABILITY_ORAL_SCHOLAR_BOMB_ALL_HD",                "LOC_ABILITY_ORAL_SCHOLAR_BOMB_ALL_HD_NAME",    "LOC_ABILITY_ORAL_SCHOLAR_BOMB_ALL_HD_DESCRIPTION"),
    ("ABILITY_TRAVEL_THEATRE_BOMB_ALL_HD",              "LOC_ABILITY_TRAVEL_THEATRE_BOMB_ALL_HD_NAME",  "LOC_ABILITY_TRAVEL_THEATRE_BOMB_ALL_HD_DESCRIPTION"),
    ("ABILITY_ROCK_BAND_BOMB_ALL_HD",                   "LOC_ABILITY_ROCK_BAND_BOMB_ALL_HD_NAME",       "LOC_ABILITY_ROCK_BAND_BOMB_ALL_HD_DESCRIPTION"),

    ("ABILITY_ROCK_BASIC_YIELD_HD",                     "LOC_ABILITY_ROCK_BASIC_YIELD_HD_NAME",         "LOC_ABILITY_ROCK_BASIC_YIELD_HD_DESCRIPTION"),
    ("ABILITY_MALI_GRIOTS_BASIC_YIELD_HD",              "LOC_ABILITY_MALI_GRIOTS_BASIC_YIELD_HD_NAME",  "LOC_ABILITY_MALI_GRIOTS_BASIC_YIELD_HD_DESCRIPTION");

insert or replace into Types
	(Type,											    Kind)
values
    ("ABILITY_ORAL_SCHOLAR_BOMB_ALL_HD",                "KIND_ABILITY"),
    ("ABILITY_TRAVEL_THEATRE_BOMB_ALL_HD",              "KIND_ABILITY"),
    ("ABILITY_ROCK_BAND_BOMB_ALL_HD",              		"KIND_ABILITY"),

    ("ABILITY_ROCK_BASIC_YIELD_HD",                     "KIND_ABILITY"),
    ("ABILITY_MALI_GRIOTS_BASIC_YIELD_HD",              "KIND_ABILITY");

insert or replace into TypeTags
    (Type,                                              Tag)
values
    ("ABILITY_ORAL_SCHOLAR_BOMB_ALL_HD",              	"CLASS_ORAL_SCHOLAR_HD"),
    ("ABILITY_TRAVEL_THEATRE_BOMB_ALL_HD",              "CLASS_TRAVEL_THEATRE_HD"),
    ("ABILITY_ROCK_BAND_BOMB_ALL_HD",              		"CLASS_ROCK_BAND_HD"),

    ("ABILITY_ROCK_BASIC_YIELD_HD",                     "CLASS_ROCK_BAND"),
    ("ABILITY_MALI_GRIOTS_BASIC_YIELD_HD",              "CLASS_MALI_GRIOTS_HD");

insert or replace into UnitAbilityModifiers
    (UnitAbilityType,                                   ModifierId)
values
    ("ABILITY_ORAL_SCHOLAR_BOMB_ALL_HD",                "ORAL_SCHOLAR_TOURISM_BOMB_ALL_HD"),
    ("ABILITY_TRAVEL_THEATRE_BOMB_ALL_HD",              "TRAVEL_THEATRE_TOURISM_BOMB_ALL_HD"),
    ("ABILITY_ROCK_BAND_BOMB_ALL_HD",                   "ROCK_BAND_TOURISM_BOMB_ALL_HD"),

    ("ABILITY_ROCK_BASIC_YIELD_HD",                     "HD_ROCK_BASIC_YIELD_GOLD"),
    ("ABILITY_ROCK_BASIC_YIELD_HD",                     "HD_ROCK_BASIC_YIELD_CULTURE"),
    ("ABILITY_MALI_GRIOTS_BASIC_YIELD_HD",              "HD_MALI_GRIOTS_BASIC_YIELD_GOLD");

insert or replace into DistrictModifiers
    (DistrictType,                                      ModifierId)
values
    ("DISTRICT_CITY_CENTER",                            "CITY_ENABLE_ROCK_BAND_FAITH_PURCHASE_HD");

insert or replace into Modifiers
    (ModifierId,                                        ModifierType)
values
    ("ROCKBAND_MYSTICISM_WONDER_HD",                    "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_MYSTICISM_HOLY_SITE_HD",                 "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_MYSTICISM_LAVRA_HD",                     "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_MYSTICISM_NATIONAL_PARK_HD",             "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_NATIONAL_PARK"),
    ("ROCKBAND_MYSTICISM_NATURAL_WONDER_HD",            "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_NATURAL_WONDER"),
    ("ROCKBAND_CLASSICISM_HD",                          "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_CLASSICISM_ACROPOLIS_HD",                "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_ROMANTICISM_HD",                         "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_ROMANTICISM_HIPPODROME_HD",              "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_ROMANTICISM_STREET_CARNIVAL_HD",         "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_HEDONISM_HD",                            "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_HEDONISM_WATER_STREET_CARNIVAL_HD",      "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_HEDONISM_BEACH_RESORT_HD",               "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_IMPROVEMENT"),
    ("ROCKBAND_REALISM_HD",                             "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_REALISM_MBANZA_HD",                      "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_ACADEMISM_HD",                           "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_ACADEMISM_SEOWON_HD",                    "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_ACADEMISM_OBSERVATORY_HD",               "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_POPULARISM_HD",                          "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_POPULARISM_SUGUBA_HD",                   "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_POPULARISM_SUK_FLOATINGMARKET_HD",       "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_PLURALISM_HD",                           "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_PLURALISM_HANSA_HD",                     "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_PLURALISM_OPPIDUM_HD",                   "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_FISHER_SONG_HD",                         "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_FISHER_SONG_ROYAL_NAVY_DOCKYARD_HD",     "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    ("ROCKBAND_FISHER_SONG_COTHON_HD",                  "MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT"),
    
    ("ROCKBAND_GLEEMAN_HD",                             "MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT"),
    ("ROCKBAND_URBAN_OPERA_HD",                         "MODIFIER_PLAYER_UNIT_ADJUST_TOURISM_BOMB_ADDITIONAL_YIELD"),
    ("ROCKBAND_PAN_POLITICALIZATION_HD",                "MODIFIER_SINGLE_UNIT_ADJUST_POST_TOURISM_BOMB_LOYALTY"),
    ("ROCKBAND_WELL_KNOWN_HD",                          "MODIFIER_PLAYER_UNIT_ADJUST_TOURISM_BOMB_RANGE"),
    --文化单位无视地形河流
    ("HD_ROCK_IGNORE_ALL",                 				"MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST"),
    ("HD_ROCK_IGNORE_RIVERS",                           "MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_RIVERS"),
    --信仰购买文化单位
    ("CITY_ENABLE_ROCK_BAND_FAITH_PURCHASE_HD",         "MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE"),
    --文化单位基础额外产出
    ("HD_ROCK_BASIC_YIELD_GOLD",                        "MODIFIER_PLAYER_UNIT_ADJUST_TOURISM_BOMB_ADDITIONAL_YIELD"),
    ("HD_ROCK_BASIC_YIELD_CULTURE",                     "MODIFIER_PLAYER_UNIT_ADJUST_TOURISM_BOMB_ADDITIONAL_YIELD"),
    ("HD_MALI_GRIOTS_BASIC_YIELD_GOLD",                 "MODIFIER_PLAYER_UNIT_ADJUST_TOURISM_BOMB_ADDITIONAL_YIELD");

insert or replace into Modifiers
    (ModifierId,                                        ModifierType,                                                           SubjectRequirementSetId)
values
    --文化单位数量效应
    ("ORAL_SCHOLAR_TOURISM_BOMB_ALL_HD",                "MODIFIER_PLAYER_UNITS_ADJUST_ROCK_BAND_TOURISM_BOMB_VALUE_PEACE",      "REQUIRESETS_ROCK_BOMB_AOE_HD"),
    ("TRAVEL_THEATRE_TOURISM_BOMB_ALL_HD",              "MODIFIER_PLAYER_UNITS_ADJUST_ROCK_BAND_TOURISM_BOMB_VALUE_PEACE",      "REQUIRESETS_ROCK_BOMB_AOE_HD"),
    ("ROCK_BAND_TOURISM_BOMB_ALL_HD",                   "MODIFIER_PLAYER_UNITS_ADJUST_ROCK_BAND_TOURISM_BOMB_VALUE_PEACE",      "REQUIRESETS_ROCK_BOMB_AOE_HD");

insert or replace into ModifierArguments
    (ModifierId,                                        Name,                   Value)
values
    ("ROCKBAND_MYSTICISM_WONDER_HD",                    "DistrictType",         "DISTRICT_WONDER"),
    ("ROCKBAND_MYSTICISM_WONDER_HD",                    "Amount",               1),
    ("ROCKBAND_MYSTICISM_HOLY_SITE_HD",                 "DistrictType",         "DISTRICT_HOLY_SITE"),
    ("ROCKBAND_MYSTICISM_HOLY_SITE_HD",                 "Amount",               1),
    ("ROCKBAND_MYSTICISM_LAVRA_HD",                     "DistrictType",         "DISTRICT_LAVRA"),
    ("ROCKBAND_MYSTICISM_LAVRA_HD",                     "Amount",               1),
    ("ROCKBAND_MYSTICISM_NATIONAL_PARK_HD",             "Amount",               1),
    ("ROCKBAND_MYSTICISM_NATURAL_WONDER_HD",            "Amount",               1),
    ("ROCKBAND_CLASSICISM_HD",                          "DistrictType",         "DISTRICT_THEATER"),
    ("ROCKBAND_CLASSICISM_HD",                          "Amount",               2),
    ("ROCKBAND_CLASSICISM_ACROPOLIS_HD",                "DistrictType",         "DISTRICT_ACROPOLIS"),
    ("ROCKBAND_CLASSICISM_ACROPOLIS_HD",                "Amount",               2),
    ("ROCKBAND_ROMANTICISM_HD",                         "DistrictType",         "DISTRICT_ENTERTAINMENT_COMPLEX"),
    ("ROCKBAND_ROMANTICISM_HD",                         "Amount",               2),
    ("ROCKBAND_ROMANTICISM_HIPPODROME_HD",              "DistrictType",         "DISTRICT_HIPPODROME"),
    ("ROCKBAND_ROMANTICISM_HIPPODROME_HD",              "Amount",               2),
    ("ROCKBAND_ROMANTICISM_STREET_CARNIVAL_HD",         "DistrictType",         "DISTRICT_STREET_CARNIVAL"),
    ("ROCKBAND_ROMANTICISM_STREET_CARNIVAL_HD",         "Amount",               2),
    ("ROCKBAND_HEDONISM_HD",                            "DistrictType",         "DISTRICT_WATER_ENTERTAINMENT_COMPLEX"),
    ("ROCKBAND_HEDONISM_HD",                            "Amount",               2),
    ("ROCKBAND_HEDONISM_WATER_STREET_CARNIVAL_HD",      "DistrictType",         "DISTRICT_WATER_STREET_CARNIVAL"),
    ("ROCKBAND_HEDONISM_WATER_STREET_CARNIVAL_HD",      "Amount",               2),
    ("ROCKBAND_HEDONISM_BEACH_RESORT_HD",               "ImprovementType",      "IMPROVEMENT_BEACH_RESORT"),
    ("ROCKBAND_HEDONISM_BEACH_RESORT_HD",               "Amount",               2),
    ("ROCKBAND_REALISM_HD",                             "DistrictType",         "DISTRICT_NEIGHBORHOOD"),
    ("ROCKBAND_REALISM_HD",                             "Amount",               2),
    ("ROCKBAND_REALISM_MBANZA_HD",                      "DistrictType",         "DISTRICT_MBANZA"),
    ("ROCKBAND_REALISM_MBANZA_HD",                      "Amount",               2),
    ("ROCKBAND_ACADEMISM_HD",                           "DistrictType",         "DISTRICT_CAMPUS"),
    ("ROCKBAND_ACADEMISM_HD",                           "Amount",               2),
    ("ROCKBAND_ACADEMISM_SEOWON_HD",                    "DistrictType",         "DISTRICT_SEOWON"),
    ("ROCKBAND_ACADEMISM_SEOWON_HD",                    "Amount",               2),
    ("ROCKBAND_ACADEMISM_OBSERVATORY_HD",               "DistrictType",         "DISTRICT_OBSERVATORY"),
    ("ROCKBAND_ACADEMISM_OBSERVATORY_HD",               "Amount",               2),
    ("ROCKBAND_POPULARISM_HD",                          "DistrictType",         "DISTRICT_COMMERCIAL_HUB"),
    ("ROCKBAND_POPULARISM_HD",                          "Amount",               2),
    ("ROCKBAND_POPULARISM_SUGUBA_HD",                   "DistrictType",         "DISTRICT_SUGUBA"),
    ("ROCKBAND_POPULARISM_SUGUBA_HD",                   "Amount",               2),
    ("ROCKBAND_POPULARISM_SUK_FLOATINGMARKET_HD",       "DistrictType",         "DISTRICT_SUK_FLOATINGMARKET"),
    ("ROCKBAND_POPULARISM_SUK_FLOATINGMARKET_HD",       "Amount",               2),
    ("ROCKBAND_PLURALISM_HD",                           "DistrictType",         "DISTRICT_INDUSTRIAL_ZONE"),
    ("ROCKBAND_PLURALISM_HD",                           "Amount",               2),
    ("ROCKBAND_PLURALISM_HANSA_HD",                     "DistrictType",         "DISTRICT_HANSA"),
    ("ROCKBAND_PLURALISM_HANSA_HD",                     "Amount",               2),
    ("ROCKBAND_PLURALISM_OPPIDUM_HD",                   "DistrictType",         "DISTRICT_OPPIDUM"),
    ("ROCKBAND_PLURALISM_OPPIDUM_HD",                   "Amount",               2),
    ("ROCKBAND_FISHER_SONG_HD",                         "DistrictType",         "DISTRICT_HARBOR"),
    ("ROCKBAND_FISHER_SONG_HD",                         "Amount",               2),
    ("ROCKBAND_FISHER_SONG_ROYAL_NAVY_DOCKYARD_HD",     "DistrictType",         "DISTRICT_ROYAL_NAVY_DOCKYARD"),
    ("ROCKBAND_FISHER_SONG_ROYAL_NAVY_DOCKYARD_HD",     "Amount",               2),
    ("ROCKBAND_FISHER_SONG_COTHON_HD",                  "DistrictType",         "DISTRICT_COTHON"),
    ("ROCKBAND_FISHER_SONG_COTHON_HD",                  "Amount",               2),

    ("ROCKBAND_GLEEMAN_HD",                             "Amount",               4),
    ("ROCKBAND_URBAN_OPERA_HD",                         "YieldType",            "YIELD_GOLD"),
    ("ROCKBAND_URBAN_OPERA_HD",                         "Amount",               60),
    ("ROCKBAND_PAN_POLITICALIZATION_HD",                "Amount",               -40),
    ("ROCKBAND_WELL_KNOWN_HD",                          "Modifier",             -50),
    ("ROCKBAND_WELL_KNOWN_HD",                          "Range",                12),

    ("ORAL_SCHOLAR_TOURISM_BOMB_ALL_HD",                "Amount",               5),
    ("TRAVEL_THEATRE_TOURISM_BOMB_ALL_HD",              "Amount",               10),
    ("ROCK_BAND_TOURISM_BOMB_ALL_HD",                   "Amount",               20),

    ("HD_ROCK_IGNORE_ALL",                              "Ignore",               1),
    ("HD_ROCK_IGNORE_ALL",                              "Type",                 "ALL"),
    ("HD_ROCK_IGNORE_RIVERS",                           "Ignore",               1),

    ("CITY_ENABLE_ROCK_BAND_FAITH_PURCHASE_HD",         "Tag",                  "CLASS_ROCK_BAND"),

    ("HD_ROCK_BASIC_YIELD_GOLD",                        "YieldType",            "YIELD_GOLD"),
    ("HD_ROCK_BASIC_YIELD_GOLD",                        "Amount",               -99),
    ("HD_ROCK_BASIC_YIELD_CULTURE",                     "YieldType",            "YIELD_CULTURE"),
    ("HD_ROCK_BASIC_YIELD_CULTURE",                     "Amount",               -99),
    ("HD_MALI_GRIOTS_BASIC_YIELD_GOLD",                 "YieldType",            "YIELD_GOLD"),
    ("HD_MALI_GRIOTS_BASIC_YIELD_GOLD",                 "Amount",               10);

insert or replace into UnitPromotionModifiers
    (UnitPromotionType,                             ModifierId)
values
    ("PROMOTION_MYSTICISM_HD",                      "ROCKBAND_MYSTICISM_WONDER_HD"),
    ("PROMOTION_MYSTICISM_HD",                      "ROCKBAND_MYSTICISM_NATIONAL_PARK_HD"),
    ("PROMOTION_MYSTICISM_HD",                      "ROCKBAND_MYSTICISM_NATURAL_WONDER_HD"),
    ("PROMOTION_CLASSICISM_HD",                     "ROCKBAND_CLASSICISM_HD"),
    ("PROMOTION_CLASSICISM_HD",                     "ROCKBAND_CLASSICISM_ACROPOLIS_HD"),
    ("PROMOTION_ROMANTICISM_HD",                    "ROCKBAND_ROMANTICISM_HD"),
    ("PROMOTION_ROMANTICISM_HD",                    "ROCKBAND_ROMANTICISM_HIPPODROME_HD"),
    ("PROMOTION_ROMANTICISM_HD",                    "ROCKBAND_ROMANTICISM_STREET_CARNIVAL_HD"),
    ("PROMOTION_HEDONISM_HD",                       "ROCKBAND_HEDONISM_HD"),
    ("PROMOTION_HEDONISM_HD",                       "ROCKBAND_HEDONISM_WATER_STREET_CARNIVAL_HD"),
    ("PROMOTION_HEDONISM_HD",                       "ROCKBAND_HEDONISM_BEACH_RESORT_HD"),
    ("PROMOTION_REALISM_HD",                        "ROCKBAND_REALISM_HD"),
    ("PROMOTION_REALISM_HD",                        "ROCKBAND_REALISM_MBANZA_HD"),
    ("PROMOTION_ACADEMISM_HD",                      "ROCKBAND_ACADEMISM_HD"),
    ("PROMOTION_ACADEMISM_HD",                      "ROCKBAND_ACADEMISM_SEOWON_HD"),
    ("PROMOTION_ACADEMISM_HD",                      "ROCKBAND_ACADEMISM_OBSERVATORY_HD"),
    ("PROMOTION_POPULARISM_HD",                     "ROCKBAND_POPULARISM_HD"),
    ("PROMOTION_POPULARISM_HD",                     "ROCKBAND_POPULARISM_SUGUBA_HD"),
    ("PROMOTION_POPULARISM_HD",                     "ROCKBAND_POPULARISM_SUK_FLOATINGMARKET_HD"),
    ("PROMOTION_PLURALISM_HD",                      "ROCKBAND_PLURALISM_HD"),
    ("PROMOTION_PLURALISM_HD",                      "ROCKBAND_PLURALISM_HANSA_HD"),
    ("PROMOTION_PLURALISM_HD",                      "ROCKBAND_PLURALISM_OPPIDUM_HD"),
    ("PROMOTION_FISHER_SONG_HD",                    "ROCKBAND_FISHER_SONG_HD"),
    ("PROMOTION_FISHER_SONG_HD",                    "ROCKBAND_FISHER_SONG_ROYAL_NAVY_DOCKYARD_HD"),
    ("PROMOTION_FISHER_SONG_HD",                    "ROCKBAND_FISHER_SONG_COTHON_HD"),

    ("PROMOTION_GLEEMAN_HD",                        "ROCKBAND_GLEEMAN_HD"),
    ("PROMOTION_GLEEMAN_HD",                        "HD_ROCK_IGNORE_ALL"),
    ("PROMOTION_GLEEMAN_HD",                        "HD_ROCK_IGNORE_RIVERS"),
    ("PROMOTION_URBAN_OPERA_HD",                    "ROCKBAND_URBAN_OPERA_HD"),
    ("PROMOTION_PAN_POLITICALIZATION_HD",           "ROCKBAND_PAN_POLITICALIZATION_HD"),
    ("PROMOTION_WELL_KNOWN_HD",                     "ROCKBAND_WELL_KNOWN_HD");

With Building_TourismBombs_XP2_Pre
    (BuildingType,                                  TourismBombValue)
as (values
    --剧院
    ("BUILDING_JNR_ASSEMBLY",                       300),
    ("BUILDING_AMPHITHEATER",                       300),
    ("BUILDING_MARAE",                              300),
    ("BUILDING_JNR_CABINET",                        300),
    ("BUILDING_JNR_MANSION",                        300),
    ("BUILDING_JNR_OPERA",                          400),
    ("BUILDING_JNR_GRAND_HOTEL",                    400),
    ("BUILDING_JNR_MEDIA_CENTER",                   500),
    ("BUILDING_BROADCAST_CENTER",                   500),
    ("BUILDING_FILM_STUDIO",                        500),
    --娱乐区
    ("BUILDING_ARENA",                              300),
    ("BUILDING_JNR_TOURNEY",                        300),
    ("BUILDING_TLACHTLI",                           300),
    ("BUILDING_ZOO",                                300),
    ("BUILDING_JNR_BOTANICAL_GARDEN",               300),
    ("BUILDING_THERMAL_BATH",                       300),
    ("BUILDING_JNR_THEME_PARK",                     500),
    ("BUILDING_STADIUM",                            500),
    --水上乐园
    ("BUILDING_JNR_MARINA",                         300),
    ("BUILDING_FERRIS_WHEEL",                       300),
    ("BUILDING_JNR_CASINO",                         300),
    ("BUILDING_AQUARIUM",                           300),
    ("BUILDING_JNR_FOOD_COURT",                     500),
    ("BUILDING_AQUATICS_CENTER",                    500),
    --社区，地铁站没给
    ("BUILDING_HD_TAVERN",                          300),
    ("BUILDING_HD_INN",                             300),
    ("BUILDING_FOOD_MARKET",                        300),
    ("BUILDING_SHOPPING_MALL",                      300),
    ("BUILDING_JNR_RECYCLING_PLANT",                400),
    ("BUILDING_JNR_HOSPITAL",                       400),
    ("BUILDING_JNR_MEDITATION",                     500),
    ("BUILDING_JNR_ART_GALLERY",                    500),
    --学院
    ("BUILDING_LIBRARY",                            300),
    ("BUILDING_JNR_ACADEMY",                        300),
    ("BUILDING_MER_ROYAL_ARCHIVE",                  300),
    ("BUILDING_MER_LITERARY_SCHOOL_HD",             300),
    ("BUILDING_UNIVERSITY",                         300),
    ("BUILDING_JNR_SCHOOL",                         300),
    ("BUILDING_MADRASA",                            300),
    ("BUILDING_NAVIGATION_SCHOOL",                  300),
    ("BUILDING_JNR_LABORATORY",                     400),
    ("BUILDING_JNR_REAL_ACADEMY",                   400),
    ("BUILDING_JNR_LIBERAL_ARTS",                   400),
    ("BUILDING_JNR_ARCHITECTURE",                   400),
    ("BUILDING_RESEARCH_LAB",                       500),
    ("BUILDING_JNR_EDUCATION",                      500),
    --商业中心
    ("BUILDING_MARKET",                             300),
    ("BUILDING_JNR_MINT",                           300),
    ("BUILDING_JNR_WAYSTATION",                     300),
    ("BUILDING_SUKIENNICE",                         300),
    ("BUILDING_JNR_GUILDHALL",                      300),
    ("BUILDING_JNR_MERCHANT_QUARTER",               300),
    ("BUILDING_BANK",                               300),
    ("BUILDING_GRAND_BAZAAR",                       300),
    ("BUILDING_JNR_MARKETING_AGENCY",               500),
    ("BUILDING_JNR_COMMODITY_EXCHANGE",             500),
    ("BUILDING_STOCK_EXCHANGE",                     500),
    --工业区
    ("BUILDING_JNR_TOOLING_SHOP",                   300),
    ("BUILDING_IZ_WATER_MILL",                      300),
    ("BUILDING_JNR_WIND_MILL",                      300),
    ("BUILDING_JNR_MANUFACTURY",                    300),
    ("BUILDING_WORKSHOP",                           300),
    ("BUILDING_FACTORY",                            400),
    ("BUILDING_JNR_CHEMICAL",                       400),
    ("BUILDING_COAL_POWER_PLANT",                   500),
    ("BUILDING_FOSSIL_FUEL_POWER_PLANT",            500),
    ("BUILDING_JNR_FREIGHT_YARD",                   500),
    ("BUILDING_POWER_PLANT",                        500),
    ("BUILDING_ELECTRONICS_FACTORY",                500),
    --港口
    ("BUILDING_JNR_LIGHTHOUSE_TRADE",               300),
    ("BUILDING_LIGHTHOUSE",                         300),
    ("BUILDING_JNR_FREEPORT",                       300),
    ("BUILDING_JNR_HAVEN",                          300),
    ("BUILDING_SHIPYARD",                           300),
    ("BUILDING_JNR_NAVAL_BASE",                     500),
    ("BUILDING_SEAPORT",                            500),
    ("BUILDING_JNR_CRUISE_TERMINAL",                500),
    --圣地
    ("BUILDING_SHRINE",                             300),
    ("BUILDING_JNR_ALTAR",                          300),
    ("BUILDING_JNR_MONASTERY",                      300),
    ("BUILDING_TEMPLE",                             300),
    ("BUILDING_STAVE_CHURCH",                       300),
    ("BUILDING_PRASAT",                             300),
    ("BUILDING_JNR_HOSPITIUM",                      500),
    ("BUILDING_JNR_GARDEN",                         500),
    ("BUILDING_CATHEDRAL",                          400),
    ("BUILDING_GURDWARA",                           400),
    ("BUILDING_MEETING_HOUSE",                      400),
    ("BUILDING_MOSQUE",                             400),
    ("BUILDING_PAGODA",                             400),
    ("BUILDING_SYNAGOGUE",                          400),
    ("BUILDING_WAT",                                400),
    ("BUILDING_STUPA",                              400),
    ("BUILDING_DAR_E_MEHR",                         400),
    ("BUILDING_JNR_CANDI",                          400),
    ("BUILDING_JNR_DAOGUAN",                        400),
    ("BUILDING_JNR_JINJA",                          400),
    ("BUILDING_JNR_KHALWAT",                        400),
    ("BUILDING_JNR_MANDIR",                         400),
    ("BUILDING_JNR_MBARI",                          400),
    ("BUILDING_JNR_PERIPTEROS",                     400),
    ("BUILDING_JNR_SOBOR",                          400),
    ("BUILDING_JNR_TZACUALLI",                      400))
insert or replace into Building_TourismBombs_XP2
    (BuildingType,                                  TourismBombValue)
select
    Building_TourismBombs_XP2_Pre.BuildingType,     Building_TourismBombs_XP2_Pre.TourismBombValue
from Building_TourismBombs_XP2_Pre INNER JOIN Buildings ON Buildings.BuildingType = Building_TourismBombs_XP2_Pre.BuildingType;

insert or replace into CivilizationTraits (CivilizationType,TraitType) values ((select CivilizationType from CivilizationTraits where CivUniqueUnitType='CIVILIZATION_CVS_SONGHAI'),'TRAIT_CIVILIZATION_UNIT_MALI_GRIOTS');