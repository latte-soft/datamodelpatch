local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Text.GetTextSize);
local v6 = require(l_Parent_1.App.ImageSet.Images);
local v7 = require(l_Parent_1.Utility.memoize);
local v8 = require(l_Parent_1.Core.Style.withStyle);
local v9 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v10 = require(l_Parent_0.Button.Enum.ButtonType);
local v11 = Vector2.new(36, 36);
local function _(v12, v13, v14, v15)
    return v5(v12, v14, v13, (Vector2.new(v15, 10000))).Y;
end;
local v17 = v3.PureComponent:extend("ToastContainer");
v17.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    buttonText = v4.optional(v4.string), 
    fitHeight = v4.optional(v4.boolean), 
    iconColorStyle = v4.optional(v9), 
    iconImage = v4.optional(v4.union(v4.table, v4.string, v4.callback)), 
    iconSize = v4.optional(v4.Vector2), 
    iconChildren = v4.optional(v4.table), 
    layoutOrder = v4.optional(v4.integer), 
    onActivated = v4.optional(v4.callback), 
    onTouchSwipe = v4.optional(v4.callback), 
    padding = v4.numberMin(0), 
    position = v4.UDim2, 
    pressedScale = v4.optional(v4.number), 
    renderToast = v4.callback, 
    size = v4.UDim2, 
    sizeConstraint = v4.optional(v4.table), 
    toastSubtitle = v4.optional(v4.string), 
    toastTitle = v4.string, 
    buttonType = v4.optional(v10.isEnumValue)
});
v17.defaultProps = {
    anchorPoint = Vector2.new(0, 0), 
    fitHeight = true, 
    padding = 12, 
    position = UDim2.new(0, 0, 0, 0), 
    size = UDim2.new(1, -24, 0, 0), 
    sizeConstraint = {
        MaxSize = Vector2.new(400, math.huge), 
        MinSize = Vector2.new(24, 60)
    }
};
v17.init = function(v18)
    v18.containerRef = v3.createRef();
    v18.isMounted = false;
    v18.state = {
        containerWidth = 0, 
        pressed = false, 
        subtitleHeight = 0, 
        titleHeight = 0
    };
    v18.getIconSize = function()
        local l_iconSize_0 = v18.props.iconSize;
        local l_iconImage_0 = v18.props.iconImage;
        local l_ImagesResolutionScale_0 = v6.ImagesResolutionScale;
        if not l_iconImage_0 then
            return Vector2.new(0, 0);
        elseif not l_iconSize_0 then
            if not (not l_iconImage_0.ImageRectSize or not l_ImagesResolutionScale_0) and l_ImagesResolutionScale_0 > 0 then
                return l_iconImage_0.ImageRectSize / l_ImagesResolutionScale_0;
            else
                return v11;
            end;
        else
            return l_iconSize_0;
        end;
    end;
    v18.onButtonInputBegan = function(_, v23)
        if not (not (v23.UserInputState == Enum.UserInputState.Begin and (not (v23.UserInputType ~= Enum.UserInputType.Touch) or v23.UserInputType == Enum.UserInputType.MouseButton1)) or v18.state.pressed) then
            v18:setState({
                pressed = true
            });
        end;
    end;
    v18.onButtonInputEnded = function()
        if v18.state.pressed then
            v18:setState({
                pressed = false
            });
        end;
    end;
    v18.getTextHeights = function(v24)
        local l_iconImage_1 = v18.props.iconImage;
        local v26 = v18.getIconSize();
        local l_buttonText_0 = v18.props.buttonText;
        local l_padding_0 = v18.props.padding;
        local l_toastSubtitle_0 = v18.props.toastSubtitle;
        local l_toastTitle_0 = v18.props.toastTitle;
        local l_Font_0 = v24.Font;
        local l_Header2_0 = l_Font_0.Header2;
        local l_CaptionBody_0 = l_Font_0.CaptionBody;
        local v34 = v18.state.containerWidth - l_padding_0 * 2;
        if l_iconImage_1 then
            v34 = (v34 - v26.X) - l_padding_0;
        end;
        if not (not l_buttonText_0 or v18.showCompactToast()) then
            v34 = v34 - v18.getButtonDimensions(v24).X;
        end;
        local v35 = math.max(0, v5(l_toastTitle_0, l_Header2_0.RelativeSize * l_Font_0.BaseSize, l_Header2_0.Font, (Vector2.new(v34, 10000))).Y);
        local v36 = 0;
        if l_toastSubtitle_0 then
            v36 = math.max(0, v5(l_toastSubtitle_0, l_CaptionBody_0.RelativeSize * l_Font_0.BaseSize, l_CaptionBody_0.Font, (Vector2.new(v34, 10000))).Y);
        end;
        return v36, v35;
    end;
    v18.showCompactToast = function()
        return v18.state.containerWidth < 400;
    end;
    v18.showPressed = function()
        if v18.props.buttonText or not v18.props.onActivated then
            return nil;
        else
            return v18.state.pressed;
        end;
    end;
    v18.getButtonDimensions = v7(function(v37)
        local l_buttonText_1 = v18.props.buttonText;
        local l_onActivated_0 = v18.props.onActivated;
        if l_buttonText_1 and l_onActivated_0 then
            local v40 = (Vector2.new(30, 30) + Vector2.new(10, 10)) + v5(l_buttonText_1, v37.Font.Header2.RelativeSize * v37.Font.BaseSize, v37.Font.Header2.Font, Vector2.new(1000, 1000));
            if v18.showCompactToast() then
                return Vector2.new(math.min(v40.X, 200), v40.Y);
            else
                return v40;
            end;
        else
            return Vector2.new(0, 0);
        end;
    end);
