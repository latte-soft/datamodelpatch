local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(script.Parent.Parent.Constants);
local l_FrameHeight_0 = v5.TopBarFormatting.FrameHeight;
local v7 = 0.5 * l_FrameHeight_0;
local v8 = (l_FrameHeight_0 - v7) / 2;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize("Developer Console", v5.DefaultFontSize.TopBar, v5.Font.TopBar, Vector2.new(0, 0));
local v11 = require(script.Parent.Parent.Components.LiveUpdateElement);
local v12 = require(script.Parent.Parent.Actions.SetDevConsolePosition);
local v13 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagDevConsoleCloseButtonOverlapFix);
local v14 = v3.Component:extend("DevConsoleTopBar");
v14.init = function(v15)
    v15.inputChangedConnection = nil;
    v15.inputBegan = function(_, v17)
        if not v15.props.isMinimized then
            if v17.UserInputType == Enum.UserInputType.MouseButton1 then
                local l_AbsolutePosition_0 = v15.ref.current.AbsolutePosition;
                local v19 = Vector3.new(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y, 0);
                if v15.inputChangedConnection then
                    v15.inputChangedConnection:Disconnect();
                    v15.inputChangedConnection = nil;
                end;
                v15.inputChangedConnection = l_UserInputService_0.InputChanged:Connect(function(v20)
                    v15.inputChanged(nil, v20);
                end);
                v15:setState({
                    startPos = v19, 
                    startOffset = v17.Position, 
                    moving = true
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v15.inputChanged = function(_, v22)
        if not v15.state.moving then
            if v15.inputChangedConnection then
                v15.inputChangedConnection:Disconnect();
                v15.inputChangedConnection = nil;
            end;
        elseif v22.UserInputType == Enum.UserInputType.MouseMovement then
            local v23 = (v15.state.startPos - v15.state.startOffset) + v22.Position;
            v15.props.dispatchSetDevConsolePosition((UDim2.new(0, v23.X, 0, v23.Y)));
            return ;
        end;
    end;
    v15.inputEnded = function(_, v25)
        if v25.UserInputType == Enum.UserInputType.MouseButton1 and v25.UserInputState == Enum.UserInputState.End then
            if v15.inputChangedConnection then
                v15.inputChangedConnection:Disconnect();
                v15.inputChangedConnection = nil;
            end;
            v15:setState({
                moving = false
            });
        end;
    end;
    v15.ref = v3.createRef();
end;
v14.render = function(v26)
    local l_isMinimized_0 = v26.props.isMinimized;
    local l_formFactor_0 = v26.props.formFactor;
    local l_onMinimizeClicked_0 = v26.props.onMinimizeClicked;
    local l_onMaximizeClicked_0 = v26.props.onMaximizeClicked;
    local l_onCloseClicked_0 = v26.props.onCloseClicked;
    local _ = v26.state.moving;
    local v33 = {
        WindowTitle = v3.createElement("TextLabel", {
            Text = "Developer Console", 
            TextSize = v5.DefaultFontSize.TopBar, 
            TextColor3 = Color3.new(1, 1, 1), 
            Font = v5.Font.TopBar, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_FrameHeight_0), 
            Position = UDim2.new(0, 4, 0, 0), 
            BackgroundColor3 = v5.Color.BaseGray, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    };
    local v34 = l_l_TextService_0_TextSize_0.X + 8;
    local v35 = UDim2.new(0, v34, 0, 0);
    local v36 = UDim2.new(1, -2 * v34, 0, l_FrameHeight_0);
    if not l_isMinimized_0 then
        if v26.ref.current then
            v36 = UDim2.new(0, v26.ref.current.AbsoluteSize.X - 2 * l_l_TextService_0_TextSize_0.X, 0, l_FrameHeight_0);
        end;
    else
        v35 = UDim2.new(0, 0, 1, 0);
        v36 = UDim2.new(1, 0, 1, 0);
    end;
    v33.LiveStatsModule = v3.createElement(v11, {
        topBarLiveUpdate = v26.props.topBarLiveUpdate, 
        size = v36, 
        position = v35
    });
    if l_formFactor_0 == v5.FormFactor.Large then
        if l_isMinimized_0 then
            v33.MaxButton = v3.createElement("ImageButton", {
                Size = UDim2.new(0, v7, 0, v7), 
                Position = UDim2.new(1, -2 * l_FrameHeight_0 + v8, 0, v8), 
                BorderColor3 = Color3.new(0, 0, 1), 
                BackgroundColor3 = v5.Color.BaseGray, 
                BackgroundTransparency = 1, 
                Image = v5.Image.Maximize, 
                [v3.Event.Activated] = l_onMaximizeClicked_0
            });
        else
            v33.MinButton = v3.createElement("ImageButton", {
                Size = UDim2.new(0, v7, 0, v7), 
                Position = UDim2.new(1, -2 * l_FrameHeight_0 + v8, 0, v8), 
                BorderColor3 = Color3.new(1, 0, 0), 
                BackgroundColor3 = v5.Color.BaseGray, 
                BackgroundTransparency = 1, 
                Image = v5.Image.Minimize, 
                [v3.Event.Activated] = l_onMinimizeClicked_0
            });
        end;
    end;
    if not v13() then
        v33.CloseButton = v3.createElement("ImageButton", {
            Size = UDim2.new(0, v7, 0, v7), 
            Position = UDim2.new(1, -l_FrameHeight_0 + v8, 0, v8), 
            BorderColor3 = Color3.new(0, 1, 0), 
            BackgroundColor3 = v5.Color.BaseGray, 
            BackgroundTransparency = 1, 
            Image = v5.Image.Close, 
            [v3.Event.Activated] = l_onCloseClicked_0
        });
    else
        v33.CloseButton = v3.createElement("ImageButton", {
            Size = UDim2.new(0, v7, 0, v7), 
            Position = UDim2.new(1, -l_FrameHeight_0 + v8, 0, v8), 
            BorderColor3 = Color3.new(0, 1, 0), 
            BackgroundColor3 = v5.Color.BaseGray, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Image = v5.Image.Close, 
            [v3.Event.Activated] = l_onCloseClicked_0
        });
    end;
    return v3.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, l_FrameHeight_0), 
        BackgroundColor3 = v5.Color.Black, 
        BackgroundTransparency = 0.5, 
        AutoButtonColor = false, 
        LayoutOrder = 1, 
        [v3.Ref] = v26.ref, 
        [v3.Event.InputBegan] = v26.inputBegan, 
        [v3.Event.InputEnded] = v26.inputEnded
    }, v33);
end;
return v4.UNSTABLE_connect2(nil, function(v37)
    return {
        dispatchSetDevConsolePosition = function(v38)
            v37(v12(v38));
        end
    };
end)(v14);
