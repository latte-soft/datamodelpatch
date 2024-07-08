local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.t);
local v5 = require(l_Core_0.Style.Validator.validateColorInfo);
local v6 = require(l_Core_0.Style.Validator.validateFontInfo);
local v7 = require(l_Core_0.Style.Validator.validateTypographyInfo);
local v8 = require(l_Parent_2.Roact);
local v9 = require(l_Core_0.Style.withStyle);
local v10 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v11 = require(l_Core_0.ImageSet.ImageSetComponent);
local v12 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v13 = require(l_Parent_0.ImageSet.getIconSize);
local v14 = require(l_Parent_0.ImageSet.Images);
local v15 = v8.PureComponent:extend("CellTailDescription");
v15.validateProps = v4.strictInterface({
    text = v4.optional(v4.string), 
    textColor = v4.optional(v5), 
    textFont = v4.optional(v4.union(v6, v7)), 
    renderTextOverride = v4.optional(v4.callback), 
    showArrow = v4.optional(v4.boolean), 
    infoIcon = v4.optional(v4.string)
});
v15.defaultProps = {
    showArrow = false, 
    infoIcon = nil
};
v15.init = function(v16)
    v16.getDescription = function(v17, v18, v19, v20, v21)
        local v22 = nil;
        if v17 then
            if v21 then
                v22 = v21();
            end;
            if not v22 then
                v22 = v8.createElement(v10, {
                    LayoutOrder = v20, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v17, 
                    colorStyle = v18, 
                    fontStyle = v19, 
                    BackgroundTransparency = 1
                });
            end;
        end;
        return v22;
    end;
end;
v15.render = function(v23)
    local l_text_0 = v23.props.text;
    local l_renderTextOverride_0 = v23.props.renderTextOverride;
    local l_showArrow_0 = v23.props.showArrow;
    local v27 = v23.props.infoIcon ~= nil;
    if (l_text_0 or l_showArrow_0) or v27 then
        return v9(function(v28)
            return v8.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                ListLayout = v8.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 8)
                }), 
                Description = v23.getDescription(l_text_0, v23.props.textColor or v28.Theme.TextDefault, v23.props.textFont or v28.Font.Body, 1, l_renderTextOverride_0), 
                RightArrow = not not l_showArrow_0 and v8.createElement(v11.Label, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(v13(v12.Small), v13(v12.Small)), 
                    BackgroundTransparency = 1, 
                    Image = v14["icons/navigation/pushRight_small"], 
                    ImageColor3 = v28.Theme.TextEmphasis.Color, 
                    ImageTransparency = v28.Theme.TextEmphasis.Transparency
                }) or nil, 
                InfoIcon = not not v27 and v8.createElement(v11.Label, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(v13(v12.Small), v13(v12.Small)), 
                    Image = v23.props.infoIcon, 
                    ImageColor3 = v28.Theme.IconEmphasis.Color, 
                    ImageTransparency = v28.Theme.IconEmphasis.Transparency, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }) or nil
            });
        end);
    else
        return nil;
    end;
end;
return v15;
