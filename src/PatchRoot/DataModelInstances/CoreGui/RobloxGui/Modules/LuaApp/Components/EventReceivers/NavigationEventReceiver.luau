local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local _ = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local l_selectCurrentRoactNavigationRoute_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors.selectCurrentRoactNavigationRoute;
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v13 = require(l_Modules_0.LuaApp.ExperienceEventReceiver);
local v14 = require(l_Modules_0.LuaApp.Analytics.Events.luaPageLoad);
local v15 = require(l_Modules_0.LuaApp.Analytics.Events.luaPageUnload);
local v16 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v18 = require(l_Modules_0.LuaApp.AppPage);
local v19 = require(l_Modules_0.LuaApp.AppPageProperties);
local v20 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v21 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v22 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_NavigateIntoChat_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.NavigateIntoChat;
local _ = require(l_Modules_0.LuaApp.Thunks.SendAppReadyForAppInputFocused);
local v25 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v26 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v27 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v28 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v29 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v30 = require(l_Modules_0.LuaApp.Actions.SetPreloading);
local _ = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local _ = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppNavigationAnalytics);
local v34 = require(l_Modules_0.LuaApp.Flags.GetFStringLuaAppUnloadEventEnabledPageNames);
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagAddPreviousPageToLuaPageLoad);
local function _(v36, v37)
    local v38 = v19[v37];
    v36:SwitchedToAppShellFeature(v38 and v38.appShellReporterFeature or Enum.AppShellFeature.None);
end;
local function _(v40)
    if v40 ~= nil then
        return v40.routeName;
    else
        return nil;
    end;
end;
local function _(v42)
    if v42 ~= nil and v42.params ~= nil then
        return v42.params.detail;
    else
        return nil;
    end;
end;
local function _()
    return #v34() > 0;
