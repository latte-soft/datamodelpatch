local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_3.RoactGamepad);
local v7 = require(l_Parent_3.Cryo);
local v8 = require(l_Parent_1.ImageSet.Images);
local v9 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_2.Core.Style.withStyle);
local v11 = require(l_Parent_1.Button.ButtonStack);
local l_FitFrameOnAxis_0 = require(l_Parent_3.FitFrame).FitFrameOnAxis;
local v13 = require(l_Parent_0.Enum.AlertType);
local v14 = require(l_Parent_0.AlertTitle);
local v15 = v4.PureComponent:extend("Alert");
v15.validateProps = v5.strictInterface({
    alertType = v13.isEnumValue, 
    maxWidth = v5.optional(v5.number), 
    minWidth = v5.optional(v5.number), 
    margin = v5.optional(v5.table), 
    anchorPoint = v5.optional(v5.Vector2), 
    onMounted = v5.optional(v5.callback), 
    onAbsoluteSizeChanged = v5.optional(v5.callback), 
    position = v5.optional(v5.UDim2), 
    screenSize = v5.Vector2, 
    title = v5.string, 
    titleContent = v5.optional(v5.callback), 
    middleContent = v5.optional(v5.callback), 
    buttonStackInfo = v5.optional(v11.validateProps), 
    footerContent = v5.optional(v5.callback), 
    defaultChildRef = v5.optional(v5.union(v5.table, v5.callback)), 
    isMiddleContentFocusable = v5.optional(v5.boolean), 
    isFooterContentFocusable = v5.optional(v5.boolean)
});
v15.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    margin = {
        top = 0, 
        bottom = 24, 
        left = 24, 
        right = 24
    }, 
    maxWidth = 400, 
    minWidth = 272, 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v15.init = function(v16)
    local v17, v18 = v4.createBinding(Vector2.new(0, 0));
    v16.contentSize = v17;
    v16.changeContentSize = v18;
    v16.middleContentRef = v4.createRef();
    v16.footerContentRef = v4.createRef();
    v16.buttonStackRef = v4.createRef();
end;
v15.didMount = function(v19)
    if v19.props.onMounted then
        v19.props.onMounted();
    end;
end;
v15.render = function(v20)
    local l_isMiddleContentFocusable_0 = v20.props.isMiddleContentFocusable;
    local l_isFooterContentFocusable_0 = v20.props.isFooterContentFocusable;
    local v23 = math.clamp((v20.props.screenSize.X - v20.props.margin.left) - v20.props.margin.right, v20.props.minWidth, v20.props.maxWidth);
    return v10(function(v24)
        local l_Theme_0 = v24.Theme;
        local v26 = nil;
        local v27 = nil;
        local v28 = nil;
        if v20.props.alertType == v13.Interactive then
            v27 = l_Theme_0.BackgroundUIDefault.Color;
            v28 = l_Theme_0.BackgroundUIDefault.Transparency;
            v26 = 1;
        else
            v26 = l_Theme_0.BackgroundUIContrast.Transparency;
            v28 = 1;
        end;
        local v29;
        v29 = v20.props.buttonStackInfo and v7.Dictionary.join(v29, {
            [v4.Ref] = v20.buttonStackRef, 
            NextSelectionUp = not not l_isMiddleContentFocusable_0 and v20.middleContentRef or nil, 
            NextSelectionDown = not not l_isFooterContentFocusable_0 and v20.footerContentRef or nil
        });
        return v4.createElement(v6.Focusable[v9.Button], {
            Position = v20.props.position, 
            AnchorPoint = v20.props.anchorPoint, 
            Size = v20.contentSize:map(function(v30)
                return UDim2.new(0, v30.X, 0, v30.Y);
            end), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            BackgroundTransparency = v26, 
            BorderSizePixel = 0, 
            Image = v8["component_assets/circle_17"], 
            ImageColor3 = v27, 
            ImageTransparency = v28, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            AutoButtonColor = false, 
            ClipsDescendants = true, 
            Selectable = false, 
            [v4.Ref] = v20.props.defaultChildRef, 
            [v4.Change.AbsoluteSize] = v20.props.onAbsoluteSizeChanged, 
            defaultChild = v20.buttonStackRef
        }, {
            AlertContents = v4.createElement(l_FitFrameOnAxis_0, {
                contentPadding = UDim.new(0, 24), 
                margin = v20.props.margin, 
                minimumSize = UDim2.new(0, v23, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                [v4.Change.AbsoluteSize] = function(v31)
                    v20.changeContentSize(v31.AbsoluteSize);
                end
            }, {
                TitleContainer = v4.createElement(v14, {
                    layoutOrder = 1, 
                    margin = v20.props.margin, 
                    maxWidth = v20.props.maxWidth, 
                    minWidth = v20.props.minWidth, 
                    screenSize = v20.props.screenSize, 
                    title = v20.props.title, 
                    titleContent = v20.props.titleContent
                }), 
                MiddleContent = v20.props.middleContent and v4.createElement(v6.Focusable[l_FitFrameOnAxis_0], {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    minimumSize = UDim2.new(1, 0, 0, 0), 
                    [v4.Ref] = v20.middleContentRef, 
                    NextSelectionDown = not not l_isMiddleContentFocusable_0 and v20.buttonStackRef or nil
                }, {
                    Content = v20.props.middleContent()
                }), 
                Footer = v4.createElement(l_FitFrameOnAxis_0, {
                    BackgroundTransparency = 1, 
                    contentPadding = UDim.new(0, 12), 
                    LayoutOrder = 3, 
                    minimumSize = UDim2.new(1, 0, 0, 0)
                }, {
                    Buttons = v29 and v4.createElement(v11, v29), 
                    FooterContent = v20.props.footerContent and v4.createElement(v6.Focusable[l_FitFrameOnAxis_0], {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 5, 
                        minimumSize = UDim2.new(1, 0, 0, 0), 
                        [v4.Ref] = v20.footerContentRef, 
                        NextSelectionUp = not not l_isFooterContentFocusable_0 and v20.buttonStackRef or nil
                    }, {
                        Content = v20.props.footerContent()
                    })
                })
            }) or nil
        });
    end);
end;
return v15;
