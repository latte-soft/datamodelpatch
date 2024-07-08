local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Roact);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_RoactPaginator_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoactPaginator;
local l_searchFilterPredicate_0 = require(l_script_FirstAncestor_0.SocialLibraries).Utils.searchFilterPredicate;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v8 = require(l_script_FirstAncestor_0.Models.Conversation);
local v9 = require(script.Parent.ConversationList);
local v10 = require(l_script_FirstAncestor_0.LegacyAnalytics.withAnalytics);
local v11 = require(l_script_FirstAncestor_0.LegacyAnalytics.withRoactChatAnalytics);
local v12 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v13 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local v14 = require(l_script_FirstAncestor_0.Flags.isAppChatFriendsSourceEnabled);
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatLastConversationHiddenFix);
local v16 = v3.PureComponent:extend("ConversationListWithTopBar");
v16.defaultProps = {
    filterText = nil, 
    isDebugEnabled = false, 
    itemList = {}, 
    topBarHeight = 0, 
    entryHeight = 64
};
v16.getDerivedStateFromProps = function(v17)
    local l_filterText_0 = v17.filterText;
    return {
        filteredItemList = v2.List.filterMap(v17.itemList, function(v19)
            if not l_searchFilterPredicate_0(l_filterText_0, v19.title) then
                return nil;
            else
                return v19;
            end;
        end)
    };
end;
v16.init = function(v20)
    v20.showErrorToast = function(v21)
        v20.props.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v21
                }
            }
        });
    end;
    v20.reportAnalytics = function(v22)
        if not (v20.props.conversationsIsFetching or v20.props.oldestConversationIsFetched) then
            v22:userFetchedOlderConversations(v20.props.localUserId);
        end;
    end;
    v20.loadNext = l_memoize_0(function(v23)
        return function(v24)
            if v20.props[l_RoactPaginator_0.loadNext] then
                v20.reportAnalytics(v23);
                v20.props[l_RoactPaginator_0.loadNext](v24);
            end;
        end;
    end);
    v20.isFiltered = v20.props.filterText and v20.props.filterText:match("%S");
    v20.indexOfList = l_memoize_0(function(v25, v26)
        local v28 = table.find(v2.List.map(v25, function(v27)
            return v27.id;
        end), v26);
        if not v28 then
            return 0;
        else
            return v28;
        end;
    end);
    v20.fireClickEvent = function(v29, v30)
        if v30 then
            local l_id_0 = v29.id;
            v30.fireAnalyticsEvent(v12.ChatLandingConversationClicked, {
                isFiltered = v20.isFiltered ~= nil, 
                conversationListCount = #v20.state.filteredItemList, 
                selectedConversationId = l_id_0, 
                selectedIndex = v20.indexOfList(v20.state.filteredItemList, l_id_0), 
                hasUnreadMessages = v29.hasUnreadMessages
            });
        end;
    end;
    v20.onActivated = l_memoize_0(function(v32, v33)
        return function(v34)
            if not v14() then
                if v34.serverState == "CREATED" then
                    v20.props.navigateToConversation(v34.id);
                else
                    local v35 = nil;
                    for _, v37 in ipairs(v34.participants) do
                        if v37.id ~= v20.props.localUserId then
                            v35 = tonumber(v37.id);
                            break;
                        end;
                    end;
                    if not v13() then
                        v20.props.startOneToOneConversation(v35):andThen(function(v38)
                            v20.props.navigateToConversation(v8.fromWeb(v38.responseBody.conversation).id);
                        end):catch(function()
                            v20.showErrorToast(v32.somethingWrongText);
                        end);
                    else
                        v20.props.createOneToOneConversation(v35):andThen(function(v39)
                            v20.props.navigateToConversation(v39.id);
                        end):catch(function()
                            v20.showErrorToast(v32.somethingWrongText);
                        end);
                    end;
                end;
            else
                v20.props.navigateToConversation(v34.id);
            end;
            v20.fireClickEvent(v34, v33);
        end;
    end);
end;
v16.render = function(v40)
    return v11(function(v41)
        return v10(function(v42)
            return l_withLocalization_0({
                somethingWrongText = "Feature.Toast.NetworkingError.SomethingIsWrong"
            })(function(v43)
                local v44 = v3.createElement(v9, {
                    Size = UDim2.fromScale(1, 1), 
                    itemList = not not (v40.props.filterText and v40.props.filterText:match("%S")) and v40.state.filteredItemList or v40.props.itemList, 
                    loadNext = v40.loadNext(v42), 
                    isDebugEnabled = v40.props.isDebugEnabled, 
                    filterText = v40.props.filterText, 
                    onActivated = v40.onActivated(v43, v41), 
                    entryHeight = v40.props.entryHeight, 
                    shouldShowPhoneVerificationUpsell = v40.props.shouldShowPhoneVerificationUpsell, 
                    shouldShowUnfilteredAccessFtux = v40.props.shouldShowUnfilteredAccessFtux, 
                    dismissUnfilteredThreadsFtux = v40.props.dismissUnfilteredThreadsFtux
                });
                if not v15() then
                    return v44;
                else
                    return v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, -v40.props.topBarHeight), 
                        BackgroundTransparency = 1
                    }, {
                        conversationList = v44
                    });
                end;
            end);
        end);
    end);
end;
v16.didMount = function(v45)
    v45.isMounted = true;
end;
v16.willUnmount = function(v46)
    v46.isMounted = false;
end;
return v16;
