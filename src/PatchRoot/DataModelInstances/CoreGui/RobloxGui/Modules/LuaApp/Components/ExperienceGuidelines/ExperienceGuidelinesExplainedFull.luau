local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_Modules_0.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesList);
local v11 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v12 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v13 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_withStyle_0 = v6.Style.withStyle;
local v17 = require(l_CorePackages_0.Packages.t);
local v18 = require(l_Modules_0.LuaApp.Models.ExperienceGuidelinesApi.AgeRecommendationDetails);
local v19 = require(l_Modules_0.LuaApp.Flags.ExperienceGuidelinesUrls);
local v20 = v2.PureComponent:extend("ExperienceGuidelinesExplainedFull");
v20.validateProps = v17.strictInterface({
    ageRecommendations = v17.optional(v18.validateModel), 
    universeId = v17.string, 
    localization = v17.table, 
    navigateDown = v17.callback
});
v20.init = function(v21)
    local l_FStringExperienceGuidelinesExplainedPageUrl_0 = v19.FStringExperienceGuidelinesExplainedPageUrl;
    v21.onLearnMoreActivated = function()
        v21.props.navigateDown({
            name = v9.GenericWebPage, 
            detail = l_FStringExperienceGuidelinesExplainedPageUrl_0, 
            extraProps = {
                title = v21.props.localization:Format("Feature.GameDetails.Label.AgeGuidelines"), 
                transitionAnimation = v13.SlideInFromRight
            }
        });
    end;
end;
v20.render = function(v23)
    local l_localization_0 = v23.props.localization;
    local l_ageRecommendations_0 = v23.props.ageRecommendations;
    return l_withStyle_0(function(v26)
        return v2.createElement(v11, {
            BackgroundColor3 = v26.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v26.Theme.BackgroundDefault.Transparency, 
            includeStatusBar = true
        }, {
            ViewFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.fromOffset(0, 0), 
                BackgroundTransparency = 1
            }), 
            TopBar = v2.createElement(v12.Container, {
                leftItem = v12.BackButton
            }), 
            PageContent = v2.createElement(v12.PageContent, {}, {
                SectionLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, 24)
                }), 
                SecionPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, 32), 
                    PaddingBottom = UDim.new(0, 32)
                }), 
                DescriptorList = l_ageRecommendations_0 and v2.createElement(v10, {
                    layoutOrder = 1, 
                    ageRecommendations = l_ageRecommendations_0
                }), 
                LearnMoreButton = v2.createElement(l_Focusable_0[l_Button_0], {
                    buttonType = l_ButtonType_0.Secondary, 
                    layoutOrder = 2, 
                    size = UDim2.new(1, 0, 0, 48), 
                    text = l_localization_0:Format("Feature.GameDetails.Label.LearnMore"), 
                    onActivated = v23.onLearnMoreActivated
                })
            })
        });
    end);
end;
return (l_RoactServices_0.connect({
    localization = v5
})((v3.connect(function(v27, v28)
    return {
        ageRecommendations = v27.AgeRecommendations[v28.universeId]
    };
end, function(v29)
    return {
        navigateDown = function(v30)
            return v29(v7(v30));
        end
    };
end)(v20))));
