local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AppBrowserService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppBrowserService;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v8 = require(l_CorePackages_0.Cryo);
local v9 = require(l_CorePackages_0.Roact);
local v10 = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.Packages.t);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local v13 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v14 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v15 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local l_NavigateIntoChat_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoChat;
local v17 = require(l_Modules_0.LuaApp.Promise);
local v18 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v19 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v20 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v21 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsShareLinks);
local v24 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsSocialProfileShare);
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local v26 = require(l_Modules_0.LuaApp.AppPage);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v28 = require(l_Modules_0.LuaApp.DeepLinks.DeepLinkMap);
local v29 = require(l_Modules_0.LuaApp.DeepLinks.DeepLinkParser);
local v30 = require(script.Parent.EventNetworking);
local l_LaunchGame_0 = require(l_CorePackages_0.Workspace.Packages.GameLaunch).LaunchGame;
local v32 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes);
local v33 = game:DefineFastFlag("DeeplinkNavDurationLog", false);
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
local v35 = game:DefineFastFlag("DeepLinkEventReceiverStampTracking", false);
local v36 = game:DefineFastFlag("DeepLinkEventReceiverAnalyticsEvent", false);
local l_simpleUrlDecode_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Utils.simpleUrlDecode;
local v38 = v29.new(v28);
local l_ParseQuery_0 = require(l_CorePackages_0.Packages.StringUtilities).ParseQuery;
local _ = function(v40)
    local _, v42 = unpack(string.split(l_simpleUrlDecode_0(v40), "?"));
    return (l_ParseQuery_0(v42));
end;
local function _(v44, v45)
    if not v44 or not v44[v45] then
        return nil;
    else
        return v44[v45][1];
    end;
end;
local function v51(v47)
    local v48 = string.lower(v47);
    for v49, v50 in pairs(v32) do
        if not v48:find("&type=" .. string.lower(v50)) then
            if v48:find((string.lower((string.gsub(l_HttpService_0:UrlEncode("&type=" .. v50), "%%", "%%%%"))))) then
                return v49;
            end;
        else
            return v49;
        end;
    end;
    return nil;
