local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_RecommendationContextType_0 = v3.RoduxFriends.Enums.RecommendationContextType;
local l_t_0 = v3.t;
local l_Dash_0 = v3.Dash;
local l_Contexts_0 = v3.SocialLuaAnalytics.Analytics.Enums.Contexts;
local l_UIBlox_0 = v3.UIBlox;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local l_withLocalization_0 = v3.withLocalization;
local v16 = nil;
v16 = if not v3.GetFFlagEnableAppCommonInputHooks() then v3.ReactFocusNavigation.useLastInputMode else v3.FocusNavigationUtils.useLastInputMode;
local l_FriendshipOriginSourceType_0 = v3.NetworkingFriendsEnums.FriendshipOriginSourceType;
local v18 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v19 = require(l_script_FirstAncestor_0.Common.Constants);
local l_convertUserPresenceTypeToString_0 = require(l_Parent_0.SocialCommon).Utils.convertUserPresenceTypeToString;
local v21 = require(script.mapStateToProps);
local v22 = require(script.getOverlayButtons);
local v23 = require(script.getFooterRelevanceInfo);
local v24 = require(script.useAddFriendsTileFocusNavigationBindings);
local v25 = require(script.useFriendRequestHandlers);
local _ = require(l_Parent_0.PlayerContextualMenu);
local v27 = require(l_script_FirstAncestor_0.Flags.getFIntFromContactsText);
local l_FFlagEnableFriendsLandingControllerBar_0 = require(l_Parent_0.SharedFlags).FFlagEnableFriendsLandingControllerBar;
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagAddPYMKToConsoleAddFriends);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local function v32()
    return nil;
