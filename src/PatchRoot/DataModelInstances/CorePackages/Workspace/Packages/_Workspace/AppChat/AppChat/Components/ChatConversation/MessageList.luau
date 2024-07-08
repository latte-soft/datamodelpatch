local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_BidirectionalFlatList_0 = require(l_Parent_0.VirtualizedList).BidirectionalFlatList;
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v6 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v7 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v8 = require(script.Parent.ChatMessage);
local v9 = require(script.Parent.SystemMessage);
local v10 = require(script.Parent.SystemMessageContainer);
local v11 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableChatSystemMessages);
local v14 = v2.PureComponent:extend("MessageList");
v14.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    autoScrollMaxIndex = 3, 
    bottomMargin = 10, 
    conversationId = nil, 
    initialFocusIndex = 1, 
    isDebugEnabled = false, 
    itemList = {}, 
    loadNext = function()
    end, 
    markAsRead = function()
    end, 
    messageListRef = nil, 
    onDetailsOpened = function()
    end, 
    openGameDetailsPage = function(_, _)
    end, 
    openViewProfile = nil, 
    wideMode = false, 
    viewProfileOnAvatarPressed = true, 
    invalidMessageTypeText = "PLACEHOLDER This message could not be displayed", 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    unknownUserText = "PLACEHOLDER unknown user"
};
local function v20(v17, v18)
    if not (v17 ~= nil) or v18 == nil then
        return false;
    else
        local v19;
        if v17.stable_key ~= nil then
            v19 = true;
            if not (v17.stable_key ~= v18.stable_key) then
                goto label0;
            end;
        end;
        v19 = false;
        if v17.messageId ~= nil then
            v19 = v17.messageId == v18.messageId;
        end;
        ::label0::;
        return v19;
    end;
