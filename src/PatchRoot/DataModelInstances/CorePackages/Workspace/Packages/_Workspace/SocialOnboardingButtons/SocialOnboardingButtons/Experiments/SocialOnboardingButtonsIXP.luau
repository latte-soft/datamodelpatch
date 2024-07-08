local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Enums.ColorVariantsEnum);
local l_useUserExperiment_0 = require(l_Parent_1.RoactAppExperiment).useUserExperiment;
local l_FStringSocialOnboardingExperimentLayer_0 = require(l_Parent_1.SharedFlags).FStringSocialOnboardingExperimentLayer;
local v5 = game:DefineFastString("SocialOnboardingEnabledVariableName", "socialOnboardingBtnsEnabled");
local v6 = game:DefineFastString("SocialOnboardingColorVariableName", "socialOnboardingBtnsColor");
local function v8(v7)
    return (v7[l_FStringSocialOnboardingExperimentLayer_0] or {})[v5] or false;
end;
local function v10(v9)
    return (v9[l_FStringSocialOnboardingExperimentLayer_0] or {})[v6] or v2.Default;
end;
return {
    useSocialOnboardingBtnsEnabled = function()
        return l_useUserExperiment_0({
            l_FStringSocialOnboardingExperimentLayer_0
        }, v8);
    end, 
    useSocialOnboardingBtnsColor = function()
        return l_useUserExperiment_0({
            l_FStringSocialOnboardingExperimentLayer_0
        }, v10);
    end
};
