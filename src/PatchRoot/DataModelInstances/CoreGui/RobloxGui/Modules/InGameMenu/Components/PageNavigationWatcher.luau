local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_t_0 = v0.t;
local v4 = l_Roact_0.PureComponent:extend("PageNavigationWatcher");
v4.validateProps = l_t_0.strictInterface({
    desiredPage = l_t_0.string, 
    onNavigateTo = l_t_0.optional(l_t_0.callback), 
    onNavigateAway = l_t_0.optional(l_t_0.callback), 
    currentPage = l_t_0.string, 
    menuOpen = l_t_0.boolean
});
v4.init = function(v5, v6)
    v5:setState({
        lastPage = v6.currentPage, 
        lastMenuOpen = v6.menuOpen
    });
end;
v4.render = function(v7)
    return l_Roact_0.createFragment(v7.props[l_Roact_0.Children]);
end;
v4.didUpdate = function(v8)
    local l_lastPage_0 = v8.state.lastPage;
    local l_lastMenuOpen_0 = v8.state.lastMenuOpen;
    local l_currentPage_0 = v8.props.currentPage;
    local l_menuOpen_0 = v8.props.menuOpen;
    if not (l_lastPage_0 == l_currentPage_0) or l_lastMenuOpen_0 ~= l_menuOpen_0 then
        v8:setState({
            lastPage = l_currentPage_0, 
            lastMenuOpen = l_menuOpen_0
        });
        if not (not (l_currentPage_0 == v8.props.desiredPage) or not l_menuOpen_0) and v8.props.onNavigateTo ~= nil then
            v8.props.onNavigateTo();
            return ;
        elseif not (not (l_lastPage_0 == v8.props.desiredPage) or not l_lastMenuOpen_0) and v8.props.onNavigateAway ~= nil then
            v8.props.onNavigateAway();
            return ;
        elseif not (not l_lastMenuOpen_0 or l_menuOpen_0) and v8.props.onNavigateAway ~= nil then
            v8.props.onNavigateAway();
        end;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v13)
    return {
        currentPage = v13.menuPage, 
        menuOpen = v13.isMenuOpen
    };
end)(v4);
