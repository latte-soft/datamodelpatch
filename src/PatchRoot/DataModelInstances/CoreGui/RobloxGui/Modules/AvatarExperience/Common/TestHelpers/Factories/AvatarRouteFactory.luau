local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types);
local v5 = {
    makeMockRouteInfo = function(v1)
        return {
            name = v1, 
            key = v1, 
            params = {}
        };
    end, 
    makeMockRoute = function(v2, v3, v4)
        return {
            current = v3, 
            previousPages = v4, 
            opaque = v2, 
            isVisible = true, 
            isOverlayVisible = false
        };
    end
};
v5.makeMockRouteSimplified = function(v6)
    local v7 = v5.makeMockRouteInfo(v6);
    return {
        current = v7, 
        previousPages = {
            v7
        }, 
        opaque = v7, 
        isVisible = true, 
        isOverlayVisible = false
    };
end;
return v5;
