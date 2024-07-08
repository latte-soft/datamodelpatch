local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local v1 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = v1.strictInterface({
    placeId = v1.string, 
    playButtonState = v1.string, 
    universeId = v1.string
});
return function(v4, v5)
    local v6, v7 = v3(v5);
    if not v6 then
        l_mutedError_0(v7);
    end;
    v4.EventStream:setRBXEventStream("GamePlayButton", "shareLinkGameJoin", v5);
    v4.Diag:reportCounter("shareLinkGameJoin", 1);
end;
