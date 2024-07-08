local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v5 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v6 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v7 = v2.PureComponent:extend("ToastText");
v7.validateProps = v3.interface({
    colorStyle = v5, 
    fontStyle = v4, 
    Size = v3.UDim2, 
    Text = v3.string, 
    AnchorPoint = v3.optional(v3.Vector2), 
    fluidSizing = v3.optional(v3.boolean), 
    LayoutOrder = v3.optional(v3.integer), 
    maxSize = v3.optional(v3.Vector2), 
    Position = v3.optional(v3.UDim2), 
    TextTruncate = v3.optional(v3.EnumItem), 
    TextXAlignment = v3.optional(v3.EnumItem), 
    TextYAlignment = v3.optional(v3.EnumItem)
});
v7.defaultProps = {
    TextXAlignment = Enum.TextXAlignment.Left, 
    TextYAlignment = Enum.TextYAlignment.Center
};
v7.render = function(v8)
    return v2.createElement(v6, v8.props);
end;
return v7;
