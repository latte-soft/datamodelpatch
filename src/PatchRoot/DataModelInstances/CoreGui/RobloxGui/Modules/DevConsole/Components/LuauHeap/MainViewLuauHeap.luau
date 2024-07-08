local l_CorePackages_0 = game:GetService("CorePackages");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local _ = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v6 = require(l_Components_0.DataConsumer);
local v7 = require(l_Components_0.UtilAndTab);
local v8 = require(l_Components_0.BoxButton);
local v9 = require(script.Parent.LuauHeapView);
local _ = require(script.Parent.LuauHeapTypes);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v12 = require(l_Actions_0.SetLuauHeapState);
local v13 = require(l_Actions_0.SetLuauHeapProfileTarget);
local v14 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v14.GeneralFormatting.MainRowPadding;
local v16 = v3.PureComponent:extend("MainViewLuauHeap");
local v17 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
v16.getState = function(v18, v19)
    if not v19 then
        return v18.props.server;
    else
        return v18.props.client;
    end;
end;
v16.getActiveState = function(v20)
    return v20.props.isClientView, v20:getState(v20.props.isClientView);
end;
v16.init = function(v21)
    v21.onUtilTabHeightChanged = function(v22)
        v21:setState({
            utilTabHeight = v22
        });
    end;
    v21.onClientButton = function()
        v21.props.dispatchSetLuauHeapProfileTarget(true);
    end;
    v21.onServerButton = function()
        v21.props.dispatchSetLuauHeapProfileTarget(false);
    end;
    v21.onCreateSnapshot = function()
        local v23, v24 = v21:getActiveState();
        if not v23 then
            local v25 = v17();
            if v25 then
                v25:RequestServerLuauHeapData();
            end;
            return ;
        else
            local l_l_ScriptContext_0_LuauHeapMemoryReport_0 = l_ScriptContext_0:GetLuauHeapMemoryReport("game");
            l_l_ScriptContext_0_LuauHeapMemoryReport_0.Refs = l_ScriptContext_0:GetLuauHeapInstanceReferenceReport("game");
            local v27 = table.clone(v24);
            table.insert(v27.snapshots, l_l_ScriptContext_0_LuauHeapMemoryReport_0);
            v27.active = #v27.snapshots;
            v21.props.dispatchSetLuauHeapState(true, v27);
            return ;
        end;
    end;
    v21.onClearSnapshots = function()
        local v28, v29 = v21:getActiveState();
        local v30 = table.clone(v29);
        table.clear(v30.snapshots);
        v30.active = 0;
        v21.props.dispatchSetLuauHeapState(v28, v30);
    end;
    v21.utilRef = v3.createRef();
    v21.state = {
        utilTabHeight = 0
    };
end;
v16.didMount = function(v31)
    v31:setState({
        utilTabHeight = v31.utilRef.current.Size.Y.Offset
    });
    v31.statsConnector = v31.props.LuauHeapData:Signal():Connect(function(v32)
        local v33 = v31:getState(false);
        local l_Report_0 = v32.Report;
        l_Report_0.Refs = v32.Refs;
        local v35 = table.clone(v33);
        table.insert(v35.snapshots, l_Report_0);
        v35.active = #v35.snapshots;
        v31.props.dispatchSetLuauHeapState(false, v35);
    end);
end;
v16.willUnmount = function(v36)
    v36.statsConnector:Disconnect();
    v36.statsConnector = nil;
end;
v16.didUpdate = function(v37)
    local l_Size_0 = v37.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v37.state.utilTabHeight then
        v37:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v16.render = function(v39)
    local l_size_0 = v39.props.size;
    local l_formFactor_0 = v39.props.formFactor;
    local l_tabList_0 = v39.props.tabList;
    local l_utilTabHeight_0 = v39.state.utilTabHeight;
    local v44, v45 = v39:getActiveState();
    return v3.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v14.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v3.createElement(v7, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            layoutOrder = 1, 
            isClientView = v44, 
            onClientButton = v39.onClientButton, 
            onServerButton = v39.onServerButton, 
            refForParent = v39.utilRef, 
            onHeightChanged = v39.onUtilTabHeightChanged
        }, {
            v3.createElement(v8, {
                text = "Create Snaphot", 
                onClicked = v39.onCreateSnapshot
            }), 
            v3.createElement(v8, {
                text = "Clear Snapshots", 
                onClicked = v39.onClearSnapshots
            })
        }), 
        LuauHeapView = v3.createElement(v9, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            layoutOrder = 2, 
            data = v45.snapshots, 
            activeSnapshot = v45.active, 
            compareSnapshot = v45.compare
        })
    });
end;
return v4.UNSTABLE_connect2(function(v46, _)
    return {
        isClientView = v46.LuauHeap.isClientView, 
        client = v46.LuauHeap.client, 
        server = v46.LuauHeap.server
    };
end, function(v48)
    return {
        dispatchSetLuauHeapState = function(v49, v50)
            v48(v12(v49, v50));
        end, 
        dispatchSetLuauHeapProfileTarget = function(v51)
            v48(v13(v51));
        end
    };
end)(v6(v16, "LuauHeapData"));
