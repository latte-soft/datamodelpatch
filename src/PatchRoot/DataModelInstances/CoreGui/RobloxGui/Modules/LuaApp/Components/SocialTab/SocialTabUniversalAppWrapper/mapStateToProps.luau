local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.LuaApp.Components.SocialTab.SocialTab);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_getFFlagSoothsayerCheckForContactImporter_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagSoothsayerCheckForContactImporter;
return function(v5, _)
    local l_history_0 = v5.Navigation.history;
    local v8 = l_history_0[#l_history_0];
    return {
        chatLoaded = v5.ChatAppReducer.AppLoaded, 
        canGoBack = #v8 > 1, 
        retrievalStatus = v2.Requests.FetchChatSettings.getStatus(v5), 
        wideMode = v5.FormFactor == l_FormFactor_0.WIDE, 
        notificationCount = v5.NotificationBadgeCounts.TopBarNotificationIcon, 
        localUserId = v5.LocalUserId, 
        currentAppPage = v8[#v8] and v8[#v8].name, 
        isLocalUserSoothsayer = not not l_getFFlagSoothsayerCheckForContactImporter_0() and v5.IsLocalUserSoothsayer
    };
end;
