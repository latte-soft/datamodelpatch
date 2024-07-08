local _ = require(script.Parent.NavigationTypes);
return function(v1, v2)
    local l_state_0 = v1.state;
    local l_router_0 = v1.router;
    local l_getChildNavigation_0 = v1.getChildNavigation;
    local l_routes_0 = l_state_0.routes;
    local _ = nil;
    local v8 = nil;
    local v9 = nil;
    while l_routes_0 do
        v8 = l_getChildNavigation_0(l_routes_0[l_state_0.index].key);
        v9 = l_router_0.getScreenOptions(v8, v2);
        if v8 then
            l_getChildNavigation_0 = v8.getChildNavigation;
            l_state_0 = v8.state;
            l_routes_0 = l_state_0.routes;
            l_router_0 = v8.router;
        else
            break;
        end;
    end;
    return v9;
end;
