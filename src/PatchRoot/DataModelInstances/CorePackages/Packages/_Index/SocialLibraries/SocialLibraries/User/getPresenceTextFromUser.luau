local l_UserModel_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel;
return function(v1)
    local l_presence_0 = v1.presence;
    local l_lastLocation_0 = v1.lastLocation;
    if l_presence_0 == l_UserModel_0.PresenceType.OFFLINE then
        return "Common.Presence.Label.Offline";
    elseif l_presence_0 == l_UserModel_0.PresenceType.ONLINE then
        return "Common.Presence.Label.Online";
    elseif not (l_presence_0 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_0 == l_UserModel_0.PresenceType.IN_STUDIO then
        if not l_lastLocation_0 then
            return "Common.Presence.Label.Online";
        else
            return (tostring(l_lastLocation_0));
        end;
    else
        return "";
    end;
end;
