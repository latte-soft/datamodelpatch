local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v2 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsExpCustomExposureLog);
local v3 = require(l_Modules_0.Personalization.Flags.FStringLuaAppChartsPageExpLayer);
return {
    getIsChartsPageRenameEnabled = function()
        local l_v3_0 = v3;
        local v5 = v1.default:getLayerVariables(l_v3_0, v2);
        if v5 and v5.IsChartsPageRenameEnabled ~= nil then
            if v2 then
                v1.default:sendCustomExposureLog(l_v3_0);
            end;
            return v5.IsChartsPageRenameEnabled;
        else
            return false;
        end;
    end
};
