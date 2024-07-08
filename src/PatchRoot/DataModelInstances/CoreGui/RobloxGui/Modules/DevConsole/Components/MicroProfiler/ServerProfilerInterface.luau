local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v2 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local _ = script.Parent.Parent.Parent.Components;
local v6 = require(script.Parent.Parent.Parent.Actions.SetRCCProfilerState);
local v7 = require(script.Parent.Parent.Parent.Constants);
local _ = v7.GeneralFormatting.MainRowPadding;
local l_ButtonWidth_0 = v7.MicroProfilerFormatting.ButtonWidth;
local l_ButtonTextSize_0 = v7.MicroProfilerFormatting.ButtonTextSize;
local l_MainWindow_0 = v7.Font.MainWindow;
local l_MainWindowHeader_0 = v7.Font.MainWindowHeader;
local l_UnselectedGray_0 = v7.Color.UnselectedGray;
local l_SelectedBlue_0 = v7.Color.SelectedBlue;
local l_UnselectedGray_1 = v7.Color.UnselectedGray;
local v16 = v3.Component:extend("ServerProfilerInteraface");
v16.init = function(v17)
    v17.onUtilTabHeightChanged = function(v18)
        v17:setState({
            utilTabHeight = v18
        });
    end;
    v17.onFocusLostFrameRate = function(v19, _, _)
        l_GameSettings_0.RCCProfilerRecordFrameRate = v19.Text;
        v19.Text = l_GameSettings_0.RCCProfilerRecordFrameRate;
    end;
    v17.onFocusLostTimeFrame = function(v22, _, _)
        l_GameSettings_0.RCCProfilerRecordTimeFrame = v22.Text;
        v22.Text = l_GameSettings_0.RCCProfilerRecordTimeFrame;
    end;
    v17.requestRCCProfilerData = function(_)
        local v26 = v2();
        if v26 then
            v26:RequestRCCProfilerData(l_GameSettings_0.RCCProfilerRecordFrameRate, l_GameSettings_0.RCCProfilerRecordTimeFrame);
            v17.props.dispatchSetRCCProfilerState(true);
        end;
    end;
    v17.changeProfilerState = function(v27)
        return function()
            l_GameSettings_0.OnScreenProfilerEnabled = v27;
            v17:setState({
                clientProfilerEnabled = v27
            });
        end;
    end;
    v17.state = {
        frameRate = l_GameSettings_0.RCCProfilerRecordFrameRate, 
        timeFrame = l_GameSettings_0.RCCProfilerRecordTimeFrame
    };
end;
v16.render = function(v28)
    local _ = v28.props.size;
    local _ = v28.props.formFactor;
    local _ = v28.props.tabList;
    local l_waitingForRecording_0 = v28.props.waitingForRecording;
    local l_lastFileOutputLocation_0 = v28.props.lastFileOutputLocation;
    local _ = v28.state.utilTabHeight;
    local l_frameRate_0 = v28.state.frameRate;
    local l_timeFrame_0 = v28.state.timeFrame;
    local _ = v28.state.clientProfilerEnabled;
    local v38 = not l_waitingForRecording_0 and #l_lastFileOutputLocation_0 > 0;
    local v39 = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30);
    local _ = UDim2.new(0.6, l_ButtonWidth_0, 0, 0);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 135), 
        BackgroundTransparency = 1, 
        LayoutOrder = 4
    }, {
        Label = v3.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = "ServerProfiler", 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v7.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 1
        }), 
        HorizontalLine = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 30)
        }), 
        LabelFPS = v3.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 37.5), 
            Text = "Frames Per Second", 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v7.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 1
        }), 
        FPSTextBox = v3.createElement("TextBox", {
            Size = v39, 
            Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 37.5), 
            Text = l_frameRate_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v7.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 0, 
            [v3.Event.FocusLost] = v28.onFocusLostFrameRate
        }), 
        LabelTimeFrame = v3.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 67.5), 
            Text = "Seconds to Record", 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v7.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1
        }), 
        TimeFrameTextBox = v3.createElement("TextBox", {
            Size = v39, 
            Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 67.5), 
            Text = l_timeFrame_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v7.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 0, 
            [v3.Event.FocusLost] = v28.onFocusLostTimeFrame
        }, {
            GetDumpButton = v3.createElement("TextButton", {
                Size = UDim2.new(0, l_ButtonWidth_0 * 0.7, 0, 30), 
                Position = UDim2.new(1, -l_ButtonWidth_0 * 0.7, 1, 30), 
                Text = not l_waitingForRecording_0 and "Start Recording" or "Recording", 
                Font = l_MainWindow_0, 
                TextSize = l_ButtonTextSize_0, 
                TextColor3 = v7.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundColor3 = not not l_waitingForRecording_0 and l_UnselectedGray_0 or l_SelectedBlue_0, 
                BackgroundTransparency = not l_waitingForRecording_0 and 0 or 0.3, 
                AutoButtonColor = not l_waitingForRecording_0, 
                Active = not l_waitingForRecording_0, 
                [v3.Event.Activated] = v28.requestRCCProfilerData
            })
        }), 
        OutputPath = v38 and v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 0, 97.5), 
            Text = l_lastFileOutputLocation_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v7.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v4.UNSTABLE_connect2(function(v41, _)
    return {
        waitingForRecording = v41.MicroProfiler.waitingForRecording, 
        lastFileOutputLocation = v41.MicroProfiler.lastFileOutputLocation
    };
end, function(v43)
    return {
        dispatchSetRCCProfilerState = function(v44, v45)
            v43(v6(v44, v45));
        end
    };
end)(v16);
