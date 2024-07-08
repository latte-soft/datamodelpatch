local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v5 = require(l_Parent_1.Core.Style.useStyle);
local l_Label_0 = require(l_Parent_1.Core.ImageSet.ImageSetComponent).Label;
local v7 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v8 = require(l_Parent_0.Enum.Placement);
local v9 = require(l_Parent_1.Core.Control.Enum.ControlState);
local v10 = require(l_Parent_1.App.ImageSet.Enum.IconSize);
local v11 = require(l_Parent_1.App.ImageSet.getIconSize);
local v12 = require(script.Parent.HorizontalContainer);
local _ = require(script.Parent.Types);
local v14 = require(script.Parent.Constants);
local v15 = {
    controlState = v9.Default, 
    selected = false, 
    padding = {
        left = v14.ICON_TAB_ITEM_PADDING_LEFT, 
        right = v14.ICON_TAB_ITEM_PADDING_RIGHT
    }
};
return function(v16)
    local v17 = l_Object_0.assign({}, v15, v16);
    local l_item_0 = v17.item;
    local v19 = v17.controlState == v9.SelectedPressed;
    local l_selected_0 = v17.selected;
    local v21 = v5();
    local v22 = if not l_selected_0 then v21.Tokens.Semantic.Color.Icon.Default else v21.Tokens.Semantic.Color.Icon.Emphasis;
    local v23 = v11(v10.Medium, v21);
    local v24 = v14.ICON_TAB_HEIGHT - v14.ICON_TAB_PADDING * 2;
    local v25 = true;
    if l_item_0.icon ~= nil then
        v25 = l_item_0.iconComponent == nil;
    end;
    assert(v25, "icon or iconComponent cannot be assigned at same time");
    return v12({
        size = UDim2.new(0, 0, 0, v14.ICON_TAB_HEIGHT), 
        automaticSize = Enum.AutomaticSize.X, 
        roundedBackgroundSize = UDim2.new(1, -(v14.ICON_TAB_PADDING * 2), 0, v24), 
        roundedBackgroundPosition = UDim2.fromOffset(v14.ICON_TAB_PADDING, v14.ICON_TAB_PADDING), 
        roundedBackgroundColor = v21.Theme.Divider.Color, 
        roundedBackgroundTransparency = v14.ICON_TAB_SELECTED_TRANSPARENCY, 
        spacing = if not (l_item_0.icon == nil) or l_item_0.iconComponent ~= nil then v14.ICON_TAB_ITEM_ICON_TITLE_SPACING else 0, 
        padding = v17.padding, 
        showRoundedBackground = if l_item_0.showRoundedBackground ~= nil then l_item_0.showRoundedBackground else l_selected_0, 
        showOverlay = if l_item_0.showOverlay ~= nil then l_item_0.showOverlay else v19
    }, {
        Icon = if l_item_0.icon ~= nil then v3.createElement(l_Label_0, {
            Size = UDim2.new(0, v23, 0, v23), 
            LayoutOrder = 1, 
            Image = l_item_0.icon, 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            ImageColor3 = v22.Color3, 
            ImageTransparency = v22.Transparency
        }) else if l_item_0.iconComponent ~= nil then v3.createElement("Frame", {
            Size = UDim2.new(0, v23, 0, v23), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, v3.createElement(l_item_0.iconComponent, {
            placement = v8.Bottom, 
            selected = l_selected_0, 
            pressed = v19, 
            hovered = false
        })) else nil, 
        Title = v3.createElement(v7, {
            LayoutOrder = 2, 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            Text = l_item_0.title, 
            fluidSizing = false, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            colorStyle = {
                Color = if not l_selected_0 then v21.Theme.TextDefault.Color else v21.Theme.TextEmphasis.Color, 
                Transparency = 0
            }, 
            fontStyle = v21.Tokens.Semantic.Typography.Header, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundTransparency = 1
        })
    });
end;
