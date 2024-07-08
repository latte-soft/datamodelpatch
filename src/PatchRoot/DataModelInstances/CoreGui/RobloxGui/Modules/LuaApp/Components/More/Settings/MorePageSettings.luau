local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local l_Images_0 = require(l_CorePackages_0.UIBlox).App.ImageSet.Images;
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v7 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v8 = require(l_Modules_0.LuaApp.buildCreatorWebNavUrl);
local v9 = require(l_Modules_0.LuaApp.Components.NumericalBadge);
local v10 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_VRConstants_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRConstants;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagLoginCodeEnabled);
local l_FFlag_0 = settings():GetFFlag("LuaAppDevSubsEnabled");
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppTradesEnabled);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppCJVMorePageShowGroups);
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableReportLogsButton);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagForceEnableReportLogsButton);
local v19 = game:DefineFastFlag("EnableLuaReputationSetting", false);
local v20 = game:DefineFastFlag("LuaAppsEnableParentalControlsTab", false);
local v21 = require(l_Modules_0.LuaApp.Flags.FFlagFetchUserNameOnCloseAccountInfo);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagPlatformEventEnabled);
local v23 = require(l_Modules_0.LuaApp.Flags.GetFStringPlatformEventUrl);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableGUACControlTOSPPLinks);
local v25 = require(l_Modules_0.Luobu.Flags.FFlagLuobuCJVMorePageShowTencentNotice);
local v26 = game:DefineFastString("LuobuCJVAboutUSCorpUrlOverride", "https://roblox.qq.com/?webview=true0409");
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVRFTUXMorePageEntrypoint);
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableSafetySupportTile);
local l_FFlagProfilePlatformDevFlag_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformDevFlag;
local l_GetFFlagEnableGateNotificationPreferencesTab_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableGateNotificationPreferencesTab;
local v31 = {
    VRFTUX = "VRFTUX", 
    Catalog = "Catalog", 
    BuildersClub = "BuildersClub", 
    DevSubs = "DevSubs", 
    Trades = "Trades", 
    Profile = "Profile", 
    TencentNoticeCenter = "TencentNoticeCenter", 
    TencentHelp = "TencentHelp", 
    UserInfo = "UserInfo", 
    Friends = "Friends", 
    Groups = "Groups", 
    Inventory = "Inventory", 
    Messages = "Messages", 
    CreateGames = "CreateGames", 
    Blog = "Blog", 
    GiftCards = "GiftCards", 
    OfficialStore = "OfficialStore", 
    Settings = "Settings", 
    AdjustScreen = "AdjustScreen", 
    SafetySupport = "SafetySupport", 
    About = "About", 
    Help = "Help", 
    LoginCode = "Login Code", 
    ReportLogs = "Report Logs", 
    LogOut = "LogOut", 
    TheHunt = "TheHunt", 
    About_AboutUs = "About_AboutUs", 
    About_AboutUs_CJV = "About_AboutUs_CJV", 
    About_Careers = "About_Careers", 
    About_Parents = "About_Parents", 
    About_Terms = "About_Terms", 
    About_Privacy = "About_Privacy", 
    About_PrivacyGuidelinesChildren = "About_PrivacyGuidelinesChildren", 
    About_LuobuRiderTerms = "About_LuobuRiderTerms", 
    About_LuobuThirdPartyDataUse = "About_LuobuThirdPartyDataUse", 
    About_Licensing = "About_Licensing", 
    About_AboutSection = "About_AboutSection", 
    About_TermsOfService = "About_TermsOfService", 
    About_LicensingSection = "About_LicensingSection", 
    SafetySupport_ReportAppeals = "SafetySupport_ReportAppeals", 
    SafetySupport_Help = "SafetySupport_Help", 
    Settings_AccountInfo = "Settings_AccountInfo", 
    Settings_Security = "Settings_Security", 
    Settings_Privacy = "Settings_Privacy", 
    Settings_ParentalControls = "Settings_ParentalControls", 
    Settings_Billing = "Settings_Billing", 
    Settings_Subscriptions = "Settings_Subscriptions", 
    Settings_Notifications = "Settings_Notifications", 
    Settings_Accessibility = "Settings_Accessibility", 
    Settings_Tencent_Reputation = "Settings_Tencent_Reputation", 
    Settings_Cross_Play = "Settings_Cross_Play", 
    Settings_SwitchProfileSection = "Settings_SwitchProfileSection", 
    Settings_AccountSettingsSection = "Settings_AccountSettingsSection", 
    Settings_AccountSettingsInfo = "Settings_AccountSettingsInfo", 
    Settings_DeviceSettingsSection = "Settings_DeviceSettingsSection"
};
local v32 = {
    Content = "Content", 
    Navigation = "Navigation", 
    Action = "Action"
};
local v33 = {
    Catalog = "Catalog", 
    Games = "Games", 
    Groups = "Groups", 
    Library = "Library", 
    Players = "Players"
};
local v34 = {
    [v31.VRFTUX] = "CommonUI.Features.Label.VRFTUX", 
    [v31.Catalog] = "Feature.Avatar.Action.Marketplace", 
    [v31.BuildersClub] = "CommonUI.Features.Label.Premium", 
    [v31.DevSubs] = "CommonUI.Features.Label.DevSubs", 
    [v31.Trades] = "CommonUI.Features.Label.Trades", 
    [v31.Profile] = "CommonUI.Features.Label.Profile", 
    [v31.TencentHelp] = "CommonUI.Features.Label.Help", 
    [v31.TencentNoticeCenter] = "CommonUI.Features.Label.TencentNotice", 
    [v31.Friends] = "CommonUI.Features.Label.Friends", 
    [v31.Groups] = "CommonUI.Features.Label.Groups", 
    [v31.Inventory] = "CommonUI.Features.Label.Inventory", 
    [v31.Messages] = "CommonUI.Features.Label.Messages", 
    [v31.CreateGames] = "CommonUI.Features.Label.CreateGames", 
    [v31.TheHunt] = "CommonUI.Features.Label.TheHunt", 
    [v31.Blog] = "CommonUI.Features.Label.Blog", 
    [v31.GiftCards] = "CommonUI.Features.Label.GiftCards", 
    [v31.OfficialStore] = "CommonUI.Features.Label.OfficialStore", 
    [v31.Settings] = "CommonUI.Features.Label.Settings", 
    [v31.AdjustScreen] = "CommonUI.Features.Label.AdjustScreen", 
    [v31.About] = "CommonUI.Features.Label.About", 
    [v31.SafetySupport] = "CommonUI.Features.Label.HelpAndSafety", 
    [v31.SafetySupport_ReportAppeals] = "Feature.AppealsPortal.Label.ReportAndAppeals", 
    [v31.Help] = "CommonUI.Features.Label.Help", 
    [v31.LoginCode] = "Authentication.CrossDevice.Heading.QuickLogin", 
    [v31.LogOut] = "Application.Logout.Action.Logout", 
    [v31.ReportLogs] = "CommonUI.Features.Label.ReportLogs", 
    [v31.About_AboutUs] = "CommonUI.Features.Label.AboutUs", 
    [v31.About_AboutUs_CJV] = "CommonUI.Features.Label.AboutUs", 
    [v31.About_Careers] = "CommonUI.Features.Label.Careers", 
    [v31.About_Parents] = "CommonUI.Features.Label.Parents", 
    [v31.About_Terms] = "CommonUI.Features.Label.Terms", 
    [v31.About_Privacy] = "CommonUI.Features.Label.Privacy", 
    [v31.About_PrivacyGuidelinesChildren] = "CommonUI.Features.Label.PrivacyGuidelinesChildren", 
    [v31.About_LuobuRiderTerms] = "CommonUI.Features.Label.LuobuRiderTerms", 
    [v31.About_LuobuThirdPartyDataUse] = "CommonUI.Features.Label.LuobuThirdPartyDataUse", 
    [v31.About_Licensing] = "CommonUI.Features.Label.Licensing", 
    [v31.About_AboutSection] = "CommonUI.Features.Label.About", 
    [v31.About_TermsOfService] = "CommonUI.Features.Label.TermsOfService", 
    [v31.About_LicensingSection] = "CommonUI.Features.Label.Licensing", 
    [v31.Settings_AccountInfo] = "Feature.AccountSettings.Heading.Tab.AccountInfo", 
    [v31.Settings_Security] = "Feature.AccountSettings.Heading.Tab.Security", 
    [v31.Settings_Privacy] = "Feature.AccountSettings.Heading.Tab.Privacy", 
    [v31.Settings_ParentalControls] = "Feature.AccountSettings.Heading.Tab.ParentalControls", 
    [v31.Settings_Billing] = "Feature.AccountSettings.Heading.Tab.Billing", 
    [v31.Settings_Subscriptions] = "Feature.AccountSettings.Heading.Tab.Subscriptions", 
    [v31.Settings_Notifications] = "Feature.AccountSettings.Heading.Tab.Notifications", 
    [v31.Settings_Accessibility] = "Feature.AccountSettings.Heading.Tab.Accessibility", 
    [v31.Settings_Tencent_Reputation] = "Feature.AccountSettings.Label.TencentReputation", 
    [v31.Settings_SwitchProfileSection] = "Feature.Settings.Heading.SwitchProfile", 
    [v31.Settings_AccountSettingsSection] = "Feature.Settings.Heading.AccountSettings"
};
local v35 = {
    [v31.VRFTUX] = "rbxasset://textures/ui/LuaApp/graphic/FTUXTutorial.png", 
    [v31.Catalog] = l_Images_0["icons/menu/shop_large"], 
    [v31.BuildersClub] = l_Images_0["icons/status/premium_large"], 
    [v31.DevSubs] = l_Images_0["icons/status/player/developer"], 
    [v31.Trades] = l_Images_0["icons/menu/trade"], 
    [v31.Profile] = l_Images_0["icons/menu/profile"], 
    [v31.TencentHelp] = l_Images_0["icons/menu/help_large"], 
    [v31.TencentNoticeCenter] = l_Images_0["icons/menu/events_large"], 
    [v31.Friends] = l_Images_0["icons/menu/friends_large"], 
    [v31.Groups] = l_Images_0["icons/menu/groups_large"], 
    [v31.Inventory] = l_Images_0["icons/menu/inventory_large"], 
    [v31.Messages] = l_Images_0["icons/menu/messages_large"], 
    [v31.CreateGames] = l_Images_0["icons/menu/create_large"], 
    [v31.TheHunt] = l_Images_0["icons/menu/events_large"], 
    [v31.Blog] = l_Images_0["icons/menu/blog_large"], 
    [v31.GiftCards] = l_Images_0["icons/menu/giftcard_large"], 
    [v31.OfficialStore] = l_Images_0["icons/menu/officialstore_large"], 
    [v31.Settings] = l_Images_0["icons/menu/settings_large"], 
    [v31.AdjustScreen] = l_Images_0["icons/menu/adjust/scale"], 
    [v31.About] = l_Images_0["icons/menu/about_large"], 
    [v31.SafetySupport] = l_Images_0["icons/menu/protection"], 
    [v31.Help] = l_Images_0["icons/menu/help_large"], 
    [v31.LoginCode] = l_Images_0["icons/graphic/lock_xxlarge"], 
    [v31.ReportLogs] = l_Images_0["icons/menu/giftcard_large"]
};
local v36 = {
    [v31.Catalog] = v7.static.catalog(), 
    [v31.BuildersClub] = v7.static.buildersClub(), 
    [v31.Trades] = v7.static.trades(), 
    [v31.Profile] = v7.static.profile(), 
    [v31.Friends] = v7.static.friends(), 
    [v31.Groups] = v7.static.groups(), 
    [v31.Inventory] = v7.static.inventory(), 
    [v31.Messages] = v7.static.messages(), 
    [v31.CreateGames] = v8({
        utm_content = "more_page"
    }), 
    [v31.TheHunt] = if v23() ~= "" then v7.fromString(v23())() else v7.static.help(), 
    [v31.Blog] = v7.static.blog(), 
    [v31.OfficialStore] = v7.static.amazonStore(), 
    [v31.GiftCards] = v7.static.giftCards(), 
    [v31.Help] = v7.static.help(), 
    [v31.SafetySupport_ReportAppeals] = v7.static.appealsPortal.main({
        source = "app-help-safety"
    }), 
    [v31.About_AboutUs] = v7.static.about.us(), 
    [v31.About_AboutUs_CJV] = v26 ~= "" and v7.fromString(v26)() or v7.static.about.us(), 
    [v31.About_Careers] = v7.static.about.careers(), 
    [v31.About_Parents] = v7.static.about.parents(), 
    [v31.About_Terms] = v7.static.about.terms({
        useGameQQUrls = true
    }), 
    [v31.About_Privacy] = v7.static.about.privacy({
        useGameQQUrls = true
    }), 
    [v31.About_PrivacyGuidelinesChildren] = v7.static.tencent.childrenPrivacyGuide(), 
    [v31.About_LuobuRiderTerms] = v7.static.tencent.luobuRiderTerms(), 
    [v31.About_LuobuThirdPartyDataUse] = v7.static.tencent.luobuThirdPartyDataUse(), 
    [v31.Settings_AccountInfo] = v7.static.settings.account(), 
    [v31.Settings_Security] = v7.static.settings.security(), 
    [v31.Settings_Privacy] = v7.static.settings.privacy(), 
    [v31.Settings_ParentalControls] = v7.static.settings.parentalControls(), 
    [v31.Settings_Billing] = v7.static.settings.billing(), 
    [v31.Settings_Subscriptions] = v7.static.settings.subscriptions(), 
    [v31.Settings_Notifications] = v7.static.settings.notifications(), 
    [v31.Settings_Tencent_Reputation] = v7.static.tencent.reputationInfo()
};
local function v40(v37, v38, v39)
    if not v37 then
        return {};
    else
        return {
            page = v38 or v5.GenericWebPage, 
            titleKey = v34[v37], 
            url = v36[v37], 
            fallbackToExternalBrowser = v39
        };
    end;
end;
local v51 = {
    [v31.VRFTUX] = {
        itemType = v31.VRFTUX, 
        textKey = v34[v31.VRFTUX], 
        icon = v35[v31.VRFTUX], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.ExperienceDetail, 
            url = l_VRConstants_0.FTUX.UniverseId
        }
    }, 
    [v31.Catalog] = {
        itemType = v31.Catalog, 
        textKey = v34[v31.Catalog], 
        icon = v35[v31.Catalog], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v4.Catalog
        }
    }, 
    [v31.BuildersClub] = {
        itemType = v31.BuildersClub, 
        textKey = v34[v31.BuildersClub], 
        icon = v35[v31.BuildersClub], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.BuildersClub
        }
    }, 
    [v31.DevSubs] = {
        itemType = v31.DevSubs, 
        textKey = v34[v31.DevSubs], 
        icon = v35[v31.DevSubs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.DevSubs
        }
    }, 
    [v31.Trades] = {
        itemType = v31.Trades, 
        textKey = v34[v31.Trades], 
        icon = v35[v31.Trades], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Trades)
    }, 
    [v31.Profile] = {
        itemType = v31.Profile, 
        textKey = v34[v31.Profile], 
        icon = v35[v31.Profile], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        urlGenerator = function(v41)
            return v41;
        end, 
        context = {
            page = if not l_FFlagProfilePlatformDevFlag_0 then v5.ProfilePeekView else v5.ProfilePlatform
        }
    }, 
    [v31.Friends] = {
        itemType = v31.Friends, 
        textKey = v34[v31.Friends], 
        icon = v35[v31.Friends], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v9, 
        badgeCount = 0, 
        urlGenerator = function(v42)
            return not not v42 and v7.user.friends({
                userId = v42
            }) or nil;
        end, 
        getSearchParams = function()
            return {
                searchType = v33.Players
            };
        end, 
        context = v40(v31.Friends)
    }, 
    [v31.Groups] = {
        itemType = v31.Groups, 
        textKey = v34[v31.Groups], 
        icon = v35[v31.Groups], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        getSearchParams = function(v43)
            if v43 == l_FormFactor_0.WIDE then
                return {
                    searchType = v33.Groups
                };
            else
                return nil;
            end;
        end, 
        context = v40(v31.Groups)
    }, 
    [v31.Inventory] = {
        itemType = v31.Inventory, 
        textKey = v34[v31.Inventory], 
        icon = v35[v31.Inventory], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        urlGenerator = function(v44)
            return not not v44 and v7.user.inventory({
                userId = v44
            }) or nil;
        end, 
        context = v40(v31.Inventory)
    }, 
    [v31.Messages] = {
        itemType = v31.Messages, 
        textKey = v34[v31.Messages], 
        icon = v35[v31.Messages], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v9, 
        badgeCount = 0, 
        context = v40(v31.Messages)
    }, 
    [v31.CreateGames] = {
        itemType = v31.CreateGames, 
        textKey = v34[v31.CreateGames], 
        icon = v35[v31.CreateGames], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.CreateGames), 
        shouldOpenInExternalBrowser = true
    }, 
    [v31.TencentHelp] = {
        itemType = v31.TencentHelp, 
        textKey = v34[v31.Help], 
        icon = v35[v31.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.TencentHelp, 
            titleKey = v34[v31.Help]
        }
    }, 
    [v31.TencentNoticeCenter] = {
        itemType = v31.TencentNoticeCenter, 
        textKey = v34[v31.TencentNoticeCenter], 
        icon = v35[v31.TencentNoticeCenter], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.TencentNoticeCenter
        }
    }, 
    [v31.TheHunt] = {
        itemType = v31.TheHunt, 
        textKey = v34[v31.TheHunt], 
        icon = v35[v31.TheHunt], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.TheHunt)
    }, 
    [v31.Blog] = {
        itemType = v31.Blog, 
        textKey = v34[v31.Blog], 
        icon = v35[v31.Blog], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Blog, nil, true)
    }, 
    [v31.GiftCards] = {
        itemType = v31.GiftCards, 
        textKey = v34[v31.GiftCards], 
        icon = v35[v31.GiftCards], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.GiftCards, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v31.OfficialStore] = {
        itemType = v31.OfficialStore, 
        textKey = v34[v31.OfficialStore], 
        icon = v35[v31.OfficialStore], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.OfficialStore, nil, true)
    }, 
    [v31.Settings] = {
        itemType = v31.Settings, 
        textKey = v34[v31.Settings], 
        icon = v35[v31.Settings], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v9, 
        badgeCount = 0, 
        context = {
            page = v5.Settings
        }
    }, 
    [v31.AdjustScreen] = {
        itemType = v31.AdjustScreen, 
        textKey = v34[v31.AdjustScreen], 
        icon = v35[v31.AdjustScreen], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        context = {
            page = v5.AdjustScreen
        }
    }, 
    [v31.About] = {
        itemType = v31.About, 
        textKey = v34[v31.About], 
        icon = v35[v31.About], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.About
        }
    }, 
    [v31.SafetySupport] = {
        itemType = v31.SafetySupport, 
        textKey = v34[v31.SafetySupport], 
        icon = v35[v31.SafetySupport], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.SafetySupport
        }
    }, 
    [v31.ReportLogs] = if v17() or v18() then {
        itemType = v31.ReportLogs, 
        textKey = v34[v31.ReportLogs], 
        icon = v35[v31.ReportLogs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {}
    } else nil, 
    [v31.Help] = {
        itemType = v31.Help, 
        textKey = v34[v31.Help], 
        icon = v35[v31.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Help, nil, true), 
        shouldOpenInExternalBrowser = true
    }, 
    [v31.LoginCode] = {
        itemType = v31.LoginCode, 
        textKey = v34[v31.LoginCode], 
        icon = v35[v31.LoginCode], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.CrossDeviceLogin
        }
    }, 
    [v31.LogOut] = {
        itemType = v31.LogOut, 
        textKey = v34[v31.LogOut], 
        textXAlignment = Enum.TextXAlignment.Center, 
        badgeCount = 0, 
        context = {
            page = v5.LogoutConfirmation
        }
    }, 
    [v31.UserInfo] = {
        itemType = v31.UserInfo
    }, 
    [v31.Settings_Cross_Play] = {
        itemType = v31.Settings_Cross_Play
    }, 
    [v31.SafetySupport_ReportAppeals] = {
        itemType = v31.SafetySupport_ReportAppeals, 
        textKey = v34[v31.SafetySupport_ReportAppeals], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.SafetySupport_ReportAppeals)
    }, 
    [v31.SafetySupport_Help] = {
        itemType = v31.SafetySupport_Help, 
        textKey = v34[v31.Help], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Help), 
        shouldOpenInExternalBrowser = true
    }, 
    [v31.About_AboutUs] = {
        itemType = v31.About_AboutUs, 
        textKey = v34[v31.About_AboutUs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_AboutUs, nil, true)
    }, 
    [v31.About_AboutUs_CJV] = {
        itemType = v31.About_AboutUs_CJV, 
        textKey = v34[v31.About_AboutUs], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_AboutUs_CJV)
    }, 
    [v31.About_Careers] = {
        itemType = v31.About_Careers, 
        textKey = v34[v31.About_Careers], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_Careers, nil, true)
    }, 
    [v31.About_Parents] = {
        itemType = v31.About_Parents, 
        textKey = v34[v31.About_Parents], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_Parents, nil, true)
    }, 
    [v31.About_Terms] = {
        itemType = v31.About_Terms, 
        textKey = v34[v31.About_Terms], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_Terms, nil, true), 
        shouldOpenInExternalBrowser = true, 
        urlGenerator = if not v24() then nil else function(_, v46)
            local v47 = nil;
            if v46 then
                v47 = v46.getTermsOfUseLink();
            end;
            if not (v47 ~= nil) or v47 == "" then
                v47 = v36[v31.About_Terms];
            end;
            return v47;
        end
    }, 
    [v31.About_Privacy] = {
        itemType = v31.About_Privacy, 
        textKey = v34[v31.About_Privacy], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_Privacy, nil, true), 
        shouldOpenInExternalBrowser = true, 
        urlGenerator = if not v24() then nil else function(_, v49)
            local v50 = nil;
            if v49 then
                v50 = v49.getPrivacyPolicyLink();
            end;
            if not (v50 ~= nil) or v50 == "" then
                v50 = v36[v31.About_Privacy];
            end;
            return v50;
        end
    }, 
    [v31.About_PrivacyGuidelinesChildren] = {
        itemType = v31.About_PrivacyGuidelinesChildren, 
        textKey = v34[v31.About_PrivacyGuidelinesChildren], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_PrivacyGuidelinesChildren)
    }, 
    [v31.About_LuobuRiderTerms] = {
        itemType = v31.About_LuobuRiderTerms, 
        textKey = v34[v31.About_LuobuRiderTerms], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_LuobuRiderTerms)
    }, 
    [v31.About_LuobuThirdPartyDataUse] = {
        itemType = v31.About_LuobuThirdPartyDataUse, 
        textKey = v34[v31.About_LuobuThirdPartyDataUse], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.About_LuobuThirdPartyDataUse)
    }, 
    [v31.About_Licensing] = {
        itemType = v31.About_Licensing, 
        textKey = v34[v31.About_Licensing], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.Licensing
        }
    }, 
    [v31.Settings_AccountInfo] = {
        itemType = v31.Settings_AccountInfo, 
        textKey = v34[v31.Settings_AccountInfo], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeComponent = v9, 
        badgeCount = 0, 
        context = if not v21 then v40(v31.Settings_AccountInfo, v5.SettingsSubPage) else v40(v31.Settings_AccountInfo, v5.AccountInfo)
    }, 
    [v31.Settings_Security] = {
        itemType = v31.Settings_Security, 
        textKey = v34[v31.Settings_Security], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Settings_Security, v5.SettingsSubPage)
    }, 
    [v31.Settings_Privacy] = {
        itemType = v31.Settings_Privacy, 
        textKey = v34[v31.Settings_Privacy], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Settings_Privacy, v5.SettingsSubPage)
    }, 
    [v31.Settings_ParentalControls] = {
        itemType = v31.Settings_ParentalControls, 
        textKey = v34[v31.Settings_ParentalControls], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Settings_ParentalControls, v5.SettingsSubPage)
    }, 
    [v31.Settings_Billing] = {
        itemType = v31.Settings_Billing, 
        textKey = v34[v31.Settings_Billing], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Settings_Billing, v5.SettingsSubPage)
    }, 
    [v31.Settings_Subscriptions] = {
        itemType = v31.Settings_Subscriptions, 
        textKey = v34[v31.Settings_Subscriptions], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Settings_Subscriptions, v5.SettingsSubPage)
    }, 
    [v31.Settings_Notifications] = {
        itemType = v31.Settings_Notifications, 
        textKey = v34[v31.Settings_Notifications], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v40(v31.Settings_Notifications, v5.SettingsSubPage)
    }, 
    [v31.Settings_Accessibility] = {
        itemType = v31.Settings_Accessibility, 
        textKey = v34[v31.Settings_Accessibility], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = {
            page = v5.Accessibility
        }
    }, 
    [v31.Settings_Tencent_Reputation] = {
        itemType = v31.Settings_Tencent_Reputation, 
        textKey = v34[v31.Settings_Tencent_Reputation], 
        rightImage = "LuaApp/icons/navigation/pushRight_small", 
        badgeCount = 0, 
        context = v2.Dictionary.join({
            notificationType = v10.SDK_OPEN_URL
        }, (v40(v31.Settings_Tencent_Reputation, v5.SettingsSubPage)))
    }, 
    [v31.Settings_SwitchProfileSection] = {
        itemType = v31.Settings_SwitchProfileSection, 
        textKey = v34[v31.Settings_SwitchProfileSection]
    }, 
    [v31.Settings_AccountSettingsSection] = {
        itemType = v31.Settings_AccountSettingsSection, 
        textKey = v34[v31.Settings_AccountSettingsSection]
    }, 
    [v31.Settings_AccountSettingsInfo] = {
        itemType = v31.Settings_AccountSettingsInfo
    }, 
    [v31.Settings_DeviceSettingsSection] = {
        itemType = v31.Settings_DeviceSettingsSection
    }, 
    [v31.About_AboutSection] = {
        itemType = v31.About_AboutSection, 
        textKey = v34[v31.About_AboutSection]
    }, 
    [v31.About_TermsOfService] = {
        itemType = v31.About_TermsOfService, 
        textKey = v34[v31.About_TermsOfService], 
        rightImage = l_Images_0["icons/navigation/externallink_medium"], 
        context = {
            url = v36[v31.About_Terms]
        }
    }, 
    [v31.About_LicensingSection] = {
        itemType = v31.About_LicensingSection, 
        textKey = v34[v31.About_LicensingSection]
    }
};
local function v53(v52)
    return v52 ~= false;
