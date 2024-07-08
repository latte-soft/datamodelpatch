local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = {
    PlayButton = v2.strictInterface({
        placeId = v2.union(v2.string, v2.number), 
        rootPlaceId = v2.union(v2.number, v2.string), 
        referralSource = v2.optional(v2.string)
    }), 
    [v4.Context.ExperienceTile] = v2.strictInterface({
        placeId = v2.string, 
        rootPlaceId = v2.number, 
        referralSource = v2.optional(v2.string), 
        sortIndex = v2.string, 
        sortEntryIndex = v2.string, 
        gameSetTypeId = v2.optional(v2.string), 
        gameSetTargetId = v2.optional(v2.number)
    }), 
    [v4.Context.SearchExperienceTile] = v2.strictInterface({
        placeId = v2.string, 
        rootPlaceId = v2.number, 
        sortEntryIndex = v2.string, 
        gameSetTypeId = v2.string, 
        sortIndex = v2.number
    }), 
    [v4.Context.PeopleListInHomePage] = v2.strictInterface({
        placeId = v2.string, 
        rootPlaceId = v2.number, 
        joinAttemptId = v2.optional(v2.string)
    }), 
    [v4.Context.GamePlayIntentInPlacesList] = v2.strictInterface({
        placeId = v2.string, 
        rootPlaceId = v2.number, 
        joinAttemptId = v2.optional(v2.string)
    }), 
    shareLinks = v2.strictInterface({
        placeId = v2.union(v2.string, v2.number), 
        rootPlaceId = v2.union(v2.number, v2.string), 
        linkId = v2.string, 
        linkType = v2.string, 
        linkStatus = v2.string, 
        joinAttemptId = v2.optional(v2.string)
    }), 
    PlayGameFromPlayTogether = v2.strictInterface({
        placeId = v2.union(v2.string, v2.number), 
        rootPlaceId = v2.union(v2.number, v2.string), 
        referralSource = v2.optional(v2.string), 
        sortIndex = v2.optional(v2.string), 
        sortEntryIndex = v2.optional(v2.string), 
        gameSetTypeId = v2.optional(v2.string), 
        gameSetTargetId = v2.optional(v2.number), 
        linkId = v2.optional(v2.union(v2.string, v2.number)), 
        linkType = v2.optional(v2.string), 
        linkStatus = v2.optional(v2.string), 
        conversationId = v2.optional(v2.union(v2.number, v2.string)), 
        joinAttemptId = v2.optional(v2.string), 
        uid = v2.optional(v2.string)
    }), 
    PlayGameFromLinkCard = v2.strictInterface({
        placeId = v2.string, 
        rootPlaceId = v2.number, 
        joinAttemptId = v2.optional(v2.string), 
        conversationId = v2.optional(v2.string)
    }), 
    [v4.Context.PlayerContextualMenu] = v2.strictInterface({
        friendId = v2.string, 
        pageName = v2.string, 
        placeId = v2.optional(v2.string), 
        rootPlaceId = v2.optional(v2.string), 
        joinAttemptId = v2.string
    })
};
return function(v6, v7, v8)
    if v5[v7] ~= nil then
        local v9, v10 = v5[v7](v8);
        if not v9 then
            l_mutedError_0(v10);
        end;
    else
        l_mutedError_0(string.format("Missing interface for eventContext %s to type check gamePlayIntent event parameters", v7));
    end;
    v6:sendEventDeferred(v7, "gamePlayIntent", {
        placeId = v8.placeId, 
        rootPlaceId = v8.rootPlaceId, 
        referralSource = v8.referralSource, 
        sortIndex = v8.sortIndex, 
        sortEntryIndex = v8.sortEntryIndex, 
        gameSetTypeId = v8.gameSetTypeId, 
        gameSetTargetId = v8.gameSetTargetId, 
        linkId = v8.linkId, 
        linkType = v8.linkType, 
        linkStatus = v8.linkStatus, 
        conversationId = v8.conversationId, 
        joinAttemptId = v8.joinAttemptId, 
        friendId = v8.friendId, 
        pageName = v8.pageName
    });
end;
