local v0 = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment);
local v1 = game:DefineFastString("RealNamesInDisplayNamesIXP_v1", "Social.DisplayNameSetting");
local v2 = game:DefineFastString("RealNamesInDisplayNamesExperimentDefinition", "can_see_real_names");
local v3 = game:DefineFastFlag("RealNamesInDisplayNamesEnabledForAll", false);
local l_useUserExperiment_0 = v0.useUserExperiment;
local function v6(v5)
    if not v3 then
        return ((v5 or {})[v1] or {})[v2] == true;
    else
        return true;
    end;
end;
return {
    isExperimentEnabled = v6, 
    useIsExperimentEnabled = function(v7)
        return l_useUserExperiment_0({
            v1
        }, v6, v7.isExposureEnabled);
    end
};
