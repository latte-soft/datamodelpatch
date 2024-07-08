local v0 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
local v1 = {
    [Enum.SwipeDirection.Up] = "up", 
    [Enum.SwipeDirection.Right] = "right", 
    [Enum.SwipeDirection.Down] = "down", 
    [Enum.SwipeDirection.Left] = "left"
};
return function(v2, v3, v4, v5, v6)
    v0.isType(v3, "string", "eventContext");
    v0.isType(v4, "string", "elementName");
    local v7 = {
        elt = v4, 
        dir = v1[v5]
    };
    if v6 ~= nil then
        v0.isType(v6, "string", "extraData");
        v7.cstm = v6;
    end;
    v2:setRBXEventStream(v3, "touchSwipe", v7);
end;
