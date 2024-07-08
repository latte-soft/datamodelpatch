local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactRodux);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.FriendsLanding);
local l_RoactPaginator_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoactPaginator;
local l_compose_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoduxTools.compose;
local v10 = require(script.Parent.ConversationGroupsEntry);
local v11 = require(script.Parent.ConversationListWithTopBar);
local v12 = require(script.Parent.ChatLoading.ChatLoadingContainer);
local v13 = require(script.Parent.EmptyConversationList);
local v14 = require(script.Parent.mapDispatchToProps);
local v15 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v16 = require(l_script_FirstAncestor_0.Hooks.useGetConversations);
local v17 = require(l_script_FirstAncestor_0.Hooks.useIsAppLoaded);
local v18 = require(l_script_FirstAncestor_0.Hooks.useAreConversationsFetching);
local v19 = require(l_script_FirstAncestor_0.Hooks.useIsOldestConversationFetched);
local v20 = require(l_script_FirstAncestor_0.Hooks.useHasConversations);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v23 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local v24 = require(l_Parent_0.UserProfiles);
local v25 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v26 = require(l_script_FirstAncestor_0.Conversations.getAllParticipants);
local l_useCallback_0 = v4.useCallback;
local l_useState_0 = v4.useState;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v31 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v32 = require(l_Parent_0.AppChatNetworking);
local v33 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local l_IsVRAppBuild_0 = v2.IsVRAppBuild;
local v35 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v36 = require(l_script_FirstAncestor_0.Analytics.Enums.EmptyStateType);
local v37 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v38 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTabHideGroupsLinkOnVR);
local v39 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableNewAppChatLoadingIndicator);
local l_default_0 = require(l_Parent_0.SocialCommon).Experiments.NewChatTabExperimentation.default;
local v41 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableAppChatPaddingConsistency);
local l_HorizontalPageMargin_0 = v6.App.Container.HorizontalPageMargin;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_NoFriendsView_0 = v7.Components.NoFriendsView;
local v45 = game:DefineFastString("ChatTabAddFriendsHeaderKey", "Feature.Friends.Feature.Friends.Heading.AddFriends");
local v46 = game:DefineFastString("ChatTabAddFriendsLabelKey", "Feature.Friends.Text.NoFriends");
local v47 = game:DefineFastString("ChatTabAddFriendsButtonKey", "Feature.Friends.Feature.Friends.Heading.AddFriends");
local v48 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v49 = game:DefineFastFlag("AppChatAnalyticsAppChatVisible", false);
local v50 = {
    topBarHeight = 0, 
    isShowingFilterBox = false
};
local function _(v51, v52, v53)
    local v54 = false;
    local v56 = v3.List.map(v51.otherParticipants, function(v55)
        if v52[tostring(v55)] == nil then
            v54 = true;
        end;
        return v52[tostring(v55)];
    end);
    if not v54 or not v51.isDefaultTitle then
        return v25(v51, v56, v53);
    else
        return "";
    end;
