local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.User);
return {
    [v0.PresenceType.OFFLINE] = nil, 
    [v0.PresenceType.ONLINE] = "component_assets/circle_16", 
    [v0.PresenceType.IN_GAME] = "icons/menu/games_small", 
    [v0.PresenceType.IN_STUDIO] = "icons/logo/studiologo_small"
};
