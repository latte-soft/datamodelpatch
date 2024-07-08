local l_Parent_0 = script.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.t);
local v4 = require(l_Core_0.Style.Validator.validateColorInfo);
local v5 = require(l_Core_0.Style.Validator.validateFontInfo);
local v6 = require(l_Core_0.Style.Validator.validateTypographyInfo);
local v7 = require(l_Parent_1.Roact);
local v8 = require(l_Core_0.Style.withStyle);
local v9 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v10 = v7.PureComponent:extend("CellHeadDetail");
v10.validateProps = v3.strictInterface({
    labelText = v3.string, 
    labelTextColor = v3.optional(v4), 
    labelTextFont = v3.optional(v3.union(v5, v6)), 
    subLabelText = v3.optional(v3.string), 
    subLabelTextColor = v3.optional(v4), 
    subLabelTextFont = v3.optional(v3.union(v5, v6))
});
v10.render = function(v11)
    return v8(function(v12)
        local l_labelText_0 = v11.props.labelText;
        local v14 = v11.props.labelTextColor or v12.Theme.TextEmphasis;
        local v15 = v11.props.labelTextFont or v12.Font.Header2;
        local l_subLabelText_0 = v11.props.subLabelText;
        return v7.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            ListLayout = v7.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Label = v7.createElement(v9, {
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_labelText_0, 
                colorStyle = v14, 
                fontStyle = v15, 
                BackgroundTransparency = 1
            }), 
            SubLabel = not not l_subLabelText_0 and v7.createElement(v9, {
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = l_subLabelText_0, 
                colorStyle = v11.props.subLabelTextColor or v12.Theme.TextDefault, 
                fontStyle = v11.props.subLabelTextFont or v12.Font.CaptionBody, 
                BackgroundTransparency = 1
            }) or nil
        });
    end);
end;
return v10;
