local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.RoactRodux);
local v2 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = v2.PureComponent:extend("NoticeListCell");
v5.validateProps = v4.strictInterface({
    screenWidth = v4.number, 
    Size = v4.UDim2, 
    Position = v4.UDim2, 
    LayoutOrder = v4.number, 
    onActivated = v4.callback, 
    item = v4.table, 
    dateText = v4.string, 
    noticeReadStatus = v4.table
});
v5.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    Position = UDim2.new(0, 0, 0, 0), 
    LayoutOrder = 1
};
v5.eventDisconnect = function(v6)
    if v6.onAbsolutePositionChanged then
        v6.onAbsolutePositionChanged:disconnect();
        v6.onAbsolutePositionChanged = nil;
    end;
end;
v5.onButtonUp = function(v7)
    if v7.state.buttonPressed then
        v7:setState({
            buttonPressed = false
        });
    end;
    v7:eventDisconnect();
end;
v5.onButtonDown = function(v8)
    if not v8.state.buttonPressed then
        v8:eventDisconnect();
        local l_current_0 = v8.buttonRef.current;
        if l_current_0 then
            v8.onAbsolutePositionChanged = l_current_0:GetPropertyChangedSignal("AbsolutePosition"):connect(function()
                v8:onButtonUp();
            end);
        end;
        v8:setState({
            buttonPressed = true
        });
        return ;
    else
        return ;
    end;
end;
v5.init = function(v10)
    v10.state = {
        buttonPressed = false
    };
    v10.buttonRef = v2.createRef();
    v10.onButtonInputBegan = function(_, v12)
        local v13 = v12.UserInputState == Enum.UserInputState.Begin;
        local v14 = v12.UserInputType == Enum.UserInputType.Touch;
        local v15 = v12.UserInputType == Enum.UserInputType.MouseButton1;
        if not (not v13 or not v14 and not v15) then
            v10:onButtonDown();
        end;
    end;
    v10.onButtonInputEnded = function()
        v10:onButtonUp();
    end;
    v10.onButtonActivated = function()
        v10:onButtonUp();
        local l_onActivated_0 = v10.props.onActivated;
        if l_onActivated_0 then
            l_onActivated_0();
        end;
    end;
end;
local function _(v17)
    if not (v17 ~= nil) or v17 == "" then
        return "";
    else
        return v17:sub(1, (string.find(v17, "\n")));
    end;
end;
v5.render = function(v19)
    local l_buttonPressed_0 = v19.state.buttonPressed;
    local l_screenWidth_0 = v19.props.screenWidth;
    local l_Size_0 = v19.props.Size;
    local l_Position_0 = v19.props.Position;
    local l_LayoutOrder_0 = v19.props.LayoutOrder;
    local l_item_0 = v19.props.item;
    local l_title_0 = l_item_0.title;
    local v27 = l_item_0.hasRead or v19.props.noticeReadStatus[l_item_0.noticeId];
    local v28 = (l_screenWidth_0 - 24) - 12;
    local l_content_0 = v19.props.item.content;
    local v30 = (not (l_content_0 ~= nil) or l_content_0 == "") and "" or l_content_0:sub(1, (string.find(l_content_0, "\n")));
    return l_withStyle_0(function(v31)
        local v32 = not not l_buttonPressed_0 and v31.Theme.BackgroundOnPress or v31.Theme.BackgroundDefault;
        local v33 = not not v27 and v31.Theme.TextDefault or v31.Theme.TextEmphasis;
        return v2.createElement("ImageButton", {
            Size = l_Size_0, 
            Position = l_Position_0, 
            AutoButtonColor = false, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundColor3 = v32.Color, 
            BackgroundTransparency = v32.Transparency, 
            BorderSizePixel = 0, 
            [v2.Event.InputBegan] = v19.onButtonInputBegan, 
            [v2.Event.InputEnded] = v19.onButtonInputEnded, 
            [v2.Event.Activated] = v19.onButtonActivated, 
            [v2.Ref] = v19.buttonRef
        }, {
            TitleText = v2.createElement("TextLabel", {
                Size = UDim2.new(0.5, 0, 0, 22), 
                Position = UDim2.fromOffset(24, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_title_0, 
                Font = v31.Font.Header2.Font, 
                TextSize = v31.Font.BaseSize * v31.Font.Header2.RelativeSize, 
                TextColor3 = v33.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextTransparency = v33.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            DescriptionText = v2.createElement("TextLabel", {
                Size = UDim2.fromOffset(v28, 22), 
                Position = UDim2.fromOffset(24, 36), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v30, 
                Font = v31.Font.CaptionBody.Font, 
                TextSize = v31.Font.BaseSize * v31.Font.CaptionBody.RelativeSize, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextColor3 = v33.Color, 
                TextTransparency = v33.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            DateLabel = v2.createElement("TextLabel", {
                AnchorPoint = Vector2.new(1, 0), 
                Size = UDim2.new(0, 100, 0, 22), 
                Position = UDim2.new(1, -12, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v19.props.dateText, 
                Font = v31.Font.CaptionBody.Font, 
                TextSize = v31.Font.BaseSize * v31.Font.CaptionBody.RelativeSize, 
                TextColor3 = v33.Color, 
                TextTransparency = v33.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
v5.willUnmount = function(v34)
    v34:eventDisconnect();
end;
return (v1.connect(function(v35)
    return {
        screenWidth = v35.ScreenSize.X, 
        noticeReadStatus = v35.Luobu.TencentNoticeReadStatus
    };
end)(v5));
