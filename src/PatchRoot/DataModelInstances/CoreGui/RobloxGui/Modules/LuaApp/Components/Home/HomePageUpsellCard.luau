local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v7 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButtonRetheme);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_withStyle_0 = v2.Style.withStyle;
local v12 = v3.PureComponent:extend("HomePageUpsellCard");
v12.didMount = function(v13)
    v13.props.authEventAnalytics.reportModalShown("homepageUpsellCard", "homepage");
end;
v12.render = function(v14)
    return l_withStyle_0(function(v15)
        local l_Theme_0 = v15.Theme;
        local l_Color_0 = l_Theme_0.TextEmphasis.Color;
        local l_Font_0 = v15.Font.Header2.Font;
        local v19 = v15.Font.BaseSize * v15.Font.Header2.RelativeSize;
        local l_formFactor_0 = v14.props.formFactor;
        return v5({
            addButtonText = "Feature.ContactMethodUpsell.Action.SecureYourAccount", 
            addTitleText = "Feature.ContactMethodUpsell.Description.HomePageUpsellCardAddPhoneText"
        })(function(v21)
            local v22 = UDim2.new(1, 0, 0, 0);
            local v23 = UDim2.new(1, 0, 0, 28);
            local v24 = 12;
            local l_Vertical_0 = Enum.FillDirection.Vertical;
            if l_formFactor_0 == l_FormFactor_0.WIDE then
                v24 = 20;
                l_Vertical_0 = Enum.FillDirection.Horizontal;
                v22 = UDim2.new(1, -l_Text_0.GetTextWidth(v21.addButtonText, v15.Font.CaptionHeader.Font, v15.Font.BaseSize * v15.Font.CaptionHeader.RelativeSize) - 30, 0, 0);
                v23 = UDim2.new(0, l_Text_0.GetTextWidth(v21.addButtonText, v15.Font.CaptionHeader.Font, v15.Font.BaseSize * v15.Font.CaptionHeader.RelativeSize) + 15, 0, 28);
            end;
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UISizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(650, math.huge)
                }), 
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = l_Vertical_0, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, v24)
                }), 
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 12)
                }), 
                UIStroke = v3.createElement("UIStroke", {
                    Thickness = 1, 
                    Color = l_Theme_0.SystemPrimaryDefault.Color, 
                    Transparency = 0.7
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12), 
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12)
                }), 
                TitleTextLabel = v3.createElement("TextLabel", {
                    Size = v22, 
                    LayoutOrder = 1, 
                    Font = l_Font_0, 
                    BorderSizePixel = 0, 
                    Text = v21.addTitleText, 
                    TextColor3 = l_Color_0, 
                    TextSize = v19, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }), 
                CallToActionButton = v3.createElement(v7, {
                    Size = v23, 
                    BackgroundTransparency = 0, 
                    Text = v21.addButtonText, 
                    LayoutOrder = 2, 
                    fontStyle = "CaptionHeader", 
                    onActivated = v14.props.buttonClickCallback, 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    authEventAnalytics = v10
})((v4.connect(function(v26, _)
    return {
        formFactor = v26.FormFactor
    };
end)(v12))));
