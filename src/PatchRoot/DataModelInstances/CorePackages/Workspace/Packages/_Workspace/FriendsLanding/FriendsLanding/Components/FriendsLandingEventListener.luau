local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local v3 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v4 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v5 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local v8 = l_Roact_0.PureComponent:extend("FriendsLandingEventListener");
v8.defaultProps = {
    navigation = nil, 
    navigationEvents = l_RoactNavigation_0.NavigationEvents, 
    debug_skipDidMount = false
};
v8.init = function(v9)
    v9.refreshPageOnceCheck = false;
    v9.refreshPage = function()
        if not v9.refreshPageOnceCheck then
            v9.refreshPageOnceCheck = true;
            v9.props.setFilterKeys(v5.All);
            v9.props.analytics:pageLoaded();
            v9.props.refreshPage({
                errorMessage = v9.props.pageError, 
                onResolve = function(v10)
                    local v11 = (not not v10 and v10[1]) and v10[1].responseBody or {};
                    v9.props.analytics:pageLoadedWithArgs("friendsLanding", {
                        friendsCount = #(not not v11 and v11.data or {})
                    });
                end
            });
            return ;
        else
            return ;
        end;
    end;
    v9.onDidBlur = function()
        v9.refreshPageOnceCheck = false;
        v9.props.setFilterKeys(v5.All);
    end;
end;
v8.render = function(v12)
    return l_Roact_0.createElement(v12.props.navigationEvents, {
        onDidFocus = v12.refreshPage, 
        onDidBlur = v12.onDidBlur
    });
end;
v8.didMount = function(v13)
    if not v13.props.debug_skipDidMount then
        v13.refreshPage();
        return ;
    else
        return ;
    end;
end;
v8.willUnmount = function(v14)
    v14.refreshPageOnceCheck = false;
end;
return l_compose_0(v3.connect(function(v15)
    return {
        filter = v15.filter, 
        setFilterKeys = v15.setFilterKeys, 
        refreshPage = v15.refreshPage
    };
end), v4.connect(function(v16)
    return {
        analytics = v16
    };
end))(v8);
