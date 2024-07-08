local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_ShareGame_0.Constants);
local v5 = require(l_ShareGame_0.Spritesheets.ShareGameIcons);
local l_v5_Frame_0 = v5:GetFrame("friends");
local l_v5_ImagePath_0 = v5:GetImagePath();
local v8 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v9 = require(l_ShareGame_0.getTranslator)();
local v10 = v3.PureComponent:extend("NoFriendsPage");
v10.render = function(v11)
    local l_LayoutOrder_0 = v11.props.LayoutOrder;
    local l_ZIndex_0 = v11.props.ZIndex;
    local l_Position_0 = v11.props.Position;
    local v15 = 0;
    local function _()
        v15 = v15 + 1;
        return v15;
    end;
    local l_createElement_0 = v3.createElement;
    local v18 = "Frame";
    local v19 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = l_ZIndex_0, 
        Position = l_Position_0
    };
    local v20 = {
        listLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_createElement_1 = v3.createElement;
    local v22 = "ImageLabel";
    local v23 = {
        BackgroundTransparency = 1, 
        Image = l_v5_ImagePath_0, 
        ImageRectOffset = l_v5_Frame_0.offset, 
        ImageRectSize = l_v5_Frame_0.size, 
        Size = UDim2.new(0, 72, 0, 72)
    };
    v15 = v15 + 1;
    v23.LayoutOrder = v15;
    v23.ZIndex = l_ZIndex_0;
    v20.friendsIcon = l_createElement_1(v22, v23);
    l_createElement_1 = v3.createElement;
    v22 = "Frame";
    v23 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 0, 34)
    };
    v15 = v15 + 1;
    v23.LayoutOrder = v15;
    v23.ZIndex = l_ZIndex_0;
    v20.iconToSubtitleSpacer = l_createElement_1(v22, v23);
    l_createElement_1 = v3.createElement;
    v22 = "TextLabel";
    v23 = {
        BackgroundTransparency = 1, 
        Text = v9:FormatByKey("Feature.SettingsHub.Label.NoFriendsScreen"), 
        TextColor3 = v4.Color.GRAY5, 
        TextTransparency = 0.22, 
        TextSize = v8.textSize(21), 
        TextWrapped = true, 
        Font = v8.font(Enum.Font.SourceSans)
    };
    v15 = v15 + 1;
    v23.LayoutOrder = v15;
    v23.Size = UDim2.new(0, 280, 0, 42);
    v23.TextYAlignment = Enum.TextYAlignment.Top;
    v23.ZIndex = l_ZIndex_0;
    v20.subtitle = l_createElement_1(v22, v23);
    l_createElement_1 = v3.createElement;
    v22 = "Frame";
    v23 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 0, 120)
    };
    v15 = v15 + 1;
    v23.LayoutOrder = v15;
    v23.ZIndex = l_ZIndex_0;
    v20.bottomSpacer = l_createElement_1(v22, v23);
    return l_createElement_0(v18, v19, v20);
end;
return v10;
