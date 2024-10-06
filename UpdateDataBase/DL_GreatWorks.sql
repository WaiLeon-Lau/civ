-------------------------------------
--      GreatWorks Adjustments     --
-------------------------------------

-- Fail to add new great work slot type (not able to add through Building_GreatWorks, but may through add slot modifier, still have other issues).

update GreatWorks set Tourism = 3 where GreatWorkObjectType = 'GREATWORKOBJECT_WRITING';
update GreatWorks set Tourism = 6 where GreatWorkObjectType = 'GREATWORKOBJECT_MUSIC';

update GreatWorks set Tourism = 4 where GreatWorkObjectType = 'GREATWORKOBJECT_ARTIFACT';
update GreatWorks set Tourism = 4
 where GreatWorkObjectType = 'GREATWORKOBJECT_SCULPTURE'
	or GreatWorkObjectType = 'GREATWORKOBJECT_RELIGIOUS'
	or GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE'
	or GreatWorkObjectType = 'GREATWORKOBJECT_PORTRAIT';

replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
	select GreatWorkType, 'YIELD_CULTURE', 3 from GreatWorks where GreatWorkObjectType = 'GREATWORKOBJECT_WRITING';
replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
	select GreatWorkType, 'YIELD_CULTURE', 6 from GreatWorks where GreatWorkObjectType = 'GREATWORKOBJECT_MUSIC';

replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
	select GreatWorkType, 'YIELD_CULTURE', 4 from GreatWorks where GreatWorkObjectType = 'GREATWORKOBJECT_ARTIFACT';
replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
	select GreatWorkType, 'YIELD_CULTURE', 4 from GreatWorks
 where GreatWorkObjectType = 'GREATWORKOBJECT_SCULPTURE'
	or GreatWorkObjectType = 'GREATWORKOBJECT_RELIGIOUS'
	or GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE'
	or GreatWorkObjectType = 'GREATWORKOBJECT_PORTRAIT';

-- Set Eras
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_BHASA_1';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_BHASA_2';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_HOMER_1';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_HOMER_2';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_OVID_1';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_OVID_2';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_QU_YUAN_1';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_QU_YUAN_2';
update GreatWorks set EraType = 'ERA_MEDIEVAL'	where GreatWorkType = 'GREATWORK_CHAUCER_1';
update GreatWorks set EraType = 'ERA_MEDIEVAL'	where GreatWorkType = 'GREATWORK_CHAUCER_2';
update GreatWorks set EraType = 'ERA_MEDIEVAL'	where GreatWorkType = 'GREATWORK_LI_BAI_1';
update GreatWorks set EraType = 'ERA_MEDIEVAL'	where GreatWorkType = 'GREATWORK_LI_BAI_2';
update GreatWorks set EraType = 'ERA_MEDIEVAL'	where GreatWorkType = 'GREATWORK_MURASAKI_1';
update GreatWorks set EraType = 'ERA_MEDIEVAL'	where GreatWorkType = 'GREATWORK_MURASAKI_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CAVENDISH_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CAVENDISH_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CERVANTES_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CERVANTES_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_MACHIAVELLI_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_MACHIAVELLI_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_SHAKESPEARE_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_SHAKESPEARE_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_D_AULNOY_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_D_AULNOY_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_PUSHKIN_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_PUSHKIN_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_POE_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_POE_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_AUSTEN_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_AUSTEN_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_GOETHE_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_GOETHE_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_SHELLEY_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_SHELLEY_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_JOYCE_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_JOYCE_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_DICKINSON_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_DICKINSON_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_TOLSTOY_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_TOLSTOY_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_TWAIN_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_TWAIN_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_FITZGERALD_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_FITZGERALD_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_WELLS_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_WELLS_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_TAGORE_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_TAGORE_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_CAPEK_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_CAPEK_2';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_SUN_TZU';
	
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_RUBLEV_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_RUBLEV_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_RUBLEV_3';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_BOSCH_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_BOSCH_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_BOSCH_3';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_DONATELLO_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_DONATELLO_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_DONATELLO_3';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_MICHELANGELO_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_MICHELANGELO_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_MICHELANGELO_3';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_YING_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_YING_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_YING_3';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_TITIAN_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_TITIAN_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_TITIAN_3';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_GRECO_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_GRECO_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_GRECO_3';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_REMBRANDT_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_REMBRANDT_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_REMBRANDT_3';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_ANGUISSOLA_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_ANGUISSOLA_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_ANGUISSOLA_3';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_KAUFFMAN_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_KAUFFMAN_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_KAUFFMAN_3';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_HOKUSAI_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_HOKUSAI_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_HOKUSAI_3';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_EOP_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_EOP_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_EOP_3';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_GOGH_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_GOGH_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_GOGH_3';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_LEWIS_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_LEWIS_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_LEWIS_3';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_COLLOT_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_COLLOT_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_COLLOT_3';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_MONET_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_MONET_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_MONET_3';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_ORLOVSKY_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_ORLOVSKY_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_ORLOVSKY_3';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_KLIMT_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_KLIMT_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_KLIMT_3';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_GIL_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_GIL_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_GIL_3';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_CASSATT_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_CASSATT_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_CASSATT_3';
	
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_VIVALDI_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_VIVALDI_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_BACH_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_BACH_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_BEETHOVEN_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_BEETHOVEN_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_MOZART_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_MOZART_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_KENGYO_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_KENGYO_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_GOMEZ_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_GOMEZ_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_LISZT_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_LISZT_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_CHOPIN_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_CHOPIN_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_TCHAIKOVSKY_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_TCHAIKOVSKY_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_TIANHUA_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_TIANHUA_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_DVORAK_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_DVORAK_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_SCHUMANN_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_SCHUMANN_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_ROSAS_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_ROSAS_2';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_LILIUOKALANI_1';
update GreatWorks set EraType = 'ERA_ATOMIC'	where GreatWorkType = 'GREATWORK_LILIUOKALANI_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_JAAN_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_JAAN_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_LEONTOVYCH_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_LEONTOVYCH_2';
	
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_BEHZAD_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_BEHZAD_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_BEHZAD_3';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_TOHAKU_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_TOHAKU_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_TOHAKU_3';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_KANDINSKY_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_KANDINSKY_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_KANDINSKY_3';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_BABYLON_CANTEMIR_1';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_BABYLON_CANTEMIR_2';
update GreatWorks set EraType = 'ERA_INDUSTRIAL'	where GreatWorkType = 'GREATWORK_BABYLON_CANTEMIR_3';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_BABYLON_JOPLIN_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_BABYLON_JOPLIN_2';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_BABYLON_JOPLIN_3';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_BABYLON_BEATRIX_POTTER_1';
update GreatWorks set EraType = 'ERA_MODERN'	where GreatWorkType = 'GREATWORK_BABYLON_BEATRIX_POTTER_2';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_BABYLON_VALMIKI_1';
update GreatWorks set EraType = 'ERA_CLASSICAL'	where GreatWorkType = 'GREATWORK_BABYLON_VALMIKI_2';
update GreatWorks set EraType = 'ERA_MEDIEVAL'	where GreatWorkType = 'GREATWORK_BABYLON_RUMI_1';
update GreatWorks set EraType = 'ERA_MEDIEVAL'	where GreatWorkType = 'GREATWORK_BABYLON_RUMI_2';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_BABYLON_GABRIELA_MISTRAL_1';
update GreatWorks set EraType = 'ERA_INFORMATION'	where GreatWorkType = 'GREATWORK_BABYLON_GABRIELA_MISTRAL_2';