end;
local v33 = l_Roact_0.PureComponent:extend("AddFriendsTile");
v33.validateProps = l_t_0.strictInterface({
    localUserId = l_t_0.string, 
    amIFollowingUser = l_t_0.optional(l_t_0.boolean), 
    isUserFollowingMe = l_t_0.optional(l_t_0.boolean), 
    sentFromExperienceName = l_t_0.optional(l_t_0.string), 
    friendStatus = l_t_0.optional(l_t_0.enum(Enum.FriendStatus)), 
    user = l_t_0.table, 
    layoutOrder = l_t_0.integer, 
    size = l_t_0.Vector2, 
    isFriendRequest = l_t_0.optional(l_t_0.boolean), 
    isRecommendation = l_t_0.optional(l_t_0.boolean), 
    hasIncomingFriendRequest = l_t_0.boolean, 
    handleNavigateDownToViewUserProfile = l_t_0.optional(l_t_0.callback), 
    handleRequestFriendship = l_t_0.optional(l_t_0.callback), 
    handleAcceptFriendRequest = l_t_0.optional(l_t_0.callback), 
    handleDeclineFriendRequest = l_t_0.optional(l_t_0.callback), 
    openPlayerContextualMenu = l_t_0.optional(l_t_0.callback), 
    isPlayerContextualMenuEnabled = l_t_0.optional(l_t_0.boolean), 
    screenSize = l_t_0.Vector2, 
    originSourceType = l_t_0.optional(l_t_0.string), 
    contactImporterWarningSeen = l_t_0.optional(l_t_0.callback), 
    showTooltip = l_t_0.optional(l_t_0.boolean), 
    tooltipShown = l_t_0.optional(l_t_0.callback), 
    navigation = l_t_0.optional(l_t_0.table), 
    position = l_t_0.integer, 
    eventHandlerMapRef = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else l_t_0.optional(l_t_0.callback), 
    selected = l_t_0.optional(l_t_0.boolean), 
    focusGuiObject = l_t_0.optional(l_t_0.callback), 
    lastInputMode = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else l_t_0.string
});
v33.defaultProps = {
    isFriendRequest = false, 
    isPlayerContextualMenuEnabled = false, 
    handleNavigateDownToViewUserProfile = v32, 
    handleRequestFriendship = v32, 
    handleAcceptFriendRequest = v32, 
    handleDeclineFriendRequest = v32, 
    lastInputMode = if not l_FFlagEnableFriendsLandingControllerBar_0 then nil else "Cursor"
};
v33.init = function(v34)
    v34.state = {
        showTooltip = v34.props.showTooltip
    };
    v34.isMounted = false;
    v34.addFriendsTileRef = l_Roact_0.createRef();
    v34.onActivated = function(_, _, v37, v38)
        if not v34.props.isPlayerContextualMenuEnabled then
            return v34.openPlayerProfile({
                profilePeekViewProps = {
                    contextualInfoDisplay = v37, 
                    contextualInfoType = v38
                }
            });
        else
            return v34.openPlayerContextualMenu(v34.props.user);
        end;
    end;
    v34.openPlayerContextualMenu = function(v39)
        return function()
            if v34.isMounted then
                local _ = nil;
                v34.props.openPlayerContextualMenu({
                    subjectUserId = v39.id, 
                    contactId = if not v30 then nil else v39.entityId, 
                    contactName = if not v30 then nil else v39.entityDisplayName, 
                    recommendationContext = if not v30 then nil else v34.props.user.contextType, 
                    mutualFriendsCount = if not v30 then nil else v39.mutualFriendsCount, 
                    robloxFriendshipStatus = if not v30 then if v34.props.isRecommendation then Enum.FriendStatus.NotFriend else Enum.FriendStatus.FriendRequestReceived else if v34.props.isRecommendation then v34.props.friendStatus or Enum.FriendStatus.NotFriend else Enum.FriendStatus.FriendRequestReceived, 
                    subjectPresence = {
                        locationString = v39.lastLocation, 
                        locationPlaceId = v39.placeId, 
                        locationRootPlaceId = v39.rootPlaceId, 
                        locationUniverseId = v39.universeId, 
                        status = l_convertUserPresenceTypeToString_0(v39.userPresenceType)
                    }, 
                    friendshipOriginSourceType = if not v34.props.isRecommendation then nil else l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue()
                });
                return ;
            else
                return ;
            end;
        end;
    end;
    v34.openPlayerProfile = function(v41)
        return function()
            if v34.isMounted then
                local v42 = (not not l_FFlagContactRecs_0 and v34.props.user.contextType) and v34.props.user.contextType == l_RecommendationContextType_0.Contacts;
                local v43 = l_Dash_0.join(v41.profilePeekViewProps, {
                    absolutePosition = v34.props.position, 
                    source = l_Contexts_0.AddFriends
                });
                if v34.props.isRecommendation then
                    v43 = l_Dash_0.join(v43, {
                        isRecommendation = v34.props.isRecommendation, 
                        rank = v34.props.user.rank, 
                        source = v19.AddFriendsPYMKSourceName, 
                        contactProps = if not v42 then nil else {
                            contactId = v34.props.user.entityId, 
                            contactname = v34.props.user.entityDisplayName, 
                            avatarImageUrl = v34.props.user.thumbnailEntities.avatarImageUrl
                        }, 
                        profileType = if not v42 then nil else "FromContacts"
                    });
                end;
                v34.props.handleNavigateDownToViewUserProfile(v34.props.user.id, {
                    profilePeekViewProps = v43
                });
                return ;
            else
                return ;
            end;
        end;
    end;
    v34.hideTooltip = function()
        v34.props.contactImporterWarningSeen();
        v34:setState({
            showTooltip = false
        });
    end;
    v34.checkAndSetSelected = function()
        if not (not v34.props.selected or not v34.props.focusGuiObject) then
            local v44 = v34.addFriendsTileRef:getValue();
            if v44 then
                v34.props.focusGuiObject(v44);
            end;
        end;
    end;
