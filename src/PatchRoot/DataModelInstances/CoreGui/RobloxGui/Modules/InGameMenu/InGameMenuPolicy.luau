local l_CorePackages_0 = game:GetService("CorePackages");
local l_PolicyProvider_0 = require(l_CorePackages_0.InGameMenuDependencies).PolicyProvider;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseVoiceExitBetaLanguage;
local v3 = l_PolicyProvider_0.withGetPolicyImplementation((l_PolicyProvider_0.GetPolicyImplementations.MemStorageService("app-policy")));
local v4 = require(script.Parent.Parent.Flags.GetFIntEducationalPopupDisplayMaxCount);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local v6 = game:DefineFastFlag("UseGUACforDUARPolicy", false);
v3.Mapper = function(v7)
    return {
        enableInGameHomeIcon = function()
            if not v6 then
                return l_isSubjectToDesktopPolicies_0();
            else
                return v7.EnableInGameHomeIcon or false;
            end;
        end, 
        enableEducationalPopup = function()
            local l_game_EngineFeature_0 = game:GetEngineFeature("NativeCloseIntercept");
            if not l_isSubjectToDesktopPolicies_0() or not l_game_EngineFeature_0 then
                return false;
            else
                return true;
            end;
        end, 
        educationalPopupMaxDisplayCount = function()
            return not not l_isSubjectToDesktopPolicies_0() and v4() or 0;
        end, 
        getGameInfoShowChatFeatures = function()
            if not l_GetFFlagUseVoiceExitBetaLanguage_0() then
                return false;
            else
                return v7.GameInfoShowChatFeatures or false;
            end;
        end, 
        enableFullscreenTitleBar = function()
            return v7.FullscreenTitleBarEnabled or false;
        end, 
        getDisplayCheckboxInVoiceConsent = function()
            if v7.DisplayCheckboxInVoiceConsent == nil then
                return true;
            else
                return v7.DisplayCheckboxInVoiceConsent;
            end;
        end
    };
end;
return v3;
