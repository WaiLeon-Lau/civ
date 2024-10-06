--------------------------------
-- Temp Interface for DEBUG   --
--------------------------------

-- NOTE: The content here can be loaded without game reload.
-- NOTE: You can use ExposedMembers to call the functions in the Gameplay (but may cause desync in multiplayer), see also Temp_Gameplay.lua
-- NOTE: It is better to use GameEvents to implement some gameplay changes.

-- Do not change the above ones
-----------------------------------------------------------------------
include "HD_StateUtils"

Utils = ExposedMembers.DLHD.Utils;
GameEvents = ExposedMembers.GameEvents;

function DevineInspirationWonderFaith( iX, iY, buildingID, playerID, cityID, iPercentComplete, iUnknown )
    local pPlayerConfig = PlayerConfigurations[playerID]
    local player = Players[playerID]
    local city = CityManager.GetCity(playerID, cityID)
    local building = GameInfo.Buildings[buildingID]
    local sDarma = 'TRAIT_CIVILIZATION_DHARMA'
    local sCiv = pPlayerConfig:GetCivilizationTypeName()

    if player ~= nil and city ~= nil and building ~= nil then
        local amount = building.Cost * GlobalParameters.DEVINE_INSPIRATION_WONDER_FAITH_PERCENTAGE * 0.01
        local belief = GameInfo.Beliefs['BELIEF_DIVINE_INSPIRATION'].Index
        local CityReligion = city:GetReligion()
        local Majority = CityReligion:GetMajorityReligion()
        local CityReligions = CityReligion:GetReligionsInCity()
        local religions = Game.GetReligion():GetReligions();
        if religions ~= nil then
            for _, religion in ipairs(religions) do
                for _, beliefIndex in ipairs(religion.Beliefs) do 
                    if  beliefIndex == belief then                      
                        if (religion.Religion == Majority) then
                            GameEvents.RequestChangeFaithBalance.Call(playerID, amount)
                            return
                        end
                        if (Utils.CivilizationHasTrait(sCiv,sDarma)) then
                            for _, rel in ipairs(CityReligions) do
                                if rel.Religion == religion.Religion then
                                    if rel.Followers >= 1 then
                                        GameEvents.RequestChangeFaithBalance.Call(playerID, amount)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

Events.WonderCompleted.Add(DevineInspirationWonderFaith)


-- local m_Walls = GameInfo.Buildings["BUILDING_WALLS"].Index
local m_Walls = GameInfo.Buildings["BUILDING_WALLS_EARLY"].Index
-- local PROP_KEY_HAVE_GRANT_WALL = 'HaveGrantWalls'

function FreeWallForCapital(playerID, cityID, iX, iY)
    local player = Players[playerID]
    local city = CityManager.GetCity(playerID, cityID)
    if player:IsMajor() then
        -- print('Capital', city:IsCapital(), 'original capital', city:IsOriginalCapital())
        -- local have_granted = player:GetProperty(PROP_KEY_HAVE_GRANT_WALL)
        local have_granted = GetObjectState(player, g_PropertyKeys_HD.PlayerFlags.HaveGrantWalls)
        if have_granted == nil then
            if (city:IsOriginalCapital()) then
                -- Utils.CreateBuilding(playerID, cityID, m_Walls)
                GameEvents.RequestCreateBuilding.Call(playerID, cityID, m_Walls)
                -- Utils.SetPlayerProperty(playerID, PROP_KEY_HAVE_GRANT_WALL, true)
                SetObjectState(player, g_PropertyKeys_HD.PlayerFlags.HaveGrantWalls, 1)
            end
        end
    end
end
Events.CityAddedToMap.Add(FreeWallForCapital)

-- For korea
function getCityCenterPlotIndex(city)
    local x = city:GetX()
    local y = city:GetY()
    return Map.GetPlotIndex(x, y)
end

