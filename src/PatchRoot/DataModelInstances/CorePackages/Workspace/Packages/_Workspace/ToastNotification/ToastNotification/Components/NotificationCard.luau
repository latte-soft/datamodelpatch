local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_context_0 = l_Parent_1.context;
local v3 = require(l_Parent_1.dependencies);
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local v6 = require(l_Parent_0.NotificationActionsFrame);
local v7 = require(l_Parent_0.NotificationContentFrame);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v9 = require(l_Parent_1.constants);
local v10 = require(l_context_0.useNotificationCardData);
local l_DefaultCardPadding_0 = v9.Padding.DefaultCardPadding;
local l_DefaultContentPadding_0 = v9.DefaultContentPadding;
local l_DefaultCardCornerRadius_0 = v9.DefaultCardCornerRadius;
return function(_)
    local v15 = v10();
    local l_cardSize_0 = v15.cardSize;
    local v17 = if not v15.cardTransparency then v9.CardTransparency.Default else v15.cardTransparency;
    local v18 = if not not l_cardSize_0 and l_cardSize_0.cardPadding then l_cardSize_0.cardPadding else l_DefaultCardPadding_0;
    local v19 = l_useStyle_0();
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = v19.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = v17, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Border = l_React_0.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v19.Theme.UIDefault.Color
        }), 
        UICorner = l_React_0.createElement("UICorner", {
            CornerRadius = l_DefaultCardCornerRadius_0
        }), 
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, l_DefaultContentPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v18), 
            PaddingLeft = UDim.new(0, v18), 
            PaddingRight = UDim.new(0, v18), 
            PaddingTop = UDim.new(0, v18)
        }), 
        NotificationContentFrame = l_React_0.createElement(v7), 
        NotificationActionsFrame = l_React_0.createElement(v6)
    });
end;
