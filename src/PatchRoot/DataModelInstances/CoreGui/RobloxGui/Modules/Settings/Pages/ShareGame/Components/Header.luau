local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Roact);
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v4 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v5 = require(l_ShareGame_0.Constants);
local v6 = require(l_ShareGame_0.Components.BackButton);
local v7 = require(l_ShareGame_0.Components.SearchArea);
local v8 = require(l_ShareGame_0.getTranslator)();
local v9 = v2.PureComponent:extend("Header");
v9.render = function(v10)
    local l_deviceLayout_0 = v10.props.deviceLayout;
    local l_size_0 = v10.props.size;
    local l_layoutOrder_0 = v10.props.layoutOrder;
    local l_zIndex_0 = v10.props.zIndex;
    local l_closePage_0 = v10.props.closePage;
    local l_searchAreaActive_0 = v10.props.searchAreaActive;
    local l_analytics_0 = v10.props.analytics;
    local l_toggleSearchIcon_0 = v10.props.toggleSearchIcon;
    local l_iconType_0 = v10.props.iconType;
    local v20 = v5.LayoutSpecific[l_deviceLayout_0];
    local v21 = l_deviceLayout_0 == v5.DeviceLayout.DESKTOP;
    local v22 = l_toggleSearchIcon_0 and l_searchAreaActive_0;
    local v23 = nil;
    v23 = if l_iconType_0 == v6.IconType.None then v20.BACK_BUTTON_WIDTH else v20.BACK_BUTTON_MODAL_WIDTH;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_size_0, 
        AnchorPoint = Vector2.new(0, 1), 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = l_zIndex_0, 
        Position = if not v4.UIBloxThemeEnabled then UDim2.new(0, 0, 0, 0) else UDim2.new(0, 0, 0, 4)
    }, {
        Title = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Visible = not v22, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Text = v8:FormatByKey("Feature.SettingsHub.Heading.InviteFriends"), 
            TextSize = v4.textSize(v20.PAGE_TITLE_TEXT_SIZE), 
            TextColor3 = v5.Color.WHITE, 
            Font = v4.font(Enum.Font.SourceSansSemibold, "Semibold"), 
            ZIndex = l_zIndex_0
        }), 
        BackButton = v2.createElement(v6, {
            visible = true, 
            iconType = l_iconType_0, 
            position = UDim2.new(0, 0, 0.5, 0), 
            size = UDim2.new(0, v23 or v20.BACK_BUTTON_WIDTH, 0, v20.BACK_BUTTON_HEIGHT), 
            anchorPoint = Vector2.new(0, 0.5), 
            zIndex = l_zIndex_0, 
            onClick = l_closePage_0
        }), 
        SearchArea = v2.createElement(v7, {
            fullWidthSearchBar = l_toggleSearchIcon_0 or not v21, 
            searchBoxMargin = v20.SEARCH_BOX_MARGIN, 
            anchorPoint = Vector2.new(1, 0.5), 
            position = UDim2.new(1, 0, 0.5, 0), 
            size = UDim2.new(1, -v23, 1, 0), 
            zIndex = l_zIndex_0, 
            analytics = l_analytics_0
        })
    });
end;
return v9;
