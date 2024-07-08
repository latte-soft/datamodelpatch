local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_context_0 = l_Parent_1.context;
local v3 = require(l_Parent_1.dependencies);
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local v6 = require(l_Parent_0.NotificationContentFrame);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v8 = require(l_Parent_1.constants);
local v9 = require(l_context_0.useNotificationCardData);
local l_DefaultCardPadding_0 = v8.Padding.DefaultCardPadding;
local l_DefaultContentPadding_0 = v8.DefaultContentPadding;
local l_DefaultCardCornerRadius_0 = v8.DefaultCardCornerRadius;
return function(v13)
    local v14 = v9();
    local l_cardSize_0 = v14.cardSize;
    local v16 = if not v14.cardTransparency then v8.CardTransparency.Default else v14.cardTransparency;
    local v17 = if not not l_cardSize_0 and l_cardSize_0.cardPadding then l_cardSize_0.cardPadding else l_DefaultCardPadding_0;
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = l_useStyle_0().Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = v16, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v13.layoutOrder
    }, {
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
            PaddingBottom = UDim.new(0, v17), 
            PaddingLeft = UDim.new(0, v17), 
            PaddingRight = UDim.new(0, v17), 
            PaddingTop = UDim.new(0, v17)
        }), 
        NotificationContentFrame = l_React_0.createElement(v6)
    });
end;
