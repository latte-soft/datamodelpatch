local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v3.Roact;
local l_RoactNavigation_0 = v3.RoactNavigation;
local v6 = require(l_script_FirstAncestor_0.Components.FriendsLandingScreen);
local v7 = require(l_script_FirstAncestor_0.Components.AddFriends.AddFriendsScreen);
local v8 = require(l_script_FirstAncestor_0.Components.FriendsLandingScreen.NavigationOptions);
local v9 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v10 = require(l_script_FirstAncestor_0.EnumScreens);
local v11 = require(l_script_FirstAncestor_0.Navigator.PlayerSearchWrapper);
local v12 = require(l_script_FirstAncestor_0.Components.HeaderBarCenterView);
local v13 = require(l_script_FirstAncestor_0.Components.HeaderBarRightView);
local v14 = require(l_script_FirstAncestor_0.Navigator.GatewayComponent);
local l_FFlagEnableFriendsLandingControllerBar_0 = require(l_Parent_0.SharedFlags).FFlagEnableFriendsLandingControllerBar;
return (l_RoactNavigation_0.createRobloxStackNavigator({
    {
        [v10.Gateway] = {
            screen = v14, 
            navigationOptions = {
                headerText = {}
            }
        }
    }, 
    {
        [v10.FriendsLanding] = {
            screen = v6, 
            navigationOptions = v8
        }
    }, 
    {
        [v10.AddFriends] = {
            screen = v7, 
            navigationOptions = function(v16)
                return {
                    headerText = {
                        raw = "Feature.Chat.Label.AddFriends"
                    }, 
                    renderCenter = function()
                        return l_Roact_0.createElement(v12, v16);
                    end, 
                    renderRight = function()
                        return v9.with(function(v17)
                            if not v17.addFriendsPageSearchbarEnabled then
                                return l_Roact_0.createElement(v13, v16);
                            else
                                return false;
                            end;
                        end);
                    end, 
                    useSecondaryHeader = true, 
                    tabBarVisible = false, 
                    transparent = true, 
                    absorbInputSelectable = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else false
                };
            end
        }
    }, 
    {
        [v10.SearchFriends] = {
            screen = function(v18)
                return l_Roact_0.createElement(v11, {
                    navigation = v18.navigation
                });
            end, 
            navigationOptions = function(v19)
                return {
                    headerText = {
                        raw = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople"
                    }, 
                    tabBarVisible = false, 
                    renderCenter = function()
                        return l_Roact_0.createElement(v12, v19);
                    end, 
                    renderRight = function()
                        return l_Roact_0.createElement(v13, v19);
                    end, 
                    useSecondaryHeader = true
                };
            end
        }
    }
}, {
    transitionConfig = function()
        if not l_UserGameSettings_0.ReducedMotion then
            return l_RoactNavigation_0.StackViewTransitionConfigs.SlideFromRight;
        else
            return l_RoactNavigation_0.StackViewTransitionConfigs.FadeInPlace;
        end;
    end
}));
