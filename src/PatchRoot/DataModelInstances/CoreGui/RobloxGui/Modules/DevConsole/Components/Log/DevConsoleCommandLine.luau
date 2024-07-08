local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LogService_0 = game:GetService("LogService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(script.Parent.Parent.DataConsumer);
local v5 = require(script.Parent.Parent.ScrollingTextBox);
local v6 = require(script.Parent.Parent.Parent.Constants);
local l_CommandLineIndent_0 = v6.LogFormatting.CommandLineIndent;
local l_CommandLine_0 = v6.DefaultFontSize.CommandLine;
local l_Log_0 = v6.Font.Log;
local v10 = v3.PureComponent:extend("DevConsoleCommandLine");
v10.init = function(v11)
    v11.onFocusLost = function(v12, v13, _)
        if v13 then
            l_LogService_0:ExecuteScript(v12.Text);
            v12:CaptureFocus();
        end;
    end;
    v11.textbox = v3.createRef();
end;
v10.didMount = function(v15)
    if not v15.onFocusConnection then
        v15.onFocusConnection = l_UserInputService_0.InputBegan:Connect(function(v16)
            if not (not v15.textbox.current or not v15.textbox.current:IsFocused()) then
                local l_current_0 = v15.textbox.current;
                local l_ServerLogData_0 = v15.props.ServerLogData;
                local v19 = l_ServerLogData_0:getCommandLineHistory();
                local v20 = l_ServerLogData_0:getCommandLineIndex();
                if v16.KeyCode == Enum.KeyCode.Up then
                    local v21 = math.min(v19:getSize(), v20 + 1);
                    v20 = v21;
                    l_current_0.Text = v19:reverseAt(v21) or "";
                elseif v16.KeyCode == Enum.KeyCode.Down then
                    local v22 = math.max(0, v20 - 1);
                    v20 = v22;
                    l_current_0.Text = v19:reverseAt(v22) or "";
                elseif v16.KeyCode == Enum.KeyCode.Return then
                    if #l_current_0.Text:gsub("%s+", "") > 0 and v19:reverseAt(1) ~= l_current_0.Text then
                        v19:push_back(l_current_0.Text);
                    end;
                    v20 = 0;
                elseif v20 ~= 0 then
                    v20 = 0;
                end;
                l_ServerLogData_0:setCommandLineIndex(v20);
            end;
        end);
    end;
    if not v15.fixUnwantedReturnCapture then
        v15.fixUnwantedReturnCapture = l_UserInputService_0.InputEnded:Connect(function(v23)
            if not (not v15.textbox.current or not v15.textbox.current:IsFocused()) and v23.KeyCode == Enum.KeyCode.Return then
                v15.textbox.current.Text = "";
            end;
        end);
    end;
end;
v10.willUnmount = function(v24)
    if v24.onFocusConnection then
        v24.onFocusConnection:Disconnect();
        v24.onFocusConnection = nil;
    end;
    if v24.fixUnwantedReturnCapture then
        v24.fixUnwantedReturnCapture:Disconnect();
        v24.fixUnwantedReturnCapture = nil;
    end;
end;
v10.render = function(v25)
    local l_height_0 = v25.props.height;
    local l_pos_0 = v25.props.pos;
    local v28 = "";
    local v29 = v25.props.ServerLogData:getCommandLineIndex();
    if v29 ~= 0 then
        v28 = v25.props.ServerLogData:getCommandLineHistory():reverseAt(v29) or "";
    end;
    return v3.createElement("Frame", {
        Position = l_pos_0, 
        Size = UDim2.new(1, 0, 0, l_height_0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v6.Color.TextBoxGray, 
        BorderColor3 = v6.Color.BorderGray, 
        BorderSizePixel = 1
    }, {
        Arrow = v3.createElement("TextLabel", {
            Size = UDim2.new(0, l_CommandLineIndent_0, 1, 0), 
            BackgroundTransparency = 1, 
            TextSize = l_CommandLine_0, 
            Font = l_Log_0, 
            Text = "> ", 
            TextColor3 = v6.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Right
        }), 
        InputField = v3.createElement(v5, {
            Position = UDim2.new(0, l_CommandLineIndent_0, 0, 0), 
            Size = UDim2.new(1, -l_CommandLineIndent_0, 0, l_height_0), 
            ShowNativeInput = true, 
            ClearTextOnFocus = false, 
            TextColor3 = v6.Color.Text, 
            TextXAlignment = 0, 
            TextSize = l_CommandLine_0, 
            Text = v28, 
            Font = l_Log_0, 
            PlaceholderText = "command line", 
            [v3.Ref] = v25.textbox, 
            TextBoxFocusLost = v25.onFocusLost
        })
    });
end;
return v4(v10, "ServerLogData");