end;
local function v54(v52)
    local v53 = v52[#v52];
    return v53.name, (v8.Dictionary.join(v53.extraProps or {}, {
        detail = v53.detail
    }));
end;
local function _(v55)
    local v56 = false;
    if #v55 > 0 then
        v56 = v55[1].name == v27.AvatarExperienceLandingPage;
    end;
    return v56;
end;
local function _(v58, v59)
    local l_v58_0 = v58;
    if l_v58_0 then
        l_v58_0 = false;
        if #v58 > 0 then
            l_v58_0 = v59 and v58[1].name == v59;
        end;
    end;
    return l_v58_0;
end;
local v62 = v9.Component:extend("DeepLinkEventReceiver");
v62.UpdateConnection = function(v63)
    if not v63.props.userLoggedOut and v63.props.appLoadingStarted then
        v63.props.linking:getAndClearLastPendingURL():andThen(function(v64)
            if v64.hasPendingUrl then
                v63:logPendingLink(v64.url, v64.attributionUrl);
                return ;
            else
                return ;
            end;
        end);
        v63.props.linking:listenForLuaURLs(function(v65, v66)
            if v36 then
                v63:logProcessedLink(v65, v66);
            end;
            v63:navigate(v65);
            if v33 then
                v63.props.loggingProtocol:logEvent("deeplink_navigation_begin");
            end;
        end);
    else
        v63.props.linking:stopListeningForLuaURLs();
    end;
    if v63.props.userLoggedOut then
        local v67 = v63.props.linking:getLastLuaURL();
        if v67 then
            local v68 = {};
            for v69, v70 in v67:gmatch("([^&=?]-)=([^&=?]+)") do
                v68[v69] = v70:gsub("+", " "):gsub("%%(%x%x)", function(v71)
                    return (string.char((tonumber(v71, 16))));
                end);
            end;
            if v68.friendshipSourceType == "profileshare" then
                v63.props.socialProfileShareAnalytics.inviteePageLoad(v68.userId, "appSignIn");
            end;
        end;
    end;
end;
v62.navigate = function(v72, v73)
    return v17.resolve((v38:resolve(v73, {
        history = v72.props.currentHistory, 
        network = v72.props.networking, 
        analyticsImpls = {
            socialProfileShareAnalytics = v72.props.socialProfileShareAnalytics, 
            shareLinksAnalytics = v72.props.shareLinksAnalytics
        }, 
        resolveLinkFromLinkId = v72.props.ResolveLinkFromLinkId, 
        launchGame = l_LaunchGame_0, 
        closeCentralOverlay = v72.props.CloseCentralOverlay
    }))):andThen(function(v74)
        if not (not (type(v74) == "table") or not next(v74)) then
            local v75 = v74[#v74];
            if not l_GetFFlagEnableUnifiedWebViews_0() and not l_default_0.isEnabled() then
                if v72.props.browserService then
                    v72.props.browserService:CloseBrowserWindow();
                end;
                local v76 = false;
                if #v75 > 0 then
                    v76 = v75[1].name == v27.AvatarExperienceLandingPage;
                end;
                if not v76 then
                    local l_Chat_0 = v26.Chat;
                    v76 = v75;
                    if v76 then
                        v76 = false;
                        if #v75 > 0 then
                            v76 = l_Chat_0 and v75[1].name == l_Chat_0;
                        end;
                    end;
                    if not v76 then
                        v72.props.ResetNavigationHistory(v74);
                    else
                        v72.navigateIntoChat(v54(v75));
                        return ;
                    end;
                else
                    v76 = v75[#v75];
                    v72.props.NavigateIntoAvatarExperience(v76.name, v8.Dictionary.join(v76.extraProps or {}, {
                        detail = v76.detail
                    }), true);
                    return ;
                end;
            else
                if not ((not l_GetFFlagEnableUnifiedWebViews_0() or l_default_0.isEnabled()) or not v72.props.browserService) then
                    v72.props.browserService:CloseBrowserWindow();
                end;
                local l_AvatarExperienceLandingPage_0 = v27.AvatarExperienceLandingPage;
                local l_v75_0 = v75;
                if l_v75_0 then
                    l_v75_0 = false;
                    if #v75 > 0 then
                        l_v75_0 = l_AvatarExperienceLandingPage_0 and v75[1].name == l_AvatarExperienceLandingPage_0;
                    end;
                end;
                if not l_v75_0 then
                    l_AvatarExperienceLandingPage_0 = v26.Chat;
                    l_v75_0 = v75;
                    if l_v75_0 then
                        l_v75_0 = false;
                        if #v75 > 0 then
                            l_v75_0 = l_AvatarExperienceLandingPage_0 and v75[1].name == l_AvatarExperienceLandingPage_0;
                        end;
                    end;
                    if not l_v75_0 then
                        v72.props.ResetNavigationHistory(v74);
                        return ;
                    else
                        v72.navigateIntoChat(v54(v75));
                        return ;
                    end;
                else
                    l_v75_0, l_AvatarExperienceLandingPage_0 = v54(v75);
                    v72.props.NavigateIntoAvatarExperience(l_v75_0, l_AvatarExperienceLandingPage_0, true);
                    return ;
                end;
            end;
        end;
    end);
end;
v62.logPendingLink = function(v80, v81, v82)
    local l_appAnalytics_0 = v80.props.appAnalytics;
    local _ = nil;
    local v85 = nil;
    if v35 then
        local v86, v87 = unpack(string.split(l_simpleUrlDecode_0(v81), "?"));
        v86 = l_ParseQuery_0(v87);
        v85 = if not not v86 and v86.stamp then v86.stamp[1] else nil;
    end;
    local v88 = v51(v81);
    l_appAnalytics_0.EventStream:setRBXEventStream("deepLinkEventReceiver", "PendingDeepLinkProcessed", {
        attributionUrl = v82, 
        shareLinkType = v88, 
        stamp = v85, 
        url = v81, 
        userDidLogIn = v80.loginTracking.userDidLogIn, 
        userDidSignUp = v80.loginTracking.userDidSignUp
    });
    local v89 = "PendingLink";
    if not v80.loginTracking.userDidLogIn then
        if v80.loginTracking.userDidSignUp then
            v89 = "PendingLinkAfterSignUp";
        end;
    else
        v89 = "PendingLinkAfterLogin";
    end;
    l_appAnalytics_0.Diag:reportCounter(v89, 1);
    if v88 ~= nil then
        l_appAnalytics_0.Diag:reportCounter(v89 .. v88, 1);
    end;
end;
v62.logProcessedLink = function(v90, v91, v92)
    local l_appAnalytics_1 = v90.props.appAnalytics;
    local l_sessionService_0 = v90.props.sessionService;
    local _, v96 = unpack(string.split(l_simpleUrlDecode_0(v91), "?"));
    local v97 = l_ParseQuery_0(v96);
    l_appAnalytics_1.EventStream:setRBXEventStream("deepLinkEventReceiver", "DeepLinkProcessed", {
        attributionUrl = v92, 
        sessionId = l_sessionService_0:GetRootSID(), 
        shareLinkType = v51(v91), 
        stamp = if not not v97 and v97.stamp then v97.stamp[1] else nil, 
        url = v91, 
        utm = if not not v97 and v97.utm then v97.utm[1] else nil, 
        userDidLogIn = v90.loginTracking.userDidLogIn, 
        userDidSignUp = v90.loginTracking.userDidSignUp
    });
end;
v62.init = function(v98)
    v98.loginTracking = {
        userDidLogIn = false, 
        userDidSignUp = false, 
        signUpUsername = nil
    };
    v98:UpdateConnection();
    v98.navigateIntoChat = function(_, v100)
        v98.props.EnteredChatFromEntryPoint(v100 and v100.entryPoint);
        v98.props.NavigateIntoChat({
            conversationId = v100 and v100.detail
        }, true);
    end;
end;
v62.render = function(_)
end;
v62.didUpdate = function(v102, v103)
    v102.loginTracking.signUpUsername = v102.props.signUpUsername or v102.loginTracking.signUpUsername;
    if v103.userLoggedOut ~= v102.props.userLoggedOut and not v102.props.userLoggedOut then
        local l_signUpUsername_0 = v102.loginTracking.signUpUsername;
        local v105 = false;
        if l_signUpUsername_0 ~= nil then
            v105 = l_signUpUsername_0 == v102.props.username;
        end;
        v102.loginTracking.userDidLogIn = not v105;
        v102.loginTracking.userDidSignUp = v105;
    end;
    v102:UpdateConnection();
end;
v62.willUnmount = function(v106)
    v106.props.linking:stopListeningForLuaURLs();
end;
return (l_RoactServices_0.connect({
    appAnalytics = v20, 
    browserService = l_AppBrowserService_0, 
    linking = l_AppLinking_0, 
    loggingProtocol = l_AppLogging_0, 
    networking = v21, 
    sessionService = l_AppSessionService_0, 
    shareLinksAnalytics = v23, 
    socialProfileShareAnalytics = v24
})((v10.connect(function(v107, _)
    return {
        currentHistory = v107.Navigation.history, 
        userLoggedOut = v107.AuthenticationStatus.status == v14.LOGGED_OUT, 
        signUpUsername = v107.SignUpInfo.SignUpUsername, 
        username = if not v107.Users[v107.LocalUserId] then nil else v107.Users[v107.LocalUserId].name, 
        appLoadingStarted = v107.Startup.AppDataStatus ~= v19.NotStarted
    };
end, function(v109)
    return {
        CloseCentralOverlay = function()
            return v109(v13());
        end, 
        EnteredChatFromEntryPoint = function(v110)
            return v109(l_EnteredChatFromEntryPoint_0(v110));
        end, 
        NavigateIntoAvatarExperience = function(v111, v112, v113)
            return v109(v15(v111, v112, v113));
        end, 
        NavigateIntoChat = function(v114, v115)
            return v109(l_NavigateIntoChat_0(v114, v115));
        end, 
        ResetNavigationHistory = function(v116)
            return v109(v18(nil, v116));
        end, 
        ResolveLinkFromLinkId = function(v117, v118)
            return v109(v30.NetworkingShareLinks.ResolveLinkFromLinkId.API({
                linkId = v117, 
                linkType = v118
            }));
        end
    };
end)(v62))));
