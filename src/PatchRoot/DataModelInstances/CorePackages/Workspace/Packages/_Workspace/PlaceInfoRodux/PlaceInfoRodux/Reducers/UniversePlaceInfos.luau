local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceInfoRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_ReceivedPlacesInfos_0 = require(l_script_FirstAncestor_0.Actions).ReceivedPlacesInfos;
local l_ConvertUniverseIdToString_0 = require(l_Parent_0.SharedFlags).ConvertUniverseIdToString;
return function(v5, v6)
    v5 = v5 or {};
    if v6.type == l_ReceivedPlacesInfos_0.name then
        for _, v8 in pairs(v6.placesInfos) do
            v5 = l_Immutable_0.Set(v5, l_ConvertUniverseIdToString_0(v8.universeId), v8);
        end;
    end;
    return v5;
end;
