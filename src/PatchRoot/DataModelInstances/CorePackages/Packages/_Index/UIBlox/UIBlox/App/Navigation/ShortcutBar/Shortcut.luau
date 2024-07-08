local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v5 = require(l_Parent_1.Core.Style.useStyle);
local v6 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v7 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v8 = require(l_Parent_0.ImageSet.getIconSize);
local v9 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v10 = require(script.Parent.ProgressIconAnimated);
local _ = require(script.Parent.Types);
local v12 = {
    iconLabelGap = 6, 
    actionTextSpacingLeading = 12
};
local v13 = {
    hasProgress = false, 
    animationTriggerTime = 0.3, 
    animationKeyHoldingTime = 1.5, 
    animationCoolDownTime = 0.75
};
local function v21(v14, v15)
    local l_layoutOrder_0 = v14.layoutOrder;
    local l_itemProps_0 = v14.itemProps;
    local v18 = v8(v7.Medium);
    local l_hasProgress_0 = l_itemProps_0.hasProgress;
    local v20 = nil;
    if l_hasProgress_0 then
        v20 = l_itemProps_0;
    end;
    return v3.createElement("Frame", {
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.fromOffset(v18, v18), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        ProgressIcon = if not l_hasProgress_0 then nil else v3.createElement(v10, v20), 
        Image = if not l_hasProgress_0 then v3.createElement(v6.Label, {
            Size = UDim2.fromScale(1, 1), 
            Image = l_itemProps_0.icon, 
            ImageColor3 = v15.Theme.TextEmphasis.Color, 
            ImageTransparency = v15.Theme.TextEmphasis.Transparency, 
            BackgroundTransparency = 1
        }) else nil
    });
end;
return function(v22)
    local v23 = l_Object_0.assign({}, v12, v22);
    local v24 = l_Object_0.assign({}, v13, v23.publicProps);
    local v25 = v5();
    return v3.createElement("Frame", {
        LayoutOrder = v23.index, 
        Size = UDim2.fromOffset(0, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v23.iconLabelGap)
        }), 
        ActionText = if not v24.actionText then nil else v3.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v23.actionTextSpacingLeading)
            }), 
            Label = v3.createElement(v9, {
                Size = UDim2.fromOffset(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v24.actionText, 
                colorStyle = v25.Theme.TextEmphasis, 
                fontStyle = v25.Font.SubHeader1, 
                BackgroundTransparency = 1
            })
        }), 
        Icon = v21({
            layoutOrder = 2, 
            itemProps = v24
        }, v25), 
        LabelText = v3.createElement(v9, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = v24.text, 
            colorStyle = v25.Theme.TextEmphasis, 
            fontStyle = v25.Font.SubHeader1, 
            BackgroundTransparency = 1
        })
    });
end;
