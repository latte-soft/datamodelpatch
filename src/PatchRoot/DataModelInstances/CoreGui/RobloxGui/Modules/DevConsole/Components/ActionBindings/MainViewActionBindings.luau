local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.ActionBindings.ActionBindingsChart);
local v5 = require(l_Components_0.UtilAndTab);
local v6 = require(script.Parent.Parent.Parent.Actions.ActionBindingsUpdateSearchFilter);
local v7 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v7.GeneralFormatting.MainRowPadding;
local v9 = v1.Component:extend("MainViewActionBindings");
v9.init = function(v10)
    v10.onUtilTabHeightChanged = function(v11)
        v10:setState({
            utilTabHeight = v11
        });
    end;
    v10.onSearchTermChanged = function(v12)
        v10.props.dispatchActionBindingsUpdateSearchFilter(v12, {});
    end;
    v10.utilRef = v1.createRef();
    v10.state = {
        utilTabHeight = 0
    };
end;
v9.didMount = function(v13)
    v13:setState({
        utilTabHeight = v13.utilRef.current.Size.Y.Offset
    });
end;
v9.didUpdate = function(v14)
    local l_Size_0 = v14.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v14.state.utilTabHeight then
        v14:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v9.render = function(v16)
    local l_size_0 = v16.props.size;
    local l_formFactor_0 = v16.props.formFactor;
    local l_tabList_0 = v16.props.tabList;
    local l_bindingsSearchTerm_0 = v16.props.bindingsSearchTerm;
    local l_utilTabHeight_0 = v16.state.utilTabHeight;
    local l_createElement_0 = v1.createElement;
    local v23 = "Frame";
    local v24 = {
        Size = l_size_0, 
        BackgroundColor3 = v7.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    };
    local v25 = {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v1.createElement(v5, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            searchTerm = l_bindingsSearchTerm_0, 
            layoutOrder = 1, 
            refForParent = v16.utilRef, 
            onHeightChanged = v16.onUtilTabHeightChanged, 
            onSearchTermChanged = v16.onSearchTermChanged
        })
    };
    local v26 = false;
    if l_utilTabHeight_0 > 0 then
        v26 = v1.createElement(v4, {
            size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            searchTerm = l_bindingsSearchTerm_0, 
            layoutOrder = 2
        });
    end;
    v25.ActionBindings = v26;
    return l_createElement_0(v23, v24, v25);
end;
return v2.UNSTABLE_connect2(function(v27, _)
    return {
        bindingsSearchTerm = v27.ActionBindingsData.bindingsSearchTerm
    };
end, function(v29)
    return {
        dispatchActionBindingsUpdateSearchFilter = function(v30, v31)
            v29(v6(v30, v31));
        end
    };
end)(v9);