end;
v33.render = function(v45)
    local l_size_0 = v45.props.size;
    local l_user_0 = v45.props.user;
    return l_withStyle_0(function(v48)
        return l_withLocalization_0({
            mutualFriendsText = (not not l_user_0.mutualFriends and #l_user_0.mutualFriends == 1) and "Feature.Friends.Label.SingularMutualFriend" or "Feature.Friends.Label.MutualFriends", 
            sentFromWithContextText = {
                "Feature.Friends.Label.SentFromWithContext"; 
                gameName = v45.props.sentFromExperienceName or ""
            }, 
            youAreFollowingText = "Feature.Friends.Label.YouAreFollowing", 
            followsYouText = "Feature.Friends.Label.FollowsYou", 
            fromContactsText = not v27() and "Feature.Friends.Description.FoundFromPhone" or "Feature.Friends.Description.FoundFromContactImporter", 
            contactNameText = if not l_user_0.contactName then nil else {
                "Feature.Friends.Description.FromContactsV2"; 
                contactName = l_user_0.contactName
            }, 
            tooltipHeaderText = "Feature.Contacts.Heading.ContactsTooltip", 
            tooltipBodyText = "Feature.Contacts.Label.ContactsTooltip", 
            tooltipButtonText = "Feature.Avatar.Action.GotIt", 
            foundThroughQRCode = v18.PROFILE_QR_CODE_TILE_FOOTER, 
            friendRequests = v18.FRIEND_REQUEST, 
            mutualFriends = v18.MUTUAL_FRIENDS, 
            singularMutualFriend = v18.MUTUAL_FRIEND_SINGULAR, 
            frequents = v18.FREQUENTS, 
            fromContacts = v18.FROM_CONTACTS
        })(function(v49)
            local v50 = {
                headerText = v49.tooltipHeaderText, 
                bodyText = v49.tooltipBodyText, 
                buttonProps = {
                    text = v49.tooltipButtonText, 
                    onActivated = v45.hideTooltip
                }, 
                useLargeDropShadow = true
            };
            local v51 = {
                preferredOrientation = l_TooltipOrientation_0.Left, 
                guiTarget = l_CoreGui_0, 
                active = v45.state.showTooltip, 
                DisplayOrder = 1
            };
            local v52, v53 = v23({
                mutualFriends = l_user_0.mutualFriends, 
                isUserFollowingMe = v45.props.isUserFollowingMe, 
                amIFollowingUser = v45.props.amIFollowingUser, 
                sentFromExperienceName = v45.props.sentFromExperienceName, 
                isFriendRequest = v45.props.isFriendRequest, 
                isRecommendation = v45.props.isRecommendation, 
                friendStatus = v45.props.friendStatus, 
                userPresenceType = l_user_0.userPresenceType, 
                lastLocation = l_user_0.lastLocation, 
                originSourceType = v45.props.originSourceType, 
                contextType = l_user_0.contextType, 
                mutualFriendsCount = l_user_0.mutualFriendsCount, 
                hasIncomingFriendRequest = v45.props.hasIncomingFriendRequest
            }, v48, v49);
            local v54 = if (not not v45.props.isRecommendation and v52) and v52.text then {
                text = v52.text, 
                icon = v52.icon
            } else nil;
            if v45.props.isPlayerContextualMenuEnabled then
                v54 = {
                    text = if not v52 then nil else v52.text, 
                    icon = if not v52 then nil else v52.icon
                };
            end;
            local v55 = nil;
            local v56 = nil;
            local v57 = nil;
            if not l_FFlagContactRecs_0 then
                v55 = l_user_0.displayName;
                v56 = "@" .. (l_user_0.externalAppDisplayName or l_user_0.username);
                v57 = string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(l_user_0.id)));
            elseif not (l_user_0.contextType and l_user_0.contextType == l_RecommendationContextType_0.Contacts) then
                v55 = l_user_0.displayName;
                v56 = "@" .. (l_user_0.externalAppDisplayName or l_user_0.username);
                v57 = string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(l_user_0.id)));
            else
                v55 = l_user_0.entityDisplayName;
                v56 = nil;
                v57 = l_user_0.thumbnailEntities.avatarImageUrl;
            end;
            if not v27() then
                return l_withTooltip_0(v50, v51, function(v58)
                    return l_Roact_0.createElement("Frame", {
                        AnchorPoint = Vector2.new(1, 0.5), 
                        Position = UDim2.fromScale(1, 0.5), 
                        Size = UDim2.new(0, l_size_0.X, 0, l_size_0.Y), 
                        BackgroundTransparency = 1, 
                        ZIndex = 1, 
                        [l_Roact_0.Change.AbsoluteSize] = v58, 
                        [l_Roact_0.Change.AbsolutePosition] = v58, 
                        [l_Roact_0.Ref] = v45.props.eventHandlerMapRef
                    }, {
                        PlayerTile = l_Roact_0.createElement(l_PlayerTile_0, {
                            thumbnail = v57, 
                            title = v55, 
                            tileSize = UDim2.new(0, l_size_0.X, 0, l_size_0.Y), 
                            subtitle = v56, 
                            buttons = if not not l_FFlagEnableFriendsLandingControllerBar_0 and v45.props.lastInputMode == "Focus" then nil else v22({
                                playerId = l_user_0.id, 
                                position = v45.props.position, 
                                isFriendRequest = v45.props.isFriendRequest, 
                                friendStatus = v45.props.friendStatus, 
                                networking = v45.props.networking, 
                                rank = l_user_0.rank, 
                                handleRequestFriendship = v45.props.handleRequestFriendship, 
                                handleAcceptFriendRequest = v45.props.handleAcceptFriendRequest, 
                                handleDeclineFriendRequest = v45.props.handleDeclineFriendRequest, 
                                hasIncomingFriendRequest = v45.props.hasIncomingFriendRequest, 
                                contextType = if not l_user_0.contextType then nil else l_user_0.contextType.rawValue()
                            }), 
                            relevancyInfo = v52, 
                            onActivated = v45.onActivated(v55, v56, v54, v53), 
                            forwardedRef = v45.addFriendsTileRef, 
                            Selectable = not not l_FFlagEnableFriendsLandingControllerBar_0 or nil
                        })
                    });
                end);
            else
                return l_Roact_0.createElement("Frame", {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Position = UDim2.fromScale(1, 0.5), 
                    Size = UDim2.new(0, l_size_0.X, 0, l_size_0.Y), 
                    BackgroundTransparency = 1, 
                    ZIndex = 1, 
                    [l_Roact_0.Ref] = v45.props.eventHandlerMapRef
                }, {
                    PlayerTile = l_Roact_0.createElement(l_PlayerTile_0, {
                        thumbnail = v57, 
                        title = v55, 
                        tileSize = UDim2.new(0, l_size_0.X, 0, l_size_0.Y), 
                        subtitle = v56, 
                        buttons = if not not l_FFlagEnableFriendsLandingControllerBar_0 and v45.props.lastInputMode == "Focus" then nil else v22({
                            playerId = l_user_0.id, 
                            position = v45.props.position, 
                            isFriendRequest = v45.props.isFriendRequest, 
                            friendStatus = v45.props.friendStatus, 
                            networking = v45.props.networking, 
                            rank = l_user_0.rank, 
                            handleRequestFriendship = v45.props.handleRequestFriendship, 
                            handleAcceptFriendRequest = v45.props.handleAcceptFriendRequest, 
                            handleDeclineFriendRequest = v45.props.handleDeclineFriendRequest, 
                            hasIncomingFriendRequest = v45.props.hasIncomingFriendRequest, 
                            contextType = if not l_user_0.contextType then nil else l_user_0.contextType.rawValue()
                        }), 
                        relevancyInfo = v52, 
                        onActivated = v45.onActivated(v55, v56, v54, v53), 
                        forwardedRef = v45.addFriendsTileRef, 
                        Selectable = not not l_FFlagEnableFriendsLandingControllerBar_0 or nil
                    })
                });
            end;
        end);
    end);
