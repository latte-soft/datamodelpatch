local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v5 = require(l_Parent_1.Core.Style.useStyle);
local v6 = require(l_Parent_0.ImageSet.Enum.IconSize);
local _ = require(l_Parent_0.ImageSet.ImagesTypes);
local v8 = require(l_Parent_0.ImageSet.getIconSize);
local v9 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v11 = require(script.Parent.Constants);
local v12 = {
    items = {}
};
return function(v13)
    local v14 = l_Object_0.assign({}, v12, v13);
    local v15 = v5();
    local v16 = {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v11.CONTEXT_BAR_PADDING_START), 
            PaddingRight = UDim.new(0, v11.CONTEXT_BAR_PADDING_END)
        }), 
        ListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v11.CONTEXT_BAR_ITEMS_SPACING)
        })
    };
    local v17 = v8(v6.Medium);
    for v18, v19 in ipairs(v14.items) do
        v16["Item" .. tostring(v18)] = v3.createElement("Frame", {
            LayoutOrder = v18, 
            Size = UDim2.fromOffset(0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v11.CONTEXT_BAR_ITEM_ICON_LABEL_SPACING)
            }), 
            Icon = v3.createElement(v9.Label, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v17, v17), 
                Image = v19.icon, 
                ImageColor3 = v15.Theme.IconEmphasis.Color, 
                ImageTransparency = v15.Theme.IconEmphasis.Transparency, 
                BackgroundTransparency = 1
            }), 
            Text = v3.createElement(v10, {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(0, v11.CONTEXT_BAR_ITEM_LABEL_HEIGHT), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Text = v19.text, 
                colorStyle = v15.Theme.TextEmphasis, 
                fontStyle = v15.Font.CaptionHeader, 
                BackgroundTransparency = 1
            })
        });
    end;
    return v3.createElement("Frame", {
        Position = v14.position, 
        AnchorPoint = v14.anchorPoint, 
        Size = UDim2.fromOffset(0, v11.CONTEXT_BAR_HEIGHT), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v15.Theme.UIMuted.Color, 
        BackgroundTransparency = v15.Theme.UIMuted.Transparency, 
        AutomaticSize = Enum.AutomaticSize.X
    }, v16);
end;
