local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_User_0 = v0.RoduxUsers.Models.User;
local l_llama_0 = v0.llama;
local l_PresenceType_0 = v0.RoduxPresence.Enums.PresenceType;
return function(v4)
    local v5 = l_User_0.mock();
    return l_llama_0.Dictionary.join(v5, {
        username = v5.name, 
        thumbnail = "rbxassetid://2610133241", 
        userPresenceType = l_PresenceType_0.Offline, 
        isPremium = false
    }, v4 or {});
end;
