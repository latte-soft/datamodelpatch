local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v2 = require(l_script_FirstAncestor_0.Components.SquadLobby);
local v3 = require(l_script_FirstAncestor_0.Components.SquadInviteFriends);
local v4 = require(l_script_FirstAncestor_0.dependencies);
local v5 = require(l_script_FirstAncestor_0.EnumScreens);
local l_AppBlox_0 = v4.AppBlox;
local l_React_0 = v4.React;
local l_RoactNavigation_0 = v4.RoactNavigation;
local l_UIBlox_0 = v4.UIBlox;
local l_FullscreenPageWithSafeArea_0 = l_AppBlox_0.FullscreenPageWithSafeArea;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v12 = l_RoactNavigation_0.createRobloxStackNavigator({
    {
        [v5.SquadLobby] = v2
    }, 
    {
        [v5.SquadInviteFriends] = v3
    }
}, {
    defaultNavigationOptions = {
        absorbInput = true, 
        overlayEnabled = true, 
        renderUnderlyingPage = true
    }, 
    mode = l_RoactNavigation_0.StackPresentationStyle.Modal, 
    transitionConfig = function()
        if not l_UserGameSettings_0.ReducedMotion then
            return l_RoactNavigation_0.StackViewTransitionConfigs.SlideFromRight;
        else
            return l_RoactNavigation_0.StackViewTransitionConfigs.FadeInPlace;
        end;
    end
});
local v13 = l_React_0.PureComponent:extend("SquadMainStackNavigatorWrapped");
v13.render = function(v14)
    return l_withStyle_0(function(v15)
        return l_React_0.createElement(l_FullscreenPageWithSafeArea_0, {
            BackgroundTransparency = v15.Theme.BackgroundDefault.Transparency, 
            BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
            includeStatusBar = true
        }, {
            Navigator = l_React_0.createElement(v12, {
                navigation = v14.props.navigation
            })
        });
    end);
end;
v13.router = v12.router;
return v13;
