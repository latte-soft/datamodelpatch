local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local l_ReducerDependencies_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies;
local l_PlaceInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.PlaceInfoRodux).Reducers.PlaceInfosReducer;
local l_UserReducer_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Reducers.UserReducer;
local l_Friends_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Reducers.Friends;
local l_FriendCount_0 = require(l_CorePackages_0.Workspace.Packages.LegacyFriendsRodux).Reducers.FriendCount;
local v8 = require(l_ShareGame_0.Reducers.ConversationsSearch);
local v9 = require(l_ShareGame_0.Reducers.DeviceInfo);
local v10 = require(l_ShareGame_0.Reducers.Invites);
local v11 = require(l_ShareGame_0.Reducers.GameInfo);
local v12 = require(l_ShareGame_0.Reducers.Page);
local v13 = require(l_ShareGame_0.Reducers.Toasts);
local l_RoduxShareLinks_0 = l_ReducerDependencies_0.RoduxShareLinks;
local v15 = l_ReducerDependencies_0.RoduxNetworking.installReducer();
local v16 = l_RoduxShareLinks_0.installReducer();
local v17 = require(l_Modules_0.Settings.Flags.GetFFlagShareInviteLinkContextMenuV1Enabled);
return function(v18, v19)
    v18 = v18 or {};
    return {
        ConversationsSearch = v8(v18.ConversationsSearch, v19), 
        DeviceInfo = v9(v18.DeviceInfo, v19), 
        Invites = v10(v18.Invites, v19), 
        Page = v12(v18.Page, v19), 
        PlaceInfos = l_PlaceInfosReducer_0(v18.PlaceInfos, v19), 
        Toasts = v13(v18.Toasts, v19), 
        Users = l_UserReducer_0(v18.Users, v19), 
        Friends = l_Friends_0(v18.Friends, v19), 
        FriendCount = l_FriendCount_0(v18.FriendCount, v19), 
        ShareLinks = if not v17() then nil else v16(v18.ShareLinks, v19), 
        GameInfo = if not v17() then nil else v11(v18.GameInfo, v19), 
        NetworkStatus = if not v17() then nil else v15(v18.NetworkStatus, v19)
    };
end;