function UpdateCityHasGovernor(playerID)
    local player = Players[playerID]
    local pCities = player:GetCities()

    for _, city in pCities:Members() do
        local plotID = getCityCenterPlotIndex(city)
        local value = 0
        if city:GetAssignedGovernor() == nil then
            value = 0
        else
            value = 1
        end
        local plot = Map.GetPlotByIndex(plotID)
        -- print(plotID, value)
        SetObjectState(plot, g_PropertyKeys_HD.CityFlags.HasAssignedGovernor, value)
    end
end

function OnGovernorChanged(playerID, governorID)
    -- print('OnGovernorChanged', playerID, governorID)
    UpdateCityHasGovernor(playerID)
end

function OnGovernorAssigned(cityOwner, cityID, governorOwner, governorType)
    -- print('OnGovernorAssigned', cityOwner, cityID, governorOwner, governorType)
    UpdateCityHasGovernor(governorOwner)
end

Events.GovernorChanged.Add(OnGovernorChanged)
Events.GovernorAppointed.Add(OnGovernorChanged)
Events.GovernorAssigned.Add(OnGovernorAssigned)

function cityHasDistrict(city, districtID)
    local districts = city:GetDistricts();
    if districts then
        return districts:HasDistrict(districtID, true);
    end
    return false
end

function DetectFavorChanged(playerID)
    local player = Players[playerID]
    local pCities = player:GetCities()
    local playerFavor   :number = player:GetFavor()
    local dipDistrict = GameInfo.Districts['DISTRICT_DIPLOMATIC_QUARTER']
    if dipDistrict == nil then
        return
    end
    local dipDistrictID = dipDistrict.Index
    local hasFavor = 0
    if playerFavor and playerFavor > 0 then
        hasFavor = 1
    end
    -- print(playerID, playerFavor)
    for _, city in pCities:Members() do
        if cityHasDistrict(city, dipDistrictID) then
            local plotID = getCityCenterPlotIndex(city)
            local plot = Map.GetPlotByIndex(plotID)
            local lastValue = GetObjectState(plot, g_PropertyKeys_HD.CityFlags.HasDipFavor)
            -- print(plot:GetX(), plot:GetY(), 'here', lastValue, hasFavor)
            SetObjectState(plot, g_PropertyKeys_HD.CityFlags.HasDipFavor, hasFavor)
            if lastValue ~= hasFavor then
                GameEvents.ForceSyncFavor.Call(playerID)
            end
        end
    end
end
Events.CityProjectCompleted.Add(DetectFavorChanged)
Events.FavorChanged.Add(DetectFavorChanged);

-- Bug fix: When upgraded, free promotion will make the experience to 15 exp.
function getPropKey(playerID, unitID)
    return 'promotion_bug_fix_' .. tostring(playerID) .. '_' .. tostring(unitID);
end

function monitorPromotionAvailable(playerID, unitID, promotionID)
    -- print('promote available', playerID, unitID, promotionID)
    local player = Players[playerID]
    local unit = UnitManager.GetUnit(playerID, unitID)
    if (player ~= nil) and (unit == nil) then
        -- the promotion available was set before unit added and cause the bug.
        SetObjectState(player, getPropKey(playerID, unitID), 1)
    end
end

function monitorUnitUpgraded(playerID, unitID)
    -- print('upgraded', playerID, unitID)
    local player = Players[playerID]
    local unit = UnitManager.GetUnit(playerID, unitID)
    if (player == nil) or (unit == nil) then
        return
    end
    local value = GetObjectState(player, getPropKey(playerID, unitID))
    if value == 1 then
        -- print('reached');
        local amount = unit:GetExperience():GetExperienceForNextLevel()
        -- Utils.SetUnitExperience(playerID, unitID, amount)
        GameEvents.ChangeUnitExperience.Call(playerID, unitID, amount)

        SetObjectState(player, getPropKey(playerID, unitID), 0)
    end
end

