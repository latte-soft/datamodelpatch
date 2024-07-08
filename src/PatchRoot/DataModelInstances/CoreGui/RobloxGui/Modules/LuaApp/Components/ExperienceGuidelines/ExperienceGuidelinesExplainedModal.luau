local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v5 = require(l_CorePackages_0.Packages.t);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v8 = require(l_CorePackages_0.UIBlox);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v10 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v11 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v12 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = require(l_Modules_0.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesList);
local v15 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local l_PartialPageModal_0 = v8.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v18 = require(l_Modules_0.LuaApp.Models.ExperienceGuidelinesApi.AgeRecommendationDetails);
local v19 = require(l_Modules_0.LuaApp.Flags.ExperienceGuidelinesUrls);
local l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAddExperienceGuidelinesToActionBar10ft;
local l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseExternalBrowserForAgeGuidelines10ft;
local v22 = v2.PureComponent:extend("ExperienceGuidelinesExplainedModal");
v22.validateProps = v5.strictInterface({
    ageRecommendations = v5.optional(v18.validateModel), 
    hideCloseButton = v5.optional(v5.boolean), 
    universeId = v5.string, 
    localization = v5.table, 
    navigateDown = v5.callback, 
    navigateBack = v5.callback, 
    screenSize = v5.Vector2, 
    webViewSupport = v5.boolean, 
    linking = v5.table, 
    useExternalBrowserForAgeGuidelines = v5.optional(v5.boolean)
});
v22.init = function(v23)
    local l_FStringExperienceGuidelinesExplainedPageUrl_0 = v19.FStringExperienceGuidelinesExplainedPageUrl;
    v23.onLearnMoreActivated = function()
        if not v23.props.useExternalBrowserForAgeGuidelines then
            v23.props.navigateDown({
                name = v13.GenericWebPage, 
                detail = l_FStringExperienceGuidelinesExplainedPageUrl_0, 
                extraProps = {
                    title = v23.props.localization:Format("Feature.GameDetails.Label.AgeGuidelines"), 
                    transitionAnimation = v15.SlideInFromRight
                }
            });
            return ;
        else
            v10(v23.props.linking, l_FStringExperienceGuidelinesExplainedPageUrl_0);
            return ;
        end;
    end;
    v23.closeModal = function()
        v23.props.navigateBack();
    end;
end;
v22.render = function(v25)
    local l_localization_0 = v25.props.localization;
    local l_ageRecommendations_0 = v25.props.ageRecommendations;
    return v2.createElement("ImageButton", {
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 1, 0), 
        ImageTransparency = 1, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Selectable = (not l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0() or not v25.props.hideCloseButton) and nil
    }, {
        Overlay = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            Content = v2.createElement(l_PartialPageModal_0, {
                title = l_localization_0:Format("Feature.GameDetails.Label.AgeGuidelines"), 
                screenSize = v25.props.screenSize, 
                onCloseClicked = if not not l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0() and v25.props.hideCloseButton then nil else v25.closeModal, 
                buttonStackProps = if not v25.props.webViewSupport then nil else {
                    forcedFillDirection = Enum.FillDirection.Vertical, 
                    buttonHeight = 48, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                isDisabled = false, 
                                onActivated = v25.onLearnMoreActivated, 
                                text = l_localization_0:Format("Feature.GameDetails.Label.LearnMore")
                            }
                        }
                    }
                }
            }, {
                ViewFrame = v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24)
                    }), 
                    DescriptorList = l_ageRecommendations_0 and v2.createElement(v14, {
                        ageRecommendations = l_ageRecommendations_0
                    })
                })
            })
        })
    });
end;
return (l_RoactAppPolicy_0.connect(function(v28)
    return {
        webViewSupport = v28.getWebViewSupport(), 
        useExternalBrowserForAgeGuidelines = if not l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then nil else v28.getUseExternalBrowserForAgeGuidelines()
    };
end)((l_RoactServices_0.connect({
    localization = v7, 
    linking = l_AppLinking_0
})((v3.connect(function(v29, v30)
    return {
        screenSize = v29.ScreenSize, 
        ageRecommendations = v29.AgeRecommendations[v30.universeId]
    };
end, function(v31)
    return {
        navigateDown = function(v32)
            return v31(v11(v32));
        end, 
        navigateBack = function()
            return v31(v12());
        end
    };
end)(v22))))));
