local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_tutils_0 = v1.tutils;
local l_CINavigator_0 = v1.CINavigator;
local v5 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v6 = l_Roact_0.PureComponent:extend("CINavigatorInFL");
v6.init = function(v7)
    v7.context = {};
end;
v6.render = function(v8)
    return v5.with(function(v9)
        if not l_tutils_0.deepEqual(v9, v8.context) then
            v8.context = v9;
        end;
        return l_Roact_0.createElement(l_CINavigator_0, {
            navigation = v8.props.navigation, 
            context = v8.context
        });
    end);
end;
v6.router = l_CINavigator_0.router;
return v6;
