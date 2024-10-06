include("SupportFunctions");

CityYield = {};
-- ==================================================================
-- Cache city yield in the following format inside city properties:
-- {
--      "CityYield" = {
--          {SourceType} = {
--              "GOLD" = 10,
--              "FOOD" = 5,
--              ...
--          }
--      }
--      ...
-- }
-- ==================================================================

local PROP_KEY_CITY_YIELD = "CityYield";
local MAX_YIELD_MODIFIER_VALUE = 50;

-- Source type constants.
CityYield.Type = {
    DEFAULT = "DEFAULT",
    MULTINATIONAL_CORP = "MULTINATIONAL_CORP",
}

-- Clear city's all types of yield to 0.
CityYield.ClearYield = function(playerID, cityID, sourceType)
    local yields = {};
    yields["YIELD_CULTURE"] = 0;
    yields["YIELD_FAITH"] = 0;
    yields["YIELD_FOOD"] = 0;
    yields["YIELD_GOLD"] = 0;
    yields["YIELD_PRODUCTION"] = 0;
    yields["YIELD_SCIENCE"] = 0;
    for yieldType, amount in orderedPairs(yields) do
        CityYield.ChangeYield(playerID, cityID, amount, yieldType, sourceType);
    end
end

-- Get the given city's yield for the given yield type and source type.
CityYield.GetYield = function(playerID, cityID, yieldType, sourceType)
    local city:table = CityManager.GetCity(playerID, cityID);
    
    if city ~= nil then
        local cityProps:table = city:GetProperty(PROP_KEY_CITY_YIELD);
        if cityProps == nil then
            cityProps = {};
        end

        sourceType = sourceType or CityYield.Type.DEFAULT;

        local yieldName = string.gsub(yieldType, "YIELD_", "");
        local cityYield = cityProps[sourceType];
        if cityYield ~= nil then
            local currentYield = cityYield[yieldName];
            if currentYield ~= nil then
                return currentYield;
            end
        end
    end

    return 0;
end

-- Change the given city's yield to the given amount for the specific source type.
CityYield.ChangeYield = function(playerID, cityID, yieldAmount, yieldType, sourceType)
    local city:table = CityManager.GetCity(playerID, cityID);

    if city ~= nil then
        local cityProps:table = city:GetProperty(PROP_KEY_CITY_YIELD);
        if cityProps == nil then
            cityProps = {};
        end

        sourceType = sourceType or CityYield.Type.DEFAULT;

        local yieldName = string.gsub(yieldType, "YIELD_", "");
        local deltaYield = yieldAmount;

        local cityYield = cityProps[sourceType];
        if cityYield ~= nil then
            local currentYield = cityYield[yieldName];
            if currentYield ~= nil then
                deltaYield = yieldAmount - currentYield;
            end
        end

        if deltaYield == 0 then return end

        local modifierList = GetModifierList(deltaYield, yieldName);

        -- Grant the yields to the city.
        for _, modifier in ipairs(modifierList) do
            city:AttachModifierByID(modifier);
        end

        -- Update city cache.
        cityYield = cityYield or {};
        cityYield[yieldName] = yieldAmount;
        cityProps[sourceType] = cityYield;
        city:SetProperty(PROP_KEY_CITY_YIELD, cityProps);
    end
end

-- Helper function to get list of modifiers to be used to get the yield amount using recursion.
function GetModifierList(yieldAmount, yieldName)
    local result = {};

    local isNegative = yieldAmount < 0;
    local absAmount = yieldAmount;
    if isNegative then
        absAmount = -yieldAmount
    end

    while MAX_YIELD_MODIFIER_VALUE <= absAmount do
        table.insert(result, "YIELD_CREATOR_" .. yieldName .. "_" .. MAX_YIELD_MODIFIER_VALUE);
        absAmount = absAmount - MAX_YIELD_MODIFIER_VALUE;
    end

    -- The remaining amount should have an existing modifier.
    if absAmount > 0 then
        table.insert(result, "YIELD_CREATOR_" .. yieldName .. "_" .. absAmount);
    end

    if isNegative then
        for index, modifierName in ipairs(result) do
            result[index] = modifierName .. "_N";
        end
    end

    return result;
end

-- Temporary code for backward compatibility.
function OnGameLoadPopulateCityYieldCache()
    local isFirstCheck = true;
    -- Get available modifiers.
    local modifiers = GameEffects.GetModifiers();
    for i, modifier in ipairs(modifiers) do
        local modifierID = GameEffects.GetModifierDefinition(modifier).Id;

        if modifierID:match "^YIELD_CREATOR_" then
            -- Yield creator modifiers
            local yieldInfo = string.gsub(modifierID, "YIELD_CREATOR_", "");
            local type, amount, neg = yieldInfo:match("([^_]+)_(%d+)_?([^%d]?)");
            amount = tonumber(amount);
            if neg == "N" then
                amount = -amount;
            end

            -- Get the owner and city id.
            local owner = GameEffects.GetModifierOwner(modifier);
            local ownerString = GameEffects.GetObjectString(owner);
            -- The string is like: City (65536), Owner: 0, Name: LOC_CITY_NAME_AMSTERDAM
            local cityID, ownerID = ownerString:match("[^%d]*(%d+)[^%d]*(%d+).*");

            local city:table = CityManager.GetCity(ownerID, cityID);

            if city ~= nil then
                local cityProps:table = city:GetProperty(PROP_KEY_CITY_YIELD);
                if isFirstCheck and cityProps ~= nil then return end
                isFirstCheck = false;

                -- Update cache
                cityProps = cityProps or {};
                cityProps[CityYield.TYPE_MULTINATIONAL_CORP] = cityProps[CityYield.TYPE_MULTINATIONAL_CORP] or {};
                cityProps[CityYield.TYPE_MULTINATIONAL_CORP][type] = cityProps[CityYield.TYPE_MULTINATIONAL_CORP][type] or 0;
                -- Add all modifiers' amount together.
                cityProps[CityYield.TYPE_MULTINATIONAL_CORP][type] = cityProps[CityYield.TYPE_MULTINATIONAL_CORP][type] + amount;
                city:SetProperty(PROP_KEY_CITY_YIELD, cityProps);
            end
        end
    end
end

Events.LoadScreenClose.Add(OnGameLoadPopulateCityYieldCache);

ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.CityYield = CityYield;