end;
v14.init = function(v21)
    v21.state = {
        width = 0, 
        startIndex = 1, 
        firstItem = v21.props.itemList[1]
    };
    v21.focusIndex = v21.props.initialFocusIndex;
    v21.isValidMessageAndSenderType = function(v22, v23)
        if v23 == v5.SenderTypes.System then
            return v22 == v6.System;
        elseif v23 == v5.SenderTypes.User then
            local v24 = true;
            if v22 ~= v6.PlainText then
                v24 = v22 == v6.Link;
            end;
            return v24;
        else
            return false;
        end;
    end;
    v21.isValidMessageType = function(v25)
        local v26 = true;
        if v25 ~= v6.PlainText then
            v26 = v25 == v6.Link;
        end;
        return v26;
    end;
    v21.ref = v21.props.messageListRef or v2.createRef();
    v21.renderItem = function(v27)
        if not if not v13() then v21.isValidMessageType(v27.messageType) else v21.isValidMessageAndSenderType(v27.messageType, v27.senderType) then
            return v2.createElement(v9, {
                Text = v21.props.invalidMessageTypeText
            });
        else
            local v28 = v21.props.isDebugEnabled and v2.createElement("StringValue", {
                Value = tostring(v27.messageId)
            });
            if v13() and v27.messageType == v6.System then
                return v2.createElement(v10, {
                    text = v27.content, 
                    parentWidth = v21.state.width, 
                    sent = v27.sent, 
                    showDateTime = v27.showDateTime, 
                    debugElement = v28
                });
            else
                local l_additionalProps_0 = v27.additionalProps;
                if l_additionalProps_0 then
                    l_additionalProps_0.onDetailsOpened = v21.props.onDetailsOpened;
                end;
                if not l_additionalProps_0 then
                    l_additionalProps_0 = {};
                end;
                l_additionalProps_0.openGameDetailsPage = v21.props.openGameDetailsPage;
                return v2.createElement(v8, {
                    additionalProps = l_additionalProps_0, 
                    content = v27.content, 
                    debugElement = v28, 
                    failed = v27.failed, 
                    filteredForReceivers = v27.filteredForReceivers, 
                    isIncoming = v27.isIncoming, 
                    isNewSender = v27.isNewSender, 
                    isSending = v27.isSending, 
                    isUnfiltered = if not v12() then nil else v27.moderationType == v7.ModerationTypes.TrustedComms, 
                    messageDefaultNoticeText = v21.props.messageDefaultNoticeText, 
                    messageModeratedNoticeText = v21.props.messageModeratedNoticeText, 
                    messageType = v27.messageType, 
                    moderated = v27.moderated, 
                    openViewProfile = v21.props.openViewProfile, 
                    parentWidth = v21.state.width, 
                    readingMessagesIsEnabled = true, 
                    senderUserId = v27.sender.id, 
                    sent = v27.sent, 
                    showDateTime = v27.showDateTime, 
                    showDisplayName = v27.showDisplayName, 
                    shouldShowName = v27.sender.shouldShowName, 
                    thumbnail = v27.sender.thumbnail, 
                    wideMode = v21.props.wideMode, 
                    unknownUserText = v21.props.unknownUserText, 
                    viewProfileOnAvatarPressed = v21.props.viewProfileOnAvatarPressed
                });
            end;
        end;
    end;
    v21.updateWidth = function(v30)
        if v30.AbsoluteSize.X ~= v21.state.width then
            v21:setState({
                width = v30.AbsoluteSize.X
            });
        end;
    end;
    v21.changeFocus = function(v31)
        v21.isNearBottom = v31.anchorIndex <= v21.props.autoScrollMaxIndex + 1;
        v21.focusIndex = if not v21.isNearBottom then v31.anchorIndex + 1 else 1;
        if not (not (v31.anchorIndex == 1) or v21.props.itemList[1].read) then
            v21.props.markAsRead();
        end;
    end;
    v21.identifier = function(v32)
        return v32.messageId .. "|" .. (v32.position or "");
    end;
    v21.getScrollRef = function()
        if v21.ref.current == nil then
            return nil;
        else
            local v33 = v21.ref.current._listRef._scrollRef.getNativeScrollRef();
            if v33 == nil then
                return nil;
            else
                return v33._nativeRef.current;
            end;
        end;
    end;
    v21.calculateScrollOffset = function(v34)
        return (v34.AbsoluteCanvasSize.Y - v34.CanvasPosition.Y) - v34.AbsoluteWindowSize.Y;
    end;
    v21.onScroll = function(v35)
        local v36 = v21.calculateScrollOffset(v35);
        if v36 < 512 then
            v21:setState(function(_, v38)
                return {
                    firstItem = v38.itemList[1]
                };
            end);
        end;
        if v11() then
            if v36 < 64 then
                v21.props.markAsRead();
            end;
            v21.isNearBottom = v36 < 64;
        elseif not (v36 < 64) or v21.props.itemList[1].read then
            if v36 >= 64 then
                v21.isNearBottom = false;
                return ;
            end;
        else
            v21.props.markAsRead();
            v21.isNearBottom = true;
            return ;
        end;
    end;
end;
v14.getDerivedStateFromProps = function(v39, v40)
    if v40.firstItem == nil then
        return {
            startIndex = 1
        };
    else
        local v41 = 1;
        while v41 <= #v39.itemList do
            local v42 = v39.itemList[v41];
            local l_firstItem_0 = v40.firstItem;
            local v44;
            if not (v42 ~= nil) or l_firstItem_0 == nil then
                v44 = false;
            else
                if v42.stable_key ~= nil then
                    v44 = true;
                    if not (v42.stable_key ~= l_firstItem_0.stable_key) then
                        goto label1;
                    end;
                end;
                v44 = false;
                if v42.messageId ~= nil then
                    v44 = v42.messageId == l_firstItem_0.messageId;
                end;
            end;
            ::label1::;
            if not v44 then
                v41 = v41 + 1;
            else
                break;
            end;
        end;
        if #v39.itemList < v41 then
            return {
                startIndex = 1
            };
        else
            return {
                startIndex = v41
            };
        end;
    end;
