local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
return (require(l_script_FirstAncestor_0.Parent.RoactNavigation).createRobloxSwitchNavigator({
    {
        [require(l_script_FirstAncestor_0.EnumScreens).EmptyConversation] = {
            screen = require(l_script_FirstAncestor_0.Components.ChatConversation.EmptyConversationScreen), 
            navigationOptions = {
                headerText = {
                    raw = "testing", 
                    shouldLocalize = false
                }, 
                backButtonEnabled = false, 
                isRoot = true
            }
        }
    }, 
    {
        ConversationStackNavigator = require(script.Parent.ConversationStackNavigatorConnector)
    }
}));
