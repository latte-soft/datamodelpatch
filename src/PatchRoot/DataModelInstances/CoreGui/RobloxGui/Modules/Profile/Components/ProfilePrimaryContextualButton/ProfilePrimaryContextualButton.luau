local l_Parent_0 = script.Parent.Parent.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Parent_0.dependencies);
local l_UIBlox_0 = v2.UIBlox;
local l_React_0 = v2.React;
local l_Dash_0 = v2.Dash;
local v6 = require(l_Parent_0.Common.ProfileScreens);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v8 = require(l_Parent_0.Common.ProfileTypes);
local l_useLocalization_0 = v2.useLocalization;
local v10 = require(script.Parent.ButtonStates);
local v11 = require(script.Parent.ButtonStateProps);
local v12 = require(script.Parent.getButtonActiveStateEnum);
local l_dependencyArray_0 = v2.dependencyArray;
local _ = require(script.Parent.profilePrimaryContextualButtonMapDispatchToProps);
local _ = require(script.Parent.profilePrimaryContextualButtonMapStateToProps);
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v18 = require(l_Parent_0.Common.TextKeys);
local l_convertUserPresenceTypeToString_0 = v2.SocialCommon.Utils.convertUserPresenceTypeToString;
local l_FriendshipOriginSourceType_0 = v2.NetworkingFriendsEnums.FriendshipOriginSourceType;
local l_Contexts_0 = v2.SocialLuaAnalytics.Analytics.Enums.Contexts;
local v22 = require(l_Parent_0.Analytics.EntryPoints);
local l_FFlagFixContactRecsFriendRequestLogging_0 = v2.FFlagFixContactRecsFriendRequestLogging;
return function(v24)
    local v25 = l_React_0.useCallback(function()
        v24.analytics:primaryCTAClick(v10.OpenEditProfilePage);
        return v24.openEditProfilePage();
    end, l_dependencyArray_0(v24.openEditProfilePage));
    local v26 = l_React_0.useCallback(function()
        v24.analytics:primaryCTAClick(v10.ShareProfileQRCode);
        return v24.navigateToLuaAppPages[v6.ProfileQRCodePage]({
            source = l_Contexts_0.ProfileCard, 
            distanceFromTop = l_UserInputService_0.StatusBarSize.Y
        });
    end, l_dependencyArray_0(v24.analytics, v24.navigateToLuaAppPages));
    local v27 = l_React_0.useCallback(function()
        v24.analytics:primaryCTAClick(v10.Chat, {
            source = v24.navigationParams.source, 
            isHomePageCarousel = v24.navigationParams.isHomePageCarousel, 
            absolutePosition = v24.navigationParams.absolutePosition, 
            presence = l_convertUserPresenceTypeToString_0(v24.userPresenceType)
        });
        v24.navigateToLuaAppPages[v6.Chat](v24.profileUserId);
    end, l_dependencyArray_0(v24.analytics, v24.navigateToLuaAppPages, v24.profileUserId));
    local v28 = l_React_0.useCallback(function()
        if not v24.navigationParams.isRecommendation then
            v24.analytics:primaryCTAClick(v10.Unfriend);
            return v24.unfriendUser(v24.localUserId, v24.profileUserId);
        else
            v24.analytics:primaryCTAClick(v10.Unfriend, v24.navigationParams);
            return v24.unfriendUser(v24.localUserId, v24.profileUserId);
        end;
    end, l_dependencyArray_0(v24.analytics, v24.navigateToLuaAppPages, v24.navigationParams, v24.unfriendUser));
    local v29 = l_React_0.useCallback(function()
        v24.analytics:primaryCTAClick(v10.Unblock);
        return v24.unblockUser({
            targetUserId = v24.profileUserId, 
            currentUserId = v24.localUserId
        });
    end, l_dependencyArray_0(v24.analytics, v24.unblockUser));
    local v32 = l_React_0.useCallback(function()
        local v30 = {
            source = v24.navigationParams.source, 
            isHomePageCarousel = v24.navigationParams.isHomePageCarousel, 
            absolutePosition = v24.navigationParams.absolutePosition, 
            shareLinkId = v24.navigationParams.shareLinkId, 
            profileType = v24.profileType
        };
        if v24.navigationParams.isRecommendation then
            v30 = l_Dash_0.join(v30, {
                isRecommendation = v24.navigationParams.isRecommendation, 
                recommendationContextType = v24.navigationParams.recommendationContextType, 
                recommendationSessionId = v24.navigationParams.recommendationSessionId, 
                recommendationRank = v24.navigationParams.recommendationRank
            });
        end;
        if v24.navigationParams.contextualInfoType then
            v30 = l_Dash_0.join(v30, {
                contextualInfoType = v24.navigationParams.contextualInfoType
            });
        end;
        v24.analytics:primaryCTAClick(v10.AddFriend, v30);
        local v31 = if not v24.navigationParams.isRecommendation then if v24.navigationParams.source == v22.PlayerSearch.rawValue() then l_FriendshipOriginSourceType_0.PlayerSearch.rawValue() else nil else l_FriendshipOriginSourceType_0.FriendRecommendations.rawValue();
        if v24.profileType == v8.ProfileShare then
            v31 = l_FriendshipOriginSourceType_0.QrCode.rawValue();
        end;
        return v24.sendFriendshipRequest(v24.localUserId, v24.profileUserId, v31);
    end, l_dependencyArray_0(v24.navigationParams, v24.profileType, v24.localUserId, v24.profileUserId, v24.sendFriendshipRequest));
    local v34 = l_React_0.useCallback(function()
        local v33 = {
            source = v24.navigationParams.source, 
            isHomePageCarousel = v24.navigationParams.isHomePageCarousel, 
            absolutePosition = v24.navigationParams.absolutePosition, 
            profileType = v24.profileType, 
            shareLinkId = v24.navigationParams.shareLinkId
        };
        if v24.navigationParams.isRecommendation then
            v33 = l_Dash_0.join(v33, {
                isRecommendation = v24.navigationParams.isRecommendation, 
                recommendationContextType = v24.navigationParams.recommendationContextType, 
                recommendationSessionId = v24.navigationParams.recommendationSessionId, 
                recommendationRank = v24.navigationParams.recommendationRank
            });
        end;
        if v24.navigationParams.contextualInfoType then
            v33 = l_Dash_0.join(v33, {
                contextualInfoType = v24.navigationParams.contextualInfoType
            });
        end;
        v24.analytics:primaryCTAClick(v10.AcceptFriendRequest, v33);
        return v24.acceptFriendshipRequest(v24.localUserId, v24.profileUserId);
    end, l_dependencyArray_0(v24.navigationParams, v24.profileType, v24.localUserId, v24.profileUserId, v24.acceptFriendshipRequest));
    local v35 = l_React_0.useCallback(function()
        v24.analytics:primaryCTAClick(v10.AcceptOffNetworkFriendRequest, {
            offNetworkFriendRequestLinkId = v24.navigationParams.shareLinkId
        });
        return v24.acceptOffNetworkFriendshipRequest({
            localUserId = v24.localUserId, 
            profileUserId = v24.profileUserId, 
            token = v24.navigationParams.offNetworkFriendRequestToken
        }):andThen(v24.resetProfileType);
    end, l_dependencyArray_0(v24.analytics, v24.navigationParams, v24.localUserId, v24.profileUserId, v24.resetProfileType, v24.acceptOffNetworkFriendshipRequest));
    local v36 = l_React_0.useCallback(function()
        if (not l_FFlagFixContactRecsFriendRequestLogging_0 or not v24.contactProps) or not v24.navigationParams then
            v24.analytics:primaryCTAClick(v10.AddFriendFromContacts);
        else
            v24.analytics:primaryCTAClick(v10.AddFriendFromContacts, {
                contactId = v24.contactProps.contactId, 
                isRecommendation = v24.navigationParams.isRecommendation, 
                recommendationContextType = v24.navigationParams.recommendationContextType, 
                recommendationSessionId = v24.navigationParams.recommendationSessionId, 
                recommendationRank = v24.navigationParams.recommendationRank
            });
        end;
        return v24.sendContactFriendshipRequest({
            currentUserId = v24.localUserId, 
            contactId = v24.contactProps.contactId
        });
    end, l_dependencyArray_0(v24.analytics, v24.localUserId, v24.contactProps, v24.sendContactFriendshipRequest));
    local v37 = v12({
        isLocalUser = v24.isLocalUser, 
        isDeleted = v24.isDeleted, 
        isUserBlockedByMe = v24.isUserBlockedByMe, 
        friendshipStatus = v24.friendshipStatus, 
        isUserInGame = v24.isUserInGame, 
        canRequestFriendshipWith = v24.canRequestFriendshipWith, 
        editProfileIXPEnabled = v24.editProfileIXPEnabled, 
        profileType = v24.profileType, 
        hasSentRequestToContact = v24.hasSentRequestToContact
    });
    local v38 = l_React_0.useMemo(function()
        return ({
            [v10.JoinExperience] = {
                openPurchaseExperienceModal = v24.openPurchaseExperienceModal, 
                openUnableToJoinExperienceModal = v24.openUnableToJoinExperienceModal
            }
        })[v37] or {};
    end, l_dependencyArray_0(v24.openPurchaseExperienceModal, v24.openUnableToJoinExperienceModal, v37));
    local v39 = {
        [v10.Chat] = v27, 
        [v10.OpenEditProfilePage] = v25, 
        [v10.ShareProfileQRCode] = v26, 
        [v10.Unfriend] = v28, 
        [v10.Unblock] = v29, 
        [v10.AddFriend] = v32, 
        [v10.AcceptFriendRequest] = v34, 
        [v10.AcceptOffNetworkFriendRequest] = v35, 
        [v10.AddFriendFromContacts] = v36
    };
    local v40 = v11[v37];
    local v41 = v39[v37];
    local v42 = l_useLocalization_0({
        buttonText = if #v40.textKey > 0 then v40.textKey else nil, 
        successText = if #v40.successTextKey > 0 then v40.successTextKey else nil, 
        errorText = v18.SomethingIsWrong
    });
    local v43 = l_React_0.useMemo(function()
        if not v41 or not v24.onClickWithToast then
            return l_Dash_0.noop;
        else
            return (v24.onClickWithToast({
                showToast = v40.showToast, 
                actionCallback = v41, 
                successIcon = v40.successIcon, 
                successTitle = v42.successText, 
                errorTitle = v42.errorText
            }));
        end;
    end, l_dependencyArray_0(v41, v40.showToast, v40.successIcon, v42.buttonText, v42.successText, v24.onClickWithToast));
    if v24.isDeleted and v24.friendshipStatus ~= Enum.FriendStatus.Friend then
        return nil;
    else
        local v44 = v40.button or {
            component = l_Button_0, 
            type = l_ButtonType_0.PrimarySystem
        };
        return l_React_0.createElement(v44.component, l_Dash_0.join({
            buttonType = v44.type, 
            size = v24.size, 
            layoutOrder = v24.layoutOrder, 
            text = v42.buttonText, 
            isDisabled = v40.isDisabled, 
            icon = v40.icon, 
            onActivated = v43
        }, v38));
    end;
end;
