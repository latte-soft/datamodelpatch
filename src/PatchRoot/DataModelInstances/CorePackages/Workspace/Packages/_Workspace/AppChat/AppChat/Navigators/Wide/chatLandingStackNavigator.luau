local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Components.ChatLanding.ChatLandingScreenWithSwitchNavigator);
local v5 = require(l_script_FirstAncestor_0.Components.CreateNewChat.CreateNewChatScreen);
local v6 = require(l_script_FirstAncestor_0.Components.EditChatMembers.EditChatMembersScreen);
local v7 = require(script:FindFirstAncestor("Navigators").createOverlayTopBarStackNavigator);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local function _(v9, v10)
    return v7({
        {
            [v9] = v10
        }
    });
end;
local v12 = {
    backButtonEnabled = true, 
    tabBarVisible = true, 
    overlayEnabled = true, 
    overlayTransparency = 0.5, 
    absorbInput = true, 
    renderUnderlyingPage = false
};
return v2.createRobloxStackNavigator({
    {
        [v3.ChatLanding] = {
            screen = v4, 
            navigationOptions = if not not l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then {
                backButtonEnabled = false, 
                tabBarVisible = true
            } else {}
        }
    }, 
    {
        CreateNewChatScreenWrapper = {
            screen = v7({
                {
                    [v3.CreateNewChat] = v5
                }
            }), 
            navigationOptions = v12
        }
    }, 
    {
        EditChatMembersScreenWrapper = {
            screen = v7({
                {
                    [v3.EditChatMembers] = v6
                }
            }), 
            navigationOptions = v12
        }
    }
}, {
    mode = v2.StackPresentationStyle.Overlay
});
