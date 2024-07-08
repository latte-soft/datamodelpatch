local l_Parent_0 = script.Parent.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Parent_0.dependencies);
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local l_PresenceType_0 = v2.RoduxPresence.Enums.PresenceType;
local v5 = require(l_Parent_0.Utils.isUserInGame);
local l_FFlagContactRecs_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagContactRecs;
local l_getFFlagContactImporterRevealSentState_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Flags.getFFlagContactImporterRevealSentState;
return function(v8, v9)
    local v10 = tostring(v9.profileUserId) or "";
    local v11 = l_getDeepValue_0(v8, string.format("Profile.FriendshipStatus.%s", v10));
    local v12 = l_getDeepValue_0(v8, string.format("FriendsLanding.Friends.friendshipStatus.%s", v10));
    if l_FFlagContactRecs_0 then
        v11 = v11 or v12;
    end;
    local v13 = l_getDeepValue_0(v8, string.format("Profile.AdditionalUserFields.%s.isDeleted", v10));
    local v14 = l_getDeepValue_0(v8, string.format("Profile.IsBlockedByMe.%s", v10));
    local v15 = l_getDeepValue_0(v8, string.format("Profile.Presence.byUserId.%s.lastLocation", v10));
    local v16 = l_getDeepValue_0(v8, string.format("Profile.Presence.byUserId.%s.userPresenceType", v10)) or l_PresenceType_0.Offline;
    local v17 = l_getDeepValue_0(v8, string.format("Profile.CanRequestFriendshipWith.%s", v10)) or false;
    local v18 = nil;
    if l_getFFlagContactImporterRevealSentState_0() then
        v18 = l_getDeepValue_0(v8, string.format("Profile.Contacts.hasSentRequest.%s", l_getDeepValue_0(v9, "contactProps.contactId") or "")) or false;
        if l_FFlagContactRecs_0 then
            local v19 = true;
            if v11 ~= Enum.FriendStatus.FriendRequestSent then
                v19 = v18;
            end;
            v18 = v19;
        end;
    end;
    return {
        friendshipStatus = v11 or Enum.FriendStatus.Unknown, 
        isDeleted = v13 or false, 
        isUserBlockedByMe = v14 or false, 
        isUserInGame = v5(v16, v15), 
        canRequestFriendshipWith = v17, 
        hasSentRequestToContact = if not l_getFFlagContactImporterRevealSentState_0() then nil else v18, 
        userPresenceType = v16
    };
end;