end;
v17.render = function(v41)
    local l_iconImage_2 = v41.props.iconImage;
    local v43 = v41.getIconSize();
    local l_padding_1 = v41.props.padding;
    local l_toastSubtitle_1 = v41.props.toastSubtitle;
    local l_toastTitle_1 = v41.props.toastTitle;
    return v8(function(v47)
        local v48, v49 = v41.getTextHeights(v47);
        local v50 = v49 + v48;
        local l_Y_0 = v41.getButtonDimensions(v47).Y;
        local l_size_0 = v41.props.size;
        if v41.props.fitHeight then
            l_size_0 = UDim2.new(l_size_0.X.Scale, l_size_0.X.Offset, 0, (math.max(v43.Y, v50) + l_padding_1 * 2) + if not not v41.showCompactToast() and v41.props.buttonText then l_Y_0 else 0);
        end;
        local l_Theme_0 = v47.Theme;
        local l_Font_1 = v47.Font;
        return v3.createElement("TextButton", {
            AnchorPoint = v41.props.anchorPoint, 
            BackgroundTransparency = 1, 
            LayoutOrder = v41.props.layoutOrder, 
            Position = v41.props.position, 
            Size = l_size_0, 
            Text = "", 
            [v3.Change.AbsoluteSize] = function(v55)
                if v41.state.containerWidth ~= v55.AbsoluteSize.X then
                    v41:setState({
                        containerWidth = v55.AbsoluteSize.X
                    });
                end;
            end, 
            [v3.Event.Activated] = if v41.props.buttonText then nil else v41.props.onActivated, 
            [v3.Event.InputBegan] = v41.onButtonInputBegan, 
            [v3.Event.InputEnded] = v41.onButtonInputEnded, 
            [v3.Event.TouchSwipe] = v41.props.onTouchSwipe, 
            [v3.Ref] = v41.containerRef
        }, {
            UISizeConstraint = v3.createElement("UISizeConstraint", v41.props.sizeConstraint), 
            Toast = v41.props.renderToast({
                buttonProps = if not not v41.props.buttonText and v41.props.onActivated then {
                    buttonDimensions = v41.getButtonDimensions(v47), 
                    buttonText = v41.props.buttonText, 
                    onActivated = v41.props.onActivated, 
                    buttonType = v41.props.buttonType
                } else nil, 
                iconProps = not not l_iconImage_2 and {
                    colorStyle = v41.props.iconColorStyle, 
                    Image = l_iconImage_2, 
                    Size = UDim2.new(0, v43.X, 0, v43.Y)
                } or nil, 
                iconChildren = v41.props.iconChildren, 
                isCompact = if not not v41.props.buttonText and v41.props.onActivated then v41.showCompactToast() else nil, 
                padding = l_padding_1, 
                pressed = v41.showPressed(), 
                pressedScale = v41.props.pressedScale, 
                subtitleTextProps = not not l_toastSubtitle_1 and {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_Font_1.CaptionBody, 
                    Size = UDim2.new(1, 0, 0, v48), 
                    Text = l_toastSubtitle_1
                } or nil, 
                textFrameSize = UDim2.new(1, not not l_iconImage_2 and -v43.X - l_padding_1 or 0, 0, v50), 
                titleTextProps = {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_Font_1.Header2, 
                    Size = UDim2.new(1, 0, 0, v49), 
                    Text = l_toastTitle_1
                }
            })
        });
    end);
end;
v17.didMount = function(v56)
    v56:setState({
        containerWidth = not not v56.containerRef.current and v56.containerRef.current.AbsoluteSize.X or 0
    });
end;
return v17;
