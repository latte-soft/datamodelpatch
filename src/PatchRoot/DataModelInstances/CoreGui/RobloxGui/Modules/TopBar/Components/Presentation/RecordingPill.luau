local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("VRService");
local _ = game:GetService("GamepadService");
local _ = game:GetService("GuiService");
local _ = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v9.Core.Style.withStyle;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v9.App.ImageSet.Images;
local _ = require(l_CorePackages_0.Workspace.Packages.VideoProtocol);
local v14 = settings():WaitForChild("Game Options");
local v15 = v6.PureComponent:extend("MenuIcon");
v15.validateProps = v8.strictInterface({
    layoutOrder = v8.integer
});
local v16 = UDim2.fromOffset(77, 28);
local v17 = UDim2.fromOffset(27, 14);
v15.init = function(v18)
    v18.state = {
        recording = false, 
        recordingText = "0:00"
    };
    v18.recordingConnection = v14:GetPropertyChangedSignal("VideoRecording"):Connect(function()
        v18:setState({
            recording = v14.VideoRecording
        });
    end);
    v18.RecordingPillActivated = function()
        l_CoreGui_0:ToggleRecording();
    end;
end;
v15.render = function(v19)
    return l_withStyle_0(function(v20)
        return v6.createFragment({
            Button = v6.createElement("Frame", {
                Visible = v19.state.recording, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v19.props.layoutOrder, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1)
            }, {
                ActualButton = v6.createElement("TextButton", {
                    Text = "", 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v20.Theme.Alert.Color, 
                    BorderSizePixel = 0, 
                    Size = v16, 
                    Position = UDim2.new(0, 0, 1, -30), 
                    [v6.Event.Activated] = v19.RecordingPillActivated
                }, {
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 18)
                    }), 
                    Layout = v6.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Image = v6.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/controls/screenrecord"], 
                        Size = UDim2.new(0, 28, 0, 28), 
                        Position = UDim2.new(0.4, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.4, 0.5)
                    }), 
                    TextLabel = v6.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Size = v17, 
                        Text = v19.state.recordingText, 
                        LayoutOrder = 2, 
                        TextColor3 = v20.Theme.TextEmphasis.Color, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                })
            })
        });
    end);
end;
v15.didUpdate = function(v21, _, _)
    if not v21.state.recording then
        v21.startRecording = false;
    elseif not v21.startRecording then
        v21.startRecording = true;
        local v24 = tick();
        local function v25()
            if v21.state.recording then
                delay(0.2, v25);
            end;
            local v26 = os.date("*t", tick() - v24);
            v21:setState({
                recordingText = ("%d:%02d"):format(v26.min, v26.sec)
            });
        end;
        delay(0.2, v25);
        return ;
    end;
end;
v15.willUnmount = function(v27)
    if v27.recordingConnection then
        v27.recordingConnection:Disconnect();
        v27.recordingConnection = nil;
    end;
end;
return v15;
