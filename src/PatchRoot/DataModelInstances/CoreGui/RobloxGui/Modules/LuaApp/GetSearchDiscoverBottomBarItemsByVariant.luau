local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotSystemBarIcon);
local v3 = {
    page = v1.Home, 
    icon = {
        on = "icons/menu/home_on", 
        off = "icons/menu/home_off"
    }, 
    actionType = Enum.AppShellActionType.TapHomePageTab, 
    badgeCount = 0
};
local v4 = {
    page = v1.Games, 
    icon = {
        on = "icons/menu/games_on", 
        off = "icons/menu/games_off"
    }, 
    actionType = Enum.AppShellActionType.TapGamePageTab, 
    badgeCount = 0
};
local v5 = {
    page = v1.Games, 
    icon = {
        on = "icons/menu/search_on", 
        off = "icons/menu/search"
    }, 
    actionType = nil, 
    badgeCount = 0
};
local v6 = {
    page = v1.AvatarExperienceRoot, 
    iconComponent = v2, 
    actionType = Enum.AppShellActionType.TapAvatarTab, 
    badgeCount = 0
};
local v7 = {
    page = v1.Chat, 
    icon = {
        on = "icons/menu/chat_on", 
        off = "icons/menu/chat_off"
    }, 
    actionType = Enum.AppShellActionType.TapChatTab, 
    badgeCount = 0
};
local v8 = {
    page = v1.More, 
    icon = {
        on = "icons/menu/more_on", 
        off = "icons/menu/more_off"
    }, 
    actionType = nil, 
    badgeCount = 0
};
local v9 = {
    v3, 
    v4, 
    v6, 
    v7, 
    v8
};
local v10 = {
    v3, 
    v5, 
    v6, 
    v7, 
    v8
};
local v11 = {
    v3, 
    v6, 
    v7, 
    v8
};
return function(v12)
    assert(typeof(v12) == "number", "variant must be a number");
    local l_v9_0 = v9;
    if v12 == 0 then
        l_v9_0 = v9;
    elseif v12 == 1 then
        l_v9_0 = v10;
    elseif v12 == 2 then
        l_v9_0 = v11;
    else
        warn("Invalid variant requested for bottom bar, returning control");
    end;
    local v14 = {};
    for v15, v16 in ipairs(l_v9_0) do
        v14[v16.page] = v15;
    end;
    return l_v9_0, v14;
end;
