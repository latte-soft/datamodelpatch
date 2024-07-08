local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local l_SwitchTab_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SwitchTab;
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotSystemBarIcon);
local _ = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_Images_0 = v2.App.ImageSet.Images;
return {
    tabs = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph then {
        {
            titleLocalizationKey = "CommonUI.Features.Label.Home", 
            page = l_SwitchTab_0.HomeTab, 
            icon = l_Images_0["icons/menu/home_on"], 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "CommonUI.Features.Label.Avatar", 
            page = l_SwitchTab_0.AvatarExperienceTab, 
            iconComponent = v5, 
            actionType = Enum.AppShellActionType.TapAvatarTab
        }, 
        {
            titleLocalizationKey = "Feature.SocialTab.Label.Connect", 
            page = l_SwitchTab_0.ChatTab, 
            icon = l_Images_0["icons/menu/friendsOn"], 
            actionType = Enum.AppShellActionType.TapChatTab
        }
    } else require(l_Modules_0.LuaApp.GetIABottomBarItems)(), 
    options = {
        {
            titleLocalizationKey = "Feature.Catalog.Label.Search", 
            page = v4.SearchPage, 
            icon = l_Images_0["icons/common/search"], 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "Feature.Home.Robux", 
            page = v4.PurchaseRobux, 
            icon = l_Images_0["icons/common/goldrobux"], 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "CommonUI.Features.Label.More", 
            page = v4.More, 
            icon = l_Images_0["icons/common/more"], 
            actionType = nil
        }
    }
};
