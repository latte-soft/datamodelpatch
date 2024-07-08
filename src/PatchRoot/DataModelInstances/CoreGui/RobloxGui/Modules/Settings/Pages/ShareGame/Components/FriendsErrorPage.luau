local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_ShareGame_0.Constants);
local v5 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v6 = require(l_ShareGame_0.getTranslator)();
local v7 = v3.PureComponent:extend("FriendsErrorPage");
v7.render = function(v8)
    local l_LayoutOrder_0 = v8.props.LayoutOrder;
    local l_ZIndex_0 = v8.props.ZIndex;
    local v11 = 0;
    local function _()
        v11 = v11 + 1;
        return v11;
    end;
    local l_createElement_0 = v3.createElement;
    local v14 = "Frame";
    local v15 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = l_ZIndex_0
    };
    local v16 = {
        listLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_createElement_1 = v3.createElement;
    local v18 = "TextLabel";
    local v19 = {
        BackgroundTransparency = 1, 
        Text = v6:FormatByKey("Feature.SettingsHub.Label.LoadingFriendsListFailed"), 
        TextColor3 = v4.Color.GRAY5, 
        TextTransparency = 0.22, 
        TextSize = v5.textSize(21), 
        TextWrapped = true, 
        Font = v5.font(Enum.Font.SourceSans)
    };
    v11 = v11 + 1;
    v19.LayoutOrder = v11;
    v19.Size = UDim2.new(0, 280, 0, 42);
    v19.TextYAlignment = Enum.TextYAlignment.Top;
    v19.ZIndex = l_ZIndex_0;
    v16.subtitle = l_createElement_1(v18, v19);
    return l_createElement_0(v14, v15, v16);
end;
return v7;
