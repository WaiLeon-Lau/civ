-- =======================================================================
-- Common helper functions to be used by other files.
-- =======================================================================
ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.Utils = ExposedMembers.DLHD.Utils or {};
Utils = ExposedMembers.DLHD.Utils;

Utils.HasBuildingWithinCountry = function( playerID, buildingID )
    local player = Players[playerID]
    local Allcity = player:GetCities()
    if player ~= nil and Allcity ~= nil then
        for _, city in Allcity:Members() do
            local CityHasBuilding = city:GetBuildings():HasBuilding(buildingID)
            if CityHasBuilding then
                return true
            end            
        end       
    end
    return false
end

Utils.GetDistrictIndex = function(districtType)
    local row = GameInfo.Districts[districtType]
    if row then
        return row.Index
    end
    return nil
end

Utils.IsDistrictType = function(districtType, targetType, noUniqueReplace)
    -- print(districtType, targetType, noUniqueReplace)
    local index = Utils.GetDistrictIndex(targetType)
    if index then
        if districtType == index then
            return true
        end
        if noUniqueReplace then
            return false
        end
        for tRow in GameInfo.DistrictReplaces() do
            if tRow.ReplacesDistrictType == targetType then
                if districtType == Utils.GetDistrictIndex(tRow.CivUniqueDistrictType) then
                    return true
                end
            end
        end
    end
    return false
end

Utils.CivilizationHasTrait = function(sCiv, sTrait)
    for tRow in GameInfo.CivilizationTraits() do
        if (tRow.CivilizationType == sCiv and tRow.TraitType == sTrait) then
            return true
        end
    end
    return false
end

Utils.LeaderHasTrait = function (sLeader, sTrait)
    for tRow in GameInfo.LeaderTraits() do
        if (tRow.LeaderType == sLeader and tRow.TraitType == sTrait) then return true end
    end
    return false
end

Utils.PlayerAttachModifierByID = function(playerID, sModifierID)
    local player = Players[playerID]
    if player ~= nil then
        player:AttachModifierByID(sModifierID)
    end
end