end;
v14.didUpdate = function(v45, v46, _)
    if not (not (#v45.props.itemList < 30) or not v45.props.loadNext) and #v45.props.itemList ~= #v46.itemList then
        v45.props.loadNext();
    end;
    if v46.conversationId ~= v45.props.conversationId then
        v45.isNearBottom = true;
    end;
    local v48 = v45.getScrollRef();
    if if v48 ~= nil then v45.calculateScrollOffset(v48) else 0 < 64 then
        v45.isNearBottom = true;
        if v11() then
            if #v45.props.itemList > 0 then
                v45.props.markAsRead();
            end;
        elseif not (not (#v45.props.itemList > 0) or v45.props.itemList[1].read) then
            v45.props.markAsRead();
        end;
    end;
    if not ((not (v46.readingMessagesIsEnabled ~= v45.props.readingMessagesIsEnabled) or not v45.props.readingMessagesIsEnabled) or not v45.isNearBottom) then
        v45.props.markAsRead();
    end;
end;
v14.didMount = function(v49)
    if not (not (#v49.props.itemList < 30) or not v49.props.loadNext) then
        v49.props.loadNext();
    end;
    v49.isNearBottom = true;
end;
v14.renderScrollingFrame = function(v50)
    local v51 = {};
    local l_startIndex_0 = v50.state.startIndex;
    if l_startIndex_0 ~= 1 then
        local v53 = v50.getScrollRef();
        if if v53 ~= nil then v50.calculateScrollOffset(v53) else 0 < 128 then
            l_startIndex_0 = 1;
        end;
    end;
    if l_startIndex_0 ~= 1 then
        local v54 = v50.props.itemList[1];
        local l_firstItem_1 = v50.state.firstItem;
        local v56;
        if not (v54 ~= nil) or l_firstItem_1 == nil then
            v56 = false;
        else
            if v54.stable_key ~= nil then
                v56 = true;
                if not (v54.stable_key ~= l_firstItem_1.stable_key) then
                    goto label3;
                end;
            end;
            v56 = false;
            if v54.messageId ~= nil then
                v56 = v54.messageId == l_firstItem_1.messageId;
            end;
        end;
        ::label3::;
        if not v56 then
            table.move(v50.props.itemList, l_startIndex_0, #v50.props.itemList, 1, v51);
            goto label2 --[[  true, true  ]];
        end;
    end;
    v51 = v50.props.itemList;
    ::label2::;
    return v2.createElement(l_BidirectionalFlatList_0, {
        data = v51, 
        renderItem = function(v57)
            return v50.renderItem(v57.item);
        end, 
        inverted = true, 
        Size = v50.props.Size, 
        style = {
            BackgroundTransparency = 1, 
            ScrollBarThickness = 0, 
            Name = "MessageList"
        }, 
        contentContainerStyle = {
            BackgroundTransparency = 1
        }, 
        keyExtractor = function(v58, v59)
            return (v58.stable_key or v58.messageId) or v59;
        end, 
        windowSize = 5, 
        initialNumToRender = 30, 
        onScroll = v50.onScroll, 
        onEndReached = function()
            v50.props.loadNext();
            return v4.resolve();
        end, 
        onEndReachedThreshold = 300, 
        onStartReachedThreshold = 64, 
        compareItemData = v20, 
        scrollEventThrottle = v50.props.scrollEventThrottle or 75, 
        [v2.Ref] = v50.ref, 
        autoscrollToTopThreshold = 33, 
        enableAutoscrollToTop = true, 
        ListHeaderComponent = function()
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 10)
            });
        end, 
        showDefaultLoadingIndicators = false, 
        onContentSizeChange = function(v60, _)
            v50:setState({
                width = v60
            });
        end, 
        optimizeInvertedCanvasResize = true, 
        UNSTABLE_forceSiblingLayoutUpdate = true
    });
end;
v14.renderEmptyMessageList = function(v62)
    return v2.createElement("Frame", {
        Size = v62.props.Size, 
        BackgroundTransparency = 1
    });
end;
v14.render = function(v63)
    if #v63.props.itemList ~= 0 then
        return (v63:renderScrollingFrame());
    else
        return (v63:renderEmptyMessageList());
    end;
end;
return v14;
