-- Units with Ability ABILITY_BLOCK_FIRST_NON_LETHAL_ATTACK_EACH_TURN ignores the first non-lethal combat (as defender) damage each turn. by xiaoxiao

function OnCombat (combatResult)
    local name = "ABILITY_BLOCK_FIRST_NON_LETHAL_ATTACK_EACH_TURN"
    local turn = Game.GetCurrentGameTurn()
    local defender = combatResult[CombatResultParameters.DEFENDER]
    local info = defender[CombatResultParameters.ID]
    local unit = UnitManager.GetUnit(info.player, info.id)
    if unit then
        local used = unit:GetProperty(name .. "_USED_ON_TURN" .. turn)
        if unit:GetAbility():HasAbility(name) and not used then
            local location = unit:GetLocation()
            Game.AddWorldViewText(0, Locale.Lookup("LOC_" .. name .. "_POP"), location.x, location.y)
            unit:ChangeDamage(-defender[CombatResultParameters.DAMAGE_TO])
            unit:SetProperty(name .. "_USED_ON_TURN" .. turn, true)
        end
    end
end

Events.Combat.Add(OnCombat)

-- 垃圾回收中心, by xiaoxiao
function HDRecyclingPlantRecycle (playerId, unitId)
    local unit = UnitManager.GetUnit(playerId, unitId);
    local unitInfo = GameInfo.Units[unit:GetType()];
    local cost = unitInfo.Cost;
    local costRate = GlobalParameters.RECYCLING_PLANT_PRODUCTION_PERCENT or 0;
    local resourceType = unitInfo.StrategicResource;
    local resourceCost = 0;
    for row in GameInfo.Units_XP2() do
        if row.UnitType == unitInfo.UnitType then
            resourceCost = row.ResourceCost;
        end
    end
    local resourceCostMultiplier = 0;
    if resourceType ~= nil then
        for row in GameInfo.GlobalParameters() do
            if row.Name == 'RECYCLING_PLANT_' .. resourceType .. '_MULTIPLIER' then
                resourceCostMultiplier = row.Value;
            end
        end
    end
    local gold = costRate * cost / 100 + resourceCostMultiplier * resourceCost;
    local player = Players[playerId];
    player:GetTreasury():ChangeGoldBalance(gold);
    
	local location = unit:GetLocation();
	local x = location.x;
	local y = location.y;
    Game.AddWorldViewText(0, '+' .. gold ..' [ICON_GOLD]', x, y);

	UnitManager.Kill(unit);

    -- original version: provides production
    -- local production = costRate * cost / 100 + resourceCostMultiplier * resourceCost;
	-- local district = CityManager.GetDistrictAt(x, y);
	-- local city = district:GetCity();
    -- city:GetBuildQueue():AddProgress(production);
end
GameEvents.HDRecyclingPlantRecycle.Add(HDRecyclingPlantRecycle);

-- 奇琴伊察献祭，by xiaoxiao
local SACRIFICED_CHICHEN_ITZA_KEY = 'SACRIFICED_CHICHEN_ITZA';
function HDChiChenItzaSacrifice (playerId, unitId)
    local player = Players[playerId];
    local unit = UnitManager.GetUnit(playerId, unitId);
    local unitInfo = GameInfo.Units[unit:GetType()];
    local unitType = unitInfo.UnitType;
	local sacrificed = player:GetProperty(SACRIFICED_CHICHEN_ITZA_KEY) or {};
    sacrificed[unitType] = 1;
    player:SetProperty(SACRIFICED_CHICHEN_ITZA_KEY, sacrificed);
    local cost = unitInfo.Combat;
    local award = math.floor(cost * GlobalParameters.CHICHEN_ITZA_PERCENTAGE / 100);
    if award < 1 then
        award = 1;
    end
    for i = 1, award do
        player:AttachModifierByID('CHICHEN_ITZA_SACRIFICE_FAITH');
        player:AttachModifierByID('CHICHEN_ITZA_SACRIFICE_CULTURE');
    end
end
GameEvents.HDChiChenItzaSacrifice.Add(HDChiChenItzaSacrifice);

-- 高德院剃度出家，by xiaoxiao
function HDKotokuInPravrajya (playerId, unitId)
    local player = Players[playerId];
    player:AttachModifierByID('KOTOKU_IN_GRANTS_CIVILIAN_MONK');
end
GameEvents.HDKotokuInPravrajya.Add(HDKotokuInPravrajya);

-- 津巴布韦探路者，by xiaoxiao
local PATHFINDER_RESOURCE_KEY = "PATHFINDER_RESOURCE";
local PATHFINDER_TIME_KEY = "PATHFINDER_TIME";
function HDPathfinderRecord (playerId, unitId)
    local unit = UnitManager.GetUnit(playerId, unitId);
	local location = unit:GetLocation();
	local plot = Map.GetPlot(location.x, location.y);
	local resourceId = plot:GetResourceType();
	if resourceId ~= -1 then
		local resourceInfo = GameInfo.Resources[resourceId];
		if resourceInfo.ResourceClassType == 'RESOURCECLASS_LUXURY' then
			unit:SetProperty(PATHFINDER_RESOURCE_KEY, resourceInfo.Index);
		end
	end
end
GameEvents.HDPathfinderRecord.Add(HDPathfinderRecord);
function HDPathfinderPlant (playerId, unitId)
    local unit = UnitManager.GetUnit(playerId, unitId);
	local location = unit:GetLocation();
	local plot = Map.GetPlot(location.x, location.y);
	local resourceId = unit:GetProperty(PATHFINDER_RESOURCE_KEY);
	if resourceId ~= nil then
		ResourceBuilder.SetResourceType(plot, resourceId, 1);
		unit:SetProperty(PATHFINDER_TIME_KEY, (unit:GetProperty(PATHFINDER_TIME_KEY) or 0) + 1);
	end
end
GameEvents.HDPathfinderPlant.Add(HDPathfinderPlant);