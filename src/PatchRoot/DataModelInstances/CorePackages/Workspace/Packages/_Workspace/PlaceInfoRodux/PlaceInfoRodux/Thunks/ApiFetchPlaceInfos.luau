local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceInfoRodux");
local l_Functional_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Functional;
local l_GetPlaceInfos_0 = require(l_script_FirstAncestor_0.Requests).GetPlaceInfos;
local l_PlaceInfoModel_0 = require(l_script_FirstAncestor_0.Models).PlaceInfoModel;
local l_ReceivedMultiplePlaceInfos_0 = require(l_script_FirstAncestor_0.Actions).ReceivedMultiplePlaceInfos;
return function(v5, v6)
    return function(v7)
        return l_GetPlaceInfos_0(v5, v6):andThen(function(v8)
            local v10 = l_Functional_0.Map(v8.responseBody, function(v9)
                return l_PlaceInfoModel_0.fromWeb(v9);
            end);
            v7:dispatch(l_ReceivedMultiplePlaceInfos_0(v10));
            return v10;
        end):catch(function(v11)
            warn("ApiFetchlaceInfos failed with error code " .. tostring(v11.HttpError));
        end);
    end;
end;