-- Events.UnitPromoted.Add(monitorPromotion)
Events.UnitPromotionAvailable.Add(monitorPromotionAvailable)
-- Events.UnitAddedToMap.Add(monitorUnitAdd)
Events.UnitUpgraded.Add(monitorUnitUpgraded)
-- Events.UnitRemovedFromMap.Add(monitorUnitRemove)

---------------------------------------------------------------------------
--[[
-- Espionage
function GovSpiesGetTechOnSpyMissionCompleted(playerID, missionID)
    local pPlayer:table = Players[playerID];
    local buildingID:number = GameInfo.Buildings['BUILDING_GOV_SPIES'].Index;
    if pPlayer and Utils.HasBuildingWithinCountry(playerID, buildingID) then
        local pPlayerDiplomacy:table = pPlayer:GetDiplomacy();
		if pPlayerDiplomacy then
			local mission = pPlayerDiplomacy:GetMission(playerID, missionID);
            local m_missionHistory = mission;
            if m_missionHistory then
                if mission.InitialResult == EspionageResultTypes.SUCCESS_UNDETECTED or 
                   mission.InitialResult == EspionageResultTypes.SUCCESS_MUST_ESCAPE then
                    local kOpDef:table = GameInfo.UnitOperations[m_missionHistory.Operation];
	                if kOpDef ~= nil then
		                if kOpDef.Hash == UnitOperationTypes.SPY_COUNTERSPY or 
                           kOpDef.Hash == UnitOperationTypes.SPY_LISTENING_POST or 
                           kOpDef.Hash == UnitOperationTypes.SPY_GAIN_SOURCES then 
                            return;
                        end 
                        local amount = 500;
			            pPlayer:GetTechs():ChangeCurrentResearchProgress(amount);
                        local message = '[COLOR:ResScienceLabelCS]+' .. tostring(amount) .. '[ENDCOLOR][ICON_Science]';
                        Game.AddWorldViewText(0, message, Map.GetPlotLocation(m_missionHistory.PlotIndex));
                    end
                end
            end
        end
    end
end

Events.SpyMissionCompleted.Add(GovSpiesGetTechOnSpyMissionCompleted)
---]]


-- Kublai
-- ===========================================================================
-- Grant CivTraits On Conquer Original Capital -- part of UI
-- ===========================================================================
function KublaiGrantCivTraitOnConquerOriginalCapital( playerID, cityID, iX, iY )
    local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local sLeader = pPlayerConfig:GetLeaderTypeName()
	local sKublai = 'TRAIT_LEADER_KUBLAI'
    local pCity = CityManager.GetCity(playerID, cityID)
    if pPlayer ~= nil and Utils.LeaderHasTrait(sLeader, sKublai) then
        -- print('Kublai3',playerID,cityID,pCity:IsOriginalCapital()) 
        if pCity ~= nil then
			if pCity:IsOriginalCapital() then  -- unable to be used in Gameplay
			    GameEvents.KublaiGrantCivTraitSwitch.Call( playerID, iX, iY )
                -- print('Kublai4',playerID,cityID,pCity:GetOriginalOwner()) 
			end
		end
    end
end

Events.CityAddedToMap.Add(KublaiGrantCivTraitOnConquerOriginalCapital)

