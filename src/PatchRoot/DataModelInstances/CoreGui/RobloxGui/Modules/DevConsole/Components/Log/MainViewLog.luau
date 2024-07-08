local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.Log.ClientLog);
local v5 = require(l_Components_0.Log.ServerLog);
local v6 = require(l_Components_0.UtilAndTab);
local v7 = require(l_Components_0.DataConsumer);
local v8 = require(script.Parent.Parent.Parent.Actions.SetActiveTab);
local v9 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v9.GeneralFormatting.MainRowPadding;
local l_MsgTypeNamesOrdered_0 = v9.MsgTypeNamesOrdered;
local v12 = v1.PureComponent:extend("MainViewLog");
v12.init = function(v13)
    v13.onUtilTabHeightChanged = function(v14)
        v13:setState({
            utilTabHeight = v14
        });
    end;
    v13.onClientButton = function()
        v13.props.dispatchSetActiveTab("Log", true);
    end;
    v13.onServerButton = function()
        v13.props.dispatchSetActiveTab("Log", false);
    end;
    v13.onCheckBoxChanged = function(v15, v16)
        if not v13.props.isClientView then
            v13.props.ServerLogData:setFilter(v15, v16);
            return ;
        else
            v13.props.ClientLogData:setFilter(v15, v16);
            return ;
        end;
    end;
    v13.filterUpdated = function()
        if not v13.forceUpdate then
            v13:setState({});
            return ;
        else
            v13:forceUpdate();
            return ;
        end;
    end;
    v13.onSearchTermChanged = function(v17)
        if not v13.props.isClientView then
            v13.props.ServerLogData:setSearchTerm(v17);
            return ;
        else
            v13.props.ClientLogData:setSearchTerm(v17);
            return ;
        end;
    end;
    v13.clientFilterConnection = v13.props.ClientLogData:filterUpdatedSignal():Connect(v13.filterUpdated);
    v13.serverFilterConnection = v13.props.ServerLogData:filterUpdatedSignal():Connect(v13.filterUpdated);
    v13.utilRef = v1.createRef();
    v13.state = {
        utilTabHeight = 0
    };
end;
v12.didMount = function(v18)
    v18:setState({
        utilTabHeight = v18.utilRef.current.Size.Y.Offset
    });
end;
v12.didUpdate = function(v19)
    local l_Size_0 = v19.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v19.state.utilTabHeight then
        v19:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v12.willUnmount = function(v21)
    if v21.clientFilterConnection then
        v21.clientFilterConnection:Disconnect();
        v21.clientFilterConnection = nil;
    end;
    if v21.serverFilterConnection then
        v21.serverFilterConnection:Disconnect();
        v21.serverFilterConnection = nil;
    end;
end;
v12.render = function(v22)
    local l_size_0 = v22.props.size;
    local l_formFactor_0 = v22.props.formFactor;
    local l_isDeveloperView_0 = v22.props.isDeveloperView;
    local l_tabList_0 = v22.props.tabList;
    local l_isClientView_0 = v22.props.isClientView;
    local l_utilTabHeight_0 = v22.state.utilTabHeight;
    local v29 = nil;
    v29 = if not l_isClientView_0 then v22.props.ServerLogData:getSearchTerm() else v22.props.ClientLogData:getSearchTerm();
    local v30 = {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_MainRowPadding_0)
        })
    };
    local v31 = nil;
    v31 = if not l_isClientView_0 then v22.props.ServerLogData:getFilters() else v22.props.ClientLogData:getFilters();
    local v32 = {};
    for v33, v34 in ipairs(l_MsgTypeNamesOrdered_0) do
        v32[v33] = {
            name = v34, 
            state = v31[v34]
        };
    end;
    v30.UtilAndTab = v1.createElement(v6, {
        windowWidth = l_size_0.X.Offset, 
        formFactor = l_formFactor_0, 
        tabList = l_tabList_0, 
        orderedCheckBoxState = v32, 
        isClientView = l_isClientView_0, 
        searchTerm = v29, 
        layoutOrder = 1, 
        refForParent = v22.utilRef, 
        onClientButton = l_isDeveloperView_0 and v22.onClientButton, 
        onServerButton = l_isDeveloperView_0 and v22.onServerButton, 
        onCheckBoxChanged = v22.onCheckBoxChanged, 
        onSearchTermChanged = v22.onSearchTermChanged
    });
    if l_utilTabHeight_0 > 0 then
        if not l_isClientView_0 then
            v30.ServerLog = v1.createElement(v5, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                layoutOrder = 2
            });
        else
            v30.ClientLog = v1.createElement(v4, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                layoutOrder = 2
            });
        end;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v9.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, v30);
end;
return v2.UNSTABLE_connect2(function(v35, _)
    return {
        isClientView = v35.MainView.isClientView
    };
end, function(v37)
    return {
        dispatchSetActiveTab = function(v38, v39)
            v37(v8(v38, v39));
        end
    };
end)(v7(v12, "ClientLogData", "ServerLogData"));
