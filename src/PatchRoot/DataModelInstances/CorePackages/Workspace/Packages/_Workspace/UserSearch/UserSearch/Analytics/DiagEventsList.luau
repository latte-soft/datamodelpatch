local l_DiagEventTypes_0 = require(script:FindFirstAncestor("UserSearch").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v1 = require(script.Parent.EventNames);
local v2 = {
    Done = game:DefineFastString("UserSearchLoadingTimeDoneStats", "UserSearchLoadingTimeDone"), 
    Failed = game:DefineFastString("UserSearchLoadingTimeFailedStats", "UserSearchLoadingTimeFailed")
};
local v3 = {
    Done = game:DefineFastString("UserSearchLoadingTimeNextPageDoneStats", "UserSearchLoadingTimeNextPageDone"), 
    Failed = game:DefineFastString("UserSearchLoadingTimeNextPageFailedStats", "UserSearchLoadingTimeNextPageFailed")
};
return {
    [v1.PlayerFriendRequest] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserSearchPlayerFriendRequestCounter", "UserSearchPlayerFriendRequest")
    }, 
    [v1.PlayerFriendAccept] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserSearchPlayerFriendAcceptCounter", "UserSearchPlayerFriendAccept")
    }, 
    [v1.PlayerTileClick] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserSearchPlayerTileClickCounter", "UserSearchPlayerTileClick")
    }, 
    [v1.PlayerTileImpressions] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserSearchPlayerTileImpressionsCounter", "UserSearchPlayerTileImpressions"), 
        count = function(v4)
            if not v4 or not v4.playerId then
                return 0;
            else
                return #v4.playerId;
            end;
        end
    }, 
    [v1.UserSearchLoadingTime] = {
        type = l_DiagEventTypes_0.Stats, 
        name = function(v5)
            if not v5.nextPage then
                return v2[v5.status];
            else
                return v3[v5.status];
            end;
        end, 
        stats = function(v6)
            return v6.loadingTime or 0;
        end
    }
};
