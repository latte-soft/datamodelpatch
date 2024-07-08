local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local v8 = require(l_Parent_1.UserProfiles);
local _ = require(l_Parent_0.Common.LocalTypes);
local v10 = require(l_Parent_0.Utils.isUserInGame);
local v11 = require(l_Parent_0.Common.TextKeys);
local v12 = require(l_Parent_0.Analytics.UILoadingEvents);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v1.getStandardSizeAvatarHeadShotRbxthumb;
local l_RecommendationContextType_0 = v1.RoduxFriends.Enums.RecommendationContextType;
local l_PresenceType_1 = require(l_Parent_1.GraphQLServer).types.PresenceType;
local l_FFlagContactRecs_0 = require(l_Parent_1.SharedFlags).FFlagContactRecs;
local l_getFFlagUpdateFriendCarousel10ft_0 = v1.getFFlagUpdateFriendCarousel10ft;
local l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 = require(l_Parent_1.SharedFlags).FFlagFriendsCarouselPaginatedFriendsEnabled;
local v19 = require(l_Parent_0.Flags.FFlagFriendsCarouselUILoadingTime);
local v20 = require(l_Parent_0.Components.UserTileCircular);
local v21 = {
    tileSize = 100, 
    tileInfoHeight = 0
};
local _ = function(v22)
    local _ = nil;
    local _ = nil;
    local _ = nil;
    if v22.__typename == "Friend" then
        local v26 = v22.presence or {};
        return v26.userPresenceType, l_PresenceType_1, v26.lastLocation;
    else
        return v22.userPresenceType, l_PresenceType_0, v22.lastLocation;
    end;
end;
local function _(v28)
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    if v28.__typename == "Friend" then
        local v32 = v28.presence or {};
        v29 = v32.userPresenceType;
        v30 = l_PresenceType_1;
        v31 = v32.lastLocation;
    else
        v29 = v28.userPresenceType;
        v30 = l_PresenceType_0;
        v31 = v28.lastLocation;
    end;
    local l_v29_0 = v29;
    local l_v30_0 = v30;
    local l_v31_0 = v31;
    return (not not l_v31_0 and l_v31_0 ~= "") and if v28.isFriendWithUser then l_v29_0 == l_v30_0.InStudio or l_v29_0 == l_v30_0.InGame else false, l_v31_0;
end;
local function _(v37)
    local v38 = false;
    if v37.userPresenceType == l_PresenceType_0.InStudio then
        v38 = v37.lastLocation and v37.lastLocation ~= "";
    end;
    return v38;
end;
local function v48(v40)
    if not l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 then
        local v41;
        if not (not v40.isFriendWithUser or not v40.userPresenceType) then
            v41 = true;
            if v40.userPresenceType ~= l_PresenceType_0.Online then
                v41 = true;
                if v40.userPresenceType ~= l_PresenceType_0.InStudio then
                    v41 = true;
                    if not (v40.userPresenceType ~= l_PresenceType_0.InGame) then
                        goto label0;
                    end;
                else
                    goto label0;
                end;
            else
                goto label0;
            end;
        end;
        v41 = false;
        ::label0::;
        return v41;
    else
        local v42 = nil;
        local v43 = nil;
        local v44 = nil;
        if v40.__typename == "Friend" then
            local v45 = v40.presence or {};
            v42 = v45.userPresenceType;
            v43 = l_PresenceType_1;
            v44 = v45.lastLocation;
        else
            v42 = v40.userPresenceType;
            v43 = l_PresenceType_0;
            v44 = v40.lastLocation;
        end;
        local l_v42_0 = v42;
        local l_v43_0 = v43;
        if v40.isFriendWithUser then
            v42 = true;
            if l_v42_0 ~= l_v43_0.Online then
                v42 = true;
                if l_v42_0 ~= l_v43_0.InStudio then
                    v42 = true;
                    if not (l_v42_0 ~= l_v43_0.InGame) then
                        goto label1;
                    end;
                else
                    goto label1;
                end;
            else
                goto label1;
            end;
        end;
        v42 = false;
        ::label1::;
        return v42;
    end;