end;
ChatLandingContainer = function(v58)
    local v59 = v3.Dictionary.join(v50, v58);
    local v60 = v15();
    local v61 = v17();
    local v62 = v18();
    local v63 = v20();
    local v64 = v19();
    local v65 = l_useLocalUserId_0();
    local v66 = l_useStyle_0();
    local v67 = v16();
    local v68 = v4.useRef({});
    local v69 = v4.useMemo(function()
        return v26(v67);
    end, {
        v67
    });
    local v70 = v24.Hooks.useUserProfilesFetch({
        userIds = v69, 
        query = v24.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v71 = v24.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v65))
        }, 
        query = v24.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v81 = v4.useMemo(function()
        local l_current_0 = v68.current;
        if v70.data then
            v3.List.map(v70.data.userProfiles, function(v73)
                l_current_0[v73.id] = v73;
            end);
        end;
        return v3.List.map(v67, function(v74)
            local l_l_current_0_0 = l_current_0;
            local v76 = not v71.data and "" or v24.Selectors.getCombinedNameFromId(v71.data, v65);
            local v77 = false;
            local v79 = v3.List.map(v74.otherParticipants, function(v78)
                if l_l_current_0_0[tostring(v78)] == nil then
                    v77 = true;
                end;
                return l_l_current_0_0[tostring(v78)];
            end);
            local v80;
            if not v77 or not v74.isDefaultTitle then
                v80 = v25(v74, v79, v76);
                --[[ close >= 4 ]]
            else
                v80 = "";
                --[[ close >= 4 ]]
            end;
            return v3.Dictionary.join(v74, {
                title = v80
            });
        end);
    end, {
        v67, 
        v69, 
        v70.data
    });
    local v82 = v37();
    l_useEffectOnMount_0(function()
        if v82 then
            v82.fireAnalyticsEvent(v35.ChatLandingScreenRendered, {
                isChatEnabled = v60
            });
        end;
    end);
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    if v48() then
        local v89, v90 = l_useState_0({
            phone_verify = false, 
            fully_eligible_ftux = false
        });
        v85 = v89;
        v86 = v90;
        v89 = l_useSelector_0(l_useCallback_0(function(v91)
            return v31(v91, "ChatAppReducer.UnfilteredThreads.ftuxModalVariant");
        end, {}));
        v90 = false;
        if v89 == "phone_verify" then
            v90 = not v85.phone_verify;
        end;
        v83 = v90;
        v90 = false;
        if v89 == "fully_eligible_ftux" then
            v90 = not v85.fully_eligible_ftux;
        end;
        v84 = v90;
        local l_v89_0 = v89 --[[ copy: 22 -> 28 ]];
        v87 = l_useCallback_0(function()
            if l_v89_0 then
                v86(function(v93)
                    return v3.Dictionary.join(v93, {
                        [l_v89_0] = true
                    });
                end);
                return ;
            else
                return ;
            end;
        end, l_dependencyArray_0(v86, v89));
        v88 = l_useSelector_0(l_useCallback_0(function(v94)
            local v95 = true;
            if v32.rodux.GetUnfilteredThreadEligibility.getStatus(v94) ~= v33.Enum.NetworkStatus.Fetching then
                v95 = v32.rodux.GetUnfilteredThreadsFtuxModal.getStatus(v94, v32.Constants.UnfilteredThreadsModalSequence) == v33.Enum.NetworkStatus.Fetching;
            end;
            return v95;
        end, {}));
    end;
    local v96 = v3.isEmpty(v81);
    local v97 = ((not v61 or v96 and v62) or v96 and v63) or v96 and v88;
    local v98 = nil;
    local v99 = false;
    if not v60 or not v97 then
        if v60 and ((not v96 or not v61) or v62) then
            local v100 = ("conversationListWithTopBar%*"):format(v59.filterText);
            v99 = true;
            v98 = v4.createElement(v11, v3.Dictionary.join(v59, {
                filterText = not not v59.isShowingFilterBox and v59.filterText or nil, 
                key = v100, 
                itemList = v81, 
                appLoaded = v61, 
                localUserId = v65, 
                conversationsIsFetching = v62, 
                oldestConversationIsFetched = v64, 
                entryHeight = 64, 
                shouldShowPhoneVerificationUpsell = v83, 
                shouldShowUnfilteredAccessFtux = v84, 
                dismissUnfilteredThreadsFtux = v87
            }));
        elseif not l_default_0.isEnabled() or not l_default_0:getShowAddFriendsOnChatTabNilState() then
            v98 = v4.createElement(v13, {
                chatEnabled = v60, 
                navigateToPrivacy = v59.navigateToPrivacy, 
                fireRenderEvent = if not l_default_0.isEnabled() then nil else function()
                    if v82 then
                        v82.fireAnalyticsEvent(v35.ChatEmptyStateScreenRendered, {
                            emptyStateType = v36.EmptyConversationList
                        });
                    end;
                end
            });
        else
            v98 = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v66.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v66.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0
            }, {
                NoFriendsView = v4.createElement(l_NoFriendsView_0, {
                    pageRenderReport = function()
                        if v82 then
                            v82.fireAnalyticsEvent(v35.ChatEmptyStateScreenRendered, {
                                emptyStateType = v36.NoFriendsView
                            });
                        end;
                    end, 
                    openAddFriendsPage = function()
                        if v82 then
                            v82.fireAnalyticsEvent(v35.ChatAddFriendsBtnClicked);
                        end;
                        v59.navigateToAddFriends();
                    end, 
                    noFriendsHeaderKey = v45, 
                    noFriendsTextLabelKey = v46, 
                    addFriendsBtnLabelKey = v47
                })
            });
            v99 = true;
        end;
    else
        v98 = v4.createElement(v12, {
            topBarHeight = v59.topBarHeight, 
            pageHeaderText = v59.pageHeaderText, 
            cellHeight = not v39() and 72 or 64, 
            cellWidth = 375
        });
        if l_default_0.isEnabled() then
            v99 = true;
        end;
    end;
    if not ((not l_default_0.isEnabled() or not v38()) or not l_IsVRAppBuild_0()) then
        v99 = true;
    end;
    local v101 = nil;
    v101 = if not (not not l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab()) or v99 then v98 else v4.createElement(v4.Fragment, nil, {
        groupsLink = v4.createElement(v10, {
            entryHeight = 64
        }), 
        chatFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v59.topBarHeight - 64), 
            Position = UDim2.new(0, 0, 0, 64), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            chatContainer = v98
        })
    });
    local v102 = if not v49 then nil else v23();
    v4.useEffect(function()
        if not (not v102 or not v82) then
            v82.fireAnalyticsEvent(v35.AppChatVisible, {
                isChatEnabled = v60, 
                chatLandingListCount = #v81, 
                isChatLoading = v97
            });
        end;
    end, l_dependencyArray_0(v102, v97));
    if not v41() then
        return v101;
    else
        return v4.createElement(l_HorizontalPageMargin_0, {
            backgroundColor3 = v66.Theme.BackgroundDefault.Color
        }, {
            chatContainerWithGroupsLink = v101
        });
    end;
end;
return l_compose_0(v5.connect(nil, v14), l_RoactPaginator_0.connect(function()
    return {
        pageSize = 30
    };
end))(ChatLandingContainer);
