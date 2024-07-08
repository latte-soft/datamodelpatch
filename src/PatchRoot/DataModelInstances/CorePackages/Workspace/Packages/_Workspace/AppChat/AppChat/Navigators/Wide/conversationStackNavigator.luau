local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversationScreen);
local v6 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsScreen);
return function(v7)
    return v2.createRobloxStackNavigator({
        {
            [v4.ChatConversation] = {
                screen = v5, 
                navigationOptions = v3.Dictionary.join({
                    backButtonEnabled = false, 
                    isRoot = true, 
                    lockIconEnabled = true
                }, v7 or {})
            }
        }, 
        {
            [v4.ChatDetails] = {
                screen = v6, 
                navigationOptions = v3.Dictionary.join({
                    backButtonEnabled = true
                }, v7 or {})
            }
        }
    });
end;
