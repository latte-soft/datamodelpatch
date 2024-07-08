local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AppChatNetworking);
local v4 = require(l_Parent_0.Rodux);
local v5 = require(l_Parent_0.LuauPolyfill);
local v6 = require(l_script_FirstAncestor_0.Conversations);
local v7 = require(l_script_FirstAncestor_0.Conversations.Actions.ChangedParticipants);
local v8 = require(l_script_FirstAncestor_0.Conversations.Actions.HasUnreadMessages);
local v9 = require(l_script_FirstAncestor_0.Conversations.Actions.FetchedOldestMessage);
local v10 = require(l_script_FirstAncestor_0.Conversations.Actions.FetchingOlderMessages);
local l_MessageFailedToSend_0 = v6.Actions.MessageFailedToSend;
local l_MessageModerated_0 = v6.Actions.MessageModerated;
local v13 = require(l_script_FirstAncestor_0.Conversations.Actions.ReadConversation);
local v14 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedConversation);
local l_ReceivedMessages_0 = v6.Actions.ReceivedMessages;
local v16 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v17 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedChannelsMigrationConflict);
local v18 = require(l_script_FirstAncestor_0.Conversations.Actions.RenamedGroupConversation);
local l_SendingMessage_0 = v6.Actions.SendingMessage;
local l_SentMessage_0 = v6.Actions.SentMessage;
local v21 = require(l_script_FirstAncestor_0.Conversations.Actions.SetConversationLoadingStatus);
local v22 = require(l_script_FirstAncestor_0.Conversations.Actions.SetPinnedGameForConversation);
local v23 = require(l_script_FirstAncestor_0.Conversations.Actions.SetUserLeavingConversation);
local v24 = require(l_script_FirstAncestor_0.Conversations.Actions.SetUserTyping);
local v25 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
local v26 = require(l_script_FirstAncestor_0.Actions.FriendshipDestroyed);
local v27 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v28 = require(l_script_FirstAncestor_0.Models.Conversation);
local v29 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_OrderedMap_0 = require(l_Parent_0.AppCommonLib).OrderedMap;
local l_Functional_0 = require(l_Parent_0.AppCommonLib).Functional;
local v33 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v34 = require(l_script_FirstAncestor_0.Utils.updateConversation);
local v35 = require(l_script_FirstAncestor_0.Utils.addConversation);
local v36 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v37 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v38 = require(l_script_FirstAncestor_0.Flags.getFFlagFixChatNilMessages);
local function v44(v39, v40)
    local v41 = v39[v40];
    if v41 then
        local v43 = l_Immutable_0.Set(l_Immutable_0.Set(v41, "messages", (v41.messages:Map(function(v42)
            if not v42.read then
                return l_Immutable_0.Set(v42, "read", true);
            else
                return v42;
            end;
        end))), "hasUnreadMessages", false);
        return (l_Immutable_0.Set(v39, v43.id, v43));
    else
        warn("Conversation " .. v40 .. " not found in ReadConversation reducer");
        return ;
    end;
