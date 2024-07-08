local l_useUserExperiment_0 = require(script:FindFirstAncestor("InvisibleMode").dependencies).RoactAppExperiment.useUserExperiment;
local v1 = game:DefineFastFlag("InvisibleModeEnabledForAll3", false);
local v2 = game:DefineFastFlag("InvisibleModeExperimentEnabled5", false);
local v3 = game:DefineFastString("InvisibleModeExperimentLayer", "Social.Friends");
local function v5(v4)
    if not v1 then
        if v2 then
            return ((v4 or {})[v3] or {}).invisibleModeAllowed == true;
        else
            return false;
        end;
    else
        return true;
    end;
end;
return {
    ExperimentLayer = v3, 
    FFlagInvisibleModeEnabledForAll = v1, 
    FFlagInvisibleModeExperimentEnabled = v2, 
    isExperimentEnabled = v5, 
    useIsExperimentEnabled = function()
        return l_useUserExperiment_0({
            v3
        }, v5);
    end
};
