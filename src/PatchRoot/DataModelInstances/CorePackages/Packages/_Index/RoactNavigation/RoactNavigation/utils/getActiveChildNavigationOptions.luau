return function(v0, v1)
    local l_state_0 = v0.state;
    return v0.router.getScreenOptions(v0.getChildNavigation(l_state_0.routes[l_state_0.index].key), v1);
end;