end;
local function v67()
    local v45 = l_useRoactService_0(v12);
    local v46 = l_useRoactService_0(l_AppNotificationService_0);
    local v47 = l_useSelector_0(l_selectCurrentRoactNavigationRoute_0);
    local v48 = if not v35() then v47.routeName else if v47 ~= nil then v47.routeName else nil;
    local v49 = if not v35() then if v47.params ~= nil then v47.params.detail else nil else if v47 ~= nil and v47.params ~= nil then v47.params.detail else nil;
    local v50, v51 = v4.useState(os.clock());
    local v52 = v4.useMemo(function()
        if not (#v34() > 0) then
            return nil;
        else
            return v13.new();
        end;
    end, {});
    v4.useEffect(function()
        if v52 ~= nil then
            local v55 = v52:onLaunched(function(v53)
                local v54 = os.clock();
                v15(v45, "AppRouter", v48, v49, {
                    nextPage = "Experience", 
                    nextDetail = v53.placeId, 
                    timeOnPage = v54 - v50
                });
                v51(v54);
            end);
            local v57 = v52:onLeft(function(v56)
                if not v35() then
                    v14(v45, "AppRouter", v48, v49);
                else
                    v14(v45, "AppRouter", v48, v49, {
                        previousPage = "Experience", 
                        previousDetail = v56.placeId
                    });
                end;
                v51(os.clock());
            end);
            return function()
                v55:disconnect();
                v57:disconnect();
            end;
        else
            return ;
        end;
    end, {
        v52, 
        v45, 
        v48, 
        v49
    });
    local v58 = v4.useRef(nil);
    v4.useEffect(function()
        if not v35() then
            v14(v45, "AppRouter", v48, v49);
            local v59 = os.clock();
            if v58.current ~= nil then
                v15(v45, "AppRouter", v58.current.routeName, if v58.current.params ~= nil then v58.current.params.detail else nil, {
                    nextPage = v48, 
                    nextDetail = v49, 
                    timeOnPage = v59 - v50
                });
            end;
            v58.current = v47;
            local l_v46_0 = v46;
            local v61 = v19[v48];
            l_v46_0:SwitchedToAppShellFeature(v61 and v61.appShellReporterFeature or Enum.AppShellFeature.None);
            v51(v59);
            return ;
        else
            local l_current_0 = v58.current;
            local v63 = if l_current_0 ~= nil then l_current_0.routeName else nil;
            local l_current_1 = v58.current;
            l_current_0 = if l_current_1 ~= nil and l_current_1.params ~= nil then l_current_1.params.detail else nil;
            v14(v45, "AppRouter", v48, v49, {
                previousPage = v63, 
                previousDetail = l_current_0
            });
            l_current_1 = os.clock();
            if v58.current ~= nil then
                v15(v45, "AppRouter", v63, l_current_0, {
                    nextPage = v48, 
                    nextDetail = v49, 
                    timeOnPage = l_current_1 - v50
                });
            end;
            v58.current = v47;
            local l_v46_1 = v46;
            local v66 = v19[v48];
            l_v46_1:SwitchedToAppShellFeature(v66 and v66.appShellReporterFeature or Enum.AppShellFeature.None);
            v51(l_current_1);
            return ;
        end;
    end, {
        v48, 
        v49
    });
end;
local v68 = v4.Component:extend("NavigationEventReceiver");
v68.handleBackButtonPressed = function(v69)
    local v70 = #v69.props.currentRoute;
    local l_name_0 = v69.props.currentRoute[1].name;
    local l_name_1 = v69.props.currentRoute[v70].name;
    if (l_name_0 == v18.Chat and l_name_1 ~= v18.GameDetail) and l_name_1 ~= v18.ShareGameToChat then
        return ;
    elseif l_name_1 == v18.ViewFriends and v69.props.centralOverlayType ~= v29.PeopleList then
        return ;
    elseif l_name_1 == v18.AddFriendsPage then
        return ;
    elseif not v19[l_name_1] or not v19[l_name_1].disableBackButton then
        if not v69.props.centralOverlayType then
            if v70 > 1 then
                v69.props.navigateBack();
                return ;
            else
                l_GuiService_0:BroadcastNotification("", v16.BACK_BUTTON_NOT_CONSUMED);
                return ;
            end;
        else
            if not v69.props.centralOverlayDisableBackButtonClose then
                v69.props.closeCentralOverlay();
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v68.init = function(v73)
    local l_RobloxEventReceiver_0 = v73.props.RobloxEventReceiver;
    v73.tokens = {
        l_RobloxEventReceiver_0:observeEvent("Navigations", function(v75, v76)
            if not (v76 ~= "Destination") or v76 == "Reload" then
                if v75.appName == v18.ShareGameToChat then
                    v73.props.navigateDown({
                        name = v18.ShareGameToChat, 
                        detail = v75.parameters.placeId
                    });
                    return ;
                elseif v75.appName == v18.Chat then
                    v73.props.setPage({
                        name = v18.Chat, 
                        detail = v75.parameters and v75.parameters.conversationId
                    });
                    return ;
                elseif v75.appName == v17.AvatarEditor then
                    v73.props.resetNavigationHistory({
                        {
                            {
                                name = v17.AvatarExperienceLandingPage
                            }
                        }, 
                        {
                            {
                                name = v17.AvatarExperienceLandingPage
                            }, 
                            {
                                name = v17.AvatarEditor
                            }
                        }
                    });
                    return ;
                else
                    v73.props.setPage({
                        name = v18[v75.appName] or v18.None
                    });
                end;
            end;
        end), 
        l_GuiService_0.ShowLeaveConfirmation:Connect(function()
            v73:handleBackButtonPressed();
        end), 
        l_RobloxEventReceiver_0:observeEvent("AppShellNotifications", function(v77, v78)
            if v78 == "StartConversationWithUserId" then
                v73.props.navigateIntoChat({
                    userId = v77
                });
                return ;
            elseif v78 == "StartConversationWithId" then
                v73.props.navigateIntoChat({
                    conversationId = v77
                });
                return ;
            else
                if v78 == "Preloading" then
                    v73.props.setPreloading(v77 == "true");
                end;
                return ;
            end;
        end), 
        l_RobloxEventReceiver_0:observeEvent("QrCodeScanResult", function(_, v80)
            if v80 == "Cancelled" then
                v73.props.navigateBack();
                return ;
            else
                v73.props.navigateBack();
                v73.props.setCurrentToast({
                    toastMessage = "Feature.Toast.ScanQrCodeError.UnrecognizableQrCode", 
                    toastType = v27.NetworkingError
                });
                return ;
            end;
        end)
    };
end;
v68.render = function(_)
end;
v68.willUnmount = function(v82)
    for _, v84 in pairs(v82.tokens) do
        v84:disconnect();
    end;
end;
v68 = v5.connect(function(v85, _)
    return {
        currentRoute = v85.Navigation.history[#v85.Navigation.history], 
        centralOverlayType = v85.CentralOverlay.OverlayType, 
        centralOverlayDisableBackButtonClose = v85.CentralOverlay.Configs.DisableBackButtonClose
    };
end, function(v87)
    return {
        setPage = function(v88)
            return v87(v20({
                v88
            }, true));
        end, 
        navigateDown = function(v89)
            return v87(v21(v89, true));
        end, 
        navigateBack = function()
            return v87(v22(true));
        end, 
        closeCentralOverlay = function()
            v87(v26());
        end, 
        resetNavigationHistory = function(v90)
            return v87(v25(nil, v90));
        end, 
        setCurrentToast = function(v91)
            v87(v28(v91));
        end, 
        navigateIntoChat = function(v92)
            return v87(l_NavigateIntoChat_0(v92, false));
        end, 
        setPreloading = function(v93)
            v87(v30(v93));
        end
    };
end)(v68);
local function v95(v94)
    v67();
    return v4.createElement(v68, v94);
end;
if not v33() then
    return v68;
else
    return v95;
end;
