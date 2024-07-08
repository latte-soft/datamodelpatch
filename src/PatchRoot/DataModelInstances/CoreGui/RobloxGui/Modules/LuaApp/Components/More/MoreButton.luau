local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v8 = v3.PureComponent:extend("MoreButton");
v8.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    TextXAlignment = Enum.TextXAlignment.Left, 
    LayoutOrder = 1
};
v8.eventDisconnect = function(v9)
    if v9.onAbsolutePositionChanged then
        v9.onAbsolutePositionChanged:disconnect();
        v9.onAbsolutePositionChanged = nil;
    end;
end;
v8.onButtonUp = function(v10)
    if v10.state.buttonPressed then
        v10:setState({
            buttonPressed = false
        });
    end;
    v10:eventDisconnect();
end;
v8.onButtonDown = function(v11)
    if not v11.state.buttonPressed then
        v11:eventDisconnect();
        v11.onAbsolutePositionChanged = v11.buttonRef.current and v11.buttonRef.current:GetPropertyChangedSignal("AbsolutePosition"):connect(function()
            v11:onButtonUp();
        end);
        v11:setState({
            buttonPressed = true
        });
    end;
end;
v8.init = function(v12)
    v12.state = {
        buttonPressed = false
    };
    v12.buttonRef = v3.createRef();
    v12.onButtonInputBegan = function(_, v14)
        if v14.UserInputState == Enum.UserInputState.Begin and (not (v14.UserInputType ~= Enum.UserInputType.Touch) or v14.UserInputType == Enum.UserInputType.MouseButton1) then
            v12:onButtonDown();
        end;
    end;
    v12.onButtonInputEnded = function()
        v12:onButtonUp();
    end;
    v12.onButtonActivated = function()
        v12:onButtonUp();
        local l_onActivated_0 = v12.props.onActivated;
        if l_onActivated_0 then
            l_onActivated_0();
        end;
    end;
end;
v8.render = function(v16)
    local l_buttonPressed_0 = v16.state.buttonPressed;
    local l_Size_0 = v16.props.Size;
    local l_Position_0 = v16.props.Position;
    local l_LayoutOrder_0 = v16.props.LayoutOrder;
    local l_textKey_0 = v16.props.textKey;
    local l_TextXAlignment_0 = v16.props.TextXAlignment;
    local l_icon_0 = v16.props.icon;
    local l_rightImage_0 = v16.props.rightImage;
    local l_badgeComponent_0 = v16.props.badgeComponent;
    local l_badgeCount_0 = v16.props.badgeCount;
    local v27 = l_TextXAlignment_0 == Enum.TextXAlignment.Center and 0 or (l_icon_0 and v5.MORE_PAGE_TEXT_PADDING_WITH_ICON or v5.MORE_PAGE_ROW_PADDING_LEFT);
    local v28 = (l_badgeComponent_0 and l_badgeCount_0) and l_badgeCount_0 > 0;
    local function v34(v29, v30, v31, v32, v33)
        return v3.createElement("ImageButton", {
            Size = l_Size_0, 
            Position = l_Position_0, 
            AutoButtonColor = false, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundColor3 = v30.Color, 
            BackgroundTransparency = v30.Transparency, 
            BorderSizePixel = 0, 
            [v3.Event.InputBegan] = v16.onButtonInputBegan, 
            [v3.Event.InputEnded] = v16.onButtonInputEnded, 
            [v3.Event.Activated] = v16.onButtonActivated, 
            [v3.Ref] = v16.buttonRef
        }, {
            Icon = l_icon_0 and v3.createElement(v7, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0, 26, 0, 26), 
                Position = UDim2.new(0, v5.MORE_PAGE_ROW_PADDING_LEFT, 0.5, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                Image = l_icon_0, 
                ImageColor3 = v32.Color, 
                ImageTransparency = v32.Transparency
            }), 
            Text = v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, v27, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v29.moreButtonText, 
                Font = v31.Font, 
                TextSize = v31.Size, 
                TextColor3 = v31.Color, 
                TextTransparency = v31.Transparency, 
                TextXAlignment = l_TextXAlignment_0, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            RightImage = l_rightImage_0 and v3.createElement(v7, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0, 14, 0, 14), 
                Position = UDim2.new(1, -v5.MORE_PAGE_ROW_PADDING_RIGHT, 0.5, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = l_rightImage_0, 
                ImageColor3 = v33.Color, 
                ImageTransparency = v33.Transparency
            }), 
            NotificationBadge = v28 and v3.createElement(l_badgeComponent_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, -v5.MORE_PAGE_ROW_PADDING_RIGHT * 2 - 14, 0.5, 0), 
                badgeCount = l_badgeCount_0
            })
        });
    end;
    return v6({
        moreButtonText = l_textKey_0
    })(function(v35)
        return l_withStyle_0(function(v36)
            return v34(v35, not not l_buttonPressed_0 and v36.Theme.BackgroundOnPress or v36.Theme.BackgroundDefault, v2.Dictionary.join(v36.Theme.TextDefault, {
                Font = v36.Font.Header2.Font, 
                Size = v36.Font.BaseSize * v36.Font.Header2.RelativeSize
            }), v36.Theme.TextDefault, v36.Theme.SecondaryDefault);
        end);
    end);
end;
v8.willUnmount = function(v37)
    v37:eventDisconnect();
end;
return v8;
