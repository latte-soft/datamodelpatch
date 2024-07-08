local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.UIBlox);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = v1.Core.Style.withStyle;
local l_StyledTextLabel_0 = v1.App.Text.StyledTextLabel;
local v6 = game:DefineFastFlag("FeedbackBarHintSizeAdjustment", false);
local v7 = v3.PureComponent:extend("FeedbackBarHint");
v7.validateProps = v2.strictInterface({
    layoutOrder = v2.optional(v2.integer), 
    text = v2.string, 
    maxWidth = v2.optional(v2.number), 
    hintTextSize = v2.optional(v2.number)
});
v7.render = function(v8)
    return l_withStyle_0(function(v9)
        return v3.createElement("Frame", {
            LayoutOrder = v8.props.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 8)
            }), 
            FeedbackBarHintText = v3.createElement(l_StyledTextLabel_0, {
                textSize = v8.props.hintTextSize, 
                maxSize = if not v8.props.maxWidth then nil else if v6 then Vector2.new(1000, v8.props.maxWidth) else Vector2.new(v8.props.maxWidth), 
                layoutOrder = 2, 
                fontStyle = v9.Font.Header2, 
                colorStyle = v9.Theme.TextEmphasis, 
                automaticSize = if v8.props.maxWidth then nil else Enum.AutomaticSize.X, 
                fluidSizing = not not v8.props.maxWidth or false, 
                text = v8.props.text, 
                textTruncate = if not v8.props.maxWidth then nil else Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
return v7;
