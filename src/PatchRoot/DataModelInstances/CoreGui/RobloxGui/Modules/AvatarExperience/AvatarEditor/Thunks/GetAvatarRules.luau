local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_CorePackages_0.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.RoduxUtils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounterNoAnalyticsArgument);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
return v7.convertAvatarEditorServiceThunk("GetAvatarRules", function(v11, v12)
    return l_PerformFetch_0.Single(v6.GetAvatarRulesKey, function(_)
        return v3.new(function(v14, v15)
            local l_status_0, l_result_0 = pcall(function()
                return v12:GetAvatarRules();
            end);
            if not l_status_0 then
                if v10() then
                    v8(v9.Counter.AvatarEditorServiceErrors.GetAvatarRules);
                end;
                v2.warn("WebApi failure in GetAvatarRules");
                v15({
                    HttpError = Enum.HttpError.OK
                });
                return ;
            else
                v14((v5.tableToCamelCaseKeys(l_result_0)));
                return ;
            end;
        end);
    end)(v11);
end);
