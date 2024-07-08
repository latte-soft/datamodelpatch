local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(l_Parent_0.ApolloClient);
local l_useQuery_0 = v6.useQuery;
local l_useApolloClient_0 = v6.useApolloClient;
local l_queries_0 = require(l_Parent_0.ApolloLocalState).queries;
local l_PresenceType_0 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local v11 = require(l_Parent_0.ApolloFriends);
local v12 = require(l_Parent_0.ApolloPresence);
local l_useFetchTimeLogging_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Timing.useFetchTimeLogging;
local v14 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v15 = require(l_script_FirstAncestor_0.Analytics.FetchNames);
local l_RetrievalStatus_0 = v4.App.Loading.Enum.RetrievalStatus;
local l_FriendsCarouselPresenceUpdateSignal_0 = require(l_script_FirstAncestor_0.Signals).FriendsCarouselPresenceUpdateSignal;
local l_FriendsCarouselFriendshipUpdateSignal_0 = require(l_script_FirstAncestor_0.Signals).FriendsCarouselFriendshipUpdateSignal;
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselUILoadingTime);
local l_FriendsCarouselFriendshipUpdateSignal_1 = require(l_script_FirstAncestor_0.Signals).FriendsCarouselFriendshipUpdateSignal;
local l_FFlagFriendsCarouselIXPfriendsSort_0 = v5.FFlagFriendsCarouselIXPfriendsSort;
local l_FIntFriendsCarouselInitialFetchSize_0 = v5.FIntFriendsCarouselInitialFetchSize;
local v23 = game:DefineFastInt("FriendsCarouselLoadMoreFetchSize", 10);
local _ = function(v24)
    local v25 = {};
    for _, v27 in v24, nil, nil do
        v25[v27.id] = v27.presence;
    end;
    return v25;
end;
local function v45(v29, v30, v31)
    local v32 = nil;
    local v33 = nil;
    if not v19 then
        v32 = v31;
    else
        v33 = v31;
        v32 = v33.friends or v33.onlineFriends;
    end;
    local v34 = v29 or {};
    local v35 = {};
    for _, v37 in v34, nil, nil do
        v35[v37.id] = v37.presence;
    end;
    local l_v35_0 = v35;
    local v44 = v3.List.map(v3.List.join(v3.List.filter(v29, function(v39)
        return v39.presence.userPresenceType == l_PresenceType_0.InGame;
    end), v3.List.filter(v29, function(v40)
        return v40.presence.userPresenceType == l_PresenceType_0.Online;
    end), v3.List.filter(v29, function(v41)
        return v41.presence.userPresenceType == l_PresenceType_0.InStudio;
    end), (v3.List.filter(v30 or {}, function(v42)
        return not l_v35_0[v42.id];
    end))), function(v43)
        return v3.Dictionary.join(v43, {
            isFriendWithUser = true, 
            presence = if not v19 then nil else if v43.presence then v43.presence else if not v19 then nil else if v33.onlineFriends then nil else {
                userPresenceType = l_PresenceType_0.Offline
            }
        });
    end);
    if v32 then
        table.insert(v44, {
            isLoading = true
        });
    end;
    return v44;
end;
local function v50(v46, v47)
    for _, v49 in v47, nil, nil do
        v12.Mutations.createUserPresenceCache(v46, {
            id = v49.userId, 
            userPresenceNumber = v49.userPresenceType, 
            lastLocation = v49.lastLocation, 
            lastOnline = v49.lastOnline, 
            gameId = v49.gameId, 
            placeId = v49.placeId, 
            rootPlaceId = v49.rootPlaceId, 
            universeId = v49.universeId
        });
    end;
end;
local function v62(v51, v52, v53)
    local v54 = v51:readQuery({
        query = l_queries_0.onlineFriendsByUserId, 
        variables = v52
    });
    local v55 = if not v54 then {} else v54.onlineFriendsByUserId or {};
    local v56 = {};
    for _, v58 in v55, nil, nil do
        v56[v58.id] = v58.presence;
    end;
    local l_v56_0 = v56;
    return #v3.List.filter(v53, function(v60)
        local v61 = false;
        if v12.Formatters.formatNumberToPresenceType(v60.userPresenceType) ~= l_PresenceType_0.Offline then
            v61 = not l_v56_0[tostring(v60.userId)];
        end;
        return v61;
    end);
end;
return function(v63)
    local v64 = l_useApolloClient_0();
    local v65 = {
        userId = v63.userId, 
        sort = if not not l_FFlagFriendsCarouselIXPfriendsSort_0 and v63.friendsSortVariant then v63.friendsSortVariant else v11.Enums.Sort.FriendshipScore
    };
    local v66 = v2.useRef(nil);
    local v67 = v2.useRef(nil);
    local v68 = l_useQuery_0(l_queries_0.allFriendsByUserId, {
        errorPolicy = "all", 
        notifyOnNetworkStatusChange = true, 
        variables = v3.Dictionary.join(v65, {
            pageLimit = l_FIntFriendsCarouselInitialFetchSize_0, 
            pageCursor = ""
        })
    });
    local v69 = l_useQuery_0(l_queries_0.onlineFriendsByUserId, {
        notifyOnNetworkStatusChange = true, 
        variables = v65
    });
    l_useFetchTimeLogging_0({
        loading = v68.loading, 
        error = v67.current or v68.error, 
        timerKey = v66.current or v15.AllFriends, 
        onSuccess = function(v70, v71)
            if v63.fireAnalyticsEvent then
                v63.fireAnalyticsEvent(v14.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Done.rawValue(), 
                    loadingTime = v70, 
                    nextPage = v71 ~= v15.AllFriends, 
                    fetch = v15.AllFriends
                });
            end;
        end, 
        onError = function(v72, v73)
            if v63.fireAnalyticsEvent then
                v63.fireAnalyticsEvent(v14.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Failed.rawValue(), 
                    loadingTime = v72, 
                    nextPage = v73 ~= v15.AllFriends, 
                    fetch = v15.AllFriends
                });
            end;
        end
    });
    l_useFetchTimeLogging_0({
        loading = v69.loading, 
        error = v69.error, 
        timerKey = v15.OnlineFriends, 
        onSuccess = function(v74)
            if v63.fireAnalyticsEvent then
                v63.fireAnalyticsEvent(v14.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Done.rawValue(), 
                    loadingTime = v74, 
                    fetch = v15.OnlineFriends
                });
            end;
        end, 
        onError = function(v75)
            if v63.fireAnalyticsEvent then
                v63.fireAnalyticsEvent(v14.PaginatedFriendsCarouselLoadingTime, {
                    status = l_RetrievalStatus_0.Failed.rawValue(), 
                    loadingTime = v75, 
                    fetch = v15.OnlineFriends
                });
            end;
        end
    });
    local v76 = if not v68.data then nil else v68.data.allFriendsByUserId.nextCursor;
    local v77 = if not v68.data then nil else v68.data.allFriendsByUserId.friends;
    local v78 = not not v69.data and v69.data.onlineFriendsByUserId or {};
    local v80 = v2.useCallback(function()
        if not (not v76 or v76 == "") and not v68.loading then
            v68:fetchMore({
                variables = {
                    pageCursor = v76, 
                    pageLimit = v23
                }
            }):andThen(function(v79)
                v67.current = v79 and v79.errors;
            end);
            v66.current = v76;
            return ;
        else
            return ;
        end;
    end, {
        v76, 
        v68.loading
    });
    local function v81()
        v69:refetch();
        v68:refetch();
        v66.current = nil;
        v67.current = nil;
    end;
    v2.useEffect(function()
        l_FriendsCarouselPresenceUpdateSignal_0.Event:Connect(function(v82)
            v50(v64, v82);
            if v62(v64, v65, v82) > 0 then
                v69:refetch();
                if not (not l_FriendsCarouselFriendshipUpdateSignal_1 or not v63.fireAnalyticsEvent) then
                    v63.fireAnalyticsEvent(v14.OnlineFriendsRefetchOnPresenceUpdate);
                end;
            end;
        end);
        l_FriendsCarouselFriendshipUpdateSignal_0.Event:Connect(function(v83)
            if not v83.removedUserId then
                if v83.addedUserId then
                    v69:refetch();
                    v11.Cache.addFriendToFriendsByUserIdCache(v64, {
                        targetUserId = v63.userId, 
                        userId = v83.addedUserId, 
                        hasVerifiedBadge = nil
                    });
                    if not (not l_FriendsCarouselFriendshipUpdateSignal_1 or not v63.fireAnalyticsEvent) then
                        v63.fireAnalyticsEvent(v14.OnlineFriendsRefetchOnFriendshipUpdate);
                    end;
                end;
                return ;
            else
                v11.Cache.removeFriendFromCache(v64, {
                    targetUserId = v63.userId, 
                    userId = v83.removedUserId
                });
                return ;
            end;
        end);
        return function()
            l_FriendsCarouselPresenceUpdateSignal_0:Destroy();
            l_FriendsCarouselFriendshipUpdateSignal_0:Destroy();
        end;
    end, {});
    local v84 = if not v19 then v68.loading or v69.loading else nil;
    return v2.useMemo(function()
        return (v45(v78, v77, if not v19 then v84 else {
            friends = v68.loading, 
            onlineFriends = v69.loading
        }));
    end, {
        v78, 
        v77, 
        v84, 
        if not v19 then nil else v68.loading, 
        if not v19 then nil else v69.loading
    }), v80, v81;
end;
