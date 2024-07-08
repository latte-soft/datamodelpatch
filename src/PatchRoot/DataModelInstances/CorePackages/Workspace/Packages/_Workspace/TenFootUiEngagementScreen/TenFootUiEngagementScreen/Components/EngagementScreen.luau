local l_Parent_0 = script:FindFirstAncestor("TenFootUiEngagementScreen").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v2.App.Button.Enum.StandardButtonSize;
local l_DividerWithText_0 = require(l_Parent_0.TenFootUiSharedComponents).DividerWithText;
local v8 = require(script.Parent.SwitchAccountButton);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_GetUIBloxEnableFontNameMapping_0 = require(l_Parent_0.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local function _(v13)
    return {
        Font = Enum.Font.Gotham, 
        RelativeSize = v13.FontSize, 
        RelativeMinSize = v13.FontSize
    };
end;
return function(v15)
    local v17 = l_useDesignTokens_0(function(v16)
        return {
            headerFontStyle = v16.Semantic.Typography.Header, 
            footerFontStyle = v16.Semantic.Typography.Footer, 
            defaultTextColor = v16.Semantic.Color.Text.Default, 
            mutedTextColor = v16.Semantic.Color.Text.Muted, 
            engagementScreen = v16.LuaApps.EngagementScreen
        };
    end);
    local v18;
    if not l_GetUIBloxEnableFontNameMapping_0() then
        local l_headerFontStyle_0 = v17.headerFontStyle;
        v18 = {
            Font = Enum.Font.Gotham, 
            RelativeSize = l_headerFontStyle_0.FontSize, 
            RelativeMinSize = l_headerFontStyle_0.FontSize
        };
    else
        v18 = v17.headerFontStyle;
    end;
    local v20 = l_useLocalization_0({
        continue = "CommonUI.Features.Label.EngagementScreen.Continue", 
        orYouCan = "CommonUI.Features.Labels.OrYouCan"
    });
    local v21 = l_useRoactService_0(l_AppLogging_0);
    v1.useLayoutEffect(function()
        v21:logEventOnce("engagement_screen_did_mount");
    end, {
        v21
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, v1.createElement("ImageLabel", {
        Position = v17.engagementScreen.robloxLogoTextImagePosition, 
        Size = v17.engagementScreen.robloxLogoTextImageSize, 
        Image = v17.engagementScreen.robloxLogoTextImageUrl, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }), v1.createElement("Frame", {
        Position = v17.engagementScreen.buttonContainerPosition, 
        Size = UDim2.new(0, v17.engagementScreen.containerWidth, 0, v17.engagementScreen.containerHeight), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, v1.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Padding = UDim.new(0, v17.engagementScreen.buttonPadding)
    }), v1.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.PrimarySystem, 
        layoutOrder = 1, 
        text = v20.continue, 
        fontStyle = v18, 
        standardSize = l_StandardButtonSize_0.Regular, 
        onActivated = v15.onContinue
    }), if not v15.onSwitchAccounts then nil else v1.createElement(v1.Fragment, nil, v1.createElement(l_DividerWithText_0, {
        layoutOrder = 2, 
        size = UDim2.new(0, v17.engagementScreen.dividerWidth, 0, v17.engagementScreen.dividerHeight), 
        width = 0, 
        height = 0, 
        font = if not l_GetUIBloxEnableFontNameMapping_0() then Enum.Font.Gotham else v17.footerFontStyle.Font, 
        fontSize = v17.footerFontStyle.FontSize, 
        color3 = v17.mutedTextColor.Color3, 
        transparency = v17.mutedTextColor.Transparency, 
        text = v20.orYouCan, 
        padding = v17.engagementScreen.dividerPadding
    }), v1.createElement(v8, {
        layoutOrder = 3, 
        fontStyle = v18, 
        onActivated = v15.onSwitchAccounts
    }))));
end;