Utils.ChangeGoldBalance = function(playerID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetTreasury():ChangeGoldBalance(amount)
    end
end

Utils.GetPlotDistance = function(plotIndex, otherPlotIndex)
    return Map.GetPlotDistance(plotIndex, otherPlotIndex)
end

Utils.RemoveBuilding = function(playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    if city ~= nil then
        local buildings = city:GetBuildings()
        buildings:RemoveBuilding(buildingID)
    end
end

Utils.CreateBuilding = function(playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    if city ~= nil then
        local buildingQueue = city:GetBuildQueue()
        buildingQueue:CreateBuilding(buildingID)
    end
end

Utils.SetImprovementType = function(plotID, ImprovementID, OwnerID)
    local plot = Map.GetPlotByIndex(plotID)
    ImprovementBuilder.SetImprovementType(plot, ImprovementID, OwnerID)
end

Utils.SetPlotProperty = function(plotID, key, value)
    local plot = Map.GetPlotByIndex(plotID)
    print(plot:GetX(), plot:GetY(), plot)
    plot:SetProperty(key, value)
end

-- Utils.SetPlayerProperty = function(playerID, key, value)
--     local player = Players[playerID]
--     player:SetProperty(key, value)
-- end

-- Utils.SendEnvoy = function(playerID, citystateID)
--     -- Need to make sure the second is citystate
--     local player = Players[playerID]
--     if player ~= nil then
--         player:GetInfluence():GiveFreeTokenToPlayer(citystateID)
--     end
-- end

Utils.AddGreatPeoplePoints = function(playerID, gppID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetGreatPeoplePoints():ChangePointsTotal(gppID, amount)
    end
end

Utils.SetUnitExperience = function(playerID, unitID, amount)
    local unit = UnitManager.GetUnit(playerID, unitID)
    if unit ~= nil then
        -- print('+exp', amount)
        unit:GetExperience():SetExperienceLocked(false);
        unit:GetExperience():ChangeExperience(amount);
    end
end

Utils.SetUnitStoredPromotions = function(playerID, unitID, amount)
    local unit = UnitManager.GetUnit(playerID, unitID)
    if amount == nil then 
        amount = 1
    end
    if unit ~= nil then
        unit:GetExperience():ChangeStoredPromotions(amount);
    end
end

-- Generic helper function to grant a relic to the given player.
Utils.GrantRelic = function(playerID)
    local player = Players[playerID];

    if player ~= nil then
        -- Grant relic here.
        player:AttachModifierByID("MODIFIER_RELIC_CREATOR");

        -- Cancel additional notification for the local player (the last RELIC_CREATED notification).
        local localPlayerId = Game.GetLocalPlayer();
        if localPlayerId == playerID then
            local lastRelicCreated = nil;
            local notificationIds = NotificationManager.GetList(localPlayerId);
            for _, notificationId in ipairs(notificationIds) do
                local notification = NotificationManager.Find(localPlayerId, notificationId);
                if notification ~= nil and notification:GetType() == NotificationTypes.RELIC_CREATED then
                    lastRelicCreated = notification;
                end
            end
            if lastRelicCreated ~= nil and not lastRelicCreated:IsDismissed() then
                NotificationManager.Dismiss(localPlayerId, lastRelicCreated:GetID());
            end
        end
    end
end

Utils.GetBuildingLocation = function (playerId, cityId, buildingId)
	local city = CityManager.GetCity(playerId, cityId);
	if city ~= nil then
		return city:GetBuildings():GetBuildingLocation(buildingId);
	end
end

local PRESERVE_NOT_ON_MAP_KEY = 'HD_PRESERVE_NOT_ON_MAP';
Utils.GetCollectionProgress = function (playerId, buildingId)
	if GameInfo.HD_PreserveCollectionProgress == nil then
		return nil;
	end
	local hasCollectable = false;
	local collectable = {};
	local notInMapModifiers = {};
	local collected = {};
	local uncollected = {};
	local buildingInfo = GameInfo.Buildings[buildingId];
	for row in GameInfo.HD_PreserveCollectionProgress() do
		if row.BuildingType == buildingInfo.BuildingType then
			hasCollectable = true;
			collectable[row.CollectedModifierId] = {
				objectType = row.ObjectType,
				name = row.ObjectName,
				collectedModifierId = row.CollectedModifierId,
				notInMapModifierId = row.NotInMapModifierId,
				notInMapPropertyKey = row.NotInMapPropertyKey
			};
			if row.NotInMapPropertyKey ~= nil then
				local inMap = Game.GetProperty(row.NotInMapPropertyKey);
				if inMap == nil then
					collectable[row.CollectedModifierId] = nil;
				end
			end
			if row.NotInMapModifierId ~= nil then
				notInMapModifiers[row.NotInMapModifierId] = row.CollectedModifierId;
			end
		end
	end
	-- Modifier
	if not hasCollectable then
		return nil;
	end
	-- Remove not in Map
	for _, modifier in ipairs(GameEffects.GetModifiers()) do
		local modifierId = GameEffects.GetModifierDefinition(modifier).Id;
		local active = GameEffects.GetModifierActive(modifier);
		if active and (notInMapModifiers[modifierId] ~= nil) then
			collectable[notInMapModifiers[modifierId]] = nil;
		end
	end
	local processed = {};
	for _, modifier in ipairs(GameEffects.GetModifiers()) do
		local modifierId = GameEffects.GetModifierDefinition(modifier).Id;
		local owner = GameEffects.GetModifierOwner(modifier);
		local ownerId = GameEffects.GetObjectsPlayerId(owner);
		if (collectable[modifierId] ~= nil) and (ownerId ~= nil) and (playerId == ownerId) and (processed[modifierId] == nil) then
			processed[modifierId] = 1;
			local active = GameEffects.GetModifierActive(modifier);
			local object = collectable[modifierId];
			if active then
				table.insert(collected, object);
			else
				table.insert(uncollected, object);
			end
		end
	end
	return collected, uncollected;
end