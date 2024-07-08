local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Roact);
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v4 = require(l_ShareGame_0.Constants);
local v5 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v6 = v5.font(Enum.Font.SourceSans, "ConversationDetails");
local l_WHITE_0 = v4.Color.WHITE;
local v8 = v5.textSize(19);
local v9 = v5.font(Enum.Font.SourceSans, "ConversationDetails");
local l_GRAY3_0 = v4.Color.GRAY3;
local v11 = v5.textSize(16, "ConversationDetails");
local v12 = v5.font(Enum.Font.SourceSans, "ConversationDetails");
local v13 = v5.textSize(16, "ConversationDetails");
local v14 = require(l_ShareGame_0.getTranslator)();
local v15 = v2.PureComponent:extend("ConversationDetails");
v15.render = function(v16)
    local l_title_0 = v16.props.title;
    local l_subtitle_0 = v16.props.subtitle;
    local l_presence_0 = v16.props.presence;
    local l_size_0 = v16.props.size;
    local l_layoutOrder_0 = v16.props.layoutOrder;
    local l_zIndex_0 = v16.props.zIndex;
    local v23 = nil;
    if l_subtitle_0 ~= nil then
        v23 = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v11), 
            Text = l_subtitle_0, 
            Font = v9, 
            TextColor3 = l_GRAY3_0, 
            TextSize = v11, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            LayoutOrder = 1, 
            ZIndex = l_zIndex_0
        });
    end;
    local v24 = nil;
    if l_presence_0 ~= nil then
        v24 = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v13), 
            Text = v14:FormatByKey(v4.PresenceTextKey[l_presence_0]), 
            Font = v12, 
            TextColor3 = v4.PresenceColors[l_presence_0], 
            TextSize = v13, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2, 
            ZIndex = l_zIndex_0
        });
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_size_0, 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = l_zIndex_0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 2)
        }), 
        Title = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v8), 
            Text = l_title_0 or "", 
            Font = v6, 
            TextColor3 = l_WHITE_0, 
            TextSize = v8, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            LayoutOrder = 0, 
            ZIndex = l_zIndex_0
        }), 
        Subtitle = v23, 
        Presence = v24
    });
end;
return v15;
