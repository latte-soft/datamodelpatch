local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local _ = require(l_Parent_0.TenFootUiCommon);
local v5 = require(l_ReactNavigationExtend_0.Views.Cards.TenFootUiSwitchViewCard_new);
local v6 = require(l_ReactNavigationExtend_0.Hooks.useSwitchScreenKeys);
local _ = require(l_Parent_0.Navigation);
local l_FFlagUnifyNavigationGraph_0 = require(l_Parent_0.SharedFlags).FFlagUnifyNavigationGraph;
local function v13(v9)
    local v10, v11 = v3.useState({
        current = v9, 
        previous = v9
    });
    v3.useEffect(function()
        v11(function(v12)
            if v9 ~= v12.current then
                return {
                    current = v9, 
                    previous = v12.current
                };
            else
                return v12;
            end;
        end);
    end, {
        v9
    });
    return v10.current, v10.previous;
end;
return function(v14)
    local l_descriptors_0 = v14.descriptors;
    local l_navigation_0 = v14.navigation;
    local l_state_0 = l_navigation_0.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local v19, v20 = v13(if not l_FFlagUnifyNavigationGraph_0 then l_descriptors_0[l_key_0].options.tabIndex or 1 else l_state_0.index);
    local v21 = v6({
        activeKey = l_key_0, 
        descriptors = l_descriptors_0, 
        keepVisitedScreensMounted = v14.navigationConfig.keepVisitedScreensMounted
    });
    local v22 = {};
    for _, v24 in v21, nil, nil do
        v22[v24] = v3.createElement(v5, {
            descriptor = l_descriptors_0[v24], 
            screenProps = v14.screenProps, 
            navigation = l_navigation_0, 
            isActiveTab = v24 == l_key_0, 
            currentTabIndex = v19, 
            previousTabIndex = v20
        });
    end;
    return v22;
end;
