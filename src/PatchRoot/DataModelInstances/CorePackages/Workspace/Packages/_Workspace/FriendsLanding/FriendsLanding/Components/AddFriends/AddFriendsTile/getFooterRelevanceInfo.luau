local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_AddFriends_0.dependencies);
local l_t_0 = v3.t;
local l_Images_0 = v3.UIBlox.App.ImageSet.Images;
local l_PresenceType_0 = v3.RoduxPresence.Enums.PresenceType;
local l_ContactImporterConstants_0 = v3.ContactImporterConstants;
local l_FriendshipOriginSourceType_0 = v3.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v9 = require(l_Parent_0.SocialCommon);
local l_getRecommendationContextualInfoDisplay_0 = v9.Utils.getRecommendationContextualInfoDisplay;
local l_getRecommendationContextualInfoType_0 = v9.Utils.getRecommendationContextualInfoType;
local l_ContextualInfoTypes_0 = v9.Enums.ContextualInfoTypes;
local v13 = l_t_0.strictInterface({
    mutualFriends = l_t_0.optional(l_t_0.table), 
    amIFollowingUser = l_t_0.optional(l_t_0.boolean), 
    isUserFollowingMe = l_t_0.optional(l_t_0.boolean), 
    sentFromExperienceName = l_t_0.optional(l_t_0.string), 
    isFriendRequest = l_t_0.boolean, 
    isRecommendation = l_t_0.optional(l_t_0.boolean), 
    userPresenceType = l_t_0.optional(l_t_0.userdata), 
    friendStatus = l_t_0.optional(l_t_0.enum(Enum.FriendStatus)), 
    lastLocation = l_t_0.optional(l_t_0.string), 
    originSourceType = l_t_0.optional(l_t_0.string), 
    contextType = l_t_0.optional(l_t_0.userdata), 
    mutualFriendsCount = l_t_0.optional(l_t_0.number), 
    hasIncomingFriendRequest = l_t_0.optional(l_t_0.boolean)
});
local function _(v14)
    local v15 = false;
    if v14 ~= nil then
        v15 = #v14 > 0;
    end;
    return v15;
end;
return function(v17, v18, v19)
    assert(v13(v17));
    if not v17.isFriendRequest then
        if v17.userPresenceType == l_PresenceType_0.InGame then
            return not not v17.lastLocation and {
                text = v17.lastLocation, 
                fontStyle = v18.Font.CaptionBody, 
                icon = l_Images_0["icons/actions/friends/friendsplaying"], 
                iconTransparency = v18.Theme.BackgroundUIDefault.Transparency, 
                iconSize = UDim2.new(0, 24, 0, 24)
            } or nil;
        elseif not v17.isRecommendation then
            return nil;
        else
            local v20 = {
                contextType = v17.contextType, 
                mutualFriendsCount = v17.mutualFriendsCount, 
                hasIncomingFriendRequest = v17.hasIncomingFriendRequest
            };
            local v21 = l_getRecommendationContextualInfoDisplay_0({
                recommendation = v20, 
                localized = {
                    mutualFriends = v19.mutualFriends, 
                    singularMutualFriend = v19.singularMutualFriend, 
                    frequents = v19.frequents, 
                    friendRequests = v19.friendRequests, 
                    contacts = v19.fromContacts
                }
            });
            return {
                text = v21.text, 
                fontStyle = v18.Font.CaptionBody, 
                icon = v21.icon
            }, l_getRecommendationContextualInfoType_0(v20);
        end;
    elseif not v19.contactNameText then
        if v17.originSourceType == l_ContactImporterConstants_0.PHONE_CONTACT_IMPORTER then
            return {
                text = v19.fromContactsText, 
                fontStyle = v18.Font.CaptionBody
            };
        elseif v17.originSourceType == l_FriendshipOriginSourceType_0.QrCode.rawValue() then
            return {
                text = v19.foundThroughQRCode, 
                fontStyle = v18.Font.CaptionBody
            };
        else
            local l_mutualFriends_0 = v17.mutualFriends;
            local v23 = false;
            if l_mutualFriends_0 ~= nil then
                v23 = #l_mutualFriends_0 > 0;
            end;
            if not v23 then
                if v17.sentFromExperienceName ~= nil then
                    return {
                        text = v19.sentFromWithContextText, 
                        fontStyle = v18.Font.CaptionBody
                    };
                elseif not v17.amIFollowingUser then
                    if not v17.isUserFollowingMe then
                        return nil;
                    else
                        return {
                            text = v19.followsYouText, 
                            fontStyle = v18.Font.CaptionBody, 
                            icon = l_Images_0["icons/status/player/following"]
                        };
                    end;
                else
                    return {
                        text = v19.youAreFollowingText, 
                        fontStyle = v18.Font.CaptionBody, 
                        icon = l_Images_0["icons/status/player/following"]
                    };
                end;
            else
                return {
                    text = ("%d %s"):format(#v17.mutualFriends, string.lower(v19.mutualFriendsText)), 
                    fontStyle = v18.Font.CaptionBody, 
                    icon = l_Images_0["icons/status/player/friend"]
                }, l_ContextualInfoTypes_0.MutualFriends;
            end;
        end;
    else
        return {
            text = v19.contactNameText, 
            fontStyle = v18.Font.CaptionBody
        };
    end;
end;
