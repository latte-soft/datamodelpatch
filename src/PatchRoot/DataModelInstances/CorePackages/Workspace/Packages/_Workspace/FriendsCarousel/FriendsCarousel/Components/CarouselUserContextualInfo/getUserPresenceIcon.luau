local l_PresenceType_0 = require(script.Parent.Parent.Parent.dependencies).RoduxPresence.Enums.PresenceType;
local v1 = {
    [l_PresenceType_0.Online] = "component_assets/circle_16", 
    [l_PresenceType_0.InGame] = "icons/menu/games_small", 
    [l_PresenceType_0.InStudio] = "icons/logo/studiologo_small"
};
local v2 = UDim2.fromOffset(12, 12);
return function(v3)
    local v4 = {
        path = v1[v3.presence]
    };
    if v3.presence == l_PresenceType_0.Online then
        v4.color = v3.theme.OnlineStatus.Color;
        v4.transparency = v3.theme.OnlineStatus.Transparency;
        v4.size = v2;
    end;
    if v3.presence == l_PresenceType_0.InGame then
        v4.transparency = v3.theme.IconEmphasis.Transparency;
    end;
    return v4;
end;
