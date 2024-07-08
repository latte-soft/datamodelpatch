local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v3 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v4 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v5 = require(l_Parent_0.Core.Style.Validator.validateColorToken);
local v6 = require(l_Parent_0.Core.Style.Validator.validateTypographyInfo);
local v7 = require(l_Parent_1.Roact);
local v8 = require(l_Parent_1.t);
local v9 = v7.PureComponent:extend("StyledTextLabel");
v9.validateProps = v8.strictInterface({
    text = v8.string, 
    fontStyle = v8.union(v3, v6), 
    colorStyle = v8.union(v4, v5), 
    textTruncate = v8.optional(v8.EnumItem), 
    textWrapped = v8.optional(v8.boolean), 
    textXAlignment = v8.optional(v8.EnumItem), 
    textYAlignment = v8.optional(v8.EnumItem), 
    size = v8.optional(v8.UDim2), 
    maxSize = v8.optional(v8.Vector2), 
    richText = v8.optional(v8.boolean), 
    layoutOrder = v8.optional(v8.number), 
    fluidSizing = v8.optional(v8.boolean), 
    automaticSize = v8.optional(v8.EnumItem), 
    lineHeight = v8.optional(v8.number), 
    clipsDescendants = v8.optional(v8.boolean), 
    onAbsoluteSizeChange = v8.optional(v8.callback)
});
v9.defaultProps = {
    textXAlignment = Enum.TextXAlignment.Left, 
    textYAlignment = Enum.TextYAlignment.Center, 
    richText = true, 
    fluidSizing = true, 
    automaticSize = Enum.AutomaticSize.None, 
    lineHeight = 1.4, 
    clipsDescendants = false
};
v9.render = function(v10)
    return v7.createElement(v2, {
        maxSize = v10.props.maxSize, 
        fontStyle = v10.props.fontStyle, 
        colorStyle = v10.props.colorStyle, 
        fluidSizing = v10.props.fluidSizing, 
        Size = v10.props.size, 
        Text = v10.props.text, 
        TextXAlignment = v10.props.textXAlignment, 
        TextYAlignment = v10.props.textYAlignment, 
        TextTruncate = v10.props.textTruncate, 
        TextWrapped = v10.props.textWrapped, 
        LayoutOrder = v10.props.layoutOrder, 
        RichText = v10.props.richText, 
        AutomaticSize = v10.props.automaticSize, 
        LineHeight = v10.props.lineHeight, 
        ClipsDescendants = v10.props.clipsDescendants, 
        [v7.Change.AbsoluteSize] = v10.props.onAbsoluteSizeChange
    });
end;
return v9;
