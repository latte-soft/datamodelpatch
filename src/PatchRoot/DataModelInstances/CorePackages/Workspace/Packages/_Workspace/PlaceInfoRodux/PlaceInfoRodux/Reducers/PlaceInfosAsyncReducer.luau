local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceInfoRodux");
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
local l_RequestMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).RequestMultiplePlaceInfos;
local l_FailedToFetchMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).FailedToFetchMultiplePlaceInfos;
local l_ReceivedMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).ReceivedMultiplePlaceInfos;
return function(v5, v6)
    v5 = v5 or {};
    if v6.type == l_RequestMultiplePlaceInfos_0.name then
        local v7 = {};
        for _, v9 in ipairs(v6.placeIds) do
            v7[v9] = true;
        end;
        return l_Immutable_0.JoinDictionaries(v5, v7);
    elseif v6.type == l_ReceivedMultiplePlaceInfos_0.name then
        local v10 = {};
        for _, v12 in ipairs(v6.placeInfos) do
            v10[v12.placeId] = false;
        end;
        return l_Immutable_0.JoinDictionaries(v5, v10);
    elseif v6.type == l_FailedToFetchMultiplePlaceInfos_0.name then
        local v13 = {};
        for _, v15 in ipairs(v6.placeIds) do
            v13[v15] = false;
        end;
        return l_Immutable_0.JoinDictionaries(v5, v13);
    else
        return v5;
    end;
end;
