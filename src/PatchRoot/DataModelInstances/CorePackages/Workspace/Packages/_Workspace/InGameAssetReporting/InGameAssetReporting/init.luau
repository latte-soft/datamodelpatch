local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_Parent_0.React);
local v6 = require(l_CorePackages_0.Roact);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v10 = require(script.Analysis.SceneAnalysis);
local v11 = require(script.InGameAssetReportUI.Components.InGameAssetReportMode);
return {
    interpretAnnotation = v10.interpretAnnotation, 
    extractItemsFromInterpretations = v10.extractItemsFromInterpretations, 
    __setRandomGenerator = v10.__setRandomGenerator, 
    initialize = function()
        v6.mount(v5.createElement("ScreenGui", {
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            LocalizationProvider = v6.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                StyleProvider = v5.createElement(l_StyleProviderWithDefaultTheme_0, {
                    withDarkTheme = true
                }, {
                    InGameAssetReportUI = v6.createElement(v11, {
                        backAction = function()
                            l_ExperienceStateCaptureService_0:ToggleCaptureMode();
                        end, 
                        onReportComplete = function()
                            l_ExperienceStateCaptureService_0:ToggleCaptureMode();
                        end, 
                        getIsSmallPortraitMode = function(v12)
                            local v13 = false;
                            if v12.X < v12.Y then
                                v13 = v12.X < 800;
                            end;
                            return v13;
                        end
                    })
                })
            })
        }), l_CoreGui_0, "InGameAssetReportMode");
    end, 
    ["jest.config"] = script["jest.config"]
};
