local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Parent.Common.ProfileTypes);
local l_getFFlagEditProfilePageEnabled_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).Flags.getFFlagEditProfilePageEnabled;
local v3 = require(script.Parent.ButtonStates);
return function(v4)
    local v5 = v4.friendshipStatus == Enum.FriendStatus.Friend;
    local v6 = v4.profileType == v1.FromContacts;
    local function _()
        if not v4.isUserInGame then
            return v3.Chat;
        else
            return v3.JoinExperience;
        end;
    end;
    local function _()
        if v4.profileType == v1.OffNetworkFriendRequest then
            return v3.AcceptOffNetworkFriendRequest;
        elseif v4.friendshipStatus == Enum.FriendStatus.FriendRequestSent then
            return v3.PendingFriendRequest;
        elseif v4.friendshipStatus == Enum.FriendStatus.FriendRequestReceived then
            return v3.AcceptFriendRequest;
        elseif not v4.canRequestFriendshipWith then
            return v3.CannotAddFriend;
        else
            return v3.AddFriend;
        end;
    end;
    return ((function()
        if not v4.isLocalUser then
            if not v6 then
                if not v5 or v4.isDeleted then
                    if not v5 or not v4.isDeleted then
                        if not v4.isUserBlockedByMe then
                            if v4.profileType == v1.OffNetworkFriendRequest then
                                return v3.AcceptOffNetworkFriendRequest;
                            elseif v4.friendshipStatus == Enum.FriendStatus.FriendRequestSent then
                                return v3.PendingFriendRequest;
                            elseif v4.friendshipStatus == Enum.FriendStatus.FriendRequestReceived then
                                return v3.AcceptFriendRequest;
                            elseif not v4.canRequestFriendshipWith then
                                return v3.CannotAddFriend;
                            else
                                return v3.AddFriend;
                            end;
                        else
                            return v3.Unblock;
                        end;
                    else
                        return v3.Unfriend;
                    end;
                elseif not v4.isUserInGame then
                    return v3.Chat;
                else
                    return v3.JoinExperience;
                end;
            elseif not v4.hasSentRequestToContact then
                return v3.AddFriendFromContacts;
            else
                return v3.AddFriendFromContactsSent;
            end;
        elseif not v4.editProfileIXPEnabled and not l_getFFlagEditProfilePageEnabled_0() then
            return v3.ShareProfileQRCode;
        else
            return v3.OpenEditProfilePage;
        end;
    end)());
end;
