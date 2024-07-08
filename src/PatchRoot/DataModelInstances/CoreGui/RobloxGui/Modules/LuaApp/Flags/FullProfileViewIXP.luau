game:DefineFastFlag("FullProfileViewIXPSetupEnabled", false);
game:DefineFastFlag("FullProfileViewIXPEnabled", false);
game:DefineFastFlag("FullProfileViewEnabledForAll", false);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v1 = require(l_script_FirstAncestor_0.LuaApp.Experiment.AppUserLayers);
local l_useUserExperiment_0 = require(l_script_FirstAncestor_0.LuaApp.Experiment.RoactAppExperiment).useUserExperiment;
local function v3()
    return game:GetFastFlag("FullProfileViewIXPSetupEnabled");
end;
local function _()
    return game:GetFastFlag("FullProfileViewIXPEnabled");
end;
local function _()
    return game:GetFastFlag("FullProfileViewEnabledForAll");
end;
local function v9(v6)
    local v7 = (v6 or {})[v1.SocialProfilePeekViewLayer] or {};
    local v8;
    if game:GetFastFlag("FullProfileViewIXPEnabled") then
        v8 = true;
        if not (v7.useFullProfileView ~= true) then
            goto label0;
        end;
    end;
    v8 = game:GetFastFlag("FullProfileViewEnabledForAll");
    ::label0::;
    return v8;
end;
return {
    GetFFlagFullProfileViewIXPSetupEnabled = v3, 
    isFeatureActive = v9, 
    useIsFeatureActive = function()
        return l_useUserExperiment_0({
            v1.SocialProfilePeekViewLayer
        }, v9);
    end
};
