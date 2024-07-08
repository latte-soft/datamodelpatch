local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_3.Cryo);
local l_EventConnection_0 = require(l_Parent_3.ReactUtils).EventConnection;
local v9 = require(l_Parent_1.Control.Interactable);
local v10 = require(l_Parent_1.Control.Enum.ControlState);
local v11 = require(script.Parent.getContentStyle);
local v12 = require(l_Parent_2.Core.Style.withStyle);
local v13 = require(l_Parent_1.ImageSet.ImageSetComponent);
local v14 = require(l_Parent_2.App.Loading.ShimmerPanel);
local v15 = require(l_Parent_2.App.ImageSet.Enum.IconSize);
local v16 = require(l_Parent_2.App.ImageSet.getIconSize);
local v17 = require(l_Parent_1.Text.GenericTextLabel.GenericTextLabel);
local v18 = require(l_Parent_2.Core.Animation.withAnimation);
local v19 = require(l_Parent_1.Style.Validator.validateFontInfo);
local v20 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v21 = require(l_Parent_1.Button.HoverButtonBackground);
local v22 = require(l_Parent_0.Enum.StandardButtonSize);
local v23 = require(l_Parent_2.UIBloxConfig);
local v24 = require(l_Parent_1.ImageSet.Validator.validateImage);
local v25 = v5.PureComponent:extend("GenericButton");
v25.init = function(v26)
    v26:setState({
        controlState = v10.Initialize, 
        absoluteSize = Vector2.new(100, 100), 
        targetLoadingProgress = 1, 
        isButtonUnfocused = if not v23.useRobloxGuiFocusedChangedEventInGenericButton then nil else l_RunService_0:GetRobloxGuiFocused()
    });
    v26.onStateChanged = function(v27, v28)
        v26:setState({
            controlState = v28
        });
        if v26.props.onStateChanged then
            v26.props.onStateChanged(v27, v28);
        end;
    end;
    v26.onAbsoluteSizeChanged = function(v29)
        v26:setState({
            absoluteSize = v29.AbsoluteSize
        });
        if v26.props[v5.Change.AbsoluteSize] then
            v26.props[v5.Change.AbsoluteSize](v29);
        end;
    end;
    v26.onRobloxGuiFocusedChanged = function(v30)
        if not v30 then
            v26:setState({
                isButtonUnfocused = false
            });
            return ;
        else
            v26:setState({
                targetLoadingProgress = 1, 
                isButtonUnfocused = true
            });
            return ;
        end;
    end;
