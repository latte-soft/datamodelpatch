local l_PresenceType_0 = require(script:FindFirstAncestor("SocialCommon").Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
    keyPath = "SocialCommon.Presence"
}).Enums.PresenceType;
return function(v1)
    if v1 == l_PresenceType_0.Online then
        return "Online";
    elseif v1 == l_PresenceType_0.InStudio then
        return "InStudio";
    elseif v1 == l_PresenceType_0.InGame then
        return "InGame";
    else
        return "Offline";
    end;
end;
