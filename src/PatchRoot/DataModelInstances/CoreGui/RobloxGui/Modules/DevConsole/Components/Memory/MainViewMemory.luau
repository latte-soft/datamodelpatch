local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.Memory.ClientMemory);
local v5 = require(l_Components_0.Memory.ServerMemory);
local v6 = require(l_Components_0.UtilAndTab);
local v7 = require(l_Components_0.DataConsumer);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v9 = require(l_Actions_0.ClientMemoryUpdateSearchFilter);
local v10 = require(l_Actions_0.ServerMemoryUpdateSearchFilter);
local v11 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v11.GeneralFormatting.MainRowPadding;
local v13 = v1.Component:extend("LogButton");
v13.init = function(v14)
    v14.onAction = function()
        local v15 = not not v14.props.isClientView and v14.props.ClientMemoryData or v14.props.ServerMemoryData;
        local v16 = "\n";
        local function _(v17)
            v16 = v16 .. v17 .. "\n";
        end;
        v16 = v16 .. "Name                                       Min   Max" .. "\n";
        v16 = v16 .. "----------------------------------------   ---   ---" .. "\n";
        local function v19(v20, v21, v22)
            v16 = v16 .. string.format("%s %s %s %3d   %3d", string.rep(" ", v22), v20, string.rep(" ", (40 - v22) - #v20), v21.min, v21.max) .. "\n";
            if v21.children then
                for v23, v24 in pairs(v21.children) do
                    v19(v23, v24, v22 + 2);
                end;
            end;
        end;
        v19("Memory", v15._memoryData.Memory, 0);
        print(v16);
    end;
end;
v13.render = function(v25)
    return v1.createElement("TextButton", {
        Text = "Log", 
        Visible = true, 
        BorderSizePixel = 1, 
        BackgroundColor3 = v11.Color.UnselectedGray, 
        TextColor3 = v11.Color.Text, 
        [v1.Event.Activated] = v25.onAction
    });
end;
v13 = v7(v13, "ClientMemoryData", "ServerMemoryData");
local v26 = v1.Component:extend("MainViewMemory");
v26.init = function(v27)
    v27.onUtilTabHeightChanged = function(v28)
        v27:setState({
            utilTabHeight = v28
        });
    end;
    v27.onClientButton = function()
        v27:setState({
            isClientView = true
        });
    end;
    v27.onServerButton = function()
        v27:setState({
            isClientView = false
        });
    end;
    v27.onSearchTermChanged = function(v29)
        if not v27.state.isClientView then
            v27.props.dispatchServerMemoryUpdateSearchFilter(v29, {});
            return ;
        else
            v27.props.dispatchClientMemoryUpdateSearchFilter(v29, {});
            return ;
        end;
    end;
    v27.utilRef = v1.createRef();
    v27.state = {
        utilTabHeight = 0, 
        isClientView = true
    };
end;
v26.didMount = function(v30)
    v30:setState({
        utilTabHeight = v30.utilRef.current.Size.Y.Offset
    });
end;
v26.didUpdate = function(v31)
    local l_Offset_0 = v31.utilRef.current.Size.Y.Offset;
    if l_Offset_0 ~= v31.state.utilTabHeight then
        v31:setState({
            utilTabHeight = l_Offset_0
        });
    end;
end;
v26.render = function(v33)
    local v34 = {};
    local l_size_0 = v33.props.size;
    local l_isDeveloperView_0 = v33.props.isDeveloperView;
    local l_formFactor_0 = v33.props.formFactor;
    local l_tabList_0 = v33.props.tabList;
    local l_utilTabHeight_0 = v33.state.utilTabHeight;
    local l_isClientView_0 = v33.state.isClientView;
    local v41 = not not l_isClientView_0 and v33.props.clientSearchTerm or v33.props.serverSearchTerm;
    v34.UIListLayout = v1.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_MainRowPadding_0)
    });
    v34.UtilAndTab = v1.createElement(v6, {
        windowWidth = l_size_0.X.Offset, 
        formFactor = l_formFactor_0, 
        tabList = l_tabList_0, 
        isClientView = l_isClientView_0, 
        searchTerm = v41, 
        layoutOrder = 1, 
        refForParent = v33.utilRef, 
        onHeightChanged = v33.onUtilTabHeightChanged, 
        onClientButton = l_isDeveloperView_0 and v33.onClientButton, 
        onServerButton = l_isDeveloperView_0 and v33.onServerButton, 
        onSearchTermChanged = v33.onSearchTermChanged
    }, {
        v13 and v1.createElement(v13, {
            isClientView = l_isClientView_0
        })
    });
    if l_utilTabHeight_0 > 0 then
        if not l_isClientView_0 then
            v34.ServerMemory = v1.createElement(v5, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                searchTerm = v41, 
                layoutOrder = 2
            });
        else
            v34.ClientMemory = v1.createElement(v4, {
                size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
                searchTerm = v41, 
                layoutOrder = 2
            });
        end;
    end;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v11.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, v34);
end;
return v2.UNSTABLE_connect2(function(v42, _)
    return {
        clientSearchTerm = v42.MemoryData.clientSearchTerm, 
        clientTypeFilters = v42.MemoryData.clientTypeFilters, 
        serverSearchTerm = v42.MemoryData.serverSearchTerm, 
        serverTypeFilters = v42.MemoryData.serverTypeFilters
    };
end, function(v44)
    return {
        dispatchClientMemoryUpdateSearchFilter = function(v45, v46)
            v44(v9(v45, v46));
        end, 
        dispatchServerMemoryUpdateSearchFilter = function(v47, v48)
            v44(v10(v47, v48));
        end
    };
end)(v26);
