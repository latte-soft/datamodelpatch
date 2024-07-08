local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("LogService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_GameSettings_0 = UserSettings().GameSettings;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(script.Parent.Parent.Parent.Components.UtilAndTab);
local v6 = require(script.Parent.ServerProfilerInterface);
local v7 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v7.GeneralFormatting.MainRowPadding;
local l_ButtonWidth_0 = v7.MicroProfilerFormatting.ButtonWidth;
local l_ButtonTextSize_0 = v7.MicroProfilerFormatting.ButtonTextSize;
local _ = v7.Font.MainWindow;
local l_MainWindowHeader_0 = v7.Font.MainWindowHeader;
local l_UnselectedGray_0 = v7.Color.UnselectedGray;
local l_SelectedBlue_0 = v7.Color.SelectedBlue;
local l_UnselectedGray_1 = v7.Color.UnselectedGray;
local v16 = v4.Component:extend("MainViewProfiler");
v16.init = function(v17)
    v17.onUtilTabHeightChanged = function(v18)
        v17:setState({
            utilTabHeight = v18
        });
    end;
    v17.changeProfilerState = function(v19)
        return function()
            l_GameSettings_0.OnScreenProfilerEnabled = v19;
            v17:setState({
                clientProfilerEnabled = v19
            });
            l_RbxAnalyticsService_0:ReportCounter("MicroprofilerDevConsolePressed");
        end;
    end;
    v17.microProfilerChangedConnection = l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
        v17:setState({
            clientProfilerEnabled = l_GameSettings_0.OnScreenProfilerEnabled
        });
    end);
    v17.utilRef = v4.createRef();
    v17.state = {
        utilTabHeight = 0
    };
end;
v16.didMount = function(v20)
    v20:setState({
        utilTabHeight = v20.utilRef.current.Size.Y.Offset
    });
end;
v16.willUnmount = function(v21)
    if v21.microProfilerChangedConnection then
        v21.microProfilerChangedConnection:Disconnect();
        v21.microProfilerChangedConnection = nil;
    end;
end;
v16.didUpdate = function(v22)
    local l_Size_0 = v22.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v22.state.utilTabHeight then
        v22:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v16.render = function(v24)
    local l_size_0 = v24.props.size;
    local l_formFactor_0 = v24.props.formFactor;
    local l_tabList_0 = v24.props.tabList;
    local l_utilTabHeight_0 = v24.state.utilTabHeight;
    local _ = v24.state.frameRate;
    local _ = v24.state.timeFrame;
    local _ = v24.state.waitingForData;
    local l_clientProfilerEnabled_0 = v24.state.clientProfilerEnabled;
    local _ = v24.state.outputPath;
    local _ = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30);
    local _ = UDim2.new(0.6, l_ButtonWidth_0, 0, 0);
    return v4.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v7.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v4.createElement(v5, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            layoutOrder = 1, 
            refForParent = v24.utilRef, 
            onHeightChanged = v24.onUtilTabHeightChanged
        }), 
        MainFrame = v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            CanvasSize = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                Padding = UDim.new(0, l_MainRowPadding_0 * 2), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            MicroProfilerRow = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 90), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Label = v4.createElement("TextLabel", {
                    Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
                    Position = UDim2.new(0.1, 0, 0, 0), 
                    Text = "MicroProfiler", 
                    Font = l_MainWindowHeader_0, 
                    TextSize = l_ButtonTextSize_0, 
                    TextColor3 = v7.Color.Text, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundColor3 = l_UnselectedGray_1, 
                    BackgroundTransparency = 1
                }), 
                HorizontalLine = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 0, 30)
                }), 
                ToggleButton = v4.createElement("TextLabel", {
                    Size = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30), 
                    Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 37.5), 
                    BackgroundTransparency = 1
                }, {
                    OffButton = v4.createElement("TextButton", {
                        Size = UDim2.new(0.5, 0, 1, 0), 
                        Text = "Off", 
                        Font = l_MainWindowHeader_0, 
                        TextSize = l_ButtonTextSize_0, 
                        TextColor3 = v7.Color.Text, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        BackgroundColor3 = not not l_clientProfilerEnabled_0 and l_UnselectedGray_0 or l_SelectedBlue_0, 
                        [v4.Event.Activated] = v24.changeProfilerState(false)
                    }), 
                    ClientButton = v4.createElement("TextButton", {
                        Size = UDim2.new(0.5, 0, 1, 0), 
                        Position = UDim2.new(0.5, 0, 0, 0), 
                        Text = "Client", 
                        Font = l_MainWindowHeader_0, 
                        TextSize = l_ButtonTextSize_0, 
                        TextColor3 = v7.Color.Text, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        BackgroundColor3 = not not l_clientProfilerEnabled_0 and l_SelectedBlue_0 or l_UnselectedGray_0, 
                        [v4.Event.Activated] = v24.changeProfilerState(true)
                    })
                })
            }), 
            HorizontalLine = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_MainRowPadding_0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }), 
            ServerProfiler = v4.createElement(v6, {
                Size = UDim2.new(1, 0, 0, 135), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4
            })
        })
    });
end;
return v16;