end;
local function v60(v49)
    local v50 = nil;
    local v51 = nil;
    if not v49.hasIncomingFriendRequest or v49.isFriendWithUser then
        if v49.isFriendWithUser then
            if not l_FFlagFriendsCarouselPaginatedFriendsEnabled_0 then
                if not v10(v49) then
                    local v52 = false;
                    if v49.userPresenceType == l_PresenceType_0.InStudio then
                        v52 = v49.lastLocation and v49.lastLocation ~= "";
                    end;
                    if not v52 then
                        v50 = nil;
                        goto label2 --[[  true, true  ]];
                    end;
                end;
                v50 = v49.lastLocation;
            else
                local v53 = nil;
                local v54 = nil;
                local v55 = nil;
                if v49.__typename == "Friend" then
                    local v56 = v49.presence or {};
                    v53 = v56.userPresenceType;
                    v54 = l_PresenceType_1;
                    v55 = v56.lastLocation;
                else
                    v53 = v49.userPresenceType;
                    v54 = l_PresenceType_0;
                    v55 = v49.lastLocation;
                end;
                local l_v53_0 = v53;
                local l_v54_0 = v54;
                local l_v55_0 = v55;
                v50 = if not ((not not l_v55_0 and l_v55_0 ~= "") and if v49.isFriendWithUser then l_v53_0 == l_v54_0.InStudio or l_v53_0 == l_v54_0.InGame else false) then nil else l_v55_0;
            end;
        else
            v51 = v11.SuggestedContext;
        end;
    else
        v51 = v11.FriendRequestContext;
    end;
    ::label2::;
    return v50 or l_useLocalization_0({
        text = v51
    }).text;
end;
return function(v61)
    local v62 = l_llama_0.Dictionary.join(v21, v61 or {});
    v3.useEffect(function()
        if not (not v19 or not v62.reportRender) then
            v62.reportRender((("%*%*"):format(v12.CarouselFriend, if v62.user.__typename == "Friend" then v12.ExperimentSuffix else "")));
            if not v62.user.userPresenceType then
                if not (not v62.user.presence or not v62.user.presence.userPresenceType) then
                    v62.reportRender((("%*%*"):format(v12.CarouselPresence, v12.ExperimentSuffix)));
                end;
            else
                v62.reportRender((("%*"):format(v12.CarouselPresence)));
                return ;
            end;
        end;
    end, {
        v62.user.__typename, 
        v62.user.userPresenceType, 
        v62.user.presence
    });
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    v63 = v8.Hooks.useUserProfilesFetch({
        userIds = {
            v62.user.id
        }, 
        query = if not l_getFFlagUpdateFriendCarousel10ft_0() then v8.Queries.userProfilesCombinedNameAndUsernameByUserIds else v8.Queries.userProfilesCombinedAndPlatformByUserIds
    });
    v65 = if not l_FFlagContactRecs_0 then v63.loading or v63.error else if not not (v62.user.contextType == l_RecommendationContextType_0.Contacts) and v62.user.entityDisplayName ~= nil then nil else v63.loading or v63.error;
    v64 = if not v63.data then nil else v8.Selectors.getCombinedNameFromId(v63.data, v62.user.id);
    if l_getFFlagUpdateFriendCarousel10ft_0() then
        v66 = if not v63.data then nil else v8.Selectors.getPlatformNameFromId(v63.data, v62.user.id);
    end;
    local v67 = v48(v62.user);
    local v68 = v60(v62.user);
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    if not l_FFlagContactRecs_0 then
        v69 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v62.user.id);
        v70 = v64;
        v71 = ("@%*"):format(v62.user.username);
    elseif not (v62.user.contextType == l_RecommendationContextType_0.Contacts) then
        v69 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v62.user.id);
        v70 = v64;
        v71 = ("@%*"):format(v62.user.username);
    else
        v69 = if not v62.user.thumbnailEntities then nil else v62.user.thumbnailEntities.headshotImageUrl;
        v70 = v62.user.entityDisplayName;
    end;
    local function v73(v72)
        v62.onActivated(v62.user, {
            headerTitle = v70, 
            headerSubtitle = v71, 
            contextText = v68, 
            absolutePosition = v62.absoluteIndex, 
            positionIndex = v62.layoutOrder, 
            anchorSpaceSize = Vector2.new(v62.tileSize, v62.tileSize + v62.tileInfoHeight), 
            anchorSpacePosition = v72.current.AbsolutePosition, 
            onOpen = function()
                v62.setPeopleListFrozen(true);
            end, 
            onClose = function()
                v62.setPeopleListFrozen(false);
            end
        });
    end;
    local l_v66_0 = v66;
    if l_v66_0 then
        l_v66_0 = false;
        if v66 ~= "" then
            l_v66_0 = v62.user.isFriendWithUser == false;
        end;
    end;
    return l_Roact_0.createElement(v20, {
        username = if not not l_getFFlagUpdateFriendCarousel10ft_0() and l_v66_0 then v66 else v70, 
        shouldShimmerName = v65, 
        thumbnail = v69, 
        contextualText = v68, 
        showOnlineIndicator = v67, 
        showVendorIcon = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else l_v66_0, 
        layoutOrder = v62.layoutOrder, 
        onActivated = v73, 
        isContextualTextMuted = true, 
        tileSize = v62.tileSize, 
        infoHeight = v62.tileInfoHeight
    });
end;
