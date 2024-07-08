local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.UIBlox);
local v4 = require(l_Parent_1.Cryo);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_UtilityActionIcon_0 = v3.App.Button.UtilityActionIcon;
local _ = require(l_Parent_0.Types);
local v9 = {
    automaticHeight = false, 
    hasDivider = false, 
    onMedia = false, 
    utilitiesGap = 0
};
local function v19(v10, v11)
    local l_Tokens_0 = v11.Tokens;
    local l_renderNavigation_0 = v10.renderNavigation;
    local l_title_0 = v10.title;
    local l_onMedia_0 = v10.onMedia;
    local v16 = v10.titleFontStyle or l_Tokens_0.Semantic.Typography.Title;
    local v17 = if not l_onMedia_0 then l_Tokens_0.Semantic.Color.Text.Emphasis else l_Tokens_0.Global.Color.White;
    local l_groupTransparencyLeft_0 = v10.groupTransparencyLeft;
    return v2.useCallback(function()
        return v2.createElement("CanvasGroup", {
            BackgroundTransparency = 1, 
            GroupTransparency = if not l_groupTransparencyLeft_0 then nil else l_groupTransparencyLeft_0.transparency, 
            ref = if not l_groupTransparencyLeft_0 then nil else l_groupTransparencyLeft_0.guiObjectRef, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Navigation = if not l_renderNavigation_0 then nil else l_renderNavigation_0({
                layoutOrder = 1
            }), 
            Title = if not l_title_0 then nil else v2.createElement("TextLabel", {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Text = l_title_0, 
                Font = v16.Font, 
                TextSize = v16.FontSize, 
                LineHeight = v16.LineHeight, 
                TextColor3 = v17.Color3, 
                TextTransparency = v17.Transparency
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_Tokens_0.Global.Space_25), 
                    PaddingBottom = UDim.new(0, l_Tokens_0.Global.Space_25)
                })
            })
        });
    end, {
        l_renderNavigation_0, 
        l_title_0, 
        v16, 
        v17, 
        l_Tokens_0, 
        l_groupTransparencyLeft_0
    });
end;
local function v27(v20)
    local l_renderUserInfo_0 = v20.renderUserInfo;
    local l_avatarActionIcon_0 = v20.avatarActionIcon;
    local l_searchActionIcon_0 = v20.searchActionIcon;
    local l_renderUtilities_0 = v20.renderUtilities;
    local l_utilitiesGap_0 = v20.utilitiesGap;
    local l_groupTransparencyRight_0 = v20.groupTransparencyRight;
    return v2.useCallback(function()
        return v2.createElement("CanvasGroup", {
            Size = UDim2.fromScale(0, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = if not l_groupTransparencyRight_0 then nil else l_groupTransparencyRight_0.transparency, 
            ref = if not l_groupTransparencyRight_0 then nil else l_groupTransparencyRight_0.guiObjectRef, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_utilitiesGap_0)
            }), 
            UserInfo = if not l_renderUserInfo_0 then nil else l_renderUserInfo_0({
                layoutOrder = 1, 
                itemsGap = l_utilitiesGap_0
            }), 
            Avatar = if not l_avatarActionIcon_0 then nil else v2.createElement(l_UtilityActionIcon_0, {
                layoutOrder = 2, 
                icon = l_avatarActionIcon_0.icon, 
                iconColor = {}, 
                onActivated = l_avatarActionIcon_0.onActivated
            }), 
            SearchIcon = if not l_searchActionIcon_0 then nil else v2.createElement(l_UtilityActionIcon_0, {
                layoutOrder = 3, 
                icon = l_searchActionIcon_0.icon, 
                onActivated = l_searchActionIcon_0.onActivated
            }), 
            Utilities = if not l_renderUtilities_0 then nil else l_renderUtilities_0({
                layoutOrder = 4, 
                itemsGap = l_utilitiesGap_0
            })
        });
    end, {
        l_renderUserInfo_0, 
        l_avatarActionIcon_0, 
        l_searchActionIcon_0, 
        l_renderUtilities_0, 
        l_utilitiesGap_0, 
        l_groupTransparencyRight_0
    });
end;
return function(v28)
    local v29 = v4.Dictionary.join(v9, v28);
    local v30 = l_useStyle_0();
    local l_barHeight_0 = v29.barHeight;
    local l_renderCenter_0 = v29.renderCenter;
    local l_zIndex_0 = v29.zIndex;
    local l_automaticHeight_0 = v29.automaticHeight;
    local l_groupTransparency_0 = v29.groupTransparency;
    return v2.createElement("CanvasGroup", {
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        GroupTransparency = if not l_groupTransparency_0 then nil else l_groupTransparency_0.transparency, 
        ref = if not l_groupTransparency_0 then nil else l_groupTransparency_0.guiObjectRef, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Bar = v2.createElement(l_HeaderBar_0, {
            barHeight = l_barHeight_0, 
            renderLeft = v19(v29, v30), 
            renderCenter = v2.useCallback(function()
                if not l_renderCenter_0 then
                    return nil;
                else
                    return (l_renderCenter_0());
                end;
            end, {
                l_renderCenter_0
            }), 
            renderRight = v27(v29), 
            onHeaderActivated = v29.onHeaderActivated, 
            backgroundStyle = v29.backgroundStyle, 
            isOnMedia = v29.onMedia, 
            automaticHeight = l_automaticHeight_0, 
            paddingLeft = v29.paddingLeft, 
            paddingTop = v29.paddingTop, 
            paddingRight = v29.paddingRight, 
            paddingBottom = v29.paddingBottom, 
            zIndex = l_zIndex_0, 
            hasDivider = v29.hasDivider
        })
    });
end;
