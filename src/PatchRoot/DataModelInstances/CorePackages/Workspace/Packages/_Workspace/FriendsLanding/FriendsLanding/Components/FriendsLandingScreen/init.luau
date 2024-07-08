local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v4 = require(l_script_FirstAncestor_0.Components.FriendsLandingContainer);
local v5 = l_Roact_0.PureComponent:extend("FriendsLandingScreen");
v5.defaultProps = {
    friends = {}
};
v5.render = function(v6)
    return v3.with(function(v7)
        return l_Roact_0.createElement(v4, {
            navigation = v6.props.navigation, 
            filterText = v7.getScreenTopBar(v2.FriendsLanding).filterText, 
            setScreenTopBar = v7.setScreenTopBar
        });
    end);
end;
return v5;
