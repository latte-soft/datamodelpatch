local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.llama);
local l_List_0 = v4.List;
local l_Dictionary_0 = v4.Dictionary;
local l_Set_0 = v4.Set;
local v8 = require(l_script_FirstAncestor_0.isWhiteSpaceOnly);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v10 = require(l_Actions_0.IncomingMessageReceived);
local v11 = require(l_Actions_0.IncomingBubbleChatMessageReceived);
local v12 = require(l_Actions_0.OutgoingMessageSent);
local v13 = require(l_Actions_0.UserMuted);
local v14 = require(l_Actions_0.UserUnmuted);
local v15 = require(l_Actions_0.PlayerRemoved);
local v16 = require(l_Actions_0.ChatPrivacySettingsReceived);
local v17 = require(l_Actions_0.ChatPrivacySettingsFetchFailed);
local v18 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v19 = require(l_Actions_0.BubbleChatSettingsChanged);
local v20 = require(l_Actions_0.ChatWindowMessagesCleared);
local v21 = require(l_Actions_0.ChatTranslationGlobalToggled);
local v22 = require(l_script_FirstAncestor_0.Actions.ChatTranslationMessageToggled);
local v23 = require(l_script_FirstAncestor_0.Actions.LegacyBubbleCreated);
local v24 = require(l_script_FirstAncestor_0.Actions.LegacyBubbleTextUpdated);
local v25 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTranslationUIEnabled);
local l_TextChatService_0 = game:GetService("TextChatService");
local v27 = require(l_script_FirstAncestor_0.Flags.FFlagAllowClearCommand);
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagFixInvalidMessagesShowingOnSenderSide);
local v29 = require(l_script_FirstAncestor_0.GlobalFlags);
getChatTranslationEnabled = function()
    local l_status_0, l_result_0 = pcall(function()
        return l_TextChatService_0.ChatTranslationEnabled;
    end);
    return l_status_0 and l_result_0;
