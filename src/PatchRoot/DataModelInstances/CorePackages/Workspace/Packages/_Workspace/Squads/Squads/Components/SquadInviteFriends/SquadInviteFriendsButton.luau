local v0 = require(script:FindFirstAncestor("Squads").dependencies);
local l_Cryo_0 = v0.Cryo;
local l_dependencyArray_0 = v0.Hooks.dependencyArray;
local l_FriendsMenu_0 = v0.FriendsMenu;
local l_React_0 = v0.React;
local l_UIBlox_0 = v0.UIBlox;
local l_useLocalization_0 = v0.Hooks.useLocalization;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_InviteCallbackContext_0 = l_FriendsMenu_0.InviteCallbackContext;
local l_SelectedUsersContext_0 = l_FriendsMenu_0.SelectedUsersContext;
return function(v11)
    local l_conversationId_0 = v11.conversationId;
    local v13 = l_React_0.useContext(l_SelectedUsersContext_0);
    local v14 = l_React_0.useContext(l_InviteCallbackContext_0);
    return l_React_0.createElement(l_Button_0, {
        onActivated = l_React_0.useCallback(function()
            v14.inviteMultiFriends(l_Cryo_0.Dictionary.keys(v13.selectedFriends), l_conversationId_0);
        end, l_dependencyArray_0(l_conversationId_0, v14.inviteMultiFriends, v13.selectedFriends)), 
        buttonType = l_ButtonType_0.PrimarySystem, 
        size = UDim2.new(1, 0, 0, 36), 
        text = l_useLocalization_0({
            addFriendsText = "Feature.Chat.Label.AddFriends"
        }).addFriendsText
    });
end;
