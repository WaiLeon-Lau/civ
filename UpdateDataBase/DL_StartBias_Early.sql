--------------------------------
--  Civilization Bias by xhh  --
--------------------------------
delete from StartBiasTerrains where CivilizationType in
	(select CivilizationType from Civilizations where StartingCivilizationLevelType = 'CIVILIZATION_LEVEL_FULL_CIV');
delete from StartBiasFeatures where CivilizationType in
	(select CivilizationType from Civilizations where StartingCivilizationLevelType = 'CIVILIZATION_LEVEL_FULL_CIV');
delete from StartBiasResources where CivilizationType in
	(select CivilizationType from Civilizations where StartingCivilizationLevelType = 'CIVILIZATION_LEVEL_FULL_CIV');
delete from StartBiasRivers where CivilizationType in
	(select CivilizationType from Civilizations where StartingCivilizationLevelType = 'CIVILIZATION_LEVEL_FULL_CIV');