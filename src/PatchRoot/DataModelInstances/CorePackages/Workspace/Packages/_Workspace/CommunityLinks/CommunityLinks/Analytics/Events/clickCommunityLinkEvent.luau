local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v2 = require(l_Parent_0.t);
local v3 = require(script.Parent.Parent.constants);
local v4 = v2.strictInterface({
    guildedServerId = v2.string, 
    entityType = v2.string, 
    entityId = v2.union(v2.string, v2.number)
});
return function(v5, v6, v7)
    local v8, v9 = v4(v7);
    if not v8 then
        l_mutedError_0(v9);
    end;
    v5:sendEventDeferred(v6, v3.EventNames.ClickCommunityLink, {
        guildedServerId = v7.guildedServerId, 
        entityType = v7.entityType, 
        entityId = v7.entityId
    });
end;
