local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v8 = require(l_Modules_0.LuaApp.Components.NavbarExperimentation);
local v9 = require(l_Modules_0.Personalization.Games.ChartsPageExperimentation);
local l_GetFFlagEnableNavBarLabels_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNavBarLabels;
local l_GetFFlagNavBarLabelsVRFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNavBarLabelsVRFix;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotSystemBarIcon);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotWithLabelSystemBarIcon);
local v14 = require(l_Modules_0.LuaApp.Components.AppSystemBarIconWithLabel);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Experiments.NewChatTabExperimentation.default;
local l_FFlagUnifyNavigationGraph_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifyNavigationGraph;
local v17 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRename);
local v18 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsPageRenameIXP);
local v19 = {
    {
        page = v5.Home, 
        icon = {
            on = "icons/menu/home_on", 
            off = "icons/menu/home_off"
        }, 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = 0
    }, 
    {
        page = v5.Games, 
        icon = {
            on = "icons/menu/games_on", 
            off = "icons/menu/games_off"
        }, 
        actionType = Enum.AppShellActionType.TapGamePageTab, 
        badgeCount = 0
    }, 
    {
        page = v5.AvatarExperienceRoot, 
        iconComponent = v12, 
        actionType = Enum.AppShellActionType.TapAvatarTab, 
        badgeCount = 0
    }, 
    {
        page = v5.Chat, 
        icon = {
            on = "icons/menu/chat_on", 
            off = "icons/menu/chat_off"
        }, 
        actionType = Enum.AppShellActionType.TapChatTab, 
        badgeCount = 0
    }, 
    {
        page = v5.More, 
        icon = {
            on = "icons/menu/more_on", 
            off = "icons/menu/more_off"
        }, 
        actionType = nil, 
        badgeCount = 0
    }
};
local v20 = UDim2.new(0, 44, 0, 64);
local v21 = {
    {
        page = v5.Home, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.Home", 
                icon = {
                    on = "icons/menu/home_on", 
                    off = "icons/menu/home_off"
                }
            }));
        end, 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = 0
    }, 
    {
        page = v5.Games, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.Discover", 
                icon = {
                    on = "icons/menu/games_on", 
                    off = "icons/menu/games_off"
                }
            }));
        end, 
        actionType = Enum.AppShellActionType.TapGamePageTab, 
        badgeCount = 0
    }, 
    {
        page = v5.AvatarExperienceRoot, 
        itemSize = v20, 
        iconComponent = function(...)
            return v13(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.Avatar"
            }));
        end, 
        actionType = Enum.AppShellActionType.TapAvatarTab, 
        badgeCount = 0
    }, 
    {
        page = v5.Chat, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = (not not l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab()) and "CommonUI.Features.Label.Chat" or "Feature.SocialTab.Label.Connect", 
                icon = {
                    on = "icons/menu/chat_on", 
                    off = "icons/menu/chat_off"
                }
            }));
        end, 
        actionType = Enum.AppShellActionType.TapChatTab, 
        badgeCount = 0
    }, 
    {
        page = v5.More, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.More", 
                icon = {
                    on = "icons/menu/more_on", 
                    off = "icons/menu/more_off"
                }
            }));
        end, 
        actionType = nil, 
        badgeCount = 0
    }
};
local v22 = {
    {
        page = v5.Home, 
        icon = {
            on = "icons/menu/home_on", 
            off = "icons/menu/home_off"
        }, 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = 0
    }, 
    {
        page = v5.Chat, 
        icon = {
            on = "icons/menu/chat_on", 
            off = "icons/menu/chat_off"
        }, 
        actionType = Enum.AppShellActionType.TapChatTab, 
        badgeCount = 0
    }, 
    {
        page = v5.More, 
        icon = {
            on = "icons/menu/more_on", 
            off = "icons/menu/more_off"
        }, 
        actionType = nil, 
        badgeCount = 0
    }, 
    {
        page = v5.AvatarExperienceRoot, 
        iconComponent = v12, 
        actionType = Enum.AppShellActionType.TapAvatarTab, 
        badgeCount = 0, 
        bottomAligned = true
    }
};
local v23 = {
    {
        page = v5.Home, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.Home", 
                icon = {
                    on = "icons/menu/home_on", 
                    off = "icons/menu/home_off"
                }
            }));
        end, 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = 0
    }, 
    {
        page = v5.Games, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.Charts", 
                icon = {
                    on = "icons/menu/charts_on", 
                    off = "icons/menu/charts_off"
                }
            }));
        end, 
        actionType = Enum.AppShellActionType.TapGamePageTab, 
        badgeCount = 0
    }, 
    {
        page = v5.AvatarExperienceRoot, 
        itemSize = v20, 
        iconComponent = function(...)
            return v13(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.Avatar"
            }));
        end, 
        actionType = Enum.AppShellActionType.TapAvatarTab, 
        badgeCount = 0
    }, 
    {
        page = v5.Chat, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = (not not l_default_0.isEnabled() and l_default_0:getConnectTabLeadsToChatTab()) and "CommonUI.Features.Label.Chat" or "Feature.SocialTab.Label.Connect", 
                icon = {
                    on = "icons/menu/chat_on", 
                    off = "icons/menu/chat_off"
                }
            }));
        end, 
        actionType = Enum.AppShellActionType.TapChatTab, 
        badgeCount = 0
    }, 
    {
        page = v5.More, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.More", 
                icon = {
                    on = "icons/menu/more_on", 
                    off = "icons/menu/more_off"
                }
            }));
        end, 
        actionType = nil, 
        badgeCount = 0
    }
};
local v24 = {
    {
        page = v5.Home, 
        titleLocalizationKey = "CommonUI.Features.Label.Home", 
        icon = l_Images_0["icons/menu/home_on"], 
        actionType = nil
    }, 
    {
        page = v5.AvatarExperienceRoot, 
        titleLocalizationKey = "CommonUI.Features.Label.Avatar", 
        iconComponent = v12, 
        actionType = Enum.AppShellActionType.TapAvatarTab
    }, 
    {
        page = v5.Chat, 
        titleLocalizationKey = "Feature.SocialTab.Label.Connect", 
        icon = l_Images_0["icons/menu/friendsOn"], 
        actionType = Enum.AppShellActionType.TapChatTab
    }
};
local v25 = {
    {
        page = v5.Home, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.Home", 
                icon = {
                    on = "icons/menu/home_on", 
                    off = "icons/menu/home_off"
                }
            }));
        end, 
        actionType = Enum.AppShellActionType.TapHomePageTab, 
        badgeCount = 0
    }, 
    {
        page = v5.Chat, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "Feature.SocialTab.Label.Connect", 
                icon = {
                    on = "icons/menu/chat_on", 
                    off = "icons/menu/chat_off"
                }
            }));
        end, 
        actionType = Enum.AppShellActionType.TapChatTab, 
        badgeCount = 0
    }, 
    {
        page = v5.More, 
        itemSize = v20, 
        iconComponent = function(...)
            return v14(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.More", 
                icon = {
                    on = "icons/menu/more_on", 
                    off = "icons/menu/more_off"
                }
            }));
        end, 
        actionType = nil, 
        badgeCount = 0
    }, 
    {
        page = v5.AvatarExperienceRoot, 
        itemSize = v20, 
        iconComponent = function(...)
            return v13(v4.Dictionary.join(..., {
                label = "CommonUI.Features.Label.Avatar"
            }));
        end, 
        actionType = Enum.AppShellActionType.TapAvatarTab, 
        badgeCount = 0, 
        bottomAligned = true
    }
};
return function()
    local v26 = {};
    local l_v19_0 = v19;
    if l_IsVRAppBuild_0() then
        l_v19_0 = if not l_GetFFlagNavBarLabelsVRFix_0() then v22 else v25;
    end;
    if not (not l_GetFFlagEnableNavBarLabels_0() and (not v8.isEnabled() or not v8.default:shouldShowNavbarLabels())) then
        l_v19_0 = v21;
    end;
    if not ((not v17 or v18 and not v9.getIsChartsPageRenameEnabled()) or l_IsVRAppBuild_0()) then
        l_v19_0 = v23;
    end;
    if not (not l_FFlagUnifyNavigationGraph_0 or not l_GuiService_0:IsTenFootInterface()) then
        l_v19_0 = v24;
    end;
    for v28, v29 in ipairs(l_v19_0) do
        v26[v29.page] = v28;
    end;
    return l_v19_0, v26;
end;
