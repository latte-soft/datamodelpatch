local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v6 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v7 = require(l_Parent_0.Core.Style.withStyle);
local v8 = v2.PureComponent:extend("ToastIcon");
v8.validateProps = v4.interface({
    Image = v4.union(v4.table, v4.string, v4.callback), 
    Size = v4.UDim2, 
    AnchorPoint = v4.optional(v4.Vector2), 
    colorStyle = v4.optional(v6), 
    LayoutOrder = v4.optional(v4.integer), 
    Position = v4.optional(v4.UDim2)
});
v8.defaultProps = {
    BackgroundTransparency = 1
};
v8.render = function(v9)
    return v7(function(v10)
        local l_Theme_0 = v10.Theme;
        local l_colorStyle_0 = v9.props.colorStyle;
        if l_colorStyle_0 == nil then
            l_colorStyle_0 = l_Theme_0.IconEmphasis;
        end;
        return v2.createElement(v5.Label, (v3.Dictionary.join(v9.props, {
            colorStyle = v3.None, 
            ImageColor3 = l_colorStyle_0.Color, 
            ImageTransparency = l_colorStyle_0.Transparency
        })));
    end);
end;
return v8;
