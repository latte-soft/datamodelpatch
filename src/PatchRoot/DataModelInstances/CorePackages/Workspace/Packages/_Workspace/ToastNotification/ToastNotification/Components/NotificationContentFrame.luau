local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_context_0 = l_Parent_1.context;
local v3 = require(l_Parent_1.dependencies);
local v4 = require(l_Parent_0.NotificationStyledText);
local v5 = require(l_Parent_0.NotificationThumbnail);
local _ = require(l_Parent_1.type);
local l_React_0 = v3.React;
local l_useStyle_0 = v3.UIBlox.Core.Style.useStyle;
local v9 = require(l_Parent_1.constants);
local v10 = require(l_context_0.useNotificationCardState);
local v11 = require(l_context_0.useNotificationCardData);
local l_DefaultContentPadding_0 = v9.DefaultContentPadding;
local l_DefaultTextContentPadding_0 = v9.DefaultTextContentPadding;
return function()
    local v14 = l_useStyle_0();
    local v15 = v14.Font.BaseSize * v14.Font.CaptionHeader.RelativeSize;
    local v16 = v14.Font.BaseSize * v14.Font.CaptionBody.RelativeSize;
    local l_cardSize_0 = v11().cardSize;
    local v18 = not not l_cardSize_0 and l_cardSize_0.thumbnail or v9.CardSizeDefault.thumbnail;
    local v19 = v10("textBody");
    local v20 = v19 and v19[1];
    local v21 = (v20 and v20.title) and {
        Text = v20.title, 
        Size = UDim2.new(1, 0, 0, 0), 
        TextSize = v15, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = 1, 
        Font = v14.Font.CaptionHeader.Font, 
        TextColor3 = v14.Theme.TextEmphasis.Color
    };
    local v22 = (v20 and v20.label) and {
        Text = v20.label, 
        Size = UDim2.new(1, 0, 0, 0), 
        TextSize = v16, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = 2, 
        Font = v14.Font.CaptionBody.Font
    };
    return l_React_0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, l_DefaultContentPadding_0)
        }), 
        NotificationThumbnailFrame = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(0, v18, 0, v18)
        }, {
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 3)
            }), 
            NotificationThumbnail = l_React_0.createElement(v5)
        }), 
        ToastTextFrame = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -v18, 0, 0)
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, l_DefaultTextContentPadding_0)
            }), 
            ToastTitle = v21 and l_React_0.createElement(v4, v21), 
            ToastSubtitle = v22 and l_React_0.createElement(v4, v22)
        })
    });
end;
