local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local l_DiagEventTypes_0 = require(l_script_FirstAncestor_0.Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v2 = require(script.Parent.EventNames);
local v3 = require(script.Parent.FetchNames);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselOldFriendEndpointLoadingTime);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagFriendsCarouselUILoadingTime);
local l_FriendsCarouselFriendshipUpdateSignal_0 = require(l_script_FirstAncestor_0.Signals).FriendsCarouselFriendshipUpdateSignal;
local v7 = {
    Done = game:DefineFastString("AllFriendsCarouselLoadingTimeDoneStats", "AllFriendsCarouselLoadingTimeDone"), 
    Failed = game:DefineFastString("AllFriendsCarouselLoadingTimeFailedStats", "AllFriendsCarouselLoadingTimeFailed")
};
local v8 = {
    Done = game:DefineFastString("AllFriendsNextPageCarouselLoadingTimeDoneStats", "AllFriendsNextPageCarouselLoadingTimeDone"), 
    Failed = game:DefineFastString("AllFriendsNextPageCarouselLoadingTimeFailedStats", "AllFriendsNextPageCarouselLoadingTimeFailed")
};
local v9 = {
    Done = game:DefineFastString("OnlineFriendsCarouselLoadingTimeDoneStats", "OnlineFriendsCarouselLoadingTimeDone"), 
    Failed = game:DefineFastString("OnlineFriendsCarouselLoadingTimeFailedStats", "OnlineFriendsCarouselLoadingTimeFailed")
};
local v10 = {
    Done = game:DefineFastString(" OldAllFriendsCarouselLoadingTimeDoneStats", "OldAllFriendsCarouselLoadingTimeDone"), 
    Failed = game:DefineFastString("OldAllFriendsCarouselLoadingTimeFailedStats", "OldAllFriendsCarouselLoadingTimeFailed")
};
local v11 = game:DefineFastString("FriendsCarouselUILoadingTimeStats", "FriendsCarouselUILoadingTime");
return {
    [v2.CarouselLoadedWithUsers] = {
        name = game:DefineFastString("FriendsCarouselLoadedWithUsers", "FriendsCarouselLoadedWithUsers")
    }, 
    [v2.UserPressed] = {
        name = game:DefineFastString("FriendsCarouselUserPressed", "FriendsCarouselUserPressed")
    }, 
    [v2.RequestFriendship] = {
        name = game:DefineFastString("FriendsCarouselRequestFriendship", "FriendsCarouselRequestFriendship")
    }, 
    [v2.RevokeFriendRequest] = {
        name = game:DefineFastString("FriendsCarouselRevokeFriendRequest", "FriendsCarouselRevokeFriendRequest")
    }, 
    [v2.ViewAllFriends] = {
        name = game:DefineFastString("HomePageNavigationViewAllFriends", "HomePageNavigationFriendsLanding")
    }, 
    [v2.ViewAddFriends] = {
        name = game:DefineFastString("HomePageNavigationViewAddFriends", "AddFriendsHomeEntry")
    }, 
    [v2.PaginatedFriendsCarouselLoadingTime] = {
        type = l_DiagEventTypes_0.Stats, 
        name = function(v12)
            if v12.fetch == v3.AllFriends then
                if not v12.nextPage then
                    return v7[v12.status];
                else
                    return v8[v12.status];
                end;
            else
                return v9[v12.status];
            end;
        end, 
        stats = function(v13)
            return v13.loadingTime or 0;
        end
    }, 
    [v2.FriendsEndpointLoadingTime] = if not v4 then nil else {
        type = l_DiagEventTypes_0.Stats, 
        name = function(v14)
            return v10[v14.status];
        end, 
        stats = function(v15)
            return v15.loadingTime or 0;
        end
    }, 
    [v2.FriendsCarouselUILoadingTime] = if not v5 then nil else {
        type = l_DiagEventTypes_0.Stats, 
        name = function(v16)
            return (("%*_%*"):format(v11, v16.fetch));
        end, 
        stats = function(v17)
            return v17.loadingTime or 0;
        end
    }, 
    [v2.OnlineFriendsRefetchOnPresenceUpdate] = if not l_FriendsCarouselFriendshipUpdateSignal_0 then nil else {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("OnlineFriendsRefetchOnPresenceUpdateCounter", "OnlineFriendsRefetchOnPresenceUpdate")
    }, 
    [v2.OnlineFriendsRefetchOnFriendshipUpdate] = if not l_FriendsCarouselFriendshipUpdateSignal_0 then nil else {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("OnlineFriendsRefetchOnFriendshipUpdateCounter", "OnlineFriendsRefetchOnFriendshipUpdate")
    }
};
