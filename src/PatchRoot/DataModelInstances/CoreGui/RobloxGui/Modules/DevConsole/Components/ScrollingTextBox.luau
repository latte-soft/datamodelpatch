local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = v4.Component:extend("ScrollingTextBox");
v5.init = function(v6, v7)
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize("A", v7.TextSize, v7.Font, Vector2.new(0, 0));
    v6.adjustOffset = function()
        if not (not v6.clipBox.current or not v6.textboxRef.current) then
            local l_fontDims_0 = v6.state.fontDims;
            local v10 = v6.textboxRef.current.CursorPosition - 1;
            local v11 = v10 - math.ceil(v6.state.innerXOffset / l_fontDims_0.X);
            local v12 = math.floor((v6.clipBox.current.AbsoluteSize.X * 0.9) / l_fontDims_0.X);
            if v12 < v11 then
                v6:setState({
                    innerXOffset = (v10 - v12) * l_fontDims_0.X
                });
                return ;
            elseif v11 < 0 then
                v6:setState({
                    innerXOffset = v10 * l_fontDims_0.X
                });
            end;
        end;
    end;
    v6.clipBox = v4.createRef();
    v6.textboxRef = v6.props.forwardRef or v4.createRef();
    v6.state = {
        fontDims = l_l_TextService_0_TextSize_0, 
        innerXOffset = 0
    };
end;
v5.didMount = function(v13)
    if not v13.onFocusConnection then
        v13.onFocusConnection = l_UserInputService_0.InputBegan:Connect(function(v14)
            if not (not v13.textboxRef.current or not v13.textboxRef.current:IsFocused()) then
                if v14.KeyCode == Enum.KeyCode.Home then
                    v13.textboxRef.current.CursorPosition = 0;
                    return ;
                elseif v14.KeyCode == Enum.KeyCode.End then
                    v13.textboxRef.current.CursorPosition = #v13.textboxRef.current.text + 1;
                    return ;
                else
                    v13.adjustOffset();
                end;
            end;
        end);
    end;
end;
v5.willUnmount = function(v15)
    if v15.onFocusConnection then
        v15.onFocusConnection:Disconnect();
        v15.onFocusConnection = nil;
    end;
end;
v5.render = function(v16)
    local l_Position_0 = v16.props.Position;
    local l_Size_0 = v16.props.Size;
    local l_PlaceholderText_0 = v16.props.PlaceholderText;
    local l_TextColor3_0 = v16.props.TextColor3;
    local l_TextSize_0 = v16.props.TextSize;
    local l_Font_0 = v16.props.Font;
    local l_Text_0 = v16.props.Text;
    local l_ClearTextOnFocus_0 = v16.props.ClearTextOnFocus;
    local l_ShowNativeInput_0 = v16.props.ShowNativeInput;
    local l_TextBoxFocusLost_0 = v16.props.TextBoxFocusLost;
    local l_innerXOffset_0 = v16.state.innerXOffset;
    return v4.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        [v4.Ref] = v16.clipBox
    }, {
        TextBox = v4.createElement("TextBox", {
            Position = UDim2.new(0, -l_innerXOffset_0, 0, 0), 
            Size = UDim2.new(1, l_innerXOffset_0, 1, 0), 
            BackgroundTransparency = 1, 
            ShowNativeInput = l_ShowNativeInput_0, 
            ClearTextOnFocus = l_ClearTextOnFocus_0, 
            TextColor3 = l_TextColor3_0, 
            TextXAlignment = 0, 
            TextSize = l_TextSize_0, 
            Text = l_Text_0, 
            Font = l_Font_0, 
            PlaceholderText = l_PlaceholderText_0, 
            [v4.Ref] = v16.textboxRef, 
            [v4.Change.CursorPosition] = v16.adjustOffset, 
            [v4.Event.FocusLost] = l_TextBoxFocusLost_0
        })
    });
end;
return v4.forwardRef(function(v28, v29)
    return v4.createElement(v5, v3.Dictionary.join(v28, {
        forwardRef = v29
    }));
end);
