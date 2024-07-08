local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceInfoRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReceivedMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).ReceivedMultiplePlaceInfos;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
return function(v4, v5)
    v4 = v4 or {};
    if v5.type == l_ReceivedMultiplePlaceInfos_0.name then
        local v6 = {};
        for _, v8 in ipairs(v5.placeInfos) do
            v6[v8.placeId] = v8;
        end;
        v4 = l_Immutable_0.JoinDictionaries(v4, v6);
    end;
    return v4;
end;
