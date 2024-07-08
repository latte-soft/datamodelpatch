local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_0.Alert);
local v6 = require(l_Parent_0.Enum.AlertType);
local l_FitFrameOnAxis_0 = require(l_Parent_2.FitFrame).FitFrameOnAxis;
local v8 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_1.Core.Text.GetTextHeight);
local v11 = require(l_Parent_1.Core.Style.withStyle);
local v12 = v3.PureComponent:extend("InformativeAlert");
v12.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.UDim2), 
    screenSize = v4.Vector2, 
    onMounted = v4.optional(v4.callback), 
    title = v4.string, 
    titleIcon = v4.optional(v4.union(v4.table, v4.string)), 
    bodyText = v4.optional(v4.string), 
    richText = v4.optional(v4.boolean)
});
v12.render = function(v13)
    return v11(function(v14)
        local l_Font_0 = v14.Font;
        local l_Theme_0 = v14.Theme;
        local l_Font_1 = l_Font_0.Body.Font;
        local v18 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local v19 = not not v13.props.bodyText and v10(v13.props.bodyText, l_Font_1, v18, math.clamp(v13.props.screenSize.X - 48, 272, 400) - 48) or 0;
        return v3.createElement(v5, {
            anchorPoint = v13.props.anchorPoint, 
            alertType = v6.Informative, 
            margin = {
                top = 0, 
                bottom = 24, 
                left = 24, 
                right = 24
            }, 
            maxWidth = 400, 
            minWidth = 272, 
            onMounted = v13.props.onMounted, 
            position = v13.props.position, 
            screenSize = v13.props.screenSize, 
            title = v13.props.title, 
            titleContent = not not v13.props.titleIcon and function()
                return v3.createElement(l_FitFrameOnAxis_0, {
                    BackgroundTransparency = 1, 
                    contentPadding = UDim.new(0, 8), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    margin = {
                        top = 12, 
                        bottom = 0, 
                        left = 0, 
                        right = 0
                    }, 
                    minimumSize = UDim2.new(1, 0, 0, 0)
                }, {
                    Icon = v3.createElement(v9.Label, {
                        BackgroundTransparency = 1, 
                        Image = v13.props.titleIcon, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        Size = UDim2.new(0, 48, 0, 48)
                    })
                });
            end or nil, 
            middleContent = function()
                return v3.createElement(v8, {
                    BackgroundTransparency = 1, 
                    colorStyle = l_Theme_0.TextDefault, 
                    fontStyle = l_Font_0.Body, 
                    LayoutOrder = 1, 
                    Text = v13.props.bodyText, 
                    TextSize = v18, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    Size = UDim2.new(1, 0, 0, v19), 
                    RichText = v13.props.richText
                });
            end
        });
    end);
end;
return v12;
