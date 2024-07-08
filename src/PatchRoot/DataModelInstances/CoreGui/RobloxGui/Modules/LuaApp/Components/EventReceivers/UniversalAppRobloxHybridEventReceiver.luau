local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppBrowserService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppBrowserService;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppGame_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGame;
local v12 = require(l_Modules_0.LuaApp.Services.AppWebView);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v14 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v15 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v16 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local l_LaunchGame_0 = require(l_CorePackages_0.Workspace.Packages.GameLaunch).LaunchGame;
local v18 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v19 = require(l_Modules_0.LuaApp.Http.UrlBase);
local v20 = require(l_Modules_0.LuaApp.AppPage);
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local v23 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v24 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v25 = require(l_Modules_0.LuaApp.Thunks.NavigateFromWebView);
local v26 = game:DefineFastFlag("HybridEventReceiverFixBaseUrl", false);
local v27 = game:DefineFastFlag("GenericNavigationDeepLinkEnabled", false);
local v28 = game:DefineFastFlag("PushPermissionTriggerEnabled", false);
local v29 = v5.Component:extend("UniversalAppRobloxHybridEventReceiver");
v29.init = function(v30)
    v30.onJavascriptCallback = function(v31)
        local v32 = l_HttpService_0:JSONDecode(v31);
        if not (v32.moduleID == "Navigation" and v32.functionName == "startWebChatConversation") or not v32.params.userId then
            if not (v32.moduleID == "Navigation" and v32.functionName == "openUserProfile") or not v32.params.userId then
                if not (v32.moduleID == "Navigation" and v32.functionName == "navigateToFeature") or not v32.params.params.urlPath then
                    if not ((v27 and v32.moduleID == "Navigation") and v32.functionName == "navigateToFeature") or not v32.params.params.deepLinkUrlPath then
                        if not (v32.moduleID == "Game" and v32.functionName == "launchGame") or not v32.params.request.placeId then
                            if (v32.moduleID == "Game" and v32.functionName == "launchGame") and v32.params.request.requestType == "RequestFollowUser" then
                                if not l_default_0.isEnabled() then
                                    v30.props.browserService:CloseBrowserWindow();
                                else
                                    v30.props.navigateBack();
                                    v30.props.webView:closeWindow();
                                end;
                                l_LaunchGame_0(nil, "FollowUserJSHybridEvent", {
                                    userId = v32.params.request.userId, 
                                    joinAttemptId = v32.params.request.joinAttemptId, 
                                    joinAttemptOrigin = v32.params.request.joinAttemptOrigin
                                }, v30.props.game, v32.params.request.joinAttemptOrigin, nil);
                                return ;
                            elseif v32.moduleID == "Localization" and v32.functionName == "languageChangeTrigger" then
                                if not l_default_0.isEnabled() then
                                    v30.props.browserService:CloseBrowserWindow();
                                else
                                    v30.props.navigateBack();
                                    v30.props.webView:closeWindow();
                                end;
                                local l_newRobloxLanguageValue_0 = v32.params.newRobloxLanguageValue;
                                if typeof(l_newRobloxLanguageValue_0) == "table" then
                                    l_newRobloxLanguageValue_0 = l_newRobloxLanguageValue_0.locale;
                                end;
                                l_AppStorageService_0:SetItem(v16.RobloxLocaleId, (string.gsub(l_newRobloxLanguageValue_0, "_", "-")));
                                v30.props.guiService:BroadcastNotification("", v15.RESTART_LUA_APP);
                                return ;
                            else
                                if (v28 and v32.moduleID == "Push") and v32.functionName == "pushPermissionTrigger" then
                                    v30.props.guiService:BroadcastNotification(v32.moduleID, v15.APP_READY);
                                end;
                                return ;
                            end;
                        else
                            if not l_default_0.isEnabled() then
                                v30.props.browserService:CloseBrowserWindow();
                            else
                                v30.props.navigateBack();
                                v30.props.webView:closeWindow();
                            end;
                            l_LaunchGame_0(v32.params.request.placeId, "GameDetailPageJSHybridEvent", {
                                accessCode = v32.params.request.accessCode, 
                                gameInstanceId = v32.params.request.instanceId, 
                                linkCode = v32.params.request.linkCode, 
                                joinAttemptId = v32.params.request.joinAttemptId, 
                                joinAttemptOrigin = v32.params.request.joinAttemptOrigin
                            }, v30.props.game, v32.params.request.joinAttemptOrigin, nil);
                            return ;
                        end;
                    else
                        v30.props.linking:detectURL(v32.params.params.deepLinkUrlPath);
                        return ;
                    end;
                elseif not l_default_0.isEnabled() then
                    if not v26 then
                        v30.props.browserService:CloseBrowserWindow();
                        v30.props.navigateDown({
                            name = v20.GenericWebPage, 
                            detail = v19.WWW .. v32.params.params.urlPath, 
                            extraProps = {
                                title = v32.params.params.feature or ""
                            }
                        });
                        return ;
                    else
                        local v34 = v18.fromString("www:" .. v32.params.params.urlPath);
                        v30.props.browserService:CloseBrowserWindow();
                        v30.props.navigateDown({
                            name = v20.GenericWebPage, 
                            detail = v34(), 
                            extraProps = {
                                title = v32.params.params.feature or ""
                            }
                        });
                        return ;
                    end;
                elseif not v26 then
                    v30.props.navigateFromWebView({
                        name = v20.GenericWebPage, 
                        detail = v19.WWW .. v32.params.params.urlPath, 
                        extraProps = {
                            title = v32.params.params.feature or ""
                        }
                    });
                    return ;
                else
                    v30.props.navigateFromWebView({
                        name = v20.GenericWebPage, 
                        detail = v18.fromString("www:" .. v32.params.params.urlPath)(), 
                        extraProps = {
                            title = v32.params.params.feature or ""
                        }
                    });
                    return ;
                end;
            elseif not l_default_0.isEnabled() then
                v30.props.browserService:CloseBrowserWindow();
                v30.props.navigateDown({
                    name = v20.ViewUserProfile, 
                    detail = v32.params.userId
                });
                return ;
            else
                v30.props.navigateFromWebView({
                    name = v20.ViewUserProfile, 
                    detail = v32.params.userId
                });
                return ;
            end;
        else
            if not l_default_0.isEnabled() then
                v30.props.browserService:CloseBrowserWindow();
            end;
            v30.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.AppShellWebView);
            v30.props.guiService:BroadcastNotification(tostring(v32.params.userId), v15.LAUNCH_CONVERSATION);
            return ;
        end;
    end;
end;
v29.render = function(v35)
    return v5.createElement(v14, {
        event = v35.props.browserService.JavaScriptCallback, 
        callback = v35.onJavascriptCallback
    });
end;
return (l_RoactServices_0.connect({
    browserService = l_AppBrowserService_0, 
    guiService = l_AppGuiService_0, 
    game = l_AppGame_0, 
    linking = l_AppLinking_0, 
    webView = not not l_default_0.isEnabled() and v12 or nil
})((v6.connect(nil, function(v36)
    return {
        navigateDown = function(v37)
            return v36(v23(v37));
        end, 
        navigateBack = not not l_default_0.isEnabled() and function()
            return v36(v24());
        end or nil, 
        navigateFromWebView = not not l_default_0.isEnabled() and function(v38)
            return v36(v25(v38));
        end or nil, 
        enteredChatFromEntryPoint = function(v39)
            return v36(l_EnteredChatFromEntryPoint_0(v39));
        end
    };
end)(v29))));