end;
local function v55(v45, v46, v47)
    local v48 = v45[v46];
    if not v48 then
        return v45;
    else
        local v49 = nil;
        for v50 = 1, #v47.messages do
            local v51 = v47.messages[v50];
            local v52 = v48.messages:Get(v51.id);
            if v52 then
                if v49 then
                    v49.previousMessageId = v52.id;
                end;
                if v51.previousMessageId == nil and v52.previousMessageId ~= nil then
                    v51.previousMessageId = v52.previousMessageId;
                end;
                v51.read = v51.read or v52.read;
            end;
            v49 = v51;
        end;
        local v53 = l_OrderedMap_0.Insert(v48.messages, unpack(v47.messages));
        if not (not (v47.exclusiveStartMessageId and #v47.messages > 0) or not v53:Get(v47.exclusiveStartMessageId)) then
            v53 = v53:Insert((l_Immutable_0.Set(v53:Get(v47.exclusiveStartMessageId), "previousMessageId", v47.messages[1].id)));
        end;
        v49 = v53.values[v53.keys[#v53.keys]];
        if v49 ~= nil then
            local v54 = l_Immutable_0.Set(l_Immutable_0.JoinDictionaries(v48, {
                messages = v53, 
                lastUpdated = (not not v48.lastUpdated and v48.lastUpdated:GetUnixTimestamp() or 0) < v49.sent:GetUnixTimestamp() and v49.sent or v48.lastUpdated, 
                hasUnreadMessages = v47.shouldMarkConversationUnread or v48.hasUnreadMessages, 
                nextCursor = v47.nextCursor, 
                previousCursor = v47.previousCursor
            }), "usersTyping", {});
            return l_Immutable_0.Set(v45, v54.id, v54);
        else
            return v45;
        end;
    end;
end;
local function v64(v56, v57, v58)
    local v59 = v56[v57];
    if v59 then
        local v60 = {};
        for v61, v62 in v58, nil, nil do
            v60[tostring(v61)] = {
                isPending = v62.is_pending
            };
        end;
        local v63 = l_Immutable_0.JoinDictionaries(v59, {
            participantMetadata = v60
        });
        return (l_Immutable_0.Set(v56, v63.id, v63));
    else
        return v56;
    end;
end;
local function _(v65, v66)
    if v66 then
        local v67 = nil;
        return (l_Functional_0.MapReverse(v66, function(v68)
            local v69 = v33.fromWeb(v68, v65, v67);
            v67 = v69.id;
            return v69;
        end));
    else
        return {};
    end;
end;
local function v79(v71, v72)
    if v72 then
        local v73 = nil;
        if not v38() then
            return (l_Functional_0.MapReverse(v72, function(v74)
                local v75 = v33.fromChannelsApi(v74, v71, v73);
                if v75 then
                    v73 = v75.id;
                end;
                return v75;
            end));
        else
            local v76 = {};
            for v77 = #v72, 1, -1 do
                local v78 = v33.fromChannelsApi(v72[v77], v71, v73);
                if v78 then
                    table.insert(v76, v78);
                    v73 = v78.id;
                end;
            end;
            return v76;
        end;
    else
        return {};
    end;
end;
local function _(v80)
    local v81 = not not v80 and v80[1] or nil;
    local v82;
    if v81 then
        v82 = true;
        if not (v81.senderTargetId ~= tostring(l_Players_0.LocalPlayer.UserId)) then
            goto label0;
        end;
    end;
    v82 = false;
    ::label0::;
    return v82;
end;
return v4.createReducer({}, {
    [v14.name] = function(v84, v85)
        return v35(v84, v85.conversation);
    end, 
    [v27.StartGroupConversation.Succeeded.name] = function(v86, v87)
        return v35(v86, v28.fromWeb(v87.responseBody.conversation));
    end, 
    [v27.StartOneToOneConversation.Succeeded.name] = function(v88, v89)
        return v35(v88, v28.fromWeb(v89.responseBody.conversation));
    end, 
    [v3.rodux.CreateConversation.Succeeded.name] = function(v90, v91)
        local l_responseBody_0 = v91.responseBody;
        if not ((not l_responseBody_0 or not l_responseBody_0.conversations) or not l_responseBody_0.conversations[1]) and l_responseBody_0.conversations[1].status == "success" then
            v90 = v35(v90, (v29.fromChannelsApi(l_responseBody_0.conversations[1])));
        end;
        return v90;
    end, 
    [v3.rodux.DuplicateConversation.Succeeded.name] = if not v37() then nil else function(v93, v94)
        local l_responseBody_1 = v94.responseBody;
        if not ((not l_responseBody_1 or not l_responseBody_1.conversations) or not l_responseBody_1.conversations[1]) then
            v93 = v35(v93, (v29.fromChannelsApi(l_responseBody_1.conversations[1])));
        end;
        return v93;
    end, 
    [l_ReceivedMessages_0.name] = function(v96, v97)
        return v55(v96, v97.conversationId, v97);
    end, 
    [l_SendingMessage_0.name] = function(v98, v99)
        local v100 = v98[v99.conversationId];
        if v100 then
            local v101 = l_Immutable_0.Set(v100, "sendingMessages", (l_OrderedMap_0.Insert(v100.sendingMessages, v99.message)));
            v98 = l_Immutable_0.Set(v98, v101.id, v101);
        end;
        return v98;
    end, 
    [l_SentMessage_0.name] = function(v102, v103)
        local v104 = v102[v103.conversationId];
        if v104 then
            local v105 = l_Immutable_0.Set(v104, "sendingMessages", (l_OrderedMap_0.Delete(v104.sendingMessages, v103.messageId)));
            v102 = l_Immutable_0.Set(v102, v105.id, v105);
        end;
        return v102;
    end, 
    [v18.name] = function(v106, v107)
        local l_conversationId_0 = v107.conversationId;
        local v109 = v106[l_conversationId_0];
        if v109 then
            v106 = l_Immutable_0.Set(v106, l_conversationId_0, (l_Immutable_0.JoinDictionaries(v109, {
                lastUpdated = v107.lastUpdated, 
                title = v107.title, 
                isDefaultTitle = v107.isDefaultTitle
            })));
        end;
        return v106;
    end, 
    [v8.name] = function(v110, v111)
        local v112 = v111.conversation and v110[v111.conversation.id];
        if v112 then
            v110 = l_Immutable_0.Set(v110, v111.conversation.id, (l_Immutable_0.Set(v112, "hasUnreadMessages", true)));
        end;
        return v110;
    end, 
    [v7.name] = function(v113, v114)
        local l_conversationId_1 = v114.conversationId;
        local l_participants_0 = v114.participants;
        local v117 = v113[l_conversationId_1];
        if v117 then
            v113 = l_Immutable_0.Set(v113, l_conversationId_1, (l_Immutable_0.JoinDictionaries(v117, {
                participants = l_participants_0, 
                lastUpdated = v114.lastUpdated, 
                title = v114.title
            })));
        end;
        return v113;
    end, 
    [v16.name] = function(v118, v119)
        return l_Immutable_0.Set(v118, v119.conversationId, nil);
    end, 
    [v24.name] = function(v120, v121)
        local v122 = v120[v121.conversationId];
        if v122 then
            local v123 = l_Immutable_0.Set(v122, "usersTyping", (l_Immutable_0.Set(v122.usersTyping, v121.userId, v121.value)));
            v120 = l_Immutable_0.Set(v120, v123.id, v123);
        end;
        return v120;
    end, 
    [v10.name] = function(v124, v125)
        local v126 = v124[v125.conversationId];
        if v126 then
            local v127 = l_Immutable_0.Set(v126, "fetchingOlderMessages", v125.fetchingOlderMessages);
            v124 = l_Immutable_0.Set(v124, v127.id, v127);
        end;
        return v124;
    end, 
    [v9.name] = function(v128, v129)
        local v130 = l_Immutable_0.Set(v128[v129.conversationId], "fetchedOldestMessage", v129.fetchedOldestMessage);
        return l_Immutable_0.Set(v128, v130.id, v130);
    end, 
    [v13.name] = function(v131, v132)
        return v44(v131, v132.conversationId);
    end, 
    [l_MessageModerated_0.name] = function(v133, v134)
        local v135 = v133[v134.conversationId];
        local v136 = v135.sendingMessages:Get(v134.messageId);
        if v136 then
            local v137 = l_Immutable_0.Set(v135, "sendingMessages", (v135.sendingMessages:Insert((l_Immutable_0.Set(v136, "moderated", true)))));
            v133 = l_Immutable_0.Set(v133, v137.id, v137);
        end;
        return v133;
    end, 
    [l_MessageFailedToSend_0.name] = function(v138, v139)
        local v140 = v138[v139.conversationId];
        local v141 = v140.sendingMessages:Get(v139.messageId);
        if v141 then
            local v142 = l_Immutable_0.Set(v140, "sendingMessages", (v140.sendingMessages:Insert((l_Immutable_0.Set(v141, "failed", true)))));
            v138 = l_Immutable_0.Set(v138, v142.id, v142);
        end;
        return v138;
    end, 
    [v21.name] = function(v143, v144)
        local v145 = l_Immutable_0.Set(v143[v144.conversationId], "initialLoadingStatus", v144.value);
        return l_Immutable_0.Set(v143, v145.id, v145);
    end, 
    [v23.name] = function(v146, v147)
        local v148 = v146[v147.id];
        if v148 then
            local v149 = l_Immutable_0.Set(v148, "isUserLeaving", v147.isLeaving);
            v146 = l_Immutable_0.Set(v146, v149.id, v149);
        end;
        return v146;
    end, 
    [v22.name] = function(v150, v151)
        local l_conversationId_2 = v151.conversationId;
        local v153 = v150[l_conversationId_2];
        if v153 then
            v150 = l_Immutable_0.Set(v150, l_conversationId_2, (l_Immutable_0.JoinDictionaries(v153, {
                pinnedGame = {
                    rootPlaceId = v151.rootPlaceId, 
                    universeId = v151.universeId
                }
            })));
        end;
        return v150;
    end, 
    [v27.GetUserConversations.Succeeded.name] = function(v154, v155)
        for _, v157 in ipairs(v155.responseBody) do
            v154 = v34(v154, (v28.fromWeb(v157)));
        end;
        return v154;
    end, 
    [v3.rodux.GetUserConversations.Succeeded.name] = function(v158, v159)
        local l_responseBody_2 = v159.responseBody;
        if not (not l_responseBody_2 or not l_responseBody_2.conversations) then
            for _, v162 in l_responseBody_2.conversations, nil, nil do
                local v163 = v29.fromChannelsApi(v162);
                v158 = v34(v158, v163);
                local l_messages_0 = v162.messages;
                if l_messages_0 and #l_messages_0 > 0 then
                    v158 = v55(v158, v163.id, {
                        messages = v5.Array.map(l_messages_0, function(v165)
                            return v33.fromChannelsApi(v165, v163.id);
                        end)
                    });
                end;
            end;
        end;
        return v158;
    end, 
    [v27.GetConversations.Succeeded.name] = function(v166, v167)
        for _, v169 in ipairs(v167.responseBody) do
            v166 = v35(v166, (v28.fromWeb(v169)));
        end;
        return v166;
    end, 
    [v3.rodux.GetOlderMessages.Succeeded.name] = function(v170, v171)
        local l_conversation_id_0 = v171.queryArgs.conversation_id;
        local l_responseBody_3 = v171.responseBody;
        local v174 = {};
        local v175 = not not v170[l_conversation_id_0] and v170[l_conversation_id_0].previousCursor or nil;
        local v176 = not not v170[l_conversation_id_0] and v170[l_conversation_id_0].nextCursor or nil;
        if l_responseBody_3 then
            v174 = v79(l_conversation_id_0, l_responseBody_3.messages);
            local v177 = if l_responseBody_3.next_cursor == "" then nil else l_responseBody_3.next_cursor;
            if v177 then
                v176 = v177;
            end;
            if v175 == nil then
                v175 = if l_responseBody_3.previous_cursor == "" then nil else l_responseBody_3.previous_cursor;
            end;
            v170 = v55(v170, l_conversation_id_0, {
                messages = v174, 
                nextCursor = v176, 
                previousCursor = v175
            });
            if not v177 then
                local v178 = v170[l_conversation_id_0];
                if v178 then
                    local v179 = l_Immutable_0.Set(v178, "fetchedOldestMessage", true);
                    v170 = l_Immutable_0.Set(v170, v179.id, v179);
                else
                    return v170;
                end;
            end;
            return v170;
        else
            return v170;
        end;
    end, 
    [v3.rodux.GetNewerMessages.Succeeded.name] = function(v180, v181)
        local l_conversation_id_1 = v181.queryArgs.conversation_id;
        local l_responseBody_4 = v181.responseBody;
        local v184 = {};
        local v185 = not not v180[l_conversation_id_1] and v180[l_conversation_id_1].previousCursor or nil;
        local v186 = not not v180[l_conversation_id_1] and v180[l_conversation_id_1].nextCursor or nil;
        if l_responseBody_4 then
            v184 = v79(l_conversation_id_1, l_responseBody_4.messages);
            if v186 == nil then
                v186 = if l_responseBody_4.next_cursor == "" then nil else l_responseBody_4.next_cursor;
            end;
            local v187 = if l_responseBody_4.previous_cursor == "" then nil else l_responseBody_4.previous_cursor;
            if v187 then
                v185 = v187;
            end;
            local v188 = {
                messages = v184, 
                nextCursor = v186, 
                previousCursor = v185
            };
            local l_v184_0 = v184;
            local v190 = not not l_v184_0 and l_v184_0[1] or nil;
            local v191;
            if v190 then
                v191 = true;
                if not (v190.senderTargetId ~= tostring(l_Players_0.LocalPlayer.UserId)) then
                    goto label1;
                end;
            end;
            v191 = false;
            ::label1::;
            v188.shouldMarkConversationUnread = not v191;
            return (v55(v180, l_conversation_id_1, v188));
        else
            return v180;
        end;
    end, 
    [v27.GetMessages.Succeeded.name] = function(v192, v193)
        local l_conversationId_3 = v193.queryArgs.conversationId;
        local l_responseBody_5 = v193.responseBody;
        local v196;
        if l_responseBody_5 then
            local v197 = nil;
            do
                local l_v197_0 = v197;
                v196 = l_Functional_0.MapReverse(l_responseBody_5, function(v199)
                    local v200 = v33.fromWeb(v199, l_conversationId_3, l_v197_0);
                    l_v197_0 = v200.id;
                    return v200;
                end);
            end;
        else
            v196 = {};
        end;
        l_responseBody_5 = {
            messages = v196
        };
        local v201 = not not v196 and v196[1] or nil;
        local v202;
        if v201 then
            v202 = true;
            if not (v201.senderTargetId ~= tostring(l_Players_0.LocalPlayer.UserId)) then
                goto label2;
            end;
        end;
        v202 = false;
        ::label2::;
        l_responseBody_5.shouldMarkConversationUnread = not v202;
        v192 = v55(v192, l_conversationId_3, l_responseBody_5);
        local l_pageSize_0 = v193.queryArgs.pageSize;
        if l_pageSize_0 and #v196 < l_pageSize_0 then
            v202 = v192[l_conversationId_3];
            if v202 then
                v201 = l_Immutable_0.Set(v202, "fetchedOldestMessage", true);
                v192 = l_Immutable_0.Set(v192, v201.id, v201);
            else
                return v192;
            end;
        end;
        return v192;
    end, 
    [v27.GetLatestMessages.Succeeded.name] = function(v204, v205)
        for _, v207 in ipairs(v205.responseBody) do
            local v208 = tostring(v207.conversationId);
            local l_chatMessages_0 = v207.chatMessages;
            local v210;
            if l_chatMessages_0 then
                local v211 = nil;
                do
                    local l_v211_0 = v211;
                    v210 = l_Functional_0.MapReverse(l_chatMessages_0, function(v213)
                        local v214 = v33.fromWeb(v213, v208, l_v211_0);
                        l_v211_0 = v214.id;
                        return v214;
                    end);
                end;
            else
                v210 = {};
            end;
            v204 = v55(v204, v208, {
                messages = v210
            });
        end;
        return v204;
    end, 
    [v3.rodux.GetConversationDetails.Succeeded.name] = function(v215, v216)
        local v217 = v216.responseBody.conversations[1];
        local v218 = v29.fromChannelsApi(v217);
        v215 = if not v37() then v35(v215, v218) else v34(v215, v218);
        local l_messages_1 = v217.messages;
        if l_messages_1 and #l_messages_1 > 0 then
            v215 = v55(v215, v218.id, {
                messages = v5.Array.map(l_messages_1, function(v220)
                    return v33.fromChannelsApi(v220, v218.id);
                end)
            });
        end;
        return v215;
    end, 
    [v3.rodux.MultiGetConversationDetails.Succeeded.name] = function(v221, v222)
        local l_responseBody_6 = v222.responseBody;
        if l_responseBody_6 and l_responseBody_6.conversations then
            for _, v225 in l_responseBody_6.conversations, nil, nil do
                local v226 = v29.fromChannelsApi(v225);
                v221 = if not v37() then v35(v221, v226) else v34(v221, v226);
                local l_messages_2 = v225.messages;
                if l_messages_2 and #l_messages_2 > 0 then
                    v221 = v55(v221, v226.id, {
                        messages = v5.Array.map(l_messages_2, function(v228)
                            return v33.fromChannelsApi(v228, v226.id);
                        end)
                    });
                end;
            end;
            return v221;
        else
            return v221;
        end;
    end, 
    [v3.rodux.MarkConversation.Succeeded.name] = function(v229, v230)
        return v44(v229, v230.postBody.conversation_ids[1]);
    end, 
    [v27.MarkAsRead.Succeeded.name] = function(v231, v232)
        return v44(v231, v232.postBody.conversationId);
    end, 
    [v3.rodux.GetConversationsParticipantsMetadata.Succeeded.name] = if not v37() then nil else function(v233, v234)
        for v235, v236 in v234.responseBody.conversation_participants_metadata, nil, nil do
            v233 = v64(v233, v235, v236.participants_metadata);
        end;
        return v233;
    end, 
    [v17.name] = if not v36() then nil else function(_, _)
        return {};
    end, 
    [v25.name] = function(v239, v240)
        if not v239[v240.oldFriendConversationId] then
            return v239;
        else
            return l_Immutable_0.Set(v239, v240.oldFriendConversationId, nil);
        end;
    end, 
    [v26.name] = function(v241, v242)
        local v243 = if v242.userId1 ~= "localUserId" then v242.userId1 else if v242.userId2 ~= "localUserId" then v242.userId2 else nil;
        if v243 then
            local v244 = v29.getFriendConversationId({
                v243
            });
            if not v241[v244] then
                return v241;
            else
                return l_Immutable_0.Set(v241, v244, nil);
            end;
        else
            return v241;
        end;
    end
});
