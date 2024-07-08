local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(script.Parent.Parent.Components.DataConsumer);
local v5 = require(script.Parent.Parent.Actions.SetActiveTab);
local v6 = require(script.Parent.Parent.Constants);
local l_MsgTypeNamesOrdered_0 = v6.MsgTypeNamesOrdered;
local l_TopBar_0 = v6.DefaultFontSize.TopBar;
local l_Text_0 = v6.Color.Text;
local l_TopBar_1 = v6.Font.TopBar;
local v11 = UDim2.new(0, l_TopBar_0, 0, l_TopBar_0);
local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize("Client Mem:", l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize("Client Memory Usage:", l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
local l_l_TextService_0_TextSize_2 = l_TextService_0:GetTextSize("Avg. Ping:", l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
local v15 = v2.PureComponent:extend("LiveUpdateElement");
v15.didMount = function(v16)
    v16.totalMemConnector = v16.props.ClientMemoryData:totalMemSignal():Connect(function(v17)
        v16:setState({
            totalClientMemory = v17
        });
    end);
    v16.avgPingConnector = v16.props.ServerStatsData:avgPing():Connect(function(v18)
        v16:setState({
            averagePing = v18
        });
    end);
    v16.logWarningErrorConnector = v16.props.ClientLogData:errorWarningSignal():Connect(function(v19, v20)
        v16:setState({
            numErrors = v19, 
            numWarnings = v20
        });
    end);
    v16:doSizeCheck();
end;
v15.didUpdate = function(v21)
    v21:doSizeCheck();
end;
v15.doSizeCheck = function(v22)
    if v22.ref.current then
        local v23 = v22.ref.current.AbsoluteSize.X < v22.state.formFactorThreshold;
        if v23 ~= v22.state.isSmallerThanFormFactorThreshold then
            v22:setState({
                isSmallerThanFormFactorThreshold = v23
            });
        end;
    end;
end;
v15.willUnmount = function(v24)
    v24.totalMemConnector:Disconnect();
    v24.totalMemConnector = nil;
    v24.avgPingConnector:Disconnect();
    v24.avgPingConnector = nil;
    v24.logWarningErrorConnector:Disconnect();
    v24.logWarningErrorConnector = nil;
end;
v15.init = function(v25)
    local v26, v27 = v25.props.ClientLogData:getErrorWarningCount();
    v25.onLogWarningButton = function()
        local v28 = {};
        for _, v30 in pairs(l_MsgTypeNamesOrdered_0) do
            v28[v30] = false;
        end;
        v28.Warning = true;
        v25.props.ClientLogData:setFilters(v28);
        v25.props.dispatchChangeTabClientLog();
    end;
    v25.onLogErrorButton = function()
        local v31 = {};
        for _, v33 in pairs(l_MsgTypeNamesOrdered_0) do
            v31[v33] = false;
        end;
        v31.Error = true;
        v25.props.ClientLogData:setFilters(v31);
        v25.props.dispatchChangeTabClientLog();
    end;
    v25.ref = v2.createRef();
    v25.state = {
        numErrors = v26, 
        numWarnings = v27, 
        totalClientMemory = 0, 
        averagePing = 0, 
        formFactorThreshold = 380, 
        isSmallerThanFormFactorThreshold = false
    };
end;
v15.render = function(v34)
    local l_size_0 = v34.props.size;
    local l_position_0 = v34.props.position;
    local l_formFactor_0 = v34.props.formFactor;
    local l_numErrors_0 = v34.state.numErrors;
    local l_numWarnings_0 = v34.state.numWarnings;
    local l_totalClientMemory_0 = v34.state.totalClientMemory;
    local l_averagePing_0 = v34.state.averagePing;
    local l_isSmallerThanFormFactorThreshold_0 = v34.state.isSmallerThanFormFactorThreshold;
    local v43 = false;
    local l_X_0 = l_l_TextService_0_TextSize_1.X;
    local l_Center_0 = Enum.HorizontalAlignment.Center;
    if not (l_formFactor_0 ~= v6.FormFactor.Small and not l_isSmallerThanFormFactorThreshold_0) then
        l_position_0 = l_position_0 + UDim2.new(0, 12, 0, 0);
        l_X_0 = l_l_TextService_0_TextSize_0.X;
        v43 = true;
        l_Center_0 = Enum.HorizontalAlignment.Left;
    end;
    local v46 = string.format("%d", l_numErrors_0);
    local l_l_TextService_0_TextSize_3 = l_TextService_0:GetTextSize(v46, l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
    local v48 = string.format("%d", l_numWarnings_0);
    local l_l_TextService_0_TextSize_4 = l_TextService_0:GetTextSize(v48, l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
    local v50 = string.format("%d MB", l_totalClientMemory_0);
    local l_l_TextService_0_TextSize_5 = l_TextService_0:GetTextSize(v50, l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
    local v52 = string.format("%d ms", l_averagePing_0);
    local l_l_TextService_0_TextSize_6 = l_TextService_0:GetTextSize(v52, l_TopBar_0, l_TopBar_1, Vector2.new(0, 0));
    if not (l_formFactor_0 ~= v6.FormFactor.Small and not l_isSmallerThanFormFactorThreshold_0) then
        l_position_0 = l_position_0 + UDim2.new(0, 12, 0, 0);
        l_X_0 = l_l_TextService_0_TextSize_0.X;
        v43 = true;
        l_Center_0 = Enum.HorizontalAlignment.Left;
    end;
    local v54 = l_averagePing_0 > 0;
    return v2.createElement("Frame", {
        Position = l_position_0, 
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        [v2.Ref] = v34.ref
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 6), 
            HorizontalAlignment = l_Center_0, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        LogErrorIcon = v2.createElement("ImageButton", {
            Image = v6.Image.Error, 
            Size = v11, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v2.Event.Activated] = v34.onLogErrorButton
        }), 
        LogErrorCount = v2.createElement("TextButton", {
            Text = v46, 
            TextSize = l_TopBar_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_3.X, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v2.Event.Activated] = v34.onLogErrorButton
        }), 
        ErrorWarningPad = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        LogWarningIcon = v2.createElement("ImageButton", {
            Image = v6.Image.Warning, 
            Size = v11, 
            BackgroundTransparency = 1, 
            LayoutOrder = 4, 
            [v2.Event.Activated] = v34.onLogWarningButton
        }), 
        LogWarningCount = v2.createElement("TextButton", {
            Text = v48, 
            TextSize = l_TopBar_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_4.X, 1, 0), 
            BackgroundTransparency = 9, 
            LayoutOrder = 5, 
            [v2.Event.Activated] = v34.onLogWarningButton
        }), 
        WarningMemoryPad = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 6
        }), 
        MemoryUsage = v2.createElement("TextButton", {
            Text = not v43 and "Client Memory Usage:" or "Client Mem:", 
            TextSize = l_TopBar_0, 
            TextColor3 = v6.Color.WarningYellow, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_X_0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 7, 
            [v2.Event.Activated] = v34.props.dispatchChangeTabClientMemory
        }), 
        MemoryUsage_MB = v2.createElement("TextButton", {
            Text = v50, 
            TextSize = l_TopBar_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_5.X, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 8, 
            [v2.Event.Activated] = v34.props.dispatchChangeTabClientMemory
        }), 
        MemoryPingPad = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 9
        }), 
        AvgPing = (not v43 and v54) and v2.createElement("TextButton", {
            Text = "Avg. Ping:", 
            TextSize = l_TopBar_0, 
            TextColor3 = v6.Color.WarningYellow, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_2.X, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 10, 
            [v2.Event.Activated] = v34.props.dispatchChangeTabNetworkPing
        }), 
        AvgPing_ms = (not v43 and v54) and v2.createElement("TextButton", {
            Text = v52, 
            TextSize = l_TopBar_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_TopBar_1, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_6.X, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 11, 
            [v2.Event.Activated] = v34.props.dispatchChangeTabNetworkPing
        })
    });
end;
return v3.UNSTABLE_connect2(nil, function(v55)
    return {
        dispatchChangeTabClientLog = function()
            v55(v5("Log", true));
        end, 
        dispatchChangeTabClientMemory = function()
            v55(v5("Memory", true));
        end, 
        dispatchChangeTabNetworkPing = function()
            v55(v5("ServerStats", true));
        end
    };
end)(v4(v15, "ServerStatsData", "ClientMemoryData", "ClientLogData"));
