local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactNavigation);
local l_ChatDetails_0 = l_script_FirstAncestor_0.Components.ChatDetails;
local v5 = require(l_ChatDetails_0.Dialogs.GenericDialogType);
local v6 = require(l_ChatDetails_0.EditChatGroupNameDialog.EditChatGroupNameDialogScreen);
local v7 = require(l_ChatDetails_0.LeaveGroupDialog.LeaveGroupDialogScreen);
local v8 = require(l_ChatDetails_0.ParticipantDialog.ParticipantDialogScreen);
local v9 = require(l_ChatDetails_0.RemoveUserDialog.RemoveUserDialogScreen);
local v10 = require(l_ChatDetails_0.UnfilteredThreads.CreateUnfilteredChatDialogScreen);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v12 = require(script.Parent.chatLandingStackNavigator);
local v13 = v2.Component:extend("ChatLandingStackNavigatorConnector");
v13.router = v12.router;
v13.render = function(v14)
    return v2.createElement(v12, v14.props);
end;
local v15 = {
    {
        ChatLandingStack = v13
    }, 
    {
        [v5.EditChatGroupNameDialog] = {
            screen = v6, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v5.LeaveGroupDialog] = {
            screen = v7, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v5.ParticipantDialog] = {
            screen = v8, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }, 
    {
        [v5.RemoveUserDialog] = {
            screen = v9, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    }
};
if v11() then
    table.insert(v15, {
        [v5.CreateUnfilteredChatDialog] = {
            screen = v10, 
            navigationOptions = {
                backButtonEnabled = true, 
                overlayEnabled = true, 
                renderUnderlyingPage = true
            }
        }
    });
end;
return v3.createRobloxStackNavigator(v15, {
    mode = v3.StackPresentationStyle.Overlay
});
