local l_Parent_0 = script:FindFirstAncestor("SocialContextToasts").Parent;
local v1 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = v1.strictInterface({
    toastType = v1.string, 
    friendId = v1.string, 
    universeId = v1.string, 
    placeId = v1.string, 
    actionType = v1.string
});
return function(v4, v5)
    local v6, v7 = v3(v5);
    if not v6 then
        l_mutedError_0(v7);
    end;
    v4:sendEventDeferred("SocialContextToast", "socialContextToastEvent", v5);
end;
