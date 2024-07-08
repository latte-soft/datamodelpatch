local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local _ = require(l_script_FirstAncestor_0.ImageSet.ImagesTypes);
local _ = require(l_script_FirstAncestor_0.Style.StyleTypes);
local v7 = require(l_script_FirstAncestor_0.ImageSet.Enum.IconSize);
local v8 = require(l_script_FirstAncestor_0.ImageSet.getIconSize);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v10 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v11 = require(l_Parent_0.Core.Style.useStyle);
local v12 = {
    containerPaddingLeft = 12, 
    containerPaddingRight = 12, 
    containerGap = 12, 
    iconSize = v8(v7.Large), 
    dataGap = 0
};
return function(v13)
    local v14 = v11();
    local v15 = v4.Dictionary.join(v12, v13.styleProps or {});
    local l_containerPaddingLeft_0 = v15.containerPaddingLeft;
    local l_containerPaddingRight_0 = v15.containerPaddingRight;
    local l_containerGap_0 = v15.containerGap;
    local l_iconSize_0 = v15.iconSize;
    return v3.createElement("Frame", {
        Position = v13.position, 
        AnchorPoint = v13.anchorPoint, 
        Size = v13.size, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.layoutOrder
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v13.horizontalAlignment, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_containerGap_0)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_containerPaddingLeft_0), 
            PaddingRight = UDim.new(0, l_containerPaddingRight_0)
        }), 
        Icon = v3.createElement(l_Label_0, {
            Size = UDim2.new(0, l_iconSize_0, 0, l_iconSize_0), 
            Image = v13.icon, 
            ImageColor3 = (v15.iconContentColor or v14.Theme.IconEmphasis).Color, 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1
        }), 
        TextSection = v3.createElement("Frame", {
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_iconSize_0 + l_containerGap_0, 0, 0)
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v15.dataGap)
            }), 
            Number = v3.createElement(v10, {
                Size = UDim2.fromScale(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                Text = v13.countText, 
                fluidSizing = true, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                colorStyle = v15.dataContentColor or v14.Theme.TextEmphasis, 
                fontStyle = v14.Font.Title, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1
            }), 
            Label = v3.createElement(v10, {
                Size = UDim2.fromScale(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                Text = v13.labelText, 
                fluidSizing = true, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                colorStyle = v15.dataLabelContentColor or v14.Theme.TextEmphasis, 
                fontStyle = v14.Font.CaptionHeader, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1
            })
        })
    });
end;
