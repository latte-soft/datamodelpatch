local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Components.More.MorePage);
local v3 = require(l_Modules_0.Personalization.Home.HomePage);
local v4 = require(l_Modules_0.Personalization.Games.GamesPage);
local v5 = require(l_Modules_0.LuaApp.Components.SocialTab.SocialTabUniversalAppWrapper.Container);
local v6 = require(l_Modules_0.LuaApp.Navigation.wrapPageInScreenGui);
local v7 = require(l_Modules_0.LuaApp.Navigation.wrapAppPageForRoactNavigation);
return {
    {
        [v1.Home] = v7(function(v8)
            return v6(v3, v1.Home, v8);
        end, v1.Home)
    }, 
    {
        [v1.Games] = v7(function(v9)
            return v6(v4, v1.Games, v9);
        end, v1.Games)
    }, 
    {
        [v1.AvatarExperienceRoot] = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer)
    }, 
    {
        [v1.Chat] = v7(function(v10, _)
            return v6(v5, v1.Chat, v10);
        end, v1.Chat)
    }, 
    {
        [v1.More] = v7(function(v12)
            return v6(v2, v1.More, v12);
        end, v1.More)
    }
};