-- 新著作
insert or replace into Types
	(Type,								Kind)
values
	('GREATWORK_ZHUANG_ZHOU_1',			'KIND_GREATWORK'),
	('GREATWORK_ZHUANG_ZHOU_2',			'KIND_GREATWORK'),
	('GREATWORK_SI_MA_QIAN_1',			'KIND_GREATWORK'),
	('GREATWORK_SI_MA_QIAN_2',			'KIND_GREATWORK');

insert or replace into GreatWorks
	(GreatWorkType,						GreatWorkObjectType,			GreatPersonIndividualType,					Name,									Audio,							Quote,									Tourism,	EraType)
values
	('GREATWORK_ZHUANG_ZHOU_1',			'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU',		'LOC_GREATWORK_ZHUANG_ZHOU_1_NAME',		'GREAT_WRITING_QUOTE_HD_1',		'LOC_GREATWORK_ZHUANG_ZHOU_1_QUOTE',	3,			'ERA_CLASSICAL'),
	('GREATWORK_ZHUANG_ZHOU_2',			'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU',		'LOC_GREATWORK_ZHUANG_ZHOU_2_NAME',		'GREAT_WRITING_QUOTE_HD_2',		'LOC_GREATWORK_ZHUANG_ZHOU_2_QUOTE',	3,			'ERA_CLASSICAL'),
	('GREATWORK_SI_MA_QIAN_1',			'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN',		'LOC_GREATWORK_SI_MA_QIAN_1_NAME',		'GREAT_WRITING_QUOTE_HD_3',		'LOC_GREATWORK_SI_MA_QIAN_1_QUOTE',		3,			'ERA_CLASSICAL'),
	('GREATWORK_SI_MA_QIAN_2',			'GREATWORKOBJECT_WRITING',		'GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN',		'LOC_GREATWORK_SI_MA_QIAN_2_NAME',		'GREAT_WRITING_QUOTE_HD_4',		'LOC_GREATWORK_SI_MA_QIAN_2_QUOTE',		3,			'ERA_CLASSICAL');

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,						YieldType,				YieldChange)
values
	('GREATWORK_ZHUANG_ZHOU_1',			'YIELD_CULTURE',		3),
	('GREATWORK_ZHUANG_ZHOU_2',			'YIELD_CULTURE',		3),
	('GREATWORK_SI_MA_QIAN_1',			'YIELD_CULTURE',		3),
	('GREATWORK_SI_MA_QIAN_2',			'YIELD_CULTURE',		3);
