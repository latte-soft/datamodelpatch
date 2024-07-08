local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local l_UniversalAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy;
local v6 = require(script.Parent.ChatConversation);
local v7 = require(script.Parent.PendingState.PendingStateConversationPage);
local v8 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v9 = require(l_script_FirstAncestor_0.LegacyAnalytics.useAnalytics);
local v10 = require(l_script_FirstAncestor_0.Components.ChatConversation.Messages.Selectors.selectMessagesPure);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v12 = require(script.Parent.mapDispatchToProps);
local v13 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useEffect_0 = v3.useEffect;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v18 = require(l_script_FirstAncestor_0.Hooks.useMapDispatch);
local v19 = require(l_script_FirstAncestor_0.Hooks.useGetUsers);
local v20 = require(l_script_FirstAncestor_0.Hooks.useGetUsersTyping);
local v21 = require(l_Parent_0.UserProfiles);
local v22 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v23 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
local v24 = require(l_script_FirstAncestor_0.Hooks.useRecipientIds);
local v25 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useCallback_0 = v3.useCallback;
local v28 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local v29 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v30 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v31 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v32 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v33 = require(l_script_FirstAncestor_0.Flags.getFFlagFixReleaseChatInputBarFocus);
local v35 = {
    topBarHeight = 0, 
    wideMode = false, 
    chatInputPlaceholderKey = "Feature.Chat.Label.ChatInputPlaceholder", 
    messageDefaultNoticeKey = "Feature.Chat.Message.Default", 
    messageModeratedNoticeKey = "Feature.Chat.Message.MessageContentModerated", 
    networkErrorTextKey = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    notImplementedMessageTypeKey = "Feature.Chat.Label.NotImplementedMessageType", 
    viewProfileOnAvatarPressed = true, 
    unknownUserTextKey = "Feature.Chat.Label.UnknownUser", 
    oneUserTyping = {
        "Feature.Chat.Message.OneUserTyping"; 
        DISPLAY_NAME = ""
    }, 
    twoUsersTyping = {
        "Feature.Chat.Message.TwoUsersTyping"; 
        DISPLAY_NAME_1 = "", 
        DISPLAY_NAME_2 = ""
    }, 
    severalUsersTyping = "Feature.Chat.Message.SeveralUsersTyping", 
    pendingStateBodyKey = "Feature.Chat.Message.ChatIsUnfiltered", 
    getReadingMessagesIsEnabled = function()
    end, 
    updateConversationTitle = function(_)
    end
};
ChatConversationContainer = function(v36)
    local v37 = v4.Dictionary.join(v35, v36);
    local v38 = v9();
    local v39 = v31();
    local v41 = v3.useCallback(function(v40)
        v38:navigate(v8.NavigationEvents.ChatConversationProfile);
        v37.openViewProfile(v40);
    end, {
        v37.openViewProfile, 
        v38
    });
    local v42 = v18(v12);
    local v43 = v13(v37.conversationId);
    local v44 = nil;
    local v45 = v24(v43);
    local l_status_0, l_result_0 = pcall(function()
        return l_HttpService_0:JSONEncode(v45);
    end);
    v44 = not l_status_0 and "[]" or l_result_0;
    local v48 = nil;
    local v49 = nil;
    local v50 = l_useLocalUserId_0();
    local v51 = if not v33() then nil else v28();
    v49 = v21.Hooks.useUserProfilesFetch({
        userIds = v23(v43, v50), 
        query = v21.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v52 = v21.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v50))
        }, 
        query = v21.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v48 = v22(v43, v49.data and v49.data.userProfiles, not v52.data and "" or v21.Selectors.getCombinedNameFromId(v52.data, (tostring(v50))));
    local v53 = v19();
    local v54 = v20(v37.conversationId);
    local v55 = v3.useRef({
        itemList = {}, 
        previousMessagesState = {}, 
        previousSendingMessagesState = {}, 
        previousMessagesResult = {}
    });
    local v56 = v3.useMemo(function()
        v55.current = v10({
            conversation = v43, 
            conversationId = v37.conversationId, 
            Users = v53, 
            localUserId = v50
        }, v55.current);
        return v55.current.itemList;
    end, {
        v43, 
        v37.conversationId, 
        v53, 
        v50
    });
    local v57 = if not not v54[1] and v49.data then v21.Selectors.getCombinedNameFromId(v49.data, v54[1].id) else nil;
    local v58 = l_useLocalization_0({
        chatInputPlaceholder = v37.chatInputPlaceholderKey, 
        invalidMessageTypeText = v37.notImplementedMessageTypeKey, 
        messageDefaultNoticeText = v37.messageDefaultNoticeKey, 
        messageModeratedNoticeText = v37.messageModeratedNoticeKey, 
        networkErrorText = v37.networkErrorTextKey, 
        unknownUserText = v37.unknownUserTextKey, 
        oneUserTyping = {
            "Feature.Chat.Message.OneUserTyping"; 
            DISPLAY_NAME = v57
        }, 
        twoUsersTyping = {
            "Feature.Chat.Message.TwoUsersTyping"; 
            DISPLAY_NAME_1 = v57, 
            DISPLAY_NAME_2 = if not not v54[2] and v49.data then v21.Selectors.getCombinedNameFromId(v49.data, v54[2].id) else nil
        }, 
        severalUsersTyping = v37.severalUsersTyping
    });
    local v59 = nil;
    if v39 then
        l_useEffectOnMount_0(function()
            v39.fireAnalyticsEvent(v30.ConversationScreenRendered, {
                conversationId = v37.conversationId
            });
        end);
        v59 = function(v60)
            v39.fireAnalyticsEvent(v30.ConversationScreenExit, {
                conversationId = v37.conversationId, 
                conversationExitType = v60
            });
        end;
    end;
    if v32() then
        l_useEffect_0(function()
            v37.updateConversationTitle(v48);
        end, l_dependencyArray_0(v48, v37.updateConversationTitle));
        local v61 = v25(v43 or {});
        local v64 = l_useSelector_0(l_useCallback_0(function(v62)
            return v29(v62, "ChatAppReducer.UnfilteredThreads.eligibility.isAgeEligible");
        end, {})) and l_useSelector_0(l_useCallback_0(function(v63)
            return v29(v63, "ChatAppReducer.UnfilteredThreads.eligibility.isIXPEligible") and v29(v63, "ChatAppReducer.UnfilteredThreads.eligibility.isRolloutEligible");
        end, {}));
        if v61 then
            return v3.createElement(v7, {
                conversationId = v37.conversationId, 
                topBarHeight = v37.topBarHeight, 
                networkErrorText = v58.networkErrorText, 
                pendingStateBodyText = v58.pendingStateBodyText, 
                navigateToToast = v37.navigateToToast, 
                shouldShowPhoneVerificationUpsell = v64, 
                shouldShowIneligibleModal = not v64, 
                style = v37.style
            });
        end;
    end;
    return v3.createElement(v6, v4.Dictionary.join(v37, v42, v58, {
        conversation = v43, 
        conversationTitle = v48, 
        itemList = v56, 
        localUserId = v50, 
        openGameDetailsPage = v37.openGameDetailsPage, 
        openViewProfile = v41, 
        readingMessagesIsEnabled = v37.getReadingMessagesIsEnabled(), 
        Users = v53, 
        usersTyping = v54, 
        onConversationUnmount = v59, 
        recipientIdsSerialized = v44, 
        chatIsVisible = v51
    }));
end;
return l_UniversalAppPolicy_0.connect(function(v65)
    return {
        viewProfileOnAvatarPressed = v65.getChatTapConversationThumbnail()
    };
end)(ChatConversationContainer);
