local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_0.Alert);
local v7 = require(l_Parent_0.Enum.AlertType);
local l_FitFrameOnAxis_0 = require(l_Parent_3.FitFrame).FitFrameOnAxis;
local v9 = 272;
local v10 = 400;
local v11 = require(l_Parent_2.UIBloxConfig);
local v12 = require(l_Parent_2.Core.Text.GenericTextLabel.GenericTextLabel);
local v13 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local v14 = require(l_Parent_2.Core.Text.GetTextHeight);
local v15 = require(l_Parent_2.Core.Style.withStyle);
local v16 = require(l_Parent_1.Button.ButtonStack);
local v17 = v4.PureComponent:extend("InteractiveAlert");
v17.validateProps = v5.strictInterface({
    anchorPoint = v5.optional(v5.Vector2), 
    position = v5.optional(v5.UDim2), 
    screenSize = v5.Vector2, 
    onMounted = v5.optional(v5.callback), 
    onAbsoluteSizeChanged = v5.optional(v5.callback), 
    title = v5.string, 
    titleIcon = v5.optional(v5.union(v5.table, v5.string)), 
    titleContent = v5.optional(v5.callback), 
    bodyText = v5.optional(v5.string), 
    richText = v5.optional(v5.boolean), 
    middleContent = v5.optional(v5.callback), 
    buttonStackInfo = v16.validateProps, 
    footerText = v5.optional(v5.string), 
    footerContent = v5.optional(v5.callback), 
    defaultChildRef = v5.optional(v5.union(v5.table, v5.callback)), 
    isMiddleContentFocusable = v5.optional(v5.boolean), 
    isFooterContentFocusable = v5.optional(v5.boolean)
});
v17.render = function(v18)
    return v15(function(v19)
        if v11.interactiveAlertDesignTokenMinMaxSize then
            v9 = v19.Tokens.Global.Size_200 * 17;
            v10 = v19.Tokens.Global.Size_500 * 10;
        end;
        local l_Theme_0 = v19.Theme;
        local l_Font_0 = v19.Font;
        local l_Font_1 = l_Font_0.Body.Font;
        local v23 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local l_titleContent_0 = v18.props.titleContent;
        if v18.props.titleIcon then
            l_titleContent_0 = function()
                return v4.createElement(l_FitFrameOnAxis_0, {
                    BackgroundTransparency = 1, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    margin = {
                        top = 12, 
                        bottom = 0, 
                        left = 0, 
                        right = 0
                    }, 
                    minimumSize = UDim2.new(1, 0, 0, 0)
                }, {
                    Icon = v4.createElement(v13.Label, {
                        BackgroundTransparency = 1, 
                        Image = v18.props.titleIcon, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        Size = UDim2.new(0, 48, 0, 48)
                    })
                });
            end;
        end;
        local v25 = math.clamp(v18.props.screenSize.X - 48, v9, v10) - 48;
        local l_footerContent_0 = v18.props.footerContent;
        if v18.props.footerText then
            local v27 = not not v18.props.footerText and v14(v18.props.footerText, l_Font_0.Footer.Font, l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, v25) or 0;
            local l_v27_0 = v27 --[[ copy: 9 -> 11 ]];
            l_footerContent_0 = function()
                return v4.createElement(v12, {
                    BackgroundTransparency = 1, 
                    colorStyle = l_Theme_0.TextDefault, 
                    fontStyle = l_Font_0.Footer, 
                    LayoutOrder = 4, 
                    Text = v18.props.footerText, 
                    TextSize = v23, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    Size = UDim2.new(1, 0, 0, l_v27_0)
                });
            end;
        end;
        local v29 = not not v18.props.bodyText and v14(v18.props.bodyText, l_Font_1, v23, v25) or 0;
        local l_middleContent_0 = v18.props.middleContent;
        if v18.props.bodyText then
            l_middleContent_0 = function()
                return v4.createElement(l_FitFrameOnAxis_0, {
                    BackgroundTransparency = 1, 
                    contentPadding = UDim.new(0, 12), 
                    LayoutOrder = 2, 
                    minimumSize = UDim2.new(1, 0, 0, 0)
                }, {
                    BodyText = v4.createElement(v12, {
                        BackgroundTransparency = 1, 
                        colorStyle = l_Theme_0.TextDefault, 
                        fontStyle = l_Font_0.Body, 
                        LayoutOrder = 1, 
                        Text = v18.props.bodyText, 
                        RichText = v18.props.richText, 
                        TextSize = v23, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Size = UDim2.new(1, 0, 0, v29)
                    }), 
                    CustomContent = v18.props.middleContent and v4.createElement(l_FitFrameOnAxis_0, {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        minimumSize = UDim2.new(1, 0, 0, 0)
                    }, {
                        Content = v18.props.middleContent()
                    })
                });
            end;
        end;
        return v4.createElement(v6, {
            anchorPoint = v18.props.anchorPoint, 
            alertType = v7.Interactive, 
            margin = {
                top = 0, 
                bottom = 24, 
                left = 24, 
                right = 24
            }, 
            maxWidth = v10, 
            minWidth = v9, 
            buttonStackInfo = v18.props.buttonStackInfo, 
            middleContent = l_middleContent_0, 
            isMiddleContentFocusable = v18.props.isMiddleContentFocusable, 
            onMounted = v18.props.onMounted, 
            onAbsoluteSizeChanged = v18.props.onAbsoluteSizeChanged, 
            position = v18.props.position, 
            screenSize = v18.props.screenSize, 
            title = v18.props.title, 
            titleContent = l_titleContent_0, 
            footerContent = l_footerContent_0, 
            isFooterContentFocusable = v18.props.isFooterContentFocusable, 
            defaultChildRef = v18.props.defaultChildRef
        });
    end);
end;
return v17;
