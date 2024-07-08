local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v7 = require(l_Parent_0.UserProfiles);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v16 = require(l_script_FirstAncestor_0.Models.Conversation);
local v17 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local l_useUserProfilesFetch_0 = v7.Hooks.useUserProfilesFetch;
local l_userProfilesCombinedNameAndUsernameByUserIds_0 = v7.Queries.userProfilesCombinedNameAndUsernameByUserIds;
local v20 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local l_getConversationDisplayTitle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation.getConversationDisplayTitle;
local v22 = require(l_script_FirstAncestor_0.LuaAppNavigationContext);
local v23 = require(script.Parent.Selectors.selectChatUserEntryModelList);
local v24 = require(script.Parent.ChatDetailsPage);
local v25 = require(script.Parent.Dialogs.GenericDialogType);
local v26 = require(l_Parent_0.AppChatNetworking);
local v27 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v28 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v29 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v30 = {
    topBarHeight = 0, 
    wideMode = false, 
    participants = nil, 
    isGroupConversation = nil, 
    isGroupOwner = nil, 
    conversationId = nil, 
    conversation = nil, 
    navigateBack = function()
    end, 
    navigateToEditChatMembers = function()
    end, 
    navigateToDialog = function()
    end, 
    navigateToToast = function()
    end
};
return function(v31)
    local v32 = v2.Dictionary.join(v30, v31 or {});
    local v33 = l_useStyle_0();
    local v34 = l_useLocalization_0({
        pageHeaderText = "Feature.Chat.Label.ChatDetails", 
        generalText = "Feature.Chat.Label.General", 
        titleNotSetText = "Feature.Chat.Label.NotSet", 
        membersText = "Feature.Chat.Label.Members", 
        addFriendsText = "Feature.Chat.Label.AddFriends", 
        leaveGroupText = "Feature.Chat.Heading.LeaveGroup", 
        chatGroupText = "Feature.Chat.Label.ChatGroupName", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        offlinePresenceText = "Common.Presence.Label.Offline", 
        tooManyPeopleText = {
            "Feature.Chat.Message.ToastText"; 
            friendNum = 5
        }
    });
    local v35 = if not v29() then nil else v3.useContext(v22);
    local v36 = nil;
    local v37 = nil;
    if v29() then
        local v38 = l_useDispatch_0();
        local l_v38_0 = v38 --[[ copy: 7 -> 29 ]];
        l_useEffect_0(function()
            l_v38_0(v26.rodux.GetConversationsParticipantsMetadata.API({
                v32.conversationId
            })):catch(function()
                warn("Error in ChatDetailsContainer -> GetConversationsParticipantsMetadata");
            end);
        end, {
            v32.conversationId, 
            v32.participants
        });
        local v41 = l_useSelector_0(l_useCallback_0(function(v40)
            return v6(v40, "ChatAppReducer.UnfilteredThreads.eligibility") or {};
        end, {}));
        v36 = v41.isFullyEligible;
        v37 = v41.isIXPEligible and v41.isRolloutEligible;
    end;
    local v43 = l_useSelector_0(function(v42)
        return v6(v42, (("ChatAppReducer.Conversations.%*"):format(v32.conversationId or ""))) or v16.empty();
    end);
    local v44 = l_useUserProfilesFetch_0({
        userIds = v43.participants, 
        query = l_userProfilesCombinedNameAndUsernameByUserIds_0
    });
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    if v43 then
        v45 = l_useSelector_0(function(v53)
            if not v44.data then
                return {};
            else
                return v23(v53, v43.participants, v44.data.userProfiles);
            end;
        end);
        v47 = v43.conversationType == v16.Type.MULTI_USER_CONVERSATION;
        v46 = l_useSelector_0(function(v54)
            return v47 and v43.initiator == v54.LocalUserId;
        end);
        v48 = l_getConversationDisplayTitle_0(v43);
        if v29() then
            v50 = v20(v43);
            v49 = v47 and v50;
            if not (not v43.participantMetadata or not v47) then
                for v55, v56 in v45, nil, nil do
                    v45[v55] = v2.Dictionary.join(v56, {
                        metadata = v43.participantMetadata[v55]
                    });
                end;
            end;
            v51 = v43.moderationType == v17.ModerationType.TrustedComms;
            v52 = v43.source == "channels";
        end;
    end;
    local v57 = ((v36 and v47) and not v51) and v52;
    local v58 = v51 or v37;
    local v59 = not v51 and "Filtered" or "Unfiltered";
    if v43.isDefaultTitle then
        v48 = v34.titleNotSetText;
    end;
    local function _(v60)
        return v5.new(function(v61, v62)
            if #v60.participants > 5 then
                v62();
                return ;
            else
                v61();
                return ;
            end;
        end);
    end;
    local function v64()
        v32.navigateToDialog(v25.EditChatGroupNameDialog, {
            conversationId = v32.conversationId
        });
    end;
    local function v65()
        v32.navigateToDialog(v25.LeaveGroupDialog, {
            conversationId = v32.conversationId
        });
    end;
    local v66 = if not v29() then nil else l_useCallback_0(function()
        v35.navigateToUnfilteredThreadsLearnMore();
    end, l_dependencyArray_0(v35));
    local v67 = if not v29() then nil else l_useCallback_0(function()
        v32.navigateToDialog(v25.CreateUnfilteredChatDialog, {
            conversationId = v32.conversationId
        });
    end, l_dependencyArray_0(v32.navigateToDialog, v32.conversationId));
    local function v69(v68)
        v32.navigateToDialog(v25.ParticipantDialog, {
            conversationId = v32.conversationId, 
            participantId = v68, 
            showRemoveUserButton = (not v50 and v47) and v46
        });
    end;
    local function v71(v70)
        v32.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v70
                }
            }
        });
    end;
    local function v76(v72)
        local l_v43_0 = v43;
        v5.new(function(v74, v75)
            if #l_v43_0.participants > 5 then
                v75();
                return ;
            else
                v74();
                return ;
            end;
        end):andThen(function()
            v32.navigateToEditChatMembers(v43);
        end, function()
            v71(v72);
        end);
    end;
    local v77 = v28();
    if v77 then
        l_useEffectOnMount_0(function()
            v77.fireAnalyticsEvent(v27.ChatDetailsRendered, {
                conversationId = v32.conversationId, 
                participantsCount = #v43.participants, 
                isGroupOwner = v46, 
                isGroupConversation = v47
            });
        end);
    end;
    return v3.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        AutoButtonColor = false
    }, {
        ChatDetailsPage = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Content = v3.createElement(v24, v2.Dictionary.join({
                navigateBack = v32.navigateBack, 
                onGroupNameEntryCellActivated = v64, 
                onLeaveGroupCellActivated = v65, 
                onParticipantCellActivated = v69, 
                onAddFriendsCellActivated = function()
                    return v76(v34.tooManyPeopleText);
                end, 
                onConversationTypeIconActivated = v66, 
                onCreateUnfilteredChatCellActivated = v67, 
                conversationTitle = v48, 
                conversation = v43, 
                conversationId = v32.conversationId, 
                participants = v45, 
                isGroupConversation = v47, 
                wideMode = v32.wideMode, 
                shouldHideGroupChatFunctionality = v49, 
                shouldShowRevampedUI = v58, 
                shouldShowCreateUnfilteredChat = v57, 
                conversationTypeText = v59, 
                topBarHeight = v32.topBarHeight, 
                LayoutOrder = 2, 
                style = v33
            }, v34))
        })
    });
end;
