local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactNavigation);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_script_FirstAncestor_0.Components.Toast.ToastScreen);
local v6 = require(script.Parent.chatLandingWithDialogsNavigator);
local v7 = v2.Component:extend("ChatLandingWithDialogsNavigatorConnector");
v7.router = v6.router;
v7.render = function(v8)
    return v2.createElement(v6, v8.props);
end;
return v3.createRobloxStackNavigator({
    {
        ChatLandingWithDialogs = v7
    }, 
    {
        [v4.RoactChatToast] = {
            screen = v5, 
            navigationOptions = {
                overlayEnabled = true, 
                overlayTransparency = 1, 
                absorbInput = false, 
                renderUnderlyingPage = true
            }
        }
    }
}, {
    mode = v3.StackPresentationStyle.Overlay
});
