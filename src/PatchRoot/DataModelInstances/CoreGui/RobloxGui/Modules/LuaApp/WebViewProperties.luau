local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local _ = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local _ = require(l_Modules_0.LuaApp.Navigation.NavigationTypes);
local v6 = require(l_Modules_0.LuaApp.Http.Url);
local v7 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v8 = require(l_Modules_0.LuaApp.Flags.FFlagLuaSetNotificationDialogMode);
local v9 = require(l_Modules_0.LuaApp.Flags.FFlagLuaSetPurchaseRobuxDialogMode);
local v10 = game:DefineFastFlag("LuaAppWebViewsUseHttps", false);
local function _()
    if v8 then
        local l_Default_0 = v3.Default;
        local l_None_0 = Enum.Platform.None;
        l_None_0 = l_UserInputService_0:GetPlatform();
        if not (l_None_0 ~= Enum.Platform.Windows and l_None_0 ~= Enum.Platform.OSX) or l_None_0 == Enum.Platform.UWP then
            l_Default_0 = v3.Dialog;
        end;
        return l_Default_0;
    else
        return v3.Default;
    end;
end;
local v14 = {
    [v2.None] = {}, 
    [v2.BuildersClub] = {
        url = ("%spremium/membership"):format(if not v10 then v6.BASE_URL else v6.BASE_URL_SECURE), 
        titleKey = "CommonUI.Features.Label.Premium", 
        windowType = v3.Default
    }, 
    [v2.GenericWebPage] = {
        windowType = v3.Default
    }, 
    [v2.SettingsSubPage] = {
        windowType = v3.Default
    }, 
    [v2.YouTubePlayer] = {
        windowType = v3.Default
    }
};
local l_PurchaseRobux_0 = v2.PurchaseRobux;
local v16 = {
    url = ("%sUpgrades/Robux.aspx"):format(if not v10 then v6.BASE_URL else v6.BASE_URL_SECURE), 
    titleKey = "Feature.BuyRobux.Heading.Banner"
};
local v17;
if not v9 then
    v17 = v3.Default;
elseif v8 then
    local l_Default_1 = v3.Default;
    local l_None_1 = Enum.Platform.None;
    l_None_1 = l_UserInputService_0:GetPlatform();
    if not (l_None_1 ~= Enum.Platform.Windows and l_None_1 ~= Enum.Platform.OSX) or l_None_1 == Enum.Platform.UWP then
        l_Default_1 = v3.Dialog;
    end;
    v17 = l_Default_1;
else
    v17 = v3.Default;
end;
v16.windowType = v17;
v14[l_PurchaseRobux_0] = v16;
l_PurchaseRobux_0 = v2.Payment;
v16 = {
    url = function(v20)
        return ("%supgrades/paymentmethods?ap=%d"):format(if not v10 then v6.BASE_URL else v6.BASE_URL_SECURE, v20);
    end, 
    titleKey = "Feature.BuyRobux.Heading.Banner"
};
if v8 then
    local l_Default_2 = v3.Default;
    local l_None_2 = Enum.Platform.None;
    l_None_2 = l_UserInputService_0:GetPlatform();
    if not (l_None_2 ~= Enum.Platform.Windows and l_None_2 ~= Enum.Platform.OSX) or l_None_2 == Enum.Platform.UWP then
        l_Default_2 = v3.Dialog;
    end;
    v17 = l_Default_2;
else
    v17 = v3.Default;
end;
v16.windowType = v17;
v14[l_PurchaseRobux_0] = v16;
l_PurchaseRobux_0 = v2.Notifications;
v16 = {
    url = ("%snotificationstream/embedded"):format(if not v10 then v6.BASE_URL else v6.BASE_URL_SECURE), 
    titleKey = "Feature.AccountSettings.Heading.Tab.Notifications"
};
if v8 then
    local l_Default_3 = v3.Default;
    local l_None_3 = Enum.Platform.None;
    l_None_3 = l_UserInputService_0:GetPlatform();
    if not (l_None_3 ~= Enum.Platform.Windows and l_None_3 ~= Enum.Platform.OSX) or l_None_3 == Enum.Platform.UWP then
        l_Default_3 = v3.Dialog;
    end;
    v17 = l_Default_3;
else
    v17 = v3.Default;
end;
v16.windowType = v17;
v14[l_PurchaseRobux_0] = v16;
v14[v2.AddFriends] = {
    url = ("%susers/friends#format(if not v10 then v6.BASE_URL else v6.BASE_URL_SECURE), 
    titleKey = "CommonUI.Features.Label.Friends", 
    searchParams = {
        searchType = "Players"
    }, 
    windowType = v3.Default
};
v14[v2.ViewUserProfile] = {
    url = function(v25)
        return v7.user.profile({
            userId = v25
        });
    end, 
    titleKey = "CommonUI.Features.Label.Profile", 
    windowType = v3.Default
};
v14[v2.ViewProfile] = {
    titleKey = "CommonUI.Features.Label.Profile", 
    windowType = v3.Default
};
v14[v2.ViewFriends] = {
    url = v7.static.friends(), 
    titleKey = "CommonUI.Features.Label.Friends", 
    windowType = v3.Default
};
v14[v2.ReportAbuse] = {
    titleKey = "Feature.GameDetails.Label.ReportAbuse", 
    windowType = v3.Default
};
v14[v2.AccountInfo] = {
    windowType = v3.Default
};
v14[v2.ParentVerification] = {
    windowType = v3.Default
};
v14[v2.EmailVerification] = {
    windowType = v3.Default
};
return v14;
