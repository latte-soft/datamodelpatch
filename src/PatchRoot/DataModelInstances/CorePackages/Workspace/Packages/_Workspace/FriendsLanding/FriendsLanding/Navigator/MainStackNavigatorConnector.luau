local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(l_script_FirstAncestor_0.Navigator.MainStackNavigator);
local v3 = require(l_script_FirstAncestor_0.Components.FriendsLandingHeaderBar);
local v4 = l_Roact_0.PureComponent:extend("MainStackNavigatorConnector");
v4.render = function(v5)
    return l_Roact_0.createFragment({
        layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = l_Roact_0.createElement(v3, {
            navigation = v5.props.navigation
        }), 
        navigator = l_Roact_0.createElement(v2, {
            navigation = v5.props.navigation
        })
    });
end;
v4.router = v2.router;
return v4;