-- Eleanor
-- ===========================================================================
-- Judgement of Love -- part of UI
-- ===========================================================================
function ProjectEnemyCitiesChangeLoyalty(playerID, cityID, projectID)
	local pPlayer = Players[playerID]
	local pCity = CityManager.GetCity(playerID, cityID)
    local dX = pCity:GetX()
    local dY = pCity:GetY()
    if pPlayer == nil then
        return
    end
    -- print('PROJECT_CIRCUSES_AND_BREAD', playerID, cityID, projectID)
    if projectID == GameInfo.Projects['PROJECT_CIRCUSES_AND_BREAD'].Index then
		local players = Game.GetPlayers{ Alive=true }
        -- print('PROJECT_CIRCUSES_AND_BREAD1', players)
		for _, player in ipairs(players) do
            -- print('PROJECT_CIRCUSES_AND_BREAD2', player:GetID())
			if player:GetID() ~= playerID then -- or player:IsMinor()            
			    local playerCities = player:GetCities()
			    for _, city in playerCities:Members() do
                    local iX = city:GetX()
                    local iY = city:GetY()
					local cityCulturalIdentity = city:GetCulturalIdentity()
                    if cityCulturalIdentity then
                        local loyaltyPerTurn = cityCulturalIdentity:GetLoyaltyPerTurn()
                        if loyaltyPerTurn < 0 then
                            -- print('PROJECT_CIRCUSES_AND_BREAD5', iX, iY, dX, dY )
                            GameEvents.ProjectEnemyCitiesChangeLoyaltySwitch.Call(iX, iY, dX, dY)
                        end
                    end
				end
			end
		end	
    end
end

Events.CityProjectCompleted.Add(ProjectEnemyCitiesChangeLoyalty)

Utils.GetCulturalProgress = function (playerId, civicId)
    local player = Players[playerId];
	if player then
		return player:GetCulture():GetCulturalProgress(civicId);
	end
end

Utils.GetFreightAmount = function (playerId, cityId)
	local amount = 0;
	local city = CityManager.GetCity(playerId, cityId);
	for _, route in ipairs(city:GetTrade():GetOutgoingRoutes()) do
		if route.DestinationCityPlayer ~= route.OriginCityPlayer then
			amount = amount + 1;
		end
	end
	for _, route in ipairs(city:GetTrade():GetIncomingRoutes()) do
		if route.DestinationCityPlayer == route.OriginCityPlayer then
			amount = amount + 1;
		end
	end
	return amount;
end

--林肯解放
--HD_LIBERATION_LINCOLN
function HD_LIBERATION_LINCOLN (playerId, unitId)
    local player = Players[playerId];
	local unit = UnitManager.GetUnit(playerId, unitId);
	local location = unit:GetLocation();
	local x = location.x;
	local y = location.y;
	local plot = Map.GetPlot(x, y);
	local districtId = plot:GetDistrictID();
    local district = player:GetDistricts():FindID(districtId);
    local city = district:GetCity();
    local cityId = city:GetID();
    local amount = unit:GetBuildCharges();
    while (amount ~= 0)  do
        GameEvents.AttachModifierSwitch.Call(playerId, cityId, 'HD_LIBERATION_LINCOLN');
        amount = amount - 1;
    end
        GameEvents.AttachModifierSwitch.Call(playerId, cityId, 'HD_LIBERATION_LINCOLN_POPULATION');
end
GameEvents.HD_LIBERATION_LINCOLN.Add(HD_LIBERATION_LINCOLN);

--神圣建筑师
--HD_CITADELOFGOD
function HD_CITADELOFGOD (playerId, unitId)
    --Nothing
end
GameEvents.HD_CITADELOFGOD.Add(HD_CITADELOFGOD);

function RoughRiderOnConquerOriginalCapital( playerID, cityID, iX, iY )
    local pPlayer = Players[playerID];
	local pPlayerConfig = PlayerConfigurations[playerID];
	local sLeader = pPlayerConfig:GetLeaderTypeName();
	local sRoosevelt = 'TRAIT_LEADER_ROOSEVELT_COROLLARY';
    local pCity = CityManager.GetCity(playerID, cityID);
    if pPlayer ~= nil and Utils.LeaderHasTrait(sLeader, sRoosevelt) then
        if pCity ~= nil then
			if pCity:IsOriginalCapital() then  -- unable to be used in Gameplay
			    GameEvents.RoughRiderCityConqueredSwitch.Call( playerID, iX, iY )
			end
		end
    end
end

Events.CityAddedToMap.Add(RoughRiderOnConquerOriginalCapital);