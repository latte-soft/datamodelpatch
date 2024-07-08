local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local _ = require(l_Parent_0.TenFootUiCommon);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v3 = require(script.Parent.createTenFootUiStackNavigator);
local v4 = require(script.Parent.createTenFootUiSwitchNavigator);
return function(v5, v6)
    local v7 = table.clone(v5.switchRoutes);
    for _, v9 in v5.stackRoutes, nil, nil do
        for v10, v11 in v9, nil, nil do
            table.insert(v7, {
                [v10] = {
                    screen = v3(l_Array_0.concat(v11.screenStack, v5.commonStackRoutes), v11.navigatorConfig), 
                    navigationOptions = v11.navigationOptions
                }
            });
        end;
    end;
    return v4(v7, v6);
end;
