local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(script.Parent.MessageList);
local v7 = require(script.Parent.ChatInputBar);
local v8 = require(script.Parent.UserTypingIndicator);
local v9 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v12 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v13 = require(l_script_FirstAncestor_0.Flags.isAppChatFriendsSourceEnabled);
local v14 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v15 = require(l_script_FirstAncestor_0.Analytics.Enums.ConversationExitType);
local v16 = require(l_script_FirstAncestor_0.Analytics.Enums.SendMessageError);
local v17 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local v18 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v19 = require(l_script_FirstAncestor_0.Flags.getFFlagFixReleaseChatInputBarFocus);
local v20 = v2.PureComponent:extend("ChatConversation");
v20.defaultProps = {
    topBarHeight = 0, 
    conversationId = nil, 
    conversationTitle = nil, 
    itemList = {}, 
    inputBoxRef = nil, 
    wideMode = false, 
    getOlderMessages = function()
    end, 
    isDebugEnabled = false, 
    sendMessage = function()
    end, 
    navigateToToast = function()
    end, 
    markConversationAsRead = function()
    end, 
    postTypingStatus = function()
    end, 
    navigateBack = function()
    end, 
    openViewProfile = function()
    end, 
    updateConversationTitle = function()
    end, 
    openGameDetailsPage = function()
    end, 
    viewProfileOnAvatarPressed = true, 
    chatInputPlaceholder = "Say something", 
    usersTyping = {}, 
    invalidMessageTypeText = "PLACEHOLDER This message could not be displayed", 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    networkErrorText = "PLACEHOLDER There was a network error, please try again later", 
    unknownUserText = "PLACEHOLDER unknown user", 
    oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...", 
    twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...", 
    severalUsersTyping = "PLACEHOLDER Several users are typing...", 
    readingMessagesIsEnabled = true, 
    onConversationUnmount = function()
    end, 
    chatIsVisible = true
};
v20.init = function(v21)
    v21.state = {
        inputBarHeight = 0, 
        keyboardOffset = 0, 
        pendingStateModalHeight = 0
    };
    v21.inputBoxRef = v21.props.inputBoxRef or v2.createRef();
    v21.conversationViewRef = v2.createRef();
    v21.messageListRef = v2.createRef();
    v21.getKeyboardOffset = function()
        if not ((not l_UserInputService_0.OnScreenKeyboardVisible or not v21.inputBoxRef:getValue()) or not v21.inputBoxRef:getValue():IsFocused()) then
            local v22 = v21.conversationViewRef:getValue();
            if v22 then
                return (v22.AbsolutePosition.Y + v22.AbsoluteSize.Y) - l_UserInputService_0.OnScreenKeyboardPosition.Y;
            end;
        end;
        return 0;
    end;
    v21.updateKeyboardOffset = function()
        if v21.isMounted then
            local v23 = v21.getKeyboardOffset();
            if v21.state.keyboardOffset ~= v23 then
                v21:setState({
                    keyboardOffset = v23
                });
            end;
            return ;
        else
            return ;
        end;
    end;
    v21.clearKeyboardOffset = function()
        v21:setState({
            keyboardOffset = 0
        });
    end;
    v21.keyboardConnections = {
        l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(v21.updateKeyboardOffset), 
        l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardPosition"):connect(v21.updateKeyboardOffset)
    };
    v21.loadNext = l_memoize_0(function(v24, v25)
        return function()
            local v26 = v24(v25);
            if v26 then
                v26:catch(function()
                    v21.showNetworkErrorToast();
                end);
            end;
        end;
    end);
    v21.markAsRead = l_memoize_0(function(v27, v28, v29)
        return function()
            if v21.props.readingMessagesIsEnabled then
                v27(v28, v29);
            end;
        end;
    end);
    v21.showNetworkErrorToast = function()
        v21.props.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v21.props.networkErrorText
                }
            }
        });
    end;
    v21.onSendChat = l_memoize_0(function(v30, v31, v32, v33, v34, v35, v36)
        return function(v37)
            if not (not v13() or not v34) and v34.source == "friends" then
                v9:info("Creating a conversation for friend conversation {} via onSendChat", v31);
                local v38, v39 = v35(v31, v33):await();
                if not v38 or not v39 then
                    v9:error("Could not create conversation. Error: {}", (tostring(v39)));
                    return ;
                else
                    v9:debug("Created conversation {} for friend conversation {} via onSendChat", v39.id, v31);
                    v31 = v39.id;
                    v36(v39.id);
                end;
            end;
            v9:info("Sending message '{}' to conversationId {} via onSendChat", v37, v31);
            local v40 = v30(v31, v37);
            if not v12() or not v40 then
                if v32 then
                    v32(v31);
                end;
            else
                v40:andThen(function(v41)
                    if v41 and v41.responseCode == l_StatusCodes_0.CONFLICT then
                        v21.showNetworkErrorToast();
                        return ;
                    else
                        if v32 then
                            v32(v31);
                        end;
                        return ;
                    end;
                end);
            end;
            if v33 then
                local v42 = {
                    conversationId = v31, 
                    messageSentResult = v16.OtherFailure, 
                    recipientIds = v21.props.recipientIdsSerialized
                };
                if v40 then
                    v40:andThen(function(v43)
                        local v44 = nil;
                        local v45 = nil;
                        if not v12() then
                            if v43 then
                                if v43.responseBody then
                                    if v43.responseBody.resultType then
                                        v44 = v43.responseBody.resultType;
                                        v45 = v43.responseBody.messageId;
                                    else
                                        v44 = v16.DEPRECATED_NoResultType;
                                        v45 = v43.responseBody.messageId;
                                    end;
                                else
                                    v44 = v16.NoResponseBody;
                                end;
                            else
                                v44 = v16.NoResponse;
                            end;
                        elseif v43 then
                            if v43.responseCode == l_StatusCodes_0.CONFLICT then
                                v44 = v16.Conflict;
                            elseif v43.responseBody then
                                if not v43.responseBody.messages or #v43.responseBody.messages == 0 then
                                    v44 = v16.NoMessages;
                                elseif v43.responseBody.messages[1].status then
                                    v44 = v43.responseBody.messages[1].status;
                                    v45 = v43.responseBody.messages[1].id;
                                else
                                    v44 = v16.NoMessageStatus;
                                end;
                            else
                                v44 = v16.NoResponseBody;
                            end;
                        else
                            v44 = v16.NoResponse;
                        end;
                        v33.fireAnalyticsEvent(v14.ConversationMessageSent, {
                            conversationId = v31, 
                            messageSentResult = v44, 
                            messageId = v45, 
                            recipientIds = v21.props.recipientIdsSerialized
                        });
                    end):catch(function()
                        v33.fireAnalyticsEvent(v14.ConversationMessageSent, v42);
                    end);
                else
                    v33.fireAnalyticsEvent(v14.ConversationMessageSent, v42);
                    return ;
                end;
            end;
        end;
    end);
    v21.onSendBtnClicked = l_memoize_0(function(v46)
        if not v46 then
            return nil;
        else
            return function(v47)
                v46.fireAnalyticsEvent(v14.ConversationSendBtnClicked, {
                    conversationId = v21.props.conversationId, 
                    sendBtnClickResult = v47
                });
            end;
        end;
    end);
    v21.onHeightChanged = function(v48)
        v21:setState(function(v49, _)
            if v48 ~= v49.inputBarHeight then
                return {
                    inputBarHeight = v48
                };
            else
                return {};
            end;
        end);
    end;
    v21.lastTypingRequest = 0;
    v21.chatInputTextChanged = function()
        if v21.props.conversation and v21.props.conversation.source == "friends" then
            return ;
        else
            local v51 = tick();
            if v51 - v21.lastTypingRequest >= 3 then
                v21.lastTypingRequest = v51;
                v21.props.postTypingStatus(v21.props.conversationId, true);
            end;
            return ;
        end;
    end;
    v21.exitTypeForAnalytics = v15.Default;
    v21.onTouchSwipe = function(_, v53, v54)
        if (not v21.props.wideMode and v53 == Enum.SwipeDirection.Right) and v54 == 1 then
            v21.exitTypeForAnalytics = v15.SwipedRight;
            v21.props.navigateBack();
        end;
    end;
    v21.fireAnalyticsEventOnUnmount = function()
        v21.props.onConversationUnmount(v21.exitTypeForAnalytics);
        v21.exitTypeForAnalytics = v15.Default;
    end;
    v21.closeKeyboard = function()
        v21.inputBoxRef:getValue():ReleaseFocus();
    end;
    v21.getUnreadConversationCount = function()
        if v21.props.getUnreadConversationCount then
            v21.props.getUnreadConversationCount();
        end;
    end;
    v21.onSizeChange = function()
        v21.updateKeyboardOffset();
    end;
    v21.calculateScrollOffset = function(v55)
        return (v55.AbsoluteCanvasSize.Y - v55.CanvasPosition.Y) - v55.AbsoluteWindowSize.Y;
    end;
    if not v19() then
        v21.openViewProfile = function(...)
            v21.closeKeyboard();
            v21.props.openViewProfile(...);
        end;
    end;
