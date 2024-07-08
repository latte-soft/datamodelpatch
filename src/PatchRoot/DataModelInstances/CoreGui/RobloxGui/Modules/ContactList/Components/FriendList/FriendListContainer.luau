local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.ApolloClient);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.Packages.Promise);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v11 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local l_GetFFlagSuggestedCalleeBugFixEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSuggestedCalleeBugFixEnabled;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_useApolloClient_0 = v4.useApolloClient;
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v17 = require(l_ContactList_0.dependencies);
local l_UIBlox_0 = v17.UIBlox;
local l_dependencyArray_0 = v17.Hooks.dependencyArray;
local l_useSelector_0 = v17.Hooks.useSelector;
local l_useDispatch_0 = v17.Hooks.useDispatch;
local v22 = nil;
local v23 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v23 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v22 = v17.Hooks.useLocalization;
end;
local l_FindFriendsFromUserId_0 = v17.NetworkingFriends.FindFriendsFromUserId;
local l_SearchFriendsByQuery_0 = v17.NetworkingFriends.SearchFriendsByQuery;
local l_GetSuggestedCallees_0 = v17.NetworkingCall.GetSuggestedCallees;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_LoadingSpinner_0 = l_UIBlox_0.App.Loading.LoadingSpinner;
local v29 = require(l_ContactList_0.Analytics.useAnalytics);
local v30 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v31 = require(l_ContactList_0.Components.FriendList.FriendListItem);
local v32 = require(l_ContactList_0.Components.FriendList.SectionHeader);
local v33 = require(l_ContactList_0.Components.ContactListCommon.NoItemView);
local v34 = require(l_ContactList_0.Components.ContactListCommon.Constants);
local v35 = require(l_RobloxGui_0.Modules.BlockingUtility);
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v37 = not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function(v38)
    local v39 = l_useApolloClient_0();
    local v40 = v29();
    local v41 = l_useDispatch_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v43 = nil;
    if l_GetFFlagIrisUseLocalizationProvider_0() then
        v43 = v22({
            genericErrorLabel = "Feature.Call.Error.Description.Generic", 
            noFriendsLabel = "Feature.Call.Description.NoFriendsFound", 
            addFriendsLabel = "Feature.Call.Prompt.AddFriends", 
            suggestedFriendsTitle = "Feature.Call.Label.Suggested", 
            suggestedFriendsDescription = "Feature.Call.Description.SuggestedFriends", 
            friendsTitle = "Feature.Call.Label.Friends", 
            friendsDescription = "Feature.Call.Description.Friends"
        });
    end;
    local v44 = v6.useRef(true);
    local v45 = v6.useRef(nil);
    local v46 = v6.useRef(0);
    local v47, v48 = v6.useState(l_RetrievalStatus_0.Fetching);
    local v49, v50 = v6.useState(false);
    local v51, v52 = v6.useState({});
    local v53, v54 = v6.useState(nil);
    local v55 = v6.useRef("");
    local v56 = nil;
    v56 = if not l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v6.useRef(v41(l_GetSuggestedCallees_0.API()):catch(function()
    end)) else v6.useMemo(function()
        return v41(l_GetSuggestedCallees_0.API()):catch(function()
        end);
    end, {});
    local v57 = v6.useMemo(function()
        return string.gsub(v38.searchText, "%s+", "");
    end, {
        v38.searchText
    });
    local v77 = v6.useCallback(function(v58, v59)
        if v37 then
            v44.current = true;
            v48(l_RetrievalStatus_0.Fetching);
            local v60 = v55.current == "" and 0 or 0.5;
            local v61 = l_HttpService_0:GenerateGUID(false);
            v55.current = v61;
            local function v75()
                if v55.current ~= v61 then
                    return ;
                else
                    v40.fireEvent(v30.PhoneBookSearchAttempted, {
                        eventTimestampMs = os.time() * 1000, 
                        searchQueryString = v57
                    });
                    v8.all({
                        v41(if v57 == "" then l_FindFriendsFromUserId_0.API(v37, {
                            userSort = "CombinedName", 
                            cursor = v59, 
                            limit = 20
                        }) else l_SearchFriendsByQuery_0.API(v37, {
                            userSort = "CombinedName", 
                            cursor = v59, 
                            limit = 20, 
                            query = v57
                        })), 
                        if not l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v56.current else v56
                    }):andThen(function(v62)
                        if v55.current ~= v61 then
                            return ;
                        else
                            local v63 = v62[1];
                            local v64 = v62[2];
                            v40.fireEvent(v30.PhoneBookSearchFinished, {
                                eventTimestampMs = os.time() * 1000, 
                                searchQueryString = v57, 
                                searchResultCount = #v63.responseBody.PageItems
                            });
                            local v65 = {};
                            for _, v67 in ipairs(v58) do
                                table.insert(v65, v67);
                            end;
                            for _, v69 in ipairs(v63.responseBody.PageItems) do
                                table.insert(v65, v69);
                            end;
                            local v71 = v5.List.map(v65, function(v70)
                                return (tostring(v70.id));
                            end);
                            if v57 == "" and v64 ~= nil then
                                for _, v73 in ipairs(v64.responseBody.suggestedCallees) do
                                    table.insert(v71, (tostring(v73.userId)));
                                end;
                            end;
                            v39:query({
                                query = v11.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
                                variables = {
                                    userIds = v71
                                }
                            }):andThen(function()
                                if v55.current ~= v61 then
                                    return ;
                                else
                                    v52(v65);
                                    v54(v63.responseBody.NextCursor);
                                    v48(l_RetrievalStatus_0.Done);
                                    return ;
                                end;
                            end):catch(function(_)
                                if v55.current ~= v61 then
                                    return ;
                                else
                                    v48(l_RetrievalStatus_0.Failed);
                                    return ;
                                end;
                            end);
                            return ;
                        end;
                    end, function()
                        if v55.current ~= v61 then
                            return ;
                        else
                            v48(l_RetrievalStatus_0.Failed);
                            return ;
                        end;
                    end);
                    return ;
                end;
            end;
            if v60 == 0 then
                v75();
                return ;
            else
                delay(v60, v75);
            end;
        end;
    end, l_dependencyArray_0(v57, l_useSelector_0(function(v76)
        return v76.LastRemovedFriend.lastRemovedFriendId;
    end), if not l_GetFFlagSuggestedCalleeBugFixEnabled_0() then nil else v56));
    v6.useEffect(function()
        v77({}, "");
        return function()
            v52({});
            v54(nil);
        end;
    end, l_dependencyArray_0(v77));
    v6.useEffect(function()
        if v47 ~= l_RetrievalStatus_0.Fetching then
            v44.current = false;
        end;
    end, {
        v47
    });
    local v83 = l_useSelector_0(v6.useCallback(function(v78)
        return v78.Call.suggestedCallees.suggestedCallees;
    end, {}), function(v79, v80)
        if #v79 ~= #v80 then
            return false;
        else
            for v81, v82 in ipairs(v79) do
                if v82.userId ~= v80[v81].userId then
                    return false;
                end;
            end;
            return true;
        end;
    end) or {};
    local v85 = v6.useMemo(function()
        local _ = nil;
        return v6.createElement(v33, {
            isImageEnabled = v47 ~= l_RetrievalStatus_0.Failed, 
            imageName = v38.searchText == "" and "icons/graphic/findfriends_xlarge" or "icons/status/oof_xlarge", 
            isFailedButtonEnabled = v47 == l_RetrievalStatus_0.Failed, 
            onFailedButtonActivated = function()
                v77(v51, v53);
            end, 
            isCallButtonEnabled = false, 
            onCallButtonActivated = function()
            end, 
            messageText = if not l_GetFFlagIrisUseLocalizationProvider_0() then if v47 == l_RetrievalStatus_0.Failed then v23:FormatByKey("Feature.Call.Error.Description.Generic") else if v38.searchText ~= "" then v23:FormatByKey("Feature.Call.Description.NoFriendsFound") else v23:FormatByKey("Feature.Call.Prompt.AddFriends") else if v47 == l_RetrievalStatus_0.Failed then v43.genericErrorLabel else if v38.searchText ~= "" then v43.noFriendsLabel else v43.addFriendsLabel
        });
    end, l_dependencyArray_0(v38.searchText, v51, v77, v53, v47));
    local v87 = v6.useCallback(function(v86)
        v46.current = v86.Position.Y;
    end, {});
    local v89 = v6.useCallback(function(v88)
        if not (not (v34.TOUCH_SLOP < v88.Position.Y - v46.current) or not v45.current) and v45.current.CanvasPosition.Y == 0 then
            v50(true);
        end;
    end, {});
    local v91 = v11.Hooks.useUserProfilesFetch({
        userIds = v6.useMemo(function()
            return v5.List.map(v5.List.join(v51, v83), function(v90)
                return (tostring(v90.id or v90.userId));
            end);
        end), 
        query = v11.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v92 = v6.useCallback(function()
        v50(false);
    end, {});
    local v109 = v6.useMemo(function()
        local v93 = {
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        if #v83 ~= 0 and v57 == "" then
            if not l_GetFFlagIrisUseLocalizationProvider_0() then
                v93[#v93 + 1] = v6.createElement(v32, {
                    name = v23:FormatByKey("Feature.Call.Label.Suggested"), 
                    description = v23:FormatByKey("Feature.Call.Description.SuggestedFriends"), 
                    layoutOrder = #v93 + 1
                });
            else
                v93[#v93 + 1] = v6.createElement(v32, {
                    name = v43.suggestedFriendsTitle, 
                    description = v43.suggestedFriendsDescription, 
                    layoutOrder = #v93 + 1
                });
            end;
            local v94 = {};
            for _, v96 in ipairs(v83) do
                if not v35:IsPlayerBlockedByUserId(v96.userId) then
                    table.insert(v94, v96);
                end;
            end;
            for v97, v98 in ipairs(v94) do
                local v99 = "";
                local v100 = "";
                if v91.data then
                    v99 = v11.Selectors.getCombinedNameFromId(v91.data, v98.userId);
                    v100 = v11.Selectors.getUsernameFromId(v91.data, v98.userId);
                end;
                v93[#v93 + 1] = v6.createElement(v31, {
                    userId = v98.userId, 
                    combinedName = v99, 
                    userName = v100, 
                    userPresenceType = v98.userPresenceType, 
                    lastLocation = v98.lastLocation, 
                    dismissCallback = v38.dismissCallback, 
                    layoutOrder = #v93 + 1, 
                    showDivider = v97 ~= #v94, 
                    itemListIndex = v97, 
                    isSuggestedUser = true
                });
            end;
        end;
        if #v51 ~= 0 then
            if not l_GetFFlagIrisUseLocalizationProvider_0() then
                v93[#v93 + 1] = v6.createElement(v32, {
                    name = v23:FormatByKey("Feature.Call.Label.Friends"), 
                    description = v23:FormatByKey("Feature.Call.Description.Friends"), 
                    layoutOrder = #v93 + 1
                });
            else
                v93[#v93 + 1] = v6.createElement(v32, {
                    name = v43.friendsTitle, 
                    description = v43.friendsDescription, 
                    layoutOrder = #v93 + 1
                });
            end;
        end;
        local v101 = {};
        for _, v103 in ipairs(v51) do
            if not v35:IsPlayerBlockedByUserId(v103.id) then
                table.insert(v101, v103);
            end;
        end;
        for v104, v105 in ipairs(v101) do
            local v106 = "";
            local v107 = "";
            if v91.data then
                v106 = v11.Selectors.getCombinedNameFromId(v91.data, v105.id);
                v107 = v11.Selectors.getUsernameFromId(v91.data, v105.id);
            end;
            v93[#v93 + 1] = v6.createElement(v31, {
                userId = v105.id, 
                combinedName = v106, 
                userName = v107, 
                dismissCallback = v38.dismissCallback, 
                layoutOrder = #v93 + 1, 
                showDivider = v104 ~= #v101, 
                searchQueryString = v57, 
                itemListIndex = v104, 
                isSuggestedUser = false
            });
        end;
        if v53 ~= nil then
            local v108 = #v93 + 1;
            if v47 == l_RetrievalStatus_0.Failed then
                v93[v108] = v85;
                return v93;
            else
                v93[v108] = v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v34.ITEM_HEIGHT), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v108
                }, {
                    LoadingSpinner = v6.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(48, 48), 
                        position = UDim2.fromScale(0.5, 0.5), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end;
        return v93;
    end, l_dependencyArray_0(v51, v53, v85, v47, v91.data, v83, v57));
    local v111 = v6.useCallback(function(v110)
        if ((not v44.current and v47 ~= l_RetrievalStatus_0.Failed) and v53 ~= nil) and (v110.AbsoluteCanvasSize.Y - v110.AbsoluteSize.Y) - 50 <= v110.CanvasPosition.Y then
            v77(v51, v53);
        end;
    end, l_dependencyArray_0(v51, v77, v53, v47));
    v6.useEffect(function()
        local v112 = (#v109 - 1) * v34.ITEM_HEIGHT;
        if v45.current and v112 <= v45.current.AbsoluteSize.Y then
            v111(v45.current);
        end;
    end, l_dependencyArray_0(v109, v111));
    return if #v51 == 0 and v47 == l_RetrievalStatus_0.Fetching then v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v34.ITEM_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        LoadingSpinner = v6.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(48, 48), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        })
    }) else if #v51 == 0 then v85 else v7.createFragment({
        FriendsScrollingFrame = v6.createElement("ScrollingFrame", {
            Size = UDim2.fromScale(1, 1), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollingEnabled = not v49 and v38.scrollingEnabled, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            ref = v45, 
            [v6.Change.CanvasPosition] = v111
        }, v109), 
        TouchStartedUserInputConnection = (v38.isSmallScreen and v38.scrollingEnabled) and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchStarted, 
            callback = v87
        }), 
        TouchMovedUserInputConnection = (v38.isSmallScreen and v38.scrollingEnabled) and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchMoved, 
            callback = v89
        }), 
        TouchEndedUserInputConnection = (v38.isSmallScreen and v38.scrollingEnabled) and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchEnded, 
            callback = v92
        })
    });
end;
