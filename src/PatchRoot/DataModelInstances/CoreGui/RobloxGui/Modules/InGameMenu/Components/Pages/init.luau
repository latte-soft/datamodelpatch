local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_Images_0 = require(l_CorePackages_0.InGameMenuDependencies).UIBlox.App.ImageSet.Images;
local v3 = require(l_Parent_0.Resources.Constants);
local v4 = {
    {
        key = v3.InitalPageKey, 
        navigationDepth = 1, 
        component = script.InitalPage, 
        parentPage = nil
    }, 
    {
        key = v3.MainPagePageKey, 
        navigationDepth = 1, 
        component = script.Parent.MainPage, 
        parentPage = nil
    }, 
    {
        key = "Players", 
        title = "CoreScripts.InGameMenu.PageTitle.Players", 
        icon = l_Images_0["icons/controls/players"], 
        component = script.PlayersPage, 
        navigationDepth = 2, 
        parentPage = v3.MainPagePageKey
    }, 
    {
        key = "InviteFriends", 
        title = "CoreScripts.InGameMenu.PageTitle.InviteFriends", 
        icon = l_Images_0["icons/actions/friends/friendInvite"], 
        component = script.Parent.InviteFriendsPage, 
        navigationDepth = 2, 
        parentPage = v3.MainPagePageKey
    }, 
    {
        key = "GameSettings", 
        title = "CoreScripts.InGameMenu.PageTitle.GameSettings", 
        icon = l_Images_0["icons/common/settings"], 
        component = script.Parent.GameSettingsPage.BasicPage, 
        navigationDepth = 2, 
        parentPage = v3.MainPagePageKey
    }, 
    {
        key = "Report", 
        title = "CoreScripts.InGameMenu.PageTitle.Report", 
        icon = l_Images_0["icons/actions/feedback"], 
        component = script.Parent.ReportPage, 
        navigationDepth = 2, 
        parentPage = v3.MainPagePageKey
    }, 
    {
        key = "Controls", 
        title = "CoreScripts.InGameMenu.PageTitle.Controls", 
        icon = l_Images_0["icons/controls/controls"], 
        component = script.Parent.ControlsPage, 
        isModal = true, 
        navigationDepth = 2, 
        parentPage = v3.MainPagePageKey
    }, 
    {
        key = "AdvancedGameSettings", 
        title = "CoreScripts.InGameMenu.PageTitle.GameSettings", 
        icon = l_Images_0["icons/menu/settings_large"], 
        component = script.Parent.GameSettingsPage.AdvancedPage, 
        isSecondaryPage = true, 
        navigationDepth = 3, 
        parentPage = "GameSettings"
    }, 
    {
        key = "VRGameSettings", 
        title = "CoreScripts.InGameMenu.PageTitle.VRComfortSettings", 
        icon = l_Images_0["icons/menu/settings_large"], 
        component = script.Parent.GameSettingsPage.VRComfortSettingsPage, 
        isSecondaryPage = true, 
        navigationDepth = 3, 
        parentPage = "GameSettings"
    }, 
    {
        key = v3.LeaveToAppPromptPageKey, 
        navigationDepth = 1, 
        component = script.Dialog.LeaveToAppPrompt, 
        parentPage = nil
    }, 
    {
        key = v3.LeaveGamePromptPageKey, 
        navigationDepth = 1, 
        component = script.Dialog.LeaveGamePrompt, 
        parentPage = nil
    }
};
local v5 = {};
for v6, v7 in ipairs(v4) do
    v7.index = v6;
    assert(v5[v7.key] == nil, ("page key %s is duplicated"):format(v7.key));
    v5[v7.key] = v7;
end;
return {
    pagesByIndex = v4, 
    pagesByKey = v5
};