end;
v20.didMount = function(v56)
    v56.isMounted = true;
    if not v18() then
        v56.props.updateConversationTitle(v56.props.conversationTitle);
    end;
    v56.markAsRead(v56.props.markConversationAsRead, v56.props.conversationId, false)();
end;
v20.willUpdate = function(v57, v58, _)
    if (not v18() and v58.conversationTitle ~= v57.props.conversationTitle) and v58.conversationTitle ~= "" then
        v57.props.updateConversationTitle(v58.conversationTitle);
    end;
    if not (not (v19() and v58.chatIsVisible ~= v57.props.chatIsVisible) or v58.chatIsVisible) then
        v57.closeKeyboard();
    end;
end;
v20.didUpdate = function(v60, v61, v62)
    if v61.conversationId ~= v60.props.conversationId then
        v60.inputBoxRef:getValue().Text = "";
        v60.inputBoxRef:getValue():ReleaseFocus();
        v60.markAsRead(v60.props.markConversationAsRead, v60.props.conversationId, false)();
    end;
    if not (v60.state.keyboardOffset == v62.keyboardOffset) or v60.state.inputBarHeight ~= v62.inputBarHeight then
        local v63 = (v60.messageListRef and v60.messageListRef.current) and v60.messageListRef.current._listRef;
        local v64 = (v63 and v63._scrollRef) and v63._scrollRef.getNativeScrollRef();
        if not (not v63 or not v64) then
            v63:scrollToOffset({
                offset = (v60.calculateScrollOffset(v64._nativeRef.current) - (v60.state.keyboardOffset - v62.keyboardOffset)) - (v60.state.inputBarHeight - v62.inputBarHeight)
            });
        end;
    end;
