local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local l_FitFrameOnAxis_0 = require(l_Parent_1.FitFrame).FitFrameOnAxis;
local v5 = require(l_Parent_0.UIBloxConfig);
local v6 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v7 = require(l_Parent_0.Core.Style.withStyle);
local v8 = v2.PureComponent:extend("AlertTitle");
v8.validateProps = v3.strictInterface({
    layoutOrder = v3.optional(v3.number), 
    margin = v3.optional(v3.table), 
    maxWidth = v3.optional(v3.number), 
    minWidth = v3.optional(v3.number), 
    screenSize = v3.Vector2, 
    title = v3.string, 
    titlePadding = v3.optional(v3.number), 
    titleContent = v3.optional(v3.callback)
});
v8.defaultProps = {
    margin = {
        top = 0, 
        bottom = 24, 
        left = 24, 
        right = 24
    }, 
    maxWidth = 400, 
    minWidth = 272, 
    titlePadding = 12
};
v8.render = function(v9)
    local v10 = (math.clamp((v9.props.screenSize.X - v9.props.margin.left) - v9.props.margin.right, v9.props.minWidth, v9.props.maxWidth) - v9.props.margin.left) - v9.props.margin.right;
    return v7(function(v11)
        local l_Font_0 = v11.Font;
        local l_Theme_0 = v11.Theme;
        local v14 = nil;
        local v15 = nil;
        if not v5.alertTitleDesignTokenHeader then
            v15 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        else
            v14 = v11.Tokens.Semantic.Typography.Header;
            v15 = v14.FontSize;
        end;
        return v2.createElement(l_FitFrameOnAxis_0, {
            BackgroundTransparency = 1, 
            contentPadding = UDim.new(0, 8), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            LayoutOrder = v9.props.layoutOrder, 
            margin = {
                top = 12, 
                bottom = 0, 
                left = 0, 
                right = 0
            }, 
            minimumSize = UDim2.new(1, 0, 0, 0)
        }, {
            TitleContent = v9.props.titleContent and v2.createElement(l_FitFrameOnAxis_0, {
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                minimumSize = UDim2.new(1, 0, 0, 0)
            }, {
                Content = v9.props.titleContent()
            }), 
            TitleArea = v2.createElement(l_FitFrameOnAxis_0, {
                BackgroundTransparency = 1, 
                contentPadding = UDim.new(0, 12), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = 1, 
                minimumSize = UDim2.new(1, 0, 0, 0)
            }, {
                Title = v2.createElement(v6, {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = if not v5.alertTitleDesignTokenHeader then l_Font_0.Header1 else v14, 
                    maxSize = Vector2.new(v10, v15 * 2), 
                    LayoutOrder = 1, 
                    Text = v9.props.title, 
                    TextSize = v15, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }), 
                Underline = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 1)
                })
            })
        });
    end);
end;
return v8;
