----CivilizationandLeaderHasTrait
ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.Utils = ExposedMembers.DLHD.Utils or {};
Utils = ExposedMembers.DLHD.Utils;
function CivilizationHasTrait(sCiv, sTrait)
	for tRow in GameInfo.CivilizationTraits() do
		if (tRow.CivilizationType == sCiv and tRow.TraitType == sTrait) then
			return true;
		end
	end
	return false;
end
Utils.CivilizationHasTrait = CivilizationHasTrait;

function LeaderHasTrait(sLeader, sTrait)
	for tRow in GameInfo.LeaderTraits() do
		if (tRow.LeaderType == sLeader and tRow.TraitType == sTrait) then return
			true;
		end
	end
	return false;
end
Utils.LeaderHasTrait = LeaderHasTrait;
--伟人
local WRITER_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_WRITER'].Index;
local ARTIST_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_ARTIST'].Index;
local MUSICIAN_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_MUSICIAN'].Index;
local SCIENTIST_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_SCIENTIST'].Index;
local MERCHANT_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_MERCHANT'].Index;
local ENGINEER_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_ENGINEER'].Index;
local PROPHET_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_PROPHET'].Index;
local ADMIRAL_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_ADMIRAL'].Index;
local GENERAL_INDEX = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_GENERAL'].Index;
-- 老秦
function ChinaBuilderScience(playerID, unitID, newCharges, oldCharges)
	-- print(playerID, unitID, newCharges, oldCharges)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local amount = GlobalParameters.CHINA_WORKER_SCIENCE_PER_CHARGE
	local sWisdonOfWorkingPeople = 'TRAIT_CIVILIZATION_DYNASTIC_CYCLE'
	if player:IsTurnActive() and CivilizationHasTrait(sCiv, sWisdonOfWorkingPeople) and (newCharges + 1 == oldCharges) and (amount > 0) then
		local unit = player:GetUnits():FindID(unitID)
		if unit ~= nil then
			-- print(unit:GetOwner(), unit:GetType(), unit:GetX(), unit:GetY())
			if unit:GetType() == GameInfo.Units['UNIT_BUILDER'].Index then
				player:GetTechs():ChangeCurrentResearchProgress(amount)
				if newCharges > 0 then
					-- 次数到0后会找不到单位(-9999, -9999)的原位置，无法显示浮动文本。
					local message = '[COLOR:ResScienceLabelCS]+' .. tostring(amount) .. '[ENDCOLOR][ICON_Science]'
					Game.AddWorldViewText(0, message, unit:GetX(), unit:GetY())
				end
			end
		end
	end
end

Events.UnitChargesChanged.Add(ChinaBuilderScience)

--Phoenicia Trigger Foreign Trade Boost
function DidoOnPlayerTurnActivated(playerID:number, bFirstTimeThisTurn:boolean)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local sMediterraneanColonies = 'TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES'
	local m_ForeignTrade = GameInfo.Civics['CIVIC_FOREIGN_TRADE'].Index
	if (not CivilizationHasTrait(sCiv, sMediterraneanColonies)) then return; end
	-- print(player, playerConfig, sCiv)
	player:GetCulture():TriggerBoost(m_ForeignTrade, 0.4)
end

Events.PlayerTurnActivated.Add(DidoOnPlayerTurnActivated)