end;
local v32 = {
    canLocalUserChat = false, 
    isBubbleChatEnabled = false, 
    _mutedUserIds = {}, 
    messageLimit = 50, 
    windowMessagesInOrder = {}, 
    byMessageId = {}, 
    bubbleMessagesInOrderBySenderId = {}, 
    mockUserIdToPartOrModel = {}, 
    partOrModelToMockUserId = {}
};
local function v46(v33, v34)
    if not v28() then
        if v8(v34.text) then
            return v33;
        end;
    elseif (v8(v34.text) and v34.status ~= Enum.TextChatMessageStatus.Floodchecked) and v34.status ~= Enum.TextChatMessageStatus.MessageTooLong then
        return v33;
    end;
    local l_partOrModel_0 = v34.partOrModel;
    local l_userId_0 = v34.userId;
    local l_messageId_0 = v34.messageId;
    local l_windowMessagesInOrder_0 = v33.windowMessagesInOrder;
    local l_byMessageId_0 = v33.byMessageId;
    local l_bubbleMessagesInOrderBySenderId_0 = v33.bubbleMessagesInOrderBySenderId;
    local l_mockUserIdToPartOrModel_0 = v33.mockUserIdToPartOrModel;
    local l_partOrModelToMockUserId_0 = v33.partOrModelToMockUserId;
    if not (l_userId_0 or not l_partOrModel_0) then
        l_userId_0 = l_partOrModelToMockUserId_0[l_partOrModel_0];
        if not l_userId_0 then
            l_userId_0 = l_HttpService_0:GenerateGUID(false);
            l_mockUserIdToPartOrModel_0 = l_Dictionary_0.join(l_mockUserIdToPartOrModel_0, {
                [l_userId_0] = l_partOrModel_0
            });
            l_partOrModelToMockUserId_0 = l_Dictionary_0.join(l_partOrModelToMockUserId_0, {
                [l_partOrModel_0] = l_userId_0
            });
        end;
    end;
    if not l_byMessageId_0[l_messageId_0] then
        if not (not (#l_windowMessagesInOrder_0 == v33.messageLimit) or not v34.isVisibleInChatWindow) then
            local v43 = l_windowMessagesInOrder_0[1];
            local v44 = if not l_byMessageId_0[v43] then nil else l_byMessageId_0[v43].userId;
            l_windowMessagesInOrder_0 = l_List_0.removeIndex(l_windowMessagesInOrder_0, 1);
            l_byMessageId_0 = l_Dictionary_0.removeKey(l_byMessageId_0, v43);
            if not (not v44 or not l_bubbleMessagesInOrderBySenderId_0[v44]) then
                l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.join(l_bubbleMessagesInOrderBySenderId_0, {
                    [v44] = l_List_0.removeValue(l_bubbleMessagesInOrderBySenderId_0[v44], v43)
                });
                if l_bubbleMessagesInOrderBySenderId_0[v44] and l_Dictionary_0.count(l_bubbleMessagesInOrderBySenderId_0[v44]) == 0 then
                    l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.removeKey(l_bubbleMessagesInOrderBySenderId_0, v44);
                    if l_mockUserIdToPartOrModel_0[v44] then
                        local v45 = l_mockUserIdToPartOrModel_0[v44];
                        if l_partOrModelToMockUserId_0[v45] then
                            l_partOrModelToMockUserId_0 = l_Dictionary_0.removeKey(l_partOrModelToMockUserId_0, v45);
                        end;
                        l_mockUserIdToPartOrModel_0 = l_Dictionary_0.removeKey(l_mockUserIdToPartOrModel_0, v44);
                    end;
                end;
            end;
        end;
        if v34.isVisibleInChatWindow then
            l_windowMessagesInOrder_0 = l_List_0.append(l_windowMessagesInOrder_0, l_messageId_0);
        end;
        return l_Dictionary_0.join(v33, {
            windowMessagesInOrder = l_windowMessagesInOrder_0, 
            byMessageId = l_Dictionary_0.join(l_byMessageId_0, {
                [l_messageId_0] = {
                    userId = l_userId_0, 
                    prefixText = v34.prefixText, 
                    text = v34.text, 
                    translation = v34.translation, 
                    useTranslation = v34.useTranslation, 
                    messageId = l_messageId_0, 
                    status = v34.status, 
                    timestamp = v34.timestamp, 
                    isVisibleInBubbleChat = v34.isVisibleInBubbleChat, 
                    isVisibleInChatWindow = v34.isVisibleInChatWindow, 
                    partOrModel = l_partOrModel_0, 
                    shouldOverrideBubbleChatSettings = v34.shouldOverrideBubbleChatSettings, 
                    bubbleChatMessageProperties = v34.bubbleChatMessageProperties
                }
            }), 
            bubbleMessagesInOrderBySenderId = l_userId_0 and l_Dictionary_0.join(l_bubbleMessagesInOrderBySenderId_0, {
                [l_userId_0] = l_List_0.append(l_bubbleMessagesInOrderBySenderId_0[l_userId_0] or {}, l_messageId_0)
            }), 
            mockUserIdToPartOrModel = l_mockUserIdToPartOrModel_0, 
            partOrModelToMockUserId = l_partOrModelToMockUserId_0
        });
    else
        l_byMessageId_0 = l_Dictionary_0.join(l_byMessageId_0, {
            [l_messageId_0] = {
                userId = l_userId_0, 
                prefixText = v34.prefixText, 
                text = v34.text, 
                translation = v34.translation, 
                useTranslation = v34.useTranslation, 
                textChannel = v34.textChannel, 
                messageId = l_messageId_0, 
                status = v34.status, 
                timestamp = v34.timestamp, 
                isVisibleInBubbleChat = v34.isVisibleInBubbleChat, 
                isVisibleInChatWindow = v34.isVisibleInChatWindow, 
                shouldOverrideBubbleChatSettings = v34.shouldOverrideBubbleChatSettings, 
                bubbleChatMessageProperties = v34.bubbleChatMessageProperties
            }
        });
        if v28() and (not (v34.status ~= Enum.TextChatMessageStatus.Floodchecked) or v34.status == Enum.TextChatMessageStatus.MessageTooLong) then
            l_windowMessagesInOrder_0 = l_List_0.removeIndex(l_windowMessagesInOrder_0, l_List_0.count(l_windowMessagesInOrder_0));
            l_byMessageId_0 = l_Dictionary_0.removeKey(l_byMessageId_0, v34.messageId);
            if l_userId_0 then
                l_bubbleMessagesInOrderBySenderId_0 = l_Dictionary_0.join(l_bubbleMessagesInOrderBySenderId_0, {
                    [l_userId_0] = l_List_0.removeValue(l_bubbleMessagesInOrderBySenderId_0[l_userId_0], v34.messageId)
                });
            end;
        end;
        return l_Dictionary_0.join(v33, {
            windowMessagesInOrder = l_windowMessagesInOrder_0, 
            byMessageId = l_byMessageId_0, 
            bubbleMessagesInOrderBySenderId = l_bubbleMessagesInOrderBySenderId_0
        });
    end;
end;
local function v55(v47, v48)
    local l_useTranslation_0 = v48.useTranslation;
    local l_byMessageId_1 = v47.byMessageId;
    local v51 = {};
    for v52, _ in pairs(l_byMessageId_1) do
        local v54 = l_byMessageId_1[v52];
        if v54 ~= nil then
            v51[v52] = {
                prefixText = v54.prefixText, 
                text = v54.text, 
                translation = v54.translation, 
                useTranslation = l_useTranslation_0, 
                messageId = v54.messageId, 
                status = v54.status, 
                timestamp = v54.timestamp, 
                isVisibleInBubbleChat = v54.isVisibleInBubbleChat, 
                isVisibleInChatWindow = v54.isVisibleInChatWindow, 
                partOrModel = v54.partOrModel, 
                shouldOverrideBubbleChatSettings = v54.shouldOverrideBubbleChatSettings, 
                bubbleChatMessageProperties = v54.bubbleChatMessageProperties, 
                userId = v54.userId, 
                textChannel = v54.textChannel
            };
        end;
    end;
    return l_Dictionary_0.join(v47, {
        byMessageId = l_Dictionary_0.join(l_byMessageId_1, v51)
    });
end;
local function v62(v56, v57)
    local l_useTranslation_1 = v57.useTranslation;
    local l_messageId_1 = v57.messageId;
    local l_byMessageId_2 = v56.byMessageId;
    local v61 = l_byMessageId_2[l_messageId_1];
    if v61 ~= nil then
        return l_Dictionary_0.join(v56, {
            byMessageId = l_Dictionary_0.join(l_byMessageId_2, {
                [l_messageId_1] = {
                    prefixText = v61.prefixText, 
                    text = v61.text, 
                    translation = v61.translation, 
                    useTranslation = l_useTranslation_1, 
                    messageId = v61.messageId, 
                    status = v61.status, 
                    timestamp = v61.timestamp, 
                    isVisibleInBubbleChat = v61.isVisibleInBubbleChat, 
                    isVisibleInChatWindow = v61.isVisibleInChatWindow, 
                    partOrModel = v61.partOrModel, 
                    shouldOverrideBubbleChatSettings = v61.shouldOverrideBubbleChatSettings, 
                    bubbleChatMessageProperties = v61.bubbleChatMessageProperties, 
                    userId = v61.userId, 
                    textChannel = v61.textChannel
                }
            })
        });
    else
        return nil;
    end;
end;
local function v66(v63, v64)
    local l_bubbleChatMessageTable_0 = v64.bubbleChatMessageTable;
    return v46(v63, {
        userId = l_bubbleChatMessageTable_0.bubbleChatMessageUserId, 
        prefixText = "", 
        text = l_bubbleChatMessageTable_0.message, 
        translation = if not v25() then nil else l_bubbleChatMessageTable_0.translation, 
        useTranslation = if not v25() then nil else getChatTranslationEnabled(), 
        messageId = l_bubbleChatMessageTable_0.bubbleChatMessageId, 
        status = Enum.TextChatMessageStatus.Success, 
        timestamp = l_bubbleChatMessageTable_0.timestamp, 
        partOrModel = l_bubbleChatMessageTable_0.partOrModel, 
        shouldOverrideBubbleChatSettings = true, 
        isVisibleInBubbleChat = true, 
        isVisibleInChatWindow = false, 
        bubbleChatMessageProperties = l_bubbleChatMessageTable_0.bubbleChatMessageProperties
    });
end;
local function v73(v67, v68)
    local l_textChatMessage_0 = v68.textChatMessage;
    local v70 = if not l_textChatMessage_0.TextSource then nil else tostring(l_textChatMessage_0.TextSource.UserId);
    local v71 = nil;
    v71 = (v70 == nil or if v67.canLocalUserChat then l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Success or l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Sending else false) and not (not not v70 and l_Set_0.has(v67._mutedUserIds, v70));
    local v72 = false;
    if not (not v67.isBubbleChatEnabled or not v71) and (not (l_textChatMessage_0.Status ~= Enum.TextChatMessageStatus.Success) or l_textChatMessage_0.Status == Enum.TextChatMessageStatus.Sending) then
        v72 = true;
    end;
    return v46(v67, {
        userId = v70, 
        prefixText = l_textChatMessage_0.PrefixText, 
        text = l_textChatMessage_0.Text, 
        translation = if not v25() then nil else l_textChatMessage_0.Translation, 
        useTranslation = if not v25() then nil else getChatTranslationEnabled(), 
        textChannel = l_textChatMessage_0.TextChannel, 
        messageId = l_textChatMessage_0.MessageId, 
        status = l_textChatMessage_0.Status, 
        timestamp = l_textChatMessage_0.Timestamp, 
        isVisibleInBubbleChat = v72, 
        isVisibleInChatWindow = v71, 
        bubbleChatMessageProperties = l_textChatMessage_0.BubbleChatMessageProperties
    });
end;
return v3.createReducer(v32, {
    [v10.name] = v73, 
    [v11.name] = v66, 
    [v12.name] = v73, 
    [v13.name] = function(v74, v75)
        return l_Dictionary_0.join(v74, {
            _mutedUserIds = l_Set_0.add(v74._mutedUserIds, v75.userId)
        });
    end, 
    [v14.name] = function(v76, v77)
        return l_Dictionary_0.join(v76, {
            _mutedUserIds = l_Set_0.subtract(v76._mutedUserIds, v77.userId)
        });
    end, 
    [v15.name] = function(v78, v79)
        return l_Dictionary_0.join(v78, {
            bubbleMessagesInOrderBySenderId = l_Dictionary_0.filter(v78.bubbleMessagesInOrderBySenderId, function(_, v81)
                return v81 ~= v79.userId;
            end), 
            _mutedUserIds = l_Set_0.subtract(v78._mutedUserIds, v79.userId)
        });
    end, 
    [v16.name] = function(v82, v83)
        return l_Dictionary_0.join(v82, {
            canLocalUserChat = v83.canUserChat
        });
    end, 
    [v17.name] = function(v84, _)
        return l_Dictionary_0.join(v84, {
            canLocalUserChat = false
        });
    end, 
    [v18.name] = function(v86, v87)
        return l_Dictionary_0.join(v86, {
            isBubbleChatEnabled = not not v87.bubbleChatSettings.Enabled and v87.bubbleChatSettings.Enabled
        });
    end, 
    [v19.name] = function(v88, v89)
        if v89.property ~= "Enabled" then
            return v88;
        else
            return l_Dictionary_0.join(v88, {
                byMessageId = l_Dictionary_0.map(v88.byMessageId, function(v90)
                    if not v90.shouldOverrideBubbleChatSettings then
                        return l_Dictionary_0.join(v90, {
                            isVisibleInBubbleChat = v89.value and v90.isVisibleInChatWindow
                        });
                    else
                        return v90;
                    end;
                end), 
                isBubbleChatEnabled = v89.value
            });
        end;
    end, 
    [v20.name] = function(v91, _)
        if not v27() then
            return v91;
        else
            return l_Dictionary_0.join(v91, {
                windowMessagesInOrder = {}, 
                byMessageId = l_Dictionary_0.map(v91.byMessageId, function(v93)
                    return l_Dictionary_0.join(v93, {
                        isVisibleInChatWindow = false
                    });
                end)
            });
        end;
    end, 
    [v21.name] = v55, 
    [v22.name] = v62, 
    [v23.name] = function(v94, v95)
        if v29.ConsolidateBubbleChat then
            local l_messageData_0 = v95.messageData;
            return v46(v94, {
                userId = l_messageData_0.userId, 
                prefixText = "", 
                text = l_messageData_0.text, 
                messageId = l_messageData_0.id, 
                status = Enum.TextChatMessageStatus.Success, 
                timestamp = if not l_messageData_0.timestamp then DateTime.now() else DateTime.fromUnixTimestampMillis(l_messageData_0.timestamp), 
                partOrModel = l_messageData_0.adornee, 
                shouldOverrideBubbleChatSettings = true, 
                isVisibleInBubbleChat = true, 
                isVisibleInChatWindow = false
            });
        else
            return v94;
        end;
    end, 
    [v24.name] = function(v97, v98)
        if v29.ConsolidateBubbleChat then
            local l_byMessageId_3 = v97.byMessageId;
            local l_messageId_2 = v98.messageId;
            local l_newText_0 = v98.newText;
            if l_byMessageId_3[l_messageId_2] then
                local v102 = l_byMessageId_3[l_messageId_2];
                v102.text = l_newText_0;
                l_byMessageId_3 = l_Dictionary_0.join(l_byMessageId_3, {
                    [l_messageId_2] = v102
                });
            end;
            return l_Dictionary_0.set(v97, "byMessageId", l_byMessageId_3);
        else
            return v97;
        end;
    end
});