end;
return {
    ItemType = v31, 
    ItemInfo = v51, 
    SectionType = v32, 
    GetItemsInPage = function(v54, v55, _, v57, v58, v59, v60, v61, v62, v63)
        if v20 then
            v58 = true;
        end;
        local v64 = false;
        if type(v57) == "table" then
            v64 = v57.giftCardsEnabled;
        end;
        local v65 = false;
        if type(v57) == "table" then
            v65 = v57.officialStoreEnabled;
        end;
        local v66;
        if not l_GetFFlagEnableGateNotificationPreferencesTab_0() then
            v66 = true;
        else
            v66 = false;
            if type(v57) == "table" then
                v66 = v57.enableNotificationPreferencesTab;
            end;
        end;
        local v67 = v18() or v17() and v63;
        v51[v31.Friends].context = {
            page = v5.ViewFriends
        };
        local v68 = {
            [v5.More] = {
                {
                    type = v32.Navigation, 
                    contents = v2.List.filter(if not v59 then {
                        v51[v31.Catalog], 
                        v51[v31.BuildersClub], 
                        not not l_FFlag_0 and (v51[v31.DevSubs] or false), 
                        not not v55 and (v15() and v51[v31.Trades] or false), 
                        v51[v31.Profile], 
                        v51[v31.Friends], 
                        v51[v31.Groups], 
                        v51[v31.Inventory], 
                        v51[v31.Messages], 
                        not not v22() and if #v23() > 0 then v51[v31.TheHunt] else false, 
                        v51[v31.CreateGames], 
                        v51[v31.Blog], 
                        not not v64 and v51[v31.GiftCards], 
                        not not v65 and v51[v31.OfficialStore], 
                        v51[v31.Settings], 
                        v51[v31.About], 
                        not not v28() and v51[v31.SafetySupport] or v51[v31.Help], 
                        not not v13() and (v51[v31.LoginCode] or false), 
                        not not v67 and v51[v31.ReportLogs]
                    } else {
                        not not l_IsVRAppBuild_0() and if v27() then v51[v31.VRFTUX] else false, 
                        v51[v31.Catalog], 
                        not not l_FFlag_0 and (v51[v31.DevSubs] or false), 
                        v51[v31.Friends], 
                        v51[v31.Settings], 
                        v51[v31.About], 
                        v51[v31.Blog], 
                        v51[v31.Help], 
                        if not v64 then nil else v51[v31.GiftCards], 
                        if not v65 then nil else v51[v31.OfficialStore], 
                        not not not v60 and if not v62 then v51[v31.BuildersClub] else false, 
                        if not v67 then nil else v51[v31.ReportLogs]
                    }, v53)
                }, 
                {
                    type = v32.Action, 
                    contents = {
                        v51[v31.LogOut]
                    }
                }
            }, 
            [v5.SimplifiedMore] = {
                {
                    type = v32.Navigation, 
                    contents = {
                        v51[v31.About_Terms]
                    }
                }, 
                {
                    type = v32.Action, 
                    contents = {
                        v51[v31.LogOut]
                    }
                }
            }, 
            [v5.TenFootMore] = {
                {
                    type = v32.Content, 
                    contents = v2.List.filter({
                        v51[v31.UserInfo]
                    }, v53)
                }, 
                {
                    type = v32.Navigation, 
                    contents = v2.List.filter({
                        v51[v31.Settings], 
                        not not v61 and (v51[v31.AdjustScreen] or false), 
                        v51[v31.About], 
                        v51[v31.LoginCode], 
                        v51[v31.Help]
                    }, v53)
                }, 
                {
                    type = v32.Action, 
                    contents = v2.List.filter({
                        v51[v31.LogOut]
                    }, v53)
                }
            }, 
            [v5.CJVMore] = {
                {
                    type = v32.Navigation, 
                    contents = v2.List.filter({
                        v51[v31.Catalog], 
                        v51[v31.Profile], 
                        v51[v31.Friends], 
                        not not v16() and (v51[v31.Groups] or false), 
                        v51[v31.Messages], 
                        not not v25 and (v51[v31.TencentNoticeCenter] or false), 
                        v51[v31.Settings], 
                        v51[v31.About], 
                        v51[v31.TencentHelp]
                    }, v53)
                }, 
                {
                    type = v32.Action, 
                    contents = {
                        v51[v31.LogOut]
                    }
                }
            }, 
            [v5.About] = {
                {
                    type = v32.Navigation, 
                    contents = v2.List.filter({
                        v51[v31.About_AboutUs], 
                        v51[v31.About_Careers], 
                        v51[v31.About_Parents], 
                        v51[v31.About_Terms], 
                        v51[v31.About_Privacy], 
                        v51[v31.About_Licensing]
                    }, v53)
                }
            }, 
            [v5.SafetySupport] = {
                {
                    type = v32.Navigation, 
                    contents = {
                        v51[v31.SafetySupport_Help], 
                        v51[v31.SafetySupport_ReportAppeals]
                    }
                }
            }, 
            [v5.CJVAbout] = {
                {
                    type = v32.Navigation, 
                    contents = v2.List.filter({
                        v51[v31.About_AboutUs_CJV], 
                        v51[v31.About_Careers], 
                        v51[v31.About_Terms], 
                        v51[v31.About_Privacy], 
                        v51[v31.About_PrivacyGuidelinesChildren], 
                        v51[v31.About_LuobuRiderTerms], 
                        v51[v31.About_LuobuThirdPartyDataUse], 
                        v51[v31.About_Licensing]
                    }, v53)
                }
            }, 
            [v5.Settings] = {
                {
                    type = v32.Navigation, 
                    contents = v2.List.filter({
                        v51[v31.Settings_AccountInfo], 
                        v51[v31.Settings_Security], 
                        v51[v31.Settings_Privacy], 
                        not not v58 and (v51[v31.Settings_ParentalControls] or false), 
                        v51[v31.Settings_Billing], 
                        v51[v31.Settings_Subscriptions], 
                        not not v66 and (v51[v31.Settings_Notifications] or false), 
                        v51[v31.Settings_Accessibility]
                    }, v53)
                }
            }, 
            [v5.CJVSettings] = {
                {
                    type = v32.Navigation, 
                    contents = v2.List.filter({
                        v51[v31.Settings_AccountInfo], 
                        v51[v31.Settings_Security], 
                        v51[v31.Settings_Privacy], 
                        not not v19 and (v51[v31.Settings_Tencent_Reputation] or false)
                    }, v53)
                }
            }, 
            [v5.TenFootSettings] = {
                {
                    type = v32.Content, 
                    contents = {
                        {
                            itemInfo = v51[v31.Settings_SwitchProfileSection]
                        }, 
                        {
                            itemInfo = v51[v31.Settings_AccountSettingsSection], 
                            subItems = {
                                v51[v31.Settings_AccountSettingsInfo]
                            }
                        }, 
                        {
                            itemInfo = v51[v31.Settings_DeviceSettingsSection]
                        }
                    }
                }
            }, 
            [v5.TenFootAbout] = {
                {
                    type = v32.Content, 
                    contents = {
                        {
                            itemInfo = v51[v31.About_AboutSection], 
                            subItems = {
                                v51[v31.About_TermsOfService], 
                                v2.Dictionary.join(v51[v31.About_Privacy], {
                                    rightImage = l_Images_0["icons/navigation/externallink_medium"]
                                })
                            }
                        }, 
                        {
                            itemInfo = v51[v31.About_LicensingSection]
                        }
                    }
                }
            }
        };
        local v69 = v68[v5.SimplifiedMore];
        if v68[v54] ~= nil then
            v69 = v68[v54];
        end;
        return v69;
    end
};
