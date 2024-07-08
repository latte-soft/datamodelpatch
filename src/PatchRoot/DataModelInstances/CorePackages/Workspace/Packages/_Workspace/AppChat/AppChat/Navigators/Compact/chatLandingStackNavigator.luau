local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Components.ChatLanding.ChatLandingScreen);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversationScreen);
local v6 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsScreen);
local v7 = require(l_script_FirstAncestor_0.Components.CreateNewChat.CreateNewChatScreen);
local v8 = require(l_script_FirstAncestor_0.Components.EditChatMembers.EditChatMembersScreen);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
return (v2.createRobloxStackNavigator({
    {
        [v3.ChatLanding] = {
            screen = v4, 
            navigationOptions = if not not l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab() then {
                isRoot = true, 
                backButtonEnabled = false, 
                tabBarVisible = true
            } else {
                isRoot = true
            }
        }
    }, 
    {
        [v3.ChatConversation] = {
            screen = v5, 
            navigationOptions = if not require(l_script_FirstAncestor_0.Flags.getFFlagDisableAppChatConversationAbsorbInputLayerAndroid)() then {
                backButtonEnabled = true, 
                tabBarVisible = false, 
                lockIconEnabled = true
            } else {
                backButtonEnabled = true, 
                tabBarVisible = false, 
                lockIconEnabled = true, 
                absorbInput = false
            }
        }
    }, 
    {
        [v3.ChatDetails] = {
            screen = v6, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    }, 
    {
        [v3.CreateNewChat] = {
            screen = v7, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    }, 
    {
        [v3.EditChatMembers] = {
            screen = v8, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    }
}));
