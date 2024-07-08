local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Packages.t);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v5 = v3.strictInterface({
    distance = v3.number, 
    screenSizeX = v3.number, 
    screenSizeY = v3.number, 
    scrollAreaSize = v3.number, 
    scrollDepth = v3.optional(v3.number), 
    startDepth = v3.optional(v3.number), 
    startPos = v3.number, 
    scrollDuration = v3.number
});
local v6 = v3.strictInterface({
    distance = v3.number, 
    screenSizeX = v3.number, 
    screenSizeY = v3.number, 
    scrollAreaSize = v3.number, 
    scrollDepth = v3.optional(v3.number), 
    startDepth = v3.optional(v3.number), 
    startPos = v3.number, 
    scrollDuration = v3.number, 
    sortPos = v3.number, 
    gameSetTypeId = v3.string, 
    gameSetTargetId = v3.optional(v3.number)
});
return function(v7, v8, v9, v10)
    v1.isType(v8, "string", "eventContext");
    local v11 = "unknown";
    local v12 = nil;
    if v9 == Enum.ScrollingDirection.Y then
        v11 = "vertical";
        v12 = v5;
    elseif v9 == Enum.ScrollingDirection.X then
        v11 = "horizontal";
        v12 = v6;
    elseif v9 == Enum.ScrollingDirection.XY then
        l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(v9.Name)));
    end;
    if not v12 then
        l_mutedError_0((("Missing interface for unknown direction %* to type check feedScroll event parameters"):format(v9.Name)));
    else
        local v13, v14 = v12(v10);
        if not v13 then
            l_mutedError_0(v14);
        end;
    end;
    v7:sendEventDeferred(v8, "feedScroll", (v2.Dictionary.join(v10, {
        direction = v11
    })));
end;
