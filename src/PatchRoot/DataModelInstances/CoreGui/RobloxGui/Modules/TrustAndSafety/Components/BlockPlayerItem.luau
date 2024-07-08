local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(script.Parent.Parent.Dependencies);
local v5 = require(v4.Divider);
local v6 = require(v4.ThemedTextLabel);
local l_withStyle_0 = v2.Style.withStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Checkbox_0 = v2.App.InputButton.Checkbox;
local v10 = v1.PureComponent:extend("BlockPlayerItem");
v10.validateProps = v3.strictInterface({
    layoutOrder = v3.optional(v3.number), 
    size = v3.UDim2, 
    text = v3.string, 
    description = v3.string, 
    icon = v3.union(v3.string, v3.table), 
    iconSize = v3.UDim2, 
    isDisabled = v3.optional(v3.boolean), 
    isCheckBoxSelected = v3.boolean, 
    onCheckBoxActivated = v3.callback
});
v10.defaultProps = {
    isDisabled = false, 
    isCheckBoxSelected = false
};
v10.init = function(v11)
    v11.onClicked = function()
        if not (not v11.props.onCheckBoxActivated or v11.props.isDisabled) then
            v11.props.onCheckBoxActivated(not v11.props.isCheckBoxSelected);
        end;
    end;
end;
v10.render = function(v12)
    local l_props_0 = v12.props;
    return l_withStyle_0(function(v14)
        local _ = v14.Theme;
        return v1.createElement("TextButton", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_0.layoutOrder, 
            Size = l_props_0.size, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            Text = "", 
            [v1.Event.Activated] = v12.onClicked
        }, {
            BlockIcon = v1.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_props_0.icon, 
                ImageTransparency = if not l_props_0.isDisabled then nil else 0.5, 
                Position = UDim2.new(0, 16, 0.5, 0), 
                Size = l_props_0.iconSize
            }), 
            CheckBoxFrame = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -20, 0.5, 0), 
                Size = UDim2.fromOffset(24, 24)
            }, {
                CheckBox = v1.createElement(l_Checkbox_0, {
                    size = UDim2.new(1, 0, 1, 0), 
                    text = "", 
                    isDisabled = l_props_0.isDisabled, 
                    onActivated = l_props_0.onCheckBoxActivated, 
                    isSelected = l_props_0.isCheckBoxSelected
                })
            }), 
            TextFrame = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 60, 0.5, 0), 
                Size = UDim2.new(1, -124, 1, 0)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                Text = v1.createElement(v6, {
                    LayoutOrder = 1, 
                    TextTransparency = if not l_props_0.isDisabled then nil else 0.5, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    fontKey = "SubHeader1", 
                    themeKey = "TextEmphasis", 
                    Text = l_props_0.text, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Description = v1.createElement(v6, {
                    LayoutOrder = 2, 
                    TextTransparency = if not l_props_0.isDisabled then nil else 0.5, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    fontKey = "Footer", 
                    TextWrapped = true, 
                    themeKey = "TextDefault", 
                    Text = l_props_0.description, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LineHeight = 1.25
                })
            }), 
            Divider = v1.createElement(v5, {
                Position = UDim2.new(0, 0, 1, 0)
            })
        });
    end);
end;
return v10;