end;
v33.didUpdate = function(v59)
    if not (not v59.state.showTooltip or v59.props.navigation.isFocused()) then
        v59:setState({
            showTooltip = false
        });
    end;
end;
v33.didMount = function(v60)
    v60.isMounted = true;
    v60.checkAndSetSelected();
end;
v33.willUnmount = function(v61)
    v61.isMounted = false;
end;
v33 = l_RoactRodux_0.connect(v21, nil)(v33);
local function v70(v62)
    local v64 = l_useSelector_0(function(v63)
        return v21(v63, v62);
    end);
    local l_user_1 = v62.user;
    local v66 = v25({
        playerId = l_user_1.id, 
        position = v62.position, 
        isFriendRequest = v62.isFriendRequest, 
        friendStatus = v62.friendStatus, 
        networking = v62.networking, 
        rank = l_user_1.rank, 
        handleRequestFriendship = v62.handleRequestFriendship, 
        handleAcceptFriendRequest = v62.handleAcceptFriendRequest, 
        handleDeclineFriendRequest = v62.handleDeclineFriendRequest, 
        hasIncomingFriendRequest = v62.hasIncomingFriendRequest, 
        contextType = if not l_user_1.contextType then nil else l_user_1.contextType.rawValue()
    });
    local v67;
    if not v30 then
        v67 = v24(v66);
    else
        v67 = v24;
        local l_v66_0 = v66;
        local v69 = true;
        if v64.friendStatus ~= Enum.FriendStatus.FriendRequestReceived then
            v69 = false;
        end;
        v67 = v67(l_v66_0, v69);
    end;
    return l_Roact_0.createElement(v33, l_Dash_0.join(v62, {
        eventHandlerMapRef = v67, 
        lastInputMode = v16()
    }));
end;
if not l_FFlagEnableFriendsLandingControllerBar_0 then
    return v33;
else
    return v70;
end;
