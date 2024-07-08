local l_Parent_0 = script:FindFirstAncestor("ExperienceAnalytics").Parent;
local v1 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = v1.strictInterface({
    pg = v1.string, 
    universeId = v1.union(v1.string, v1.number), 
    navigationUniverseId = if not require(l_Parent_0.SharedFlags).FFlagLuaAppFixNavigationUidLogging then nil else v1.optional(v1.string), 
    pos = v1.optional(v1.number), 
    pid = v1.optional(v1.union(v1.number, v1.string)), 
    sortPos = v1.optional(v1.number), 
    ad = v1.optional(v1.string), 
    gameSetTargetId = v1.optional(v1.number), 
    gameSetTypeId = v1.optional(v1.string), 
    tis = v1.optional(v1.number), 
    refId = v1.optional(v1.string), 
    src = v1.optional(v1.string), 
    friendId = v1.optional(v1.string), 
    position = v1.optional(v1.number), 
    absolutePosition = v1.optional(v1.number), 
    fromWhere = v1.optional(v1.string), 
    locale = v1.optional(v1.string), 
    conversationId = v1.optional(v1.number)
});
return function(v4, v5, v6)
    local v7, v8 = v3(v6);
    if not v7 then
        l_mutedError_0(v8);
    end;
    v4:sendEventDeferred(v5, "gameDetailReferral", v6);
end;
