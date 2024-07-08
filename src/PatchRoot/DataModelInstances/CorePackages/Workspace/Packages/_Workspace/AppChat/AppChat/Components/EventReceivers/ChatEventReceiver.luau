local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Localization);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_Parent_0.RoactUtils);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.AppChatNetworking);
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useMemo_0 = v3.useMemo;
local l_useRef_0 = v3.useRef;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v17 = require(l_script_FirstAncestor_0.Logger):new("AppChat.Realtime");
local l_AddUser_0 = require(l_Parent_0.UserLib).Actions.AddUser;
local v19 = require(l_script_FirstAncestor_0.Models.Conversation);
local v20 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v22 = require(l_script_FirstAncestor_0.Conversations.Actions.ChangedParticipants);
local v23 = require(l_script_FirstAncestor_0.Conversations.Thunks.DEPRECATED_FetchChatData);
local v24 = require(l_script_FirstAncestor_0.Conversations.Thunks.FetchChatSettings);
local v25 = require(l_script_FirstAncestor_0.Actions.FetchChatSettingsCompleted);
local v26 = require(l_script_FirstAncestor_0.Http.RoduxAliases);
local v27 = require(l_script_FirstAncestor_0.Conversations.Actions.ReceivedUserTyping);
local v28 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v29 = require(l_script_FirstAncestor_0.Conversations.Actions.RenamedGroupConversation);
local v30 = require(l_script_FirstAncestor_0.Actions.SetConnectionState);
local v31 = require(l_script_FirstAncestor_0.Conversations.Actions.FriendConversationCreated);
local v32 = require(l_script_FirstAncestor_0.Actions.FriendshipDestroyed);
local v33 = require(l_script_FirstAncestor_0.Components.ChatConversation.Messages);
local v34 = require(l_script_FirstAncestor_0.EnumScreens);
local v35 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local l_getNewMessages_0 = v33.Thunks.getNewMessages;
local v37 = require(l_script_FirstAncestor_0.Conversations.Thunks.DEPRECATED_refreshConversations);
local v38 = require(l_script_FirstAncestor_0.Conversations.Thunks.paginateAndRefreshConversations);
local v39 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchChatMetadata);
local l_multiGetOlderMessages_0 = v33.NetworkRequests.multiGetOlderMessages;
local v41 = require(l_script_FirstAncestor_0.Conversations.Thunks.getAllUserPresences);
local v42 = require(l_script_FirstAncestor_0.Conversations.Thunks.DEPRECATED_getConversations);
local v43 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchLatestConversationDetails);
local v44 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchConversationsByPage);
local v45 = require(l_script_FirstAncestor_0.Conversations.Thunks.getAllFriendsAsync);
local v46 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v48 = require(l_script_FirstAncestor_0.Conversations.Thunks.getUnfilteredThreadsEligibility);
local v49 = require(l_script_FirstAncestor_0.Conversations.Thunks.multiGetConversationDetails);
local _ = require(script.Parent.CommunicationChannelsTypes);
local _ = require(script.Parent.UnfilteredThreadsTypes);
local _ = require(script.Parent.ChatMigrationTypes);
local v53 = game:DefineFastFlag("AppChatEventReceiverRefactorRefresh", false);
local v54 = game:DefineFastFlag("AppChatHandleChannelArchived", false);
local v55 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v56 = require(l_script_FirstAncestor_0.Flags.isAppChatFriendsSourceEnabled);
local v57 = {
    handlesAppShellNotifications = true
};
ChatEventReceiver = function(v58)
    l_useEffect_0(function()
        v17:info("ChatEventReceiver mounted");
        return function()
            v17:info("ChatEventReceiver unmounted");
        end;
    end, {});
    local v60 = l_useSelector_0(l_useCallback_0(function(v59)
        return v59.ChatAppReducer.AppLoaded;
    end, {}));
    local v62 = l_useSelector_0(l_useCallback_0(function(v61)
        return v61.ChatAppReducer.Conversations;
    end, {}));
    local v64 = l_useSelector_0(l_useCallback_0(function(v63)
        return v63.FormFactor;
    end, {}));
    local v66 = l_useSelector_0(l_useCallback_0(function(v65)
        return v65.Users;
    end, {}));
    local v67 = v6.isEmpty(v62);
    local v68 = l_useLocalUserId_0();
    local v69 = l_useDispatch_0();
    local function _(v70)
        v69(l_AddUser_0(v70));
    end;
    local function v76(v72, v73, v74, v75)
        v69(v22(v72, v73, v74, v75));
    end;
    local function v77()
        if not v46() then
            v69(v23());
            return ;
        else
            return v69(v39()):andThen(function()
                return v69(v44());
            end);
        end;
    end;
    local function v82()
        if not v46() then
            return v69(v24.API()):andThen(function(v78)
                return v78.responseBody;
            end):catch(function(v79)
                v17:warning("NetworkingChat failure in RobloxEventReceiver->FetchChatSettings, Status: " .. tostring(v79));
                return {};
            end);
        else
            return v69(v7.rodux.GetMetadata.API()):andThen(function(v80)
                return v80.responseBody;
            end):catch(function(v81)
                v17:warning("AppChatNetworking failure in RobloxEventReceiver->FetchChatSettings, Status: {}", (tostring(v81)));
                return {};
            end);
        end;
    end;
    local function _(v83)
        v69(v25(v83));
    end;
    local function _(v85)
        return v69(v42(v85));
    end;
    local function v88(v87)
        return v69(v43(v87));
    end;
    local function v89()
        v69(v45());
    end;
    local function v90()
        spawn(function()
            v69(v41());
        end);
    end;
    local function v94(v91, v92, v93)
        return v69(l_getNewMessages_0(v91, v92, v93));
    end;
    local function _(v95)
        return v69(l_multiGetOlderMessages_0(v95, {}));
    end;
    local function _(v97)
        v69(v35.GetPresencesFromUserIds.API(v97)):catch(function(v98)
            v17:warning("NetworkingPresence failure in RobloxEventReceiver->ChatNotification, Status: " .. tostring(v98));
        end);
    end;
    local function _(v100, v101)
        v69(v26.Actions.AliasUpdated(v100, v101));
    end;
    local function v105(v103, v104)
        v69(v27(v103, v104));
    end;
    local function v106()
        if not v46() then
            v69(v37());
            return ;
        else
            v69(v38());
            return ;
        end;
    end;
    local function v108(v107)
        v69(v28(v107));
    end;
    local function v113(v109, v110, v111, v112)
        v69(v29(v109, v110, v111, v112));
    end;
    local function _(v114)
        v69(v30(v114));
    end;
    local v116 = v6.Dictionary.join(v57, v58);
    local l_robloxEventReceiver_0 = v116.robloxEventReceiver;
    local v118 = l_useRef_0({});
    local v119 = l_useRef_0(Enum.ConnectionState.Connected);
    local v120 = l_useLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        removedFromConversationToastTitle = "Feature.Chat.Message.RemovedFromConversation"
    });
    local l_networkErrorText_0 = v120.networkErrorText;
    local l_removedFromConversationToastTitle_0 = v120.removedFromConversationToastTitle;
    local v125 = l_useCallback_0(function(v123, v124)
        assert(v118.current, "table");
        v118.current[v123] = v124;
    end, l_dependencyArray_0(v118.current));
    local v126 = l_useCallback_0(function()
        if v116.rnBypassActionSignal then
            v116.rnBypassActionSignal:fire(v4.Actions.navigate({
                routeName = v34.RoactChatToast, 
                params = {
                    toastProps = {
                        toastContent = {
                            toastTitle = l_networkErrorText_0
                        }
                    }
                }
            }));
        end;
    end, l_dependencyArray_0(v116.rnBypassActionSignal, l_networkErrorText_0));
    l_useEffect_0(function()
        local v156 = l_robloxEventReceiver_0:observeEvent("ChatNotifications", function(v127, v128, _)
            v125("ChatNotifications", v127.SequenceNumber);
            local v130 = v127.Type or v128;
            v17:debug((("Received chat notification:%*"):format(v130)));
            local v131 = not not v127.ConversationId and tostring(v127.ConversationId) or "";
            if not (v130 ~= "RemovedFromConversation") or v130 == "ConversationRemoved" then
                v69(v28(v131));
                local l_activeConversationId_0 = v116.activeConversationId;
                if not (not (l_activeConversationId_0 ~= nil and tostring(l_activeConversationId_0) == v131) or not v116.rnBypassActionSignal) then
                    v116.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v64 == l_FormFactor_0.WIDE and v34.EmptyConversation or v34.ChatLanding
                    }));
                end;
                if v130 == "RemovedFromConversation" then
                    v116.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v34.RoactChatToast, 
                        params = {
                            toastProps = {
                                toastContent = {
                                    toastTitle = l_removedFromConversationToastTitle_0
                                }
                            }
                        }
                    }));
                    return ;
                end;
            elseif not (v130 ~= "ConversationTitleChanged" and v130 ~= "ParticipantAdded") or v130 == "ParticipantLeft" then
                if not v46() then
                    spawn(function()
                        v69(v42({
                            v131
                        })):andThen(function(v133)
                            if v133.responseBody and #v133.responseBody > 0 then
                                local v134 = v133.responseBody[1];
                                local v135 = v19.fromWeb(v134);
                                local l_title_0 = v135.title;
                                local l_lastUpdated_0 = v135.lastUpdated;
                                local v138 = {};
                                for _, v140 in ipairs(v134.participants) do
                                    if v138[tostring(v140.targetId)] == nil then
                                        local v141 = l_UserModel_0.fromDataTable({
                                            id = v140.targetId, 
                                            name = v140.name, 
                                            displayName = v140.displayName, 
                                            isFriend = false
                                        });
                                        v138[v141.id] = v141;
                                    end;
                                end;
                                if v130 == "ConversationTitleChanged" then
                                    v69(v29(v131, l_title_0, v135.isDefaultTitle, l_lastUpdated_0));
                                    return ;
                                else
                                    if v130 == "ParticipantAdded" then
                                        local v142 = {};
                                        for _, v144 in pairs(v138) do
                                            if v66[v144.id] == nil then
                                                v69(l_AddUser_0(v144));
                                                table.insert(v142, v144.id);
                                            end;
                                        end;
                                        if #v142 > 0 then
                                            v69(v35.GetPresencesFromUserIds.API(v142)):catch(function(v145)
                                                v17:warning("NetworkingPresence failure in RobloxEventReceiver->ChatNotification, Status: " .. tostring(v145));
                                            end);
                                        end;
                                    end;
                                    v69(v22(v131, v135.participants, l_title_0, l_lastUpdated_0));
                                end;
                            end;
                        end):catch(function(v146)
                            v17:warning("NetworkingChat failure in RobloxEventReceiver->" .. v130 .. ", Status: " .. tostring(v146));
                        end);
                    end);
                    return ;
                else
                    task.spawn(function()
                        v69(v43(v131)):andThen(function(v147)
                            local l_title_1 = v147.title;
                            local l_lastUpdated_1 = v147.lastUpdated;
                            if v130 == "ConversationTitleChanged" then
                                v69(v29(v131, l_title_1, v147.isDefaultTitle, l_lastUpdated_1));
                                return ;
                            else
                                v69(v22(v131, v147.participants, l_title_1, l_lastUpdated_1));
                                return ;
                            end;
                        end):catch(function(v150)
                            v17:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(v130, (tostring(v150)))));
                        end);
                    end);
                    return ;
                end;
            elseif not (v130 ~= "AddedToConversation") or v130 == "NewConversation" then
                if not v46() then
                    spawn(function()
                        if not v67 then
                            v69(v42({
                                v131
                            })):andThen(function(v151)
                                if not v151.responseBody or #v151.responseBody <= 0 then
                                    return ;
                                else
                                    return ;
                                end;
                            end):catch(function(v152)
                                v17:warning("NetworkingChat failure in RobloxEventReceiver->" .. v130 .. ", Status: " .. tostring(v152));
                            end);
                            return ;
                        else
                            return ;
                        end;
                    end);
                    return ;
                elseif not v67 then
                    task.spawn(function()
                        v69(v43(v131)):catch(function(v153)
                            v17:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(v130, (tostring(v153)))));
                        end);
                    end);
                    return ;
                else
                    v17:debug((("Received %* event while loading conversation data"):format(v130)));
                    return ;
                end;
            elseif v130 == "NewMessage" then
                local _ = v69(l_getNewMessages_0(v131, false, (tick())));
                return ;
            elseif v130 == "NewMessageBySelf" then
                local _ = v69(l_getNewMessages_0(v131, true, (tick())));
                return ;
            elseif v130 == "ParticipantTyping" then
                v69(v27(v131, (tostring(v127.UserId))));
            end;
        end);
        return function()
            if not (not v156 or not v156.disconnect) then
                v156:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v69, v125, v116.activeConversationId, v116.rnBypassActionSignal, v67, v64, v66));
    l_useEffect_0(function()
        local v161 = l_robloxEventReceiver_0:observeEvent("ChatPrivacySettingsNotifications", function(v157, _)
            local l_Type_0 = v157.Type;
            v17:info("Received chat privacy settings notification: {}", l_Type_0);
            if l_Type_0 == "ChatDisabled" then
                v69(v25({
                    chatEnabled = false
                }));
                if not (not v116.activeConversationId or not v116.rnBypassActionSignal) then
                    v116.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v64 == l_FormFactor_0.WIDE and v34.EmptyConversation or v34.ChatLanding
                    }));
                    return ;
                end;
            elseif l_Type_0 == "ChatEnabled" then
                v69(v25({
                    chatEnabled = true
                }));
                v77():catch(function(v160)
                    v17:warning("Failed to fetch chat data after receiving privacy setting notification: {}", (tostring(v160)));
                end);
            end;
        end);
        return function()
            if not (not v161 or not v161.disconnect) then
                v161:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v69, v116.activeConversationId, v116.rnBypassActionSignal, v64));
    l_useEffect_0(function()
        local v164 = l_robloxEventReceiver_0:observeEvent("UserTagChangeNotification", function(v162, _)
            if v162.Type == "UserTagUpdate" then
                v69(v26.Actions.AliasUpdated(tostring(v162.UserId), v162.NewAlias));
            end;
        end);
        return function()
            if not (not v164 or not v164.disconnect) then
                v164:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v69));
    if v46() then
        l_useEffect_0(function()
            local v170 = l_robloxEventReceiver_0:observeEvent("FriendshipNotifications", function(v165, _)
                local l_Type_1 = v165.Type;
                v17:debug("Received friendship notification: {}", l_Type_1);
                if l_Type_1 == "FriendshipCreated" then
                    if not v46() then
                        v69(v37());
                        return ;
                    else
                        v69(v38());
                        return ;
                    end;
                else
                    if not (not (v56() and l_Type_1 == "FriendshipDestroyed") or not v165.EventArgs) then
                        local v168 = tostring(v165.EventArgs.UserId1);
                        local v169 = tostring(v165.EventArgs.UserId2);
                        if v168 == v68 then
                            v168 = "localUserId";
                        end;
                        if v169 == v68 then
                            v169 = "localUserId";
                        end;
                        v69(v32({
                            userId1 = v168, 
                            userId2 = v169
                        }));
                    end;
                    return ;
                end;
            end);
            return function()
                if not (not v170 or not v170.disconnect) then
                    v170:disconnect();
                end;
            end;
        end, l_dependencyArray_0(v69, v106, v68));
        l_useEffect_0(function()
            local v177 = l_robloxEventReceiver_0:observeEvent("ChatMigration", function(v171, _)
                local l_Type_2 = v171.Type;
                v17:debug("Received chat migration notification: {}", l_Type_2);
                local v174 = nil;
                local v175 = nil;
                if l_Type_2 == "ConversationBackfilled" then
                    v174 = v171.ConversationId;
                    v175 = v171.ChannelId;
                elseif l_Type_2 == "ConversationReset" then
                    v174 = v171.ChannelId;
                    v175 = v171.ConversationId;
                else
                    v17:warning((("ChatEventReceiver: unknown notification %*"):format(l_Type_2)));
                    return ;
                end;
                v69(v28(v174));
                v69(v43(v175)):catch(function(v176)
                    v17:warning((("NetworkingChat failure in RobloxEventReceiver->%*, Status: %*"):format(l_Type_2, (tostring(v176)))));
                end);
                if not (not (not (not v116.activeConversationId or not v174) and tostring(v116.activeConversationId) == v174) or not v116.rnBypassActionSignal) then
                    v116.rnBypassActionSignal:fire(v4.Actions.navigate({
                        routeName = v34.ChatConversation, 
                        params = {
                            conversationId = v175
                        }
                    }));
                end;
            end);
            return function()
                if not (not v177 or not v177.disconnect) then
                    v177:disconnect();
                end;
            end;
        end, l_dependencyArray_0(v69, v116.activeConversationId, v116.rnBypassActionSignal, v88));
    end;
    local v179 = l_useCallback_0(function()
        if v60 then
            v82():andThen(function(v178)
                if not if not v46() then v178.chatEnabled else v178.isChatEnabled then
                    v17:trace("Chat is disabled for our user, no need to refresh conversations");
                    return ;
                else
                    v17:trace("Chat is enabled for our user, refreshing conversations");
                    if not v46() then
                        v69(v37());
                    else
                        v69(v38());
                    end;
                    task.spawn(function()
                        v69(v45());
                    end);
                    spawn(function()
                        v69(v41());
                    end);
                    return ;
                end;
            end);
        end;
    end, l_dependencyArray_0(v60, v82, v106, v89, v90));
    l_useEffect_0(function()
        local v185 = l_robloxEventReceiver_0:observeEvent("signalR", function(v180, _, v182)
            v17:info("SignalR connection state transitioned to {}", (tostring(v180)));
            v69(v30(v180));
            local l_current_0 = v119.current;
            v119.current = v180;
            if not v53 then
                if v180 == Enum.ConnectionState.Connected then
                    if v182 then
                        if not (v118.current ~= nil and v118.current.ChatNotifications == v182.ChatNotifications) or l_current_0 ~= v180 then
                            v17:trace("We missed some messages while we were disconnected. The chat app was previously {}", not v60 and "unloaded" or "loaded");
                            v179();
                        end;
                        v118.current = v182;
                    end;
                    if not v46() then
                        local _ = v69(l_multiGetOlderMessages_0(v126, {}));
                    end;
                end;
            elseif not (not (v180 == Enum.ConnectionState.Connected) or not v182) and (not (v118.current ~= nil and v118.current.ChatNotifications == v182.ChatNotifications) or v46() and (not (v118.current ~= nil) or v118.current.CommunicationChannels ~= v182.CommunicationChannels)) then
                v17:trace("We missed some messages while we were disconnected. The chat app was previously {}", not v60 and "unloaded" or "loaded");
                v179();
                return ;
            end;
        end);
        return function()
            if not (not v185 or not v185.disconnect) then
                v185:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v69, if not v53 then v119.current else v119, if not v53 then v118.current else v118, v126, v60));
    if v46() then
        l_useEffect_0(function()
            local v198 = l_robloxEventReceiver_0:observeEvent("CommunicationChannels", function(v186, _)
                if v186.ChannelVertical ~= "PlatformChat" then
                    v17:trace("Received notification from different vertical: {}", v186.ChannelVertical);
                    return ;
                else
                    v17:info("Received channels notification: {}", v186.Type);
                    v125("CommunicationChannels", v186.SequenceNumber);
                    local l_ChannelId_0 = v186.ChannelId;
                    if not (v186.Type ~= "ChannelDeleted" and v186.Type ~= "RemovedFromChannel") or v54 and v186.Type == "ChannelArchived" then
                        v69(v28(l_ChannelId_0));
                        local l_activeConversationId_1 = v116.activeConversationId;
                        if not (not (l_activeConversationId_1 ~= nil and tostring(l_activeConversationId_1) == v186.ChannelId) or not v116.rnBypassActionSignal) then
                            v116.rnBypassActionSignal:fire(v4.Actions.navigate({
                                routeName = if v64 == l_FormFactor_0.WIDE then v34.EmptyConversation else v34.ChatLanding
                            }));
                        end;
                        if v186.Actor.Id ~= tostring(v68) then
                            v116.rnBypassActionSignal:fire(v4.Actions.navigate({
                                routeName = v34.RoactChatToast, 
                                params = {
                                    toastProps = {
                                        toastContent = {
                                            toastTitle = l_removedFromConversationToastTitle_0
                                        }
                                    }
                                }
                            }));
                            return ;
                        end;
                    elseif not (v186.Type ~= "ChannelUpdated" and v186.Type ~= "ParticipantsAdded") or v186.Type == "ParticipantsRemoved" then
                        task.spawn(function()
                            v69(v43(l_ChannelId_0)):andThen(function(v190)
                                local l_title_2 = v190.title;
                                local l_lastUpdated_2 = v190.lastUpdated;
                                if v186.Type == "ChannelUpdated" then
                                    v69(v29(l_ChannelId_0, l_title_2, v190.isDefaultTitle, l_lastUpdated_2));
                                    return ;
                                else
                                    v69(v22(l_ChannelId_0, v190.participants, l_title_2, l_lastUpdated_2));
                                    return ;
                                end;
                            end):catch(function(v193)
                                v17:warning((("Failure in RobloxEventReceiver->%*, Status: %*"):format(v186.Type, (tostring(v193)))));
                            end);
                        end);
                        return ;
                    elseif not (((v186.Type ~= "AddedToChannel" and v186.Type ~= "ChannelCreated") and v186.Type ~= "ChannelMarkedRead") and v186.Type ~= "ChannelMetadataUpdated") or v186.Type == "ChannelUnarchived" then
                        if not v67 then
                            task.spawn(function()
                                v69(v43(l_ChannelId_0)):andThen(function(v194)
                                    if (v56() and (not (v186.Type ~= "ChannelCreated") or v186.Type == "ChannelUnarchived")) and v194.type == "one_to_one" then
                                        local v195 = v20.getFriendConversationId(v194.participants);
                                        if v195 then
                                            v69(v31({
                                                newConversationId = v194.id, 
                                                oldFriendConversationId = v195
                                            }));
                                            if v116.activeConversationId == v195 then
                                                v116.rnBypassActionSignal:fire(v4.Actions.navigate({
                                                    routeName = v34.ChatConversation, 
                                                    params = {
                                                        conversationId = v194.id
                                                    }
                                                }));
                                            end;
                                        end;
                                    end;
                                end):catch(function(v196)
                                    v17:warning("Failure in RobloxEventReceiver->{}, Status: {}", v186.Type, (tostring(v196)));
                                end);
                            end);
                            return ;
                        else
                            v17:debug("Received {} event while loading conversation data", v186.Type);
                            return ;
                        end;
                    elseif v186.Type == "MessageCreated" then
                        local _ = v69(l_getNewMessages_0(l_ChannelId_0, v186.Actor.Id == tostring(v68), (tick())));
                        return ;
                    elseif not (not (v186.Type == "ParticipantTyping") or not v186.IsTyping) then
                        v69(v27(l_ChannelId_0, v186.Actor.Id));
                    end;
                    return ;
                end;
            end);
            return function()
                if not (not v198 or not v198.disconnect) then
                    v198:disconnect();
                end;
            end;
        end, l_dependencyArray_0(v68, l_robloxEventReceiver_0, v125, v108, v116.activeConversationId, v116.rnBypassActionSignal, l_removedFromConversationToastTitle_0, v88, v113, v76, v67, v94, v105, v179));
    end;
    if v55() then
        local v200 = l_useMemo_0(function()
            if v62 then
                return (v6.List.filterMap(v6.Dictionary.values(v62), function(v199)
                    if not (not v199 or not v199.id) and v199.source ~= "friends" then
                        return v199.id;
                    else
                        return nil;
                    end;
                end));
            else
                return {};
            end;
        end, l_dependencyArray_0(v62));
        l_useEffect_0(function()
            local v208 = l_robloxEventReceiver_0:observeEvent("ChatModerationTypeEligibility", function(v201, _)
                v17:debug("Received ChatModerationTypeEligibility notification");
                local l_channels_inspected_0 = v201.channels_inspected;
                if not l_channels_inspected_0 or #l_channels_inspected_0 == 0 then
                    return ;
                else
                    local v205 = v6.List.filter(l_channels_inspected_0, function(v204)
                        return table.find(v200, v204);
                    end);
                    if #v205 == 0 then
                        v17:debug("No filtered existing conversation IDs found in ChatModerationTypeEligibility notification");
                        return ;
                    else
                        v69(v49(v205)):catch(function(v206)
                            v17:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->MultiGetConversationDetails, Status: " .. tostring(v206));
                        end);
                        if v116.activeConversationId then
                            if table.find(l_channels_inspected_0, v116.activeConversationId) then
                                v69(v7.rodux.GetConversationsParticipantsMetadata.API({
                                    v116.activeConversationId
                                })):catch(function(v207)
                                    v17:warning("NetworkingChat failure in " .. "ChatEventReceiver->ChatModerationTypeEligibility->GetConversationsParticipantsMetadata, Status: " .. tostring(v207));
                                end);
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end;
                end;
            end);
            return function()
                if not (not v208 or not v208.disconnect) then
                    v208:disconnect();
                end;
            end;
        end, l_dependencyArray_0(v69, v116.activeConversationId, v200));
        l_useEffect_0(function()
            local v211 = l_robloxEventReceiver_0:observeEvent("EligibilityStatusChanged", function(_, _)
                v17:debug("Received EligibilityStatusChanged notification");
                v69(v48());
            end);
            return function()
                if not (not v211 or not v211.disconnect) then
                    v211:disconnect();
                end;
            end;
        end, l_dependencyArray_0(v69));
    end;
    return {};
end;
return ChatEventReceiver;