--Brazil
function PedroGreatPersonFaith(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sLeader = playerConfig:GetLeaderTypeName()
	local sMagnanimous = 'TRAIT_LEADER_MAGNANIMOUS'
	local sModifierID = 'TRAIT_GREAT_PEOPLE_JUNGLE_FAITH'
	local PROP_KEY_NUMBER_GREAT_PEOPLE = 'NumberofGreatPeople'
	if LeaderHasTrait(sLeader, sMagnanimous) then
		local amount = player:GetProperty(PROP_KEY_NUMBER_GREAT_PEOPLE)
		if amount == nil then
			amount = 0
		end
		amount = amount + 1
		-- Every two greatperson add 1 faith to jungle.
		if amount == 2 then
			amount = 0
			player:AttachModifierByID(sModifierID)
		end
		player:SetProperty(PROP_KEY_NUMBER_GREAT_PEOPLE, amount)
	end
end

Events.UnitGreatPersonCreated.Add(PedroGreatPersonFaith)

--Mali EraScore +15 Gold
function MaliPlayerEraScoreChanged(playerID, amountAwarded)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sLeader = playerConfig:GetLeaderTypeName()
	local sMaliGoldDesert = 'TRAIT_LEADER_SAHEL_MERCHANTS'
	local amount = GlobalParameters.MALI_EXTRA_GOLD_FOR_EVERY_ERA_SCORE
	if (not LeaderHasTrait(sLeader, sMaliGoldDesert)) then return; end
	player:GetTreasury():ChangeGoldBalance(amountAwarded * amount)
end

Events.PlayerEraScoreChanged.Add(MaliPlayerEraScoreChanged)

-- Aztec
-- ===========================================================================
--	Sacrifice
-- ===========================================================================
function HD_Aztec_Sacrifice(eOwner : number, iUnitID : number)
	local pPlayer = Players[eOwner];
	if (pPlayer == nil) then
		return;
	end

	local pUnit = pPlayer:GetUnits():FindID(iUnitID);
	if (pUnit == nil) then
		return;
	end

	local city = CityManager.GetCityAt(pUnit:GetX(), pUnit:GetY());

	if city == nil then
		return;
	end
	local amount = 10 * pUnit:GetBuildCharges();
	pPlayer:GetCulture():ChangeCurrentCulturalProgress(amount);
	pPlayer:GetReligion():ChangeFaithBalance(amount);

	-- Flyover text
	local message:string  = Locale.Lookup("LOC_FLYOVER_AZTEC_SACRIFICE", amount);
	Game.AddWorldViewText(0, message, pUnit:GetX(), pUnit:GetY());

	-- Report to the application side that we did something.  This helps with visualization
	-- UnitManager.ReportActivation(pUnit, "DEMOLISH");

end
GameEvents.HD_Aztec_Sacrifice.Add(HD_Aztec_Sacrifice)

-- France, Catherine De Medici
-- ===========================================================================
-- Double promotion for spy, cancelled, due to spy removed & added issue.
-- ===========================================================================

-- function OnUnitAddedToMap(playerID, unitID)
-- 	print('OnUnitAddedToMap', playerID, unitID)
-- 	local player = Players[playerID]
-- 	local playerConfig = PlayerConfigurations[playerID]
-- 	local sLeader = playerConfig:GetLeaderTypeName()
-- 	local sFlyingSquadronTrait = 'FLYING_SQUADRON_TRAIT'
-- 	if (not LeaderHasTrait(sLeader, sFlyingSquadronTrait)) then return; end
-- 	-- 
-- 	local unit = UnitManager.GetUnit(playerID, unitID)
-- 	local mSpyIndex = GameInfo.Units['UNIT_SPY'].Index
-- 	if (player == nil) or (unit == nil) then return; end
-- 	if unit:GetType() == mSpyIndex then
-- 		local unitExp = unit:GetExperience()
-- 		-- print(unitExp:CanPromote())
-- 		unitExp:ChangeStoredPromotions(1);
-- 		-- if (unitExp:CanPromote()) then
-- 		-- 	-- Have promotion ready, add a stored promotion so we don't lose the experience.
-- 		-- 	unitExp:ChangeStoredPromotions(1);
-- 		-- else
-- 		-- 	-- grant the experience for the next level.
-- 		-- 	local nextLevelExperience :number = unitExp:GetExperienceForNextLevel()
-- 		-- 	unitExp:SetExperienceLocked(false)
-- 		-- 	unitExp:ChangeExperience(nextLevelExperience)
-- 		-- end
-- 	end
-- end
-- Events.UnitAddedToMap.Add(OnUnitAddedToMap);

-- function OnSpyAdded(playerID, unitID)
-- 	print('OnSpyAdded',	playerID, unitID)
-- 	local player = Players[playerID]
-- 	local playerConfig = PlayerConfigurations[playerID]
-- 	local sLeader = playerConfig:GetLeaderTypeName()
-- 	local sFlyingSquadronTrait = 'FLYING_SQUADRON_TRAIT'
-- 	if (not LeaderHasTrait(sLeader, sFlyingSquadronTrait)) then return; end

-- 	local unit = UnitManager.GetUnit(playerID, unitID)
-- 	local unitExp = unit:GetExperience()
-- 	unitExp:ChangeStoredPromotions(-1);
-- end
-- Events.SpyAdded.Add(OnSpyAdded);

-- function OnUnitAbilityGained(playerID, unitID, eAbilityType)
-- 	print('OnUnitAbilityGained', playerID, unitID, eAbilityType)
-- end
-- Events.UnitAbilityGained.Add(OnUnitAbilityGained);

-- function OnUnitPromotionAvailable(playerID, unitID, promotionID)
-- 	print('OnUnitPromotionAvailable', playerID, unitID, promotionID)
-- end
-- Events.UnitPromotionAvailable.Add(OnUnitPromotionAvailable);

-- Poland
-- ===========================================================================
-- temple unlock military engineers
-- ===========================================================================
function PolandTempleUnlockMilitaryEngineers(playerID:number, cityID:number)
	local player = Players[playerID]
	local city = player:GetCities():FindID(cityID)
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local sGoldenLiberty = 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY'
	if (not CivilizationHasTrait(sCiv, sGoldenLiberty)) then 
		return
	end
    local m_Dummy_Poland = GameInfo.Buildings['BUILDING_DUMMY_POLAND'].Index
    local m_Temple = GameInfo.Buildings['BUILDING_TEMPLE'].Index
	if player ~= nil and city ~= nil then
		local cityHasDummy = city:GetBuildings():HasBuilding(m_Dummy_Poland)
		local cityHasTemple = city:GetBuildings():HasBuilding(m_Temple)
		local cityTemplePillaged = city:GetBuildings():IsPillaged(m_Temple)
		local cityHas_JNR_MONASTERY = false
		local city_JNR_MONASTERY_Pillaged = true
		for row in GameInfo.Buildings() do
			if row.BuildingType == 'BUILDING_JNR_MONASTERY' then
				local m_JNR_MONASTERY = GameInfo.Buildings['BUILDING_JNR_MONASTERY'].Index
				cityHas_JNR_MONASTERY = city:GetBuildings():HasBuilding(m_JNR_MONASTERY)
				city_JNR_MONASTERY_Pillaged = city:GetBuildings():IsPillaged(m_JNR_MONASTERY)
			end
		end
		-- print('Poland', cityHasDummy, cityHasTemple, cityTemplePillaged)
		if cityHasTemple and not cityTemplePillaged then
			if not cityHasDummy then
				local buildingQueue = city:GetBuildQueue()
				buildingQueue:CreateBuilding(m_Dummy_Poland)
				-- print('Dummy Poland created', player:GetID(), city:GetID())
			end
		elseif cityHas_JNR_MONASTERY and not city_JNR_MONASTERY_Pillaged then
			if not cityHasDummy then
				local buildingQueue = city:GetBuildQueue()
				buildingQueue:CreateBuilding(m_Dummy_Poland)
				-- print('Dummy Poland created', player:GetID(), city:GetID())
			end
		elseif cityHasDummy then -- no temple or temple is pillaged but city has Dummy
			city:GetBuildings():RemoveBuilding(m_Dummy_Poland)
			-- print('Dummy Poland removed', player:GetID(), city:GetID())
		end
    end
end

-- Events.PlayerTurnActivated.Add(PolandTempleUnlockMilitaryEngineers)
GameEvents.BuildingConstructed.Add(PolandTempleUnlockMilitaryEngineers)
GameEvents.BuildingPillageStateChanged.Add(PolandTempleUnlockMilitaryEngineers)
Events.CityAddedToMap.Add(PolandTempleUnlockMilitaryEngineers)

-- Kublai 
-- ===========================================================================
-- Grant CivTraits On Conquer Original Capital -- part of Gameplay
-- ===========================================================================
function KublaiGrantCivTrait( playerID, iX, iY )
	local captureModifier = {}
    local captureTrait = {}
    local pPlayer = Players[playerID]
	local pCity = CityManager.GetCityAt(iX, iY)
	local originalOwnerID = pCity:GetOriginalOwner() 
    -- print('Kublai0',originalOwnerID,playerID) 
	if originalOwnerID ~= playerID and originalOwnerID ~= nil then
		local oPlayer = Players[originalOwnerID]
		local oPlayerConfig = PlayerConfigurations[originalOwnerID]
		local oCiv = oPlayerConfig:GetCivilizationTypeName()
		local have_captured = pPlayer:GetProperty('PROP_KEY_HAVE_CAPTURED_'..originalOwnerID)
		-- print('Kublai5', have_captured)
		if have_captured == nil then -- avoid repeating
			pPlayer:SetProperty('PROP_KEY_HAVE_CAPTURED_'..originalOwnerID, true)
			-- print('Kublai6', pPlayer:GetProperty('PROP_KEY_HAVE_CAPTURED_'..originalOwnerID))
			for tRow in GameInfo.CivilizationTraits() do
				if tRow.CivilizationType == oCiv then
					table.insert(captureTrait,tRow.TraitType)
				end
			end
			-- print('Kublai1',oCiv) 
			for _, traitType in ipairs(captureTrait) do
				for tRow in GameInfo.TraitModifiers() do
					if string.sub(tRow.TraitType,1,28) ~= 'TRAIT_CIVILIZATION_BUILDING_' and
					string.sub(tRow.TraitType,1,28) ~= 'TRAIT_CIVILIZATION_DISTRICT_' and
					tRow.TraitType == traitType then
						table.insert(captureModifier,tRow.ModifierId)
					end
				end
			end 
			for _, modifier in ipairs(captureModifier) do
				pPlayer:AttachModifierByID(modifier)  -- unable to be used in UI
				-- print('Kublai2',modifier)
			end
		end
	end
end

GameEvents.KublaiGrantCivTraitSwitch.Add(KublaiGrantCivTrait)

-- Eleanor
-- ===========================================================================
-- Judgement of Love -- part of Gameplay
-- ===========================================================================
function ProjectJudgementOfLove(iX, iY, dX, dY)
	local city = CityManager.GetCityAt(iX, iY)
	local pCity = CityManager.GetCityAt(dX, dY)
	local districtID = GameInfo.Districts['DISTRICT_THEATER'].Index
	local pCityDistricts : object = pCity:GetDistricts();
	if (pCityDistricts ~= nil) then
		local eX, eY = pCityDistricts:GetDistrictLocation(districtID)
		local distance = Map.GetPlotDistance(eX, eY, iX, iY)
		--print('PROJECT_CIRCUSES_AND_BREAD3',eX, eY, iX, iY, distance)
		if distance <= 9 then
			city:ChangeLoyalty(-200)
		end
	end
end
GameEvents.ProjectEnemyCitiesChangeLoyaltySwitch.Add(ProjectJudgementOfLove)

-- Hungary Conquer Envoy
--function ConquerEnvoy(newPlayerID, oldPlayerID, newCityID, iCityX, iCityY)
--    local pPlayer = Players[newPlayerID]
--    if pPlayer ~= nil then
--        local pPlayerConfig = PlayerConfigurations[newPlayerID]
--        local sLeader = pPlayerConfig:GetLeaderTypeName()
--        local sConquerEnvoy = 'TRAIT_LEADER_RAVEN_KING'
--        if LeaderHasTrait(sLeader, sConquerEnvoy) then
--            pPlayer:GetInfluence():ChangeTokensToGive(1)
--        end
--    end
--end
--GameEvents.CityConquered.Add(ConquerEnvoy)

-- 刚果
function MBANZABoost(playerID, districtID, iX, iY)
    local pPlayer = Players[playerID]
    if pPlayer ~= nil then
    	local plot = Map.GetPlot(iX, iY)
        local districtType = plot:GetDistrictType()
        if ExposedMembers.DLHD.Utils.IsDistrictType(districtType, 'DISTRICT_MBANZA') then
            local m_THEOLOGY = GameInfo.Civics['CIVIC_THEOLOGY'].Index;
            local m_DIVINE_RIGHT = GameInfo.Civics['CIVIC_DIVINE_RIGHT'].Index;
            local m_REFORMED_CHURCH = GameInfo.Civics['CIVIC_REFORMED_CHURCH'].Index;

            local pPlayerConfig = PlayerConfigurations[playerID]
       		local sLeader = pPlayerConfig:GetLeaderTypeName()
            if LeaderHasTrait(sLeader, 'TRAIT_LEADER_RELIGIOUS_CONVERT') then
				pPlayer:GetCulture():TriggerBoost(m_THEOLOGY, 1);
				pPlayer:GetCulture():TriggerBoost(m_DIVINE_RIGHT, 1);
            	pPlayer:GetCulture():TriggerBoost(m_REFORMED_CHURCH, 1);
            end
        end
    end
end

GameEvents.OnDistrictConstructed.Add(MBANZABoost)

-- 维多利亚: 招提督送使者 by 先驱
function OnUnitGreatPersonCreated(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local playerConfig = PlayerConfigurations[playerID]
	local leader = playerConfig:GetLeaderTypeName()
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_PAX_BRITANNICA') then return end
	local era = nil;
	for row in GameInfo.GreatPersonIndividuals() do
		if row.Index == greatPersonIndividualID and row.GreatPersonClassType == 'GREAT_PERSON_CLASS_ADMIRAL' then
			era = row.EraType
			break
		end
	end
	if not era then return end
	local player = Players[playerID]
	player:AttachModifierByID('HD_VICTORIA_GRANT_ENVOY');
end

Events.UnitGreatPersonCreated.Add(OnUnitGreatPersonCreated)

-- 巴西UD改动, by xiaoxiao
function OnUnitGreatPersonCreatedBrazil(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local civ = playerConfig:GetCivilizationTypeName()
	if not CivilizationHasTrait(civ, 'TRAIT_CIVILIZATION_STREET_CARNIVAL') then return end
	for row in GameInfo.GreatPersonClasses() do
		if row.Index == greatPersonClassID then
			local classType = row.GreatPersonClassType
			player:AttachModifierByID('HD_BRAZIL_UD_' .. classType)
		end
	end
end
Events.UnitGreatPersonCreated.Add(OnUnitGreatPersonCreatedBrazil)

-- 法国UA改动, by xiaoxiao
function FranceWonderGreatPeoplePoint (x, y, buildingId, playerId, cityId, percentComplete, unknown)
	local player = Players[playerId];
	local playerConfig = PlayerConfigurations[playerId];
	local civ = playerConfig:GetCivilizationTypeName();
	if CivilizationHasTrait(civ, 'TRAIT_CIVILIZATION_WONDER_TOURISM') then
        local building = GameInfo.Buildings[buildingId];
        local amount = building.Cost * (GlobalParameters.FRANCE_WONDER_GREATPEOPLE_PERCENTAGE or 0) * 0.01;
        player:GetGreatPeoplePoints():ChangePointsTotal(WRITER_INDEX, amount);
        player:GetGreatPeoplePoints():ChangePointsTotal(ARTIST_INDEX, amount);
        player:GetGreatPeoplePoints():ChangePointsTotal(MUSICIAN_INDEX, amount);
	end
end
Events.WonderCompleted.Add(FranceWonderGreatPeoplePoint);

function FranceGreatPeopleActiveWonder (playerId, unitId, x, y, buildingId, greatWorkId)
	local player = Players[playerId];
	local playerConfig = PlayerConfigurations[playerId];
	local civ = playerConfig:GetCivilizationTypeName();
	if not CivilizationHasTrait(civ, 'TRAIT_CIVILIZATION_WONDER_TOURISM') then
		return;
	end
	local greatWorkInfo = GameInfo.GreatWorks[greatWorkId];
	if greatWorkInfo.GreatPersonIndividualType == nil then
		return;
	end
	local greatPersonInfo = GameInfo.GreatPersonIndividuals[greatWorkInfo.GreatPersonIndividualType];
	if greatPersonInfo.GreatPersonClassType ~= 'GREAT_PERSON_CLASS_WRITER'
			and greatPersonInfo.GreatPersonClassType ~= 'GREAT_PERSON_CLASS_ARTIST'
			and greatPersonInfo.GreatPersonClassType ~= 'GREAT_PERSON_CLASS_MUSICIAN' then
		return;
	end
	local city = CityManager.GetCityAt(x, y);
	local current = city:GetBuildQueue():CurrentlyBuilding();
	if not current then
		return;
	end
	local buildingInfo = GameInfo.Buildings[current];
	if not buildingInfo.IsWonder then
		return;
	end
	local cost = buildingInfo.Cost;
	local rate = GlobalParameters.FRANCE_GREATPEOPLE_WONDER_PERCENTAGE or 0;
	local amount = cost * rate / 100;
	city:GetBuildQueue():AddProgress(amount);
	Game.AddWorldViewText(0, "+" .. amount .. " [ICON_PRODUCTION]", location.x, location.y);
end
Events.GreatWorkCreated.Add(FranceGreatPeopleActiveWonder);

-- 荷兰跳探索, by xiaoxiao
local EXPLORATION_INDEX = GameInfo.Civics['CIVIC_EXPLORATION'].Index;
function NetherlandsBuildingAddedToMap (playerID, cityID, buildingID, plotID, bOriginalConstruction)
	if GlobalParameters.NETHERLANDS_EXPLORATION ~= 1 then
		return;
	end
	local player = Players[playerID];
	local playerConfig = PlayerConfigurations[playerID];
	local civ = playerConfig:GetCivilizationTypeName();
	if CivilizationHasTrait(civ, 'TRAIT_CIVILIZATION_GROTE_RIVIEREN') then
		local building = GameInfo.Buildings[buildingID];
		if building.PrereqDistrict == 'DISTRICT_HARBOR' then
			if not player:GetCulture():HasBoostBeenTriggered(EXPLORATION_INDEX) then
				player:GetCulture():TriggerBoost(EXPLORATION_INDEX, 1);
			elseif not player:GetCulture():HasCivic(EXPLORATION_INDEX) then
				local cost = player:GetCulture():GetCultureCost(EXPLORATION_INDEX);
				player:GetCulture():SetCulturalProgress(EXPLORATION_INDEX, cost);
			end
		end
	end
end
GameEvents.BuildingConstructed.Add(NetherlandsBuildingAddedToMap);

-- 印加梯田触发尤里卡和鼓舞
local TERRACE_FARM_INDEX = GameInfo.Improvements['IMPROVEMENT_TERRACE_FARM'].Index;
local IRRIGATION_INDEX = GameInfo.Technologies['TECH_IRRIGATION'].Index;
local FEUDALISM_INDEX = GameInfo.Civics['CIVIC_FEUDALISM'].Index;
function ImprovementAddedToMap (x, y, improvementId, playerId, resourceId, isPillaged, isWorked)
	if improvementId == TERRACE_FARM_INDEX and resourceId >= 0 then
		local player = Players[playerId];
		player:GetTechs():TriggerBoost(IRRIGATION_INDEX, 1);
		player:GetCulture():TriggerBoost(FEUDALISM_INDEX, 1);
	end
end
Events.ImprovementAddedToMap.Add(ImprovementAddedToMap);

-- 斯基泰 骑兵死亡加鸽子
local HOUSR_ARCHER_INDEX = GameInfo.Units['UNIT_SCYTHIAN_HORSE_ARCHER'].Index;
local GREAT_GENERAL_INDEX = GameInfo.Units['UNIT_GREAT_GENERAL'].Index;
function CavalryKurganFaith (killedPlayerId, killedUnitId, playerId, unitId)
	local player = Players[killedPlayerId];
	local unit = UnitManager.GetUnit(killedPlayerId, killedUnitId);
	for row in GameInfo.UnitPromotions() do
		if (row ~= nil) and (unit ~= nil) and (unit:GetExperience() ~= nil) and (unit:GetExperience():HasPromotion(row.Index)) then
			if (row.PromotionClass == 'PROMOTION_CLASS_LIGHT_CAVALRY') or (row.PromotionClass == 'PROMOTION_CLASS_HEAVY_CAVALRY') then
				player:AttachModifierByID('KURGAN_CAVALRY_FAITH');
			end
			if (row.PromotionClass == 'PROMOTION_CLASS_RANGED') and (unit:GetType() == HOUSR_ARCHER_INDEX) then
				player:AttachModifierByID('KURGAN_CAVALRY_FAITH');
			end
		end
	end
end
Events.UnitKilledInCombat.Add(CavalryKurganFaith);

function GreatGeneralFaith (playerId, unitId)
	local player = Players[playerId];
	local unit = UnitManager.GetUnit(playerId, unitId);
	if (unit ~= nil) and (unit:GetType() == GREAT_GENERAL_INDEX) then
		player:AttachModifierByID('KURGAN_GENERAL_FAITH');
	end
end
Events.UnitRemovedFromMap.Add(GreatGeneralFaith);


function SetPlotProperty (x, y, key, value)
	local plot = Map.GetPlot(x, y);
	if plot ~= nil then
		plot:SetProperty(key, value);
	end
end
GameEvents.SetPlotPropertySwitch.Add(SetPlotProperty);

function AttachModifier (playerId, cityId, modifierId)
	local city = CityManager.GetCity(playerId, cityId);
	city:AttachModifierByID(modifierId);
end
GameEvents.AttachModifierSwitch.Add(AttachModifier);
--波斯

function PersiaGrantYield (player, prereqDistrict, amount)
	if (prereqDistrict == 'DISTRICT_CAMPUS') or (prereqDistrict == 'DISTRICT_INDUSTRIAL_ZONE') or (PrereqDistrict == 'DISTRICT_ENCAMPMENT') then
		player:GetTechs():ChangeCurrentResearchProgress(amount);
	elseif (prereqDistrict == 'DISTRICT_HOLY_SITE') or (prereqDistrict == 'DISTRICT_THEATER') or (PrereqDistrict == 'DISTRICT_ENTERTAINMENT_COMPLEX') or (prereqDistrict == 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') then
		player:GetCulture():ChangeCurrentCulturalProgress(amount);
	else
		player:GetTreasury():ChangeGoldBalance(4 * amount);
	end
end
function PersiaCityConquered (newPlayerId, oldPlayerId, newCityId, x, y)
	local playerConfig = PlayerConfigurations[newPlayerId];
	local leader = playerConfig:GetLeaderTypeName()
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_NADER_SHAH') then
		return;
	end
	local player = Players[newPlayerId];
	local city = CityManager.GetCity(newPlayerId, newCityId);
	local cityBuildings = city:GetBuildings();
	for row in GameInfo.Buildings() do
		if cityBuildings:HasBuilding(row.Index) then
			if (row.PrereqDistrict ~= nil) and (row.Cost ~= 0) and (row.Cost ~= 1) and (row.Cost ~= 9999)then
				cityBuildings:RemoveBuilding(row.Index);
				PersiaGrantYield(player, row.PrereqDistrict, row.Cost);
			end
		end
	end
	local cityDistricts = city:GetDistricts();
	for row in GameInfo.Districts() do
		if cityDistricts:HasDistrict(row.Index) and (row.DistrictType ~= 'DISTRICT_WONDER') and (row.DistrictType ~= 'DISTRICT_CITY_CENTER') then
			cityDistricts:RemoveDistrict(row.Index);
			PersiaGrantYield(player, row.DistrictType, row.Cost);
		end
	end
end
GameEvents.CityConquered.Add(PersiaCityConquered);
--马其顿
function MacedonActiveWonder (newPlayerID, oldPlayerID, newCityID, iCityX, iCityY)
	local player = Players[newPlayerID];
	local playerConfig = PlayerConfigurations[newPlayerID];
	local leader = playerConfig:GetLeaderTypeName();
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_TO_WORLDS_END') then
		return;
	end
	for _,city in player:GetCities():Members() do
		local current = city:GetBuildQueue():CurrentlyBuilding();
		if current then
			local buildingInfo = GameInfo.Buildings[current];
			if buildingInfo then
				if buildingInfo.IsWonder then
					local cost = buildingInfo.Cost;
					local rate = GlobalParameters.ALEXANDER_WONDER_PERCENTAGE or 0;
					local amount = cost * rate / 100;
					city:GetBuildQueue():AddProgress(amount);
				end
			end
		end
	end
end
GameEvents.CityConquered.Add(MacedonActiveWonder);

--瑞典时代分伟人点
function SwedenPlayerEraScoreChanged(playerID, amountAwarded)
	local player = Players[playerID];
	local playerConfig = PlayerConfigurations[playerID];
	local sCiv = playerConfig:GetCivilizationTypeName();
	local sSweden = 'TRAIT_CIVILIZATION_NOBEL_PRIZE';
	local sCAMPUS = 0;
	local sCOMMERCIAL = 0;
	local sINDUSTRIAL = 0;
	local sTHEATER = 0;
	if (not CivilizationHasTrait(sCiv, sSweden)) then
		return;
	end
	for _,city in player:GetCities():Members() do
		local cityDistricts = city:GetDistricts();
		for row in GameInfo.Districts() do
			if cityDistricts:HasDistrict(row.Index) and (row.DistrictType == 'DISTRICT_CAMPUS') then
				sCAMPUS = sCAMPUS + 1;
			end
			if cityDistricts:HasDistrict(row.Index) and (row.DistrictType == 'DISTRICT_COMMERCIAL_HUB') then
				sCOMMERCIAL = sCOMMERCIAL + 1;
			end
			if cityDistricts:HasDistrict(row.Index) and (row.DistrictType == 'DISTRICT_INDUSTRIAL_ZONE') then
				sINDUSTRIAL = sINDUSTRIAL + 1;
			end
			if cityDistricts:HasDistrict(row.Index) and (row.DistrictType == 'DISTRICT_THEATER') then
				sTHEATER = sTHEATER + 1;
			end
		end
	end
	player:GetGreatPeoplePoints():ChangePointsTotal(SCIENTIST_INDEX, amountAwarded * (2 * sCAMPUS + 1));
	player:GetGreatPeoplePoints():ChangePointsTotal(MERCHANT_INDEX, amountAwarded * (2 * sCOMMERCIAL + 1));
	player:GetGreatPeoplePoints():ChangePointsTotal(ENGINEER_INDEX, amountAwarded * (2 * sINDUSTRIAL + 1));
	player:GetGreatPeoplePoints():ChangePointsTotal(WRITER_INDEX, amountAwarded * (2 * sTHEATER + 1));
	player:GetGreatPeoplePoints():ChangePointsTotal(ARTIST_INDEX, amountAwarded * (2 * sTHEATER + 1));
	player:GetGreatPeoplePoints():ChangePointsTotal(MUSICIAN_INDEX, amountAwarded * (2 * sTHEATER + 1));
end

Events.PlayerEraScoreChanged.Add(SwedenPlayerEraScoreChanged);

--瑞典伟人金
function SwedenGreatPersonCreated(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local era = nil;
	local amount = 0;
	for sPlayerID, player in ipairs(Players) do
		local playerConfig = PlayerConfigurations[sPlayerID];
		local sCiv = playerConfig:GetCivilizationTypeName();
		if CivilizationHasTrait(sCiv, 'TRAIT_CIVILIZATION_NOBEL_PRIZE') then
			for row in GameInfo.GreatPersonIndividuals() do
				if row.Index == greatPersonIndividualID and (row.GreatPersonClassType == 'GREAT_PERSON_CLASS_SCIENTIST' or row.GreatPersonClassType == 'GREAT_PERSON_CLASS_MERCHANT' or row.GreatPersonClassType == 'GREAT_PERSON_CLASS_ENGINEER' or row.GreatPersonClassType == 'GREAT_PERSON_CLASS_WRITER' or row.GreatPersonClassType == 'GREAT_PERSON_CLASS_ARTIST' or row.GreatPersonClassType == 'GREAT_PERSON_CLASS_MUSICIAN') then
					era = row.EraType;
					if era == 'ERA_ANCIENT' then
						amount = 0;
					end
					if era == 'ERA_CLASSICAL' then
						amount = 60;
					end
					if era == 'ERA_MEDIEVAL' then
						amount = 120;
					end
					if era == 'ERA_RENAISSANCE' then
						amount = 240;
					end
					if era == 'ERA_INDUSTRIAL' then
						amount = 420;
					end
					if era == 'ERA_MODERN' then
						amount = 660;
					end
					if era == 'ERA_ATOMIC' then
						amount = 960;
					end
					if era == 'ERA_INFORMATION' then
						amount = 1320;
					end
					if era == 'ERA_FUTURE' then
						amount = 9999;
					end
					break
				end
			end
			player:GetTreasury():ChangeGoldBalance(amount);
		end
	end
end

Events.UnitGreatPersonCreated.Add(SwedenGreatPersonCreated);

--武美攻占首都
function RoughRiderCityConquered(playerID, iX, iY)
	local pPlayer = Players[playerID];
	local pCity = CityManager.GetCityAt(iX, iY);
	local originalOwnerID = pCity:GetOriginalOwner();
	local oPlayer = Players[originalOwnerID];
	local count = 0;
	if originalOwnerID ~= playerID and originalOwnerID ~= nil then
		for citystateID, player in ipairs(Players) do
			if (player ~= nil) and (player:GetInfluence() ~= nil) and player:GetInfluence():CanReceiveInfluence() then
				local citystateConfig = PlayerConfigurations[citystateID];
				print(player:GetInfluence():GetSuzerain());
				print(originalOwnerID);
				print(citystateConfig:GetLeaderTypeName());
				if player:GetInfluence():GetSuzerain() == originalOwnerID then
					print(playerID);
					print(player:GetInfluence():GetSuzerain());
					count = player:GetInfluence():GetTokensReceived(originalOwnerID);
					print(count);
					print(player:GetInfluence():GetTokensReceived(originalOwnerID));
					while ((count ~= -1) and (player:GetInfluence():GetSuzerain() ~= playerID)) do
						pPlayer:GetInfluence():GiveFreeTokenToPlayer(citystateID);
						count = count - 1;
					end
				end
			end
		end
	end
end
GameEvents.RoughRiderCityConqueredSwitch.Add(RoughRiderCityConquered);

--朱棣
--连接商路送自由使者和额外金币
function JudyTradeRouteActivityChanged(PlayerID, OriginPlayerID, OriginCityID, TargetPlayerID, TargetCityID)
	local playerConfig = PlayerConfigurations[PlayerID];
	local player = Players[PlayerID];
	local leader = playerConfig:GetLeaderTypeName();
	local targetPlayer = Players[TargetPlayerID];
	local JUDY_CACHE_KEY = 'JUDY_CACHE';
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_YONGLE') then
		return;
	end
	if targetPlayer:GetProperty(JUDY_CACHE_KEY) == 1 then
		return;
	end
	player:AttachModifierByID('JUDY_TRADE_ENVOY');
	player:AttachModifierByID('JUDY_TRADE_GOLD_INTERNATIONAL');
	player:AttachModifierByID('JUDY_TRADE_GOLD_DOMESTIC');
	targetPlayer:SetProperty(JUDY_CACHE_KEY,1);
end
Events.TradeRouteActivityChanged.Add(JudyTradeRouteActivityChanged);
--商路荣神
function JudyGreatPersonActivated(unitOwner, unitID)
	local unit = UnitManager.GetUnit(unitOwner, unitID);
	local player = Players[unitOwner];
	local playerConfig = PlayerConfigurations[unitOwner];
	local leader = playerConfig:GetLeaderTypeName();
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_YONGLE') then
		return;
	end
	if (unit ~= nil) and (unit:GetGreatPerson() ~= nil) and (unit:GetX() < 0) and (unit:GetY() < 0) then
		local PROP_KEY_NUMBER_USED_GREAT_PEOPLE_JUDY = 'NumberOfUsedGreatPeopleJudy';
		local amount = player:GetProperty(PROP_KEY_NUMBER_USED_GREAT_PEOPLE_JUDY);
		if amount == nil then
			amount = 0;
		end
		amount = amount + 1;
		if amount == 1 then
			player:AttachModifierByID('JUDY_TRADE_ADD');
		end
		if amount == 3 then
			amount = 0;
		end
		player:SetProperty(PROP_KEY_NUMBER_USED_GREAT_PEOPLE_JUDY, amount);
	end
end
Events.UnitGreatPersonActivated.Add(JudyGreatPersonActivated);

--武则天
function WztUnitGreatPersonCreated(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local playerConfig = PlayerConfigurations[playerID];
	local player = Players[playerID];
	local leader = playerConfig:GetLeaderTypeName();
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_WU_ZETIAN') then
		return;
	end
	for row in GameInfo.GreatPersonClasses() do
		if row.Index == greatPersonClassID then
			local classType = row.GreatPersonClassType;
			player:AttachModifierByID('WU_ZETIAN_' .. classType);
		end
	end

end
Events.UnitGreatPersonCreated.Add(WztUnitGreatPersonCreated);

--客卿招募
-- Defines
local KeqingPlayersNum = nil;
local KeqingPlayersMap = nil;

local KeqingAbility	= "TRAIT_LEADER_UNIT_KEQING";
local KeqingLoc	= "HD_KeqingLocation";
local KeqingList = "HD_KeqingList";
local KeqingGovTierKey = "HD_KeqingTier";
local KeqingAgain = "HD_KeqingAgain";

local KeqingPersonClass = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_KEQING"].Index;
local KeqingPersonClassHash	= GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_KEQING"].Hash;
function GetPlayersWithTrait(sTrait)
	local tValid = {};
	iLength = 0;

	for _, iPlayer in pairs(PlayerManager.GetWasEverAliveIDs()) do
		local leaderType = PlayerConfigurations[iPlayer]:GetLeaderTypeName();
		for trait in GameInfo.LeaderTraits() do
			if trait.LeaderType == leaderType and trait.TraitType == sTrait then
				tValid[iPlayer] = Players[iPlayer];
				iLength = iLength + 1;
			end
		end
		if not tValid[iPlayer] then
			local civType = PlayerConfigurations[iPlayer]:GetCivilizationTypeName();
			for trait in GameInfo.CivilizationTraits() do
				if trait.CivilizationType == civType and trait.TraitType == sTrait then
					tValid[iPlayer] = Players[iPlayer];
					iLength = iLength + 1;
				end
			end
		end
	end
	return tValid, iLength
end
-- GrantKeqing
function InitKeqing()
	local tKeqing = {};
	KeqingPlayersMap, KeqingPlayersNum = GetPlayersWithTrait(KeqingAbility);
	if (KeqingPlayersNum < 1) then
		return
	end
	for tRow in GameInfo.GreatPersonIndividuals() do
		if tRow.GreatPersonClassType == "GREAT_PERSON_CLASS_KEQING" then
			table.insert(tKeqing, tRow.Index);
		end
	end

	for iPlayer, pPlayer in pairs(KeqingPlayersMap) do
		local tList = pPlayer:GetProperty(KeqingList);
		local num = pPlayer:GetProperty(KeqingAgain);
		if num == 1 then
			return;
		end
		if (not tList) or (#tList < 1) then
			pPlayer:SetProperty(KeqingList, tKeqing);
		end
	end
end
InitKeqing();
function GrantKeqing(iPlayer)
	local pPlayer = Players[iPlayer];
	local tList = pPlayer:GetProperty(KeqingList);
	if #tList < 1 then
		return;
	end

	iRandom = Game.GetRandNum(#tList, "Random Keqing for Player " .. iPlayer) + 1

	local iEra = Game.GetEras():GetCurrentEra();

	Game.GetGreatPeople():GrantPerson(tList[iRandom], KeqingPersonClass, iEra, 0, iPlayer, false);

	table.remove(tList, iRandom);

	pPlayer:SetProperty(KeqingAgain, 1);

	pPlayer:SetProperty(KeqingList, tList);
end
--完成政府区建筑送伟人
function QinBuildingConstructed(iPlayer, iCity, iBuildingType, iPlot, bOriginalConstruction)
	local playerConfig = PlayerConfigurations[iPlayer];
	local player = Players[iPlayer];
	local leader = playerConfig:GetLeaderTypeName();
	local amount = player:GetProperty(PROP_KEY_NUMBER_CIVIC);
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_QIN') then
		return;
	end

	local tBuilding = GameInfo.Buildings[iBuildingType];
	if not tBuilding then 
		return;
	end
	if tBuilding.PrereqDistrict == "DISTRICT_GOVERNMENT" then
		GrantKeqing(iPlayer);
	end
end
GameEvents.BuildingConstructed.Add(QinBuildingConstructed);

--武秦3市政送伟人
function QinCivicCompleted(playerID, iCivic, bCancelled)
	local playerConfig = PlayerConfigurations[playerID];
	local player = Players[playerID];
	local leader = playerConfig:GetLeaderTypeName();
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_QIN') then
		return;
	end
	if (iCivic ~= nil) then
		local PROP_KEY_NUMBER_CIVIC = 'NumberOfCivic';
		local amount = player:GetProperty(PROP_KEY_NUMBER_CIVIC);
		if amount == nil then
			amount = 0;
		end
		amount = amount + 1;
		if amount == 3 then
			GrantKeqing(playerID);
			amount = 0;
		end
		player:SetProperty(PROP_KEY_NUMBER_CIVIC, amount);
	end
end
Events.CivicCompleted.Add(QinCivicCompleted);
--政府区地基送伟人
function QinDistrictConstructed(iPlayer, iDistrictType, iX, iY)
	local playerConfig = PlayerConfigurations[iPlayer];
	local player = Players[iPlayer];
	local leader = playerConfig:GetLeaderTypeName();
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_QIN') then
		return;
	end
	local sDistrict = GameInfo.Districts[iDistrictType].DistrictType;
	if sDistrict == "DISTRICT_GOVERNMENT" then
		GrantKeqing(iPlayer);
	end
end
GameEvents.OnDistrictConstructed.Add(QinDistrictConstructed);

--武马里
local MaliUnit = 'HD_MaliList';
function MaliCityMadePurchase(playerId, cityId, x, y, purchaseType, objectType)
	local playerConfig = PlayerConfigurations[playerId];
	local player = Players[playerId];
	local leader = playerConfig:GetLeaderTypeName();
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_SUNDIATA_KEITA') then
		return;
	end
 	if not (purchaseType == EventSubTypes.UNIT) then
		return;
 	end
	local unitId = player:GetProperty(MaliUnit);
	local pUnit = UnitManager.GetUnit(playerId, unitId);
	UnitManager.RestoreMovement(pUnit, true);
	UnitManager.RestoreUnitAttacks(pUnit, true);
end

Events.CityMadePurchase.Add(MaliCityMadePurchase);

function MaliUnitAddedToMap(playerId, unitId)
	local playerConfig = PlayerConfigurations[playerId];
	local player = Players[playerId];
	local leader = playerConfig:GetLeaderTypeName();
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_SUNDIATA_KEITA') then
		return;
	end
	player:SetProperty(MaliUnit, unitId);
end

Events.UnitAddedToMap.Add(MaliUnitAddedToMap);

--狄奥多拉la拜占庭的宠儿：圣地和跑马场建成时，开发相邻的加成和奢侈资源。创力宗教时可以额外选取一个信条。
local HOLY_SITE_INDEX = GameInfo.Districts['DISTRICT_HOLY_SITE'].Index;
local HIPPODROME_INDEX = GameInfo.Districts['DISTRICT_HIPPODROME'].Index;
local WATER_INDEX = GameInfo.Terrains['TERRAIN_COAST'].Index;
function TheodoraOnDistrictConstructed (playerId, districtId, x, y)
	local playerConfig = PlayerConfigurations[playerId];
	local leader = playerConfig:GetLeaderTypeName();
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_THEODORA') then
		return;
	end
	if (districtId == HOLY_SITE_INDEX) or (districtId == HIPPODROME_INDEX) then
		for direction = 0, 5 do
			local plot = Map.GetAdjacentPlot(x, y, direction);
			if plot then
				if plot:GetResourceType() ~= -1 and plot:GetImprovementType() == -1 and plot:GetDistrictType() == -1 then
					local resourceInfo = GameInfo.Resources[plot:GetResourceType()];
					local validImprovement = nil;
					if (resourceInfo.ResourceClassType ~= 'RESOURCECLASS_STRATEGIC') then
						local isWater = plot:GetTerrainType() == WATER_INDEX;
						for row in GameInfo.Improvement_ValidResources() do
							local improvementType = row.ImprovementType;
							if row.ResourceType == resourceInfo.ResourceType and
									(((not isWater) and (improvementType == 'IMPROVEMENT_MINE'
									or improvementType == 'IMPROVEMENT_QUARRY'
									or improvementType == 'IMPROVEMENT_FARM'
									or improvementType == 'IMPROVEMENT_PLANTATION'
									or improvementType == 'IMPROVEMENT_CAMP'
									or improvementType == 'IMPROVEMENT_PASTURE'
									or improvementType == 'IMPROVEMENT_LUMBER_MILL'))
									or (isWater and improvementType == 'IMPROVEMENT_FISHING_BOATS')) then
								validImprovement = improvementType;
							end
						end
					end
					if validImprovement then
						ImprovementBuilder.SetImprovementType(plot, GameInfo.Improvements[validImprovement].Index, playerId);
					end
				end
			end
		end
	end
end
GameEvents.OnDistrictConstructed.Add(TheodoraOnDistrictConstructed);
--挪威
local VarangianAdventurenumber = 'HD_VarangianAdventure';
function VarangianAdventure()
	for _, iPlayer in pairs(PlayerManager.GetWasEverAliveIDs()) do
		local playerConfig = PlayerConfigurations[iPlayer];
		local leader = playerConfig:GetLeaderTypeName();
		local player = Players[iPlayer];
		if LeaderHasTrait(leader, 'TRAIT_LEADER_HARALD_ALT') then
			local pPlayerVisibility = PlayersVisibility[iPlayer];
			print(pPlayerVisibility);
			if pPlayerVisibility then
				local curExploredCount:number = pPlayerVisibility:GetNumRevealedHexes();
				local amount = player:GetProperty(VarangianAdventurenumber) or 0;
				player:SetProperty(VarangianAdventurenumber, curExploredCount);
				player:GetTreasury():ChangeGoldBalance(curExploredCount - amount);
				return;
			end
		end
	end
end
function HaraldTurnEnd(iTurn:number)
	VarangianAdventure();
end
Events.TurnEnd.Add(HaraldTurnEnd);

function HaraldGoodyHutReward(playerID, unitID, iRewardType, iRewardSubType)
	local playerConfig = PlayerConfigurations[playerID];
	local leader = playerConfig:GetLeaderTypeName();
	local player = Players[playerID];
	if not LeaderHasTrait(leader, 'TRAIT_LEADER_HARALD_ALT') then
		return;
	end
	player:GetTreasury():ChangeGoldBalance(30);
end
Events.GoodyHutReward.Add(HaraldGoodyHutReward);