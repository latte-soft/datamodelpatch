local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.Scripts.ServerScripts);
local v5 = require(l_Components_0.UtilAndTab);
local v6 = require(script.Parent.Parent.Parent.Actions.ServerScriptsUpdateSearchFilter);
local v7 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v7.GeneralFormatting.MainRowPadding;
local v9 = {
    "Active", 
    "Inactive"
};
local v10 = v1.PureComponent:extend("MainViewScripts");
v10.init = function(v11)
    v11.onUtilTabHeightChanged = function(v12)
        v11:setState({
            utilTabHeight = v12
        });
    end;
    v11.onCheckBoxChanged = function(v13, v14)
        v11.props.dispatchServerScriptsUpdateSearchFilter(nil, {
            [v13] = v14
        });
    end;
    v11.onSearchTermChanged = function(v15)
        v11.props.dispatchServerScriptsUpdateSearchFilter(v15, {});
    end;
    v11.utilRef = v1.createRef();
    v11.state = {
        utilTabHeight = 0, 
        isClientView = true
    };
end;
v10.didMount = function(v16)
    v16:setState({
        utilTabHeight = v16.utilRef.current.Size.Y.Offset
    });
end;
v10.didUpdate = function(v17)
    local l_Size_0 = v17.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v17.state.utilTabHeight then
        v17:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v10.render = function(v19)
    local l_size_0 = v19.props.size;
    local l_formFactor_0 = v19.props.formFactor;
    local l_tabList_0 = v19.props.tabList;
    local l_serverTypeFilters_0 = v19.props.serverTypeFilters;
    local l_utilTabHeight_0 = v19.state.utilTabHeight;
    local l_serverSearchTerm_0 = v19.props.serverSearchTerm;
    local v26 = {};
    for v27, v28 in ipairs(v9) do
        local v29 = l_serverTypeFilters_0[v28];
        if v29 == nil then
            v29 = true;
        end;
        v26[v27] = {
            name = v28, 
            state = v29
        };
    end;
    local l_createElement_0 = v1.createElement;
    local v31 = "Frame";
    local v32 = {
        Size = l_size_0, 
        BackgroundColor3 = v7.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    };
    local v33 = {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v1.createElement(v5, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            orderedCheckBoxState = v26, 
            searchTerm = l_serverSearchTerm_0, 
            layoutOrder = 1, 
            refForParent = v19.utilRef, 
            onHeightChanged = v19.onUtilTabHeightChanged, 
            onCheckBoxChanged = v19.onCheckBoxChanged, 
            onSearchTermChanged = v19.onSearchTermChanged
        })
    };
    local v34 = false;
    if l_utilTabHeight_0 > 0 then
        v34 = v1.createElement(v4, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            searchTerm = l_serverSearchTerm_0, 
            scriptFilters = l_serverTypeFilters_0, 
            layoutOrder = 2
        });
    end;
    v33.ServerScripts = v34;
    return l_createElement_0(v31, v32, v33);
end;
return v2.UNSTABLE_connect2(function(v35, _)
    return {
        serverSearchTerm = v35.ScriptsData.serverSearchTerm, 
        serverTypeFilters = v35.ScriptsData.serverTypeFilters
    };
end, function(v37)
    return {
        dispatchServerScriptsUpdateSearchFilter = function(v38, v39)
            v37(v6(v38, v39));
        end
    };
end)(v10);
