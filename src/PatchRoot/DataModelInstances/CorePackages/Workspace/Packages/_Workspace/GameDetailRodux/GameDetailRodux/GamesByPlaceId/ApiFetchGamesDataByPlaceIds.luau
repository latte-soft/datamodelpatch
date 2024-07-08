local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ApiFetchGameIcons_0 = require(l_Parent_0.GameIconRodux).GameIcons.ApiFetchGameIcons;
local l_Functional_0 = require(l_Parent_0.AppCommonLib).Functional;
local v4 = require(l_script_FirstAncestor_0.GamesByPlaceId.GamesMultigetPlaceDetails);
local l_PlaceInfoModel_0 = require(l_Parent_0.PlaceInfoRodux).Models.PlaceInfoModel;
local l_ReceivedPlacesInfos_0 = require(l_Parent_0.PlaceInfoRodux).Actions.ReceivedPlacesInfos;
local l_ConvertUniverseIdToString_0 = require(l_Parent_0.SharedFlags).ConvertUniverseIdToString;
return function(v8, v9)
    return function(v10)
        if not v9 or #v9 == 0 then
            return ;
        else
            return v4(v8, v9):andThen(function(v11)
                local l_responseBody_0 = v11.responseBody;
                local v13 = {};
                local v16 = l_Functional_0.Map(l_responseBody_0, function(v14)
                    local v15 = l_PlaceInfoModel_0.fromWeb(v14);
                    table.insert(v13, (l_ConvertUniverseIdToString_0(v15.universeId)));
                    return v15;
                end);
                v10:dispatch(l_ReceivedPlacesInfos_0(v16));
                if #v13 > 0 then
                    v10:dispatch(l_ApiFetchGameIcons_0(v8, v13));
                end;
                return v16;
            end);
        end;
    end;
end;
