local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = v1.union(v1.strictInterface({
    page = v1.string, 
    dismissMethod = v1.string
}), (v1.strictInterface({
    page = v1.string, 
    dismissMethod = v1.string, 
    locale = v1.optional(v1.string), 
    universeId = v1.string, 
    source = v1.string, 
    index = v1.number
})));
return {
    dismissMethodEnum = {
        topBarTap = "topBarTap", 
        scrimTap = "scrimTap", 
        swipe = "swipe", 
        handleTap = "handleTap"
    }, 
    logEvent = function(v4, v5, v6)
        local v7, v8 = v3(v6);
        if not v7 then
            l_mutedError_0(v8);
        end;
        v4:sendEventDeferred(v5, "uiPeekViewDismissed", v6);
    end
};
