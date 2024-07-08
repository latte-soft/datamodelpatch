local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Parent.Constants);
local l_HeaderFrameHeight_0 = v1.NetworkFormatting.HeaderFrameHeight;
local l_EntryFrameHeight_0 = v1.NetworkFormatting.EntryFrameHeight;
local l_SummaryButtonHeight_0 = v1.NetworkFormatting.SummaryButtonHeight;
local l_MinFrameWidth_0 = v1.NetworkFormatting.MinFrameWidth;
local l_MainWindow_0 = v1.DefaultFontSize.MainWindow;
local l_MainWindowHeader_0 = v1.Font.MainWindowHeader;
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v9 = require(l_Components_0.BannerButton);
local v10 = require(l_Components_0.Network.NetworkSummary);
local v11 = require(l_Components_0.Network.NetworkChart);
local v12 = v0.Component:extend("NetworkView");
v12.init = function(v13, v14)
    assert(v14.targetNetworkData, "Make sure the NetworkData is assigned for this NetworkView");
    local v15 = v14.targetNetworkData:getCurrentData();
    v13.onSortChanged = function(v16)
        if v16 == v14.targetNetworkData:getSortType() then
            v13:setState({
                reverseSort = not v13.state.reverseSort
            });
            return ;
        else
            v14.targetNetworkData:setSortType(v16);
            v13:setState({
                reverseSort = false
            });
            return ;
        end;
    end;
    v13.onSummaryButton = function(_, _)
        v13:setState({
            summaryExpanded = not v13.state.summaryExpanded
        });
    end;
    v13.onDetailButton = function(_, _)
        v13:setState({
            entriesExpanded = not v13.state.entriesExpanded
        });
    end;
    v13.ref = v0.createRef();
    v13.state = {
        httpSummaryTable = v15.summaryTable, 
        httpSummaryCount = v15.summaryCount, 
        httpEntryList = v15.entryList, 
        summaryExpanded = true, 
        entriesExpanded = true, 
        indexOfEntryExpanded = 0, 
        reverseSort = false, 
        absWidth = 0
    };
end;
v12.didUpdate = function(v21)
    if v21.ref.current and v21.state.absWidth ~= v21.ref.current.AbsoluteSize.X then
        v21:setState({
            absWidth = v21.ref.current.AbsoluteSize.X
        });
    end;
end;
v12.didMount = function(v22)
    v22.httpEntryAddedConnector = v22.props.targetNetworkData:Signal():Connect(function(v23, v24, v25)
        v22:setState({
            httpSummaryTable = v23, 
            httpSummaryCount = v24, 
            httpEntryList = v25
        });
    end);
    if v22.ref.current then
        v22:setState({
            absWidth = v22.ref.current.AbsoluteSize.X
        });
    end;
end;
v12.willUnmount = function(v26)
    v26.httpEntryAddedConnector:Disconnect();
    v26.httpEntryAddedConnector = nil;
end;
v12.render = function(v27)
    local l_layoutOrder_0 = v27.props.layoutOrder;
    local l_searchTerm_0 = v27.props.searchTerm;
    local l_size_0 = v27.props.size;
    local l_summaryExpanded_0 = v27.state.summaryExpanded;
    local l_entriesExpanded_0 = v27.state.entriesExpanded;
    local l_reverseSort_0 = v27.state.reverseSort;
    local l_httpSummaryTable_0 = v27.state.httpSummaryTable;
    local l_httpEntryList_0 = v27.state.httpEntryList;
    local l_httpSummaryCount_0 = v27.state.httpSummaryCount;
    local v37 = math.max(l_MinFrameWidth_0, v27.state.absWidth);
    local v38 = l_SummaryButtonHeight_0 * 2;
    if l_summaryExpanded_0 then
        v38 = (v38 + l_httpSummaryCount_0 * l_EntryFrameHeight_0) + l_HeaderFrameHeight_0;
    end;
    local _ = nil;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        LayoutOrder = l_layoutOrder_0, 
        [v0.Ref] = v27.ref
    }, {
        UIListLayout = v0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        SummaryButton = v0.createElement(v9, {
            size = UDim2.new(1, 0, 0, l_SummaryButtonHeight_0), 
            pos = UDim2.new(), 
            isExpanded = l_summaryExpanded_0, 
            onButtonPress = v27.onSummaryButton, 
            layoutOrder = 1
        }, {
            Text = v0.createElement("TextLabel", {
                Text = "Summary", 
                TextColor3 = v1.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = l_MainWindow_0, 
                Font = l_MainWindowHeader_0, 
                Size = UDim2.new(1, -30, 0, l_SummaryButtonHeight_0), 
                Position = UDim2.new(0, 30, 0, 0), 
                BackgroundTransparency = 1
            })
        }), 
        Summary = l_summaryExpanded_0 and v0.createElement(v10, {
            width = v37, 
            httpSummaryTable = l_httpSummaryTable_0, 
            layoutOrder = 2
        }), 
        DetailsButton = v0.createElement(v9, {
            size = UDim2.new(1, 0, 0, l_SummaryButtonHeight_0), 
            pos = UDim2.new(), 
            isExpanded = l_entriesExpanded_0, 
            onButtonPress = v27.onDetailButton, 
            layoutOrder = 3
        }, {
            Text = v0.createElement("TextLabel", {
                Text = "Details", 
                TextColor3 = v1.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = l_MainWindow_0, 
                Font = l_MainWindowHeader_0, 
                Size = UDim2.new(1, -30, 0, l_SummaryButtonHeight_0), 
                Position = UDim2.new(0, 30, 0, 0), 
                BackgroundTransparency = 1
            })
        }), 
        Entries = l_entriesExpanded_0 and v0.createElement(v11, {
            httpEntryList = l_httpEntryList_0, 
            chartHeight = math.max(0, if not v27.ref.current then l_size_0.Y.Offset - v38 else v27.ref.current.AbsoluteSize.Y - v38), 
            width = v37, 
            searchTerm = l_searchTerm_0, 
            reverseSort = l_reverseSort_0, 
            layoutOrder = 4, 
            onSortChanged = v27.onSortChanged
        })
    });
end;
return v12;