end;
v20.willUnmount = function(v65)
    for _, v67 in ipairs(v65.keyboardConnections) do
        v67:Disconnect();
    end;
    v65.fireAnalyticsEventOnUnmount();
    v65.keyboardConnections = {};
    v65.isMounted = false;
end;
v20.render = function(v68)
    local v69 = #v68.props.usersTyping > 0;
    local v70 = not not v68.props.conversation and v68.props.conversation.source == "friends";
    local v71 = "MessageList" .. tostring(v68.props.conversationId);
    return v17(function(v72)
        return l_withStyle_0(function(v73)
            return v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v73.Theme.BackgroundDefault.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, -v68.props.topBarHeight), 
                Text = "", 
                Transparency = v73.Theme.BackgroundDefault.Transparency, 
                [v2.Change.AbsoluteSize] = v68.onSizeChange, 
                [v2.Event.TouchSwipe] = v68.onTouchSwipe, 
                [v2.Event.TouchTap] = v68.closeKeyboard, 
                [v2.Event.MouseButton1Down] = v68.closeKeyboard, 
                [v2.Ref] = v68.conversationViewRef
            }, {
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                MessageListFrame = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 1, -v68.state.inputBarHeight - v68.state.keyboardOffset)
                }, {
                    [v71] = v2.createElement(v6, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        bottomMargin = 28, 
                        conversationId = v68.props.conversationId, 
                        isDebugEnabled = v68.props.isDebugEnabled, 
                        itemList = v68.props.itemList, 
                        loadNext = if not v70 then v68.loadNext(v68.props.getOlderMessages, v68.props.conversationId) else nil, 
                        localUserId = v68.props.localUserId, 
                        markAsRead = v68.markAsRead(v68.props.markConversationAsRead, v68.props.conversationId), 
                        messageListRef = v68.messageListRef, 
                        openViewProfile = if not v19() then v68.openViewProfile else v68.props.openViewProfile, 
                        onDetailsOpened = v68.closeKeyboard, 
                        wideMode = v68.props.wideMode, 
                        viewProfileOnAvatarPressed = v68.props.viewProfileOnAvatarPressed, 
                        readingMessagesIsEnabled = v68.props.readingMessagesIsEnabled, 
                        invalidMessageTypeText = v68.props.invalidMessageTypeText, 
                        messageDefaultNoticeText = v68.props.messageDefaultNoticeText, 
                        messageModeratedNoticeText = v68.props.messageModeratedNoticeText, 
                        unknownUserText = v68.props.unknownUserText, 
                        openGameDetailsPage = v68.props.openGameDetailsPage
                    }), 
                    UserTypingIndicator = v69 and v2.createElement(v8, {
                        AnchorPoint = Vector2.new(0, 1), 
                        Position = UDim2.new(0, 0, 1, 0), 
                        ZIndex = 2, 
                        height = 28, 
                        usersTyping = v68.props.usersTyping, 
                        oneUserTyping = v68.props.oneUserTyping, 
                        twoUsersTyping = v68.props.twoUsersTyping, 
                        severalUsersTyping = v68.props.severalUsersTyping
                    })
                }), 
                ChatInputBar = v2.createElement(v7, {
                    LayoutOrder = 2, 
                    onFocusLost = v68.clearKeyboardOffset, 
                    conversationId = v68.props.conversationId, 
                    inputBoxRef = v68.inputBoxRef, 
                    localUserId = v68.props.localUserId, 
                    messageListRef = v68.messageListRef, 
                    onHeightChanged = v68.onHeightChanged, 
                    onSendChat = v68.onSendChat(v68.props.sendMessage, v68.props.conversationId, v68.props.markConversationAsRead, v72, v68.props.conversation, v68.props.createFriendConversation, v68.props.navigateToChatConversation), 
                    onSendBtnClicked = v68.onSendBtnClicked(v72), 
                    onTextChanged = v68.chatInputTextChanged, 
                    placeholderText = v68.props.chatInputPlaceholder
                })
            });
        end);
    end);
end;
return v20;
