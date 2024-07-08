local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
return {
    {
        page = v1.Home, 
        icon = {
            on = "LuaApp/icons/menu/home_on", 
            off = "LuaApp/icons/menu/home_off"
        }, 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = 0
    }, 
    {
        page = v1.Games, 
        icon = {
            on = "LuaApp/icons/menu/games_on", 
            off = "LuaApp/icons/menu/games_off"
        }, 
        actionType = Enum.AppShellActionType.TapGamePageTab, 
        badgeCount = 0
    }, 
    {
        page = v1.AvatarExperienceRoot, 
        iconComponent = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotSystemBarIcon), 
        actionType = Enum.AppShellActionType.TapAvatarTab, 
        badgeCount = 0
    }, 
    {
        page = v1.Chat, 
        icon = {
            on = "LuaApp/icons/menu/chat_on", 
            off = "LuaApp/icons/menu/chat_off"
        }, 
        actionType = Enum.AppShellActionType.TapChatTab, 
        badgeCount = 0
    }, 
    {
        page = v1.More, 
        icon = {
            on = "LuaApp/icons/menu/more_on", 
            off = "LuaApp/icons/menu/more_off"
        }, 
        actionType = nil, 
        badgeCount = 0
    }
};
