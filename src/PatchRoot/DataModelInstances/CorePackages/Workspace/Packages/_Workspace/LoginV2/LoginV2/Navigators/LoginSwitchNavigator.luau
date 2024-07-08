local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local _ = require(l_Parent_0.Navigation);
local v6 = require(l_script_FirstAncestor_0.Components.AuthenticationScreen);
local v7 = require(l_script_FirstAncestor_0.Components.LoginScreenV2);
return (v3.createRobloxSwitchNavigator({
    {
        [v4.LoginScreenV2] = {
            screen = function(v8)
                return v2.createElement(v7, v8);
            end, 
            navigationOptions = {
                title = v4.LoginScreenV2
            }
        }
    }, 
    {
        [v4.AuthenticationScreen] = {
            screen = function(v9)
                return v2.createElement(v6, v9);
            end, 
            navigationOptions = {
                title = v4.AuthenticationScreen
            }
        }
    }
}, {
    initialRouteName = v4.LoginScreenV2, 
    keepVisitedScreensMounted = false, 
    backBehavior = v3.BackBehavior.InitialRoute
}));