end;
local v31 = v6.interface({
    [v10.Default] = v6.string
});
v25.validateProps = v6.interface({
    icon = v6.optional(v24), 
    text = v6.optional(v6.string), 
    inputIcon = v6.optional(v24), 
    buttonImage = v24, 
    fontStyle = v6.optional(v6.union(v6.string, v19, v20)), 
    delayedInputImage = v6.optional(v24), 
    buttonStateColorMap = v31, 
    contentStateColorMap = v6.optional(v31), 
    textStateColorMap = v6.optional(v31), 
    iconStateColorMap = v6.optional(v31), 
    inputIconStateColorMap = v6.optional(v31), 
    isDisabled = v6.optional(v6.boolean), 
    isLoading = v6.optional(v6.boolean), 
    isDelayedInput = v6.optional(v6.boolean), 
    isHoverBackgroundEnabled = v6.optional(v6.boolean), 
    enableInputDelayed = v6.optional(v6.boolean), 
    delayInputSeconds = v6.optional(v6.numberPositive), 
    onActivated = v6.callback, 
    onStateChanged = v6.optional(v6.callback), 
    userInteractionEnabled = v6.optional(v6.boolean), 
    standardSize = v6.optional(v22.isEnumValue), 
    maxWidth = v6.optional(v6.numberPositive), 
    fitContent = v6.optional(v6.boolean), 
    buttonTextOverride = v6.optional(v6.strictInterface({
        RichText = v6.optional(v6.boolean), 
        Size = v6.optional(v6.UDim2), 
        TextSize = v6.optional(v6.number), 
        TextWrapped = v6.optional(v6.boolean), 
        TextTruncate = v6.optional(v6.enum(Enum.TextTruncate)), 
        TextXAlignment = v6.optional(v6.enum(Enum.TextXAlignment))
    })), 
    forwardedRef = v6.optional(v6.union(v6.table, v6.callback)), 
    feedbackType = v6.optional(v6.string)
});
v25.defaultProps = {
    fontStyle = "Header2", 
    isDisabled = false, 
    isLoading = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    delayInputSeconds = 3, 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
if v23.useRobloxGuiFocusedChangedEventInGenericButton then
    v25.didMount = function(v32)
        v32:setState({
            targetLoadingProgress = (not v32.state.isButtonUnfocused and v32.props.enableInputDelayed) and 0 or 1
        });
    end;
end;
v25.render = function(v33)
    local l_isDelayedInput_0 = v33.props.isDelayedInput;
    local l_enableInputDelayed_0 = v33.props.enableInputDelayed;
    local l_delayInputSeconds_0 = v33.props.delayInputSeconds;
    local l_l_isDelayedInput_0_0 = l_isDelayedInput_0;
    if v23.useRobloxGuiFocusedChangedEventInGenericButton then
        l_l_isDelayedInput_0_0 = l_isDelayedInput_0 and not v33.state.isButtonUnfocused;
    end;
    if not l_l_isDelayedInput_0_0 then
        if not v23.useRobloxGuiFocusedChangedEventInGenericButton then
            return v33:renderButton();
        elseif not v33.state.isButtonUnfocused then
            return v33:renderButton();
        else
            return v33:renderButton(1);
        end;
    else
        local _ = nil;
        return v18({
            loadingProgress = if not v23.useRobloxGuiFocusedChangedEventInGenericButton then not l_enableInputDelayed_0 and 1 or 0 else v33.state.targetLoadingProgress
        }, function(v39)
            return v33:renderButton((math.clamp(v39.loadingProgress, 0, 1)));
        end, {
            frequency = 1 / l_delayInputSeconds_0, 
            dampingRatio = 0.8
        });
    end;
end;
v25.renderButton = function(v40, v41)
    return v12(function(v42)
        assert(v6.table(v42), "Style provider is missing.");
        local l_controlState_0 = v40.state.controlState;
        local l_text_0 = v40.props.text;
        local l_icon_0 = v40.props.icon;
        local l_inputIcon_0 = v40.props.inputIcon;
        local l_isLoading_0 = v40.props.isLoading;
        local l_isDisabled_0 = v40.props.isDisabled;
        local l_isDelayedInput_1 = v40.props.isDelayedInput;
        local l_userInteractionEnabled_0 = v40.props.userInteractionEnabled;
        local l_buttonImage_0 = v40.props.buttonImage;
        local l_fontStyle_0 = v40.props.fontStyle;
        local l_delayedInputImage_0 = v40.props.delayedInputImage;
        local l_buttonStateColorMap_0 = v40.props.buttonStateColorMap;
        local l_contentStateColorMap_0 = v40.props.contentStateColorMap;
        local v56 = v40.props.textStateColorMap or l_contentStateColorMap_0;
        local v57 = v40.props.iconStateColorMap or l_contentStateColorMap_0;
        local v58 = v40.props.inputIconStateColorMap or l_contentStateColorMap_0;
        local l_Size_0 = v40.props.Size;
        local l_standardSize_0 = v40.props.standardSize;
        local v61 = v40.props.maxWidth or 640;
        local l_fitContent_0 = v40.props.fitContent;
        if l_text_0 then
            assert(v31(v56), "textStateColorMap is missing or invalid.");
        end;
        if l_icon_0 then
            assert(v31(v57), "iconStateColorMap is missing or invalid.");
        end;
        if l_inputIcon_0 then
            assert(v31(v58), "inputIconStateColorMap is missing or invalid.");
        end;
        if l_isDelayedInput_1 and l_delayedInputImage_0 == nil then
            l_isDelayedInput_1 = false;
        end;
        if l_isLoading_0 then
            l_isDisabled_0 = true;
        end;
        if l_isDisabled_0 then
            l_isDelayedInput_1 = false;
        end;
        if type(l_fontStyle_0) == "string" then
            l_fontStyle_0 = v42.Font[l_fontStyle_0];
        end;
        local l_l_delayedInputImage_0_0 = l_delayedInputImage_0;
        if v41 == 1 then
            l_l_delayedInputImage_0_0 = l_buttonImage_0;
        end;
        if l_isDelayedInput_1 and v41 ~= 0 then
            l_userInteractionEnabled_0 = false;
        end;
        local v64 = v11(l_buttonStateColorMap_0, l_controlState_0, v42);
        local v65 = l_text_0 and v11(v56, l_controlState_0, v42);
        local v66 = l_icon_0 and v11(v57, l_controlState_0, v42);
        local v67 = l_inputIcon_0 and v11(v58, l_controlState_0, v42);
        local v68 = false;
        if l_controlState_0 == v10.Hover then
            v68 = v40.props.isHoverBackgroundEnabled == true;
        end;
        local v69 = 5;
        if l_standardSize_0 then
            local v70 = nil;
            local v71 = nil;
            if l_standardSize_0 == v22.Regular then
                v70 = 48;
                v69 = 12;
                l_fontStyle_0 = v42.Font.Header2;
                v71 = false;
            elseif l_standardSize_0 == v22.Small then
                v70 = 36;
                v69 = 8;
                l_fontStyle_0 = v42.Font.Header2;
                v71 = false;
            elseif l_standardSize_0 == v22.XSmall then
                v70 = 28;
                v69 = 8;
                l_fontStyle_0 = v42.Font.CaptionHeader;
                v71 = true;
            end;
            if l_fitContent_0 == nil then
                l_fitContent_0 = v71;
            end;
            l_Size_0 = UDim2.new(not l_fitContent_0 and 1 or 0, 0, 0, v70);
        end;
        local v72 = nil;
        if not l_isLoading_0 then
            local l_X_0 = v40.state.absoluteSize.X;
            if not (not l_standardSize_0 or not l_fitContent_0) then
                l_X_0 = v61;
            end;
            local v74 = v40.state.absoluteSize.Y - 10;
            local v75 = l_X_0 - 2 * v69;
            if l_icon_0 then
                v75 = v75 - (5 + v16(v15.Medium));
            end;
            v72 = v40.props[v5.Children] or {
                ButtonMiddleContent = v5.createElement("Frame", {
                    AutomaticSize = if not l_fitContent_0 then nil else Enum.AutomaticSize.X, 
                    Size = if not l_fitContent_0 then UDim2.fromScale(1, 1) else UDim2.fromScale(0, 1), 
                    BackgroundTransparency = 1
                }, v40.props[v5.Children] or {
                    UIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 5)
                    }), 
                    Icon = not not l_icon_0 and v5.createElement(v13.Label, {
                        Size = UDim2.new(0, v16(v15.Medium), 0, v16(v15.Medium)), 
                        BackgroundTransparency = 1, 
                        Image = l_icon_0, 
                        ImageColor3 = v66.Color, 
                        ImageTransparency = v66.Transparency, 
                        LayoutOrder = 1
                    }) or nil, 
                    Text = not not l_text_0 and v5.createElement(v17, v7.Dictionary.join({
                        BackgroundTransparency = 1, 
                        Text = l_text_0, 
                        fontStyle = l_fontStyle_0, 
                        colorStyle = v65, 
                        LayoutOrder = 2, 
                        maxSize = Vector2.new(v75, v74), 
                        TextWrapped = if not l_standardSize_0 then nil else false, 
                        TextTruncate = if not l_standardSize_0 then nil else Enum.TextTruncate.AtEnd, 
                        TextXAlignment = if not not l_standardSize_0 and l_icon_0 then Enum.TextXAlignment.Left else nil
                    }, v40.props.buttonTextOverride or {})) or nil
                }), 
                ButtonIcon = not not l_inputIcon_0 and v5.createElement(v13.Label, {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.new(1, -4, 0.5, 0), 
                    Size = UDim2.new(0, v16(v15.Medium), 0, v16(v15.Medium)), 
                    BackgroundTransparency = 1, 
                    Image = l_inputIcon_0, 
                    ImageColor3 = v67.Color, 
                    ImageTransparency = v67.Transparency
                }) or nil
            };
        else
            v72 = {
                isLoadingShimmer = v5.createElement(v14, {
                    Size = UDim2.new(1, 0, 1, 0)
                })
            };
        end;
        return v5.createElement(v9, v7.Dictionary.join(v40.props, {
            forwardedRef = v7.None, 
            icon = v7.None, 
            text = v7.None, 
            inputIcon = v7.None, 
            buttonImage = v7.None, 
            fontStyle = v7.None, 
            delayedInputImage = v7.None, 
            buttonStateColorMap = v7.None, 
            contentStateColorMap = v7.None, 
            textStateColorMap = v7.None, 
            iconStateColorMap = v7.None, 
            inputIconStateColorMap = v7.None, 
            onActivated = v7.None, 
            isLoading = v7.None, 
            isHoverBackgroundEnabled = v7.None, 
            isDelayedInput = v7.None, 
            enableInputDelayed = v7.None, 
            delayInputSeconds = v7.None, 
            standardSize = v7.None, 
            maxWidth = v7.None, 
            fitContent = v7.None, 
            buttonTextOverride = v7.None, 
            [v5.Children] = v7.None, 
            Size = l_Size_0, 
            AutomaticSize = if not l_fitContent_0 then nil else Enum.AutomaticSize.X, 
            [v5.Ref] = v40.props.forwardedRef, 
            isDisabled = l_isDisabled_0, 
            onStateChanged = v40.onStateChanged, 
            userInteractionEnabled = l_userInteractionEnabled_0, 
            Image = l_buttonImage_0, 
            ScaleType = Enum.ScaleType.Slice, 
            ImageColor3 = v64.Color, 
            ImageTransparency = v64.Transparency, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v5.Event.Activated] = v40.props.onActivated, 
            [v5.Change.AbsoluteSize] = v40.onAbsoluteSizeChanged
        }), {
            UISizeConstraint = if not not l_standardSize_0 and v61 then v5.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v61, math.huge)
            }) else nil, 
            UIPadding = if not l_standardSize_0 then nil else v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v69), 
                PaddingRight = UDim.new(0, v69)
            }), 
            ButtonContent = v5.createElement("Frame", {
                AutomaticSize = if not l_fitContent_0 then nil else Enum.AutomaticSize.X, 
                Size = if not l_fitContent_0 then UDim2.fromScale(1, 1) else UDim2.fromScale(0, 1), 
                BackgroundTransparency = 1
            }, v72), 
            LoadingImage = l_isDelayedInput_1 and v5.createElement(v13.Label, {
                Size = UDim2.new(v41, 0, 1, 0), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_l_delayedInputImage_0_0, 
                ImageColor3 = Color3.new(0, 0, 0), 
                ImageTransparency = 0.5, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v40.props.SliceCenter
            }), 
            HoverBackground = not not v68 and v5.createElement(v21) or nil, 
            EventConnection = not not v23.useRobloxGuiFocusedChangedEventInGenericButton and v5.createElement(l_EventConnection_0, {
                event = l_RunService_0.RobloxGuiFocusedChanged, 
                callback = v40.onRobloxGuiFocusedChanged
            }) or nil
        });
    end);
end;
if v23.useRobloxGuiFocusedChangedEventInGenericButton then
    v25.didUpdate = function(v76, v77, v78)
        if v76.props.enableInputDelayed ~= v77.enableInputDelayed then
            v76:setState({
                targetLoadingProgress = not v76.props.enableInputDelayed and 1 or 0
            });
        end;
        if not (not (not (v76.state.isButtonUnfocused or not v78.isButtonUnfocused) and v76.state.targetLoadingProgress == 1) or not v76.props.enableInputDelayed) then
            v76:setState({
                targetLoadingProgress = 0
            });
        end;
    end;
end;
return v5.forwardRef(function(v79, v80)
    return v5.createElement(v25, v7.Dictionary.join(v79, {
        forwardedRef = v80
    }));
end);
