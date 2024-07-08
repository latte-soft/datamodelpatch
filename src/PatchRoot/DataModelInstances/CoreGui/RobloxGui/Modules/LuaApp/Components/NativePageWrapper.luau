local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local v6 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v7 = require(l_Modules_0.LuaApp.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v10 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local _ = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local _ = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v14 = require(l_CorePackages_0.RoactNavigation);
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isRunningInStudio;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLocalizedWebViewFallbackText);
local v20 = {
    canNativeWrapperParentHandleBackNavigation = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppCanNativeWrapperParentHandleBackNavigation)
};
local v21 = v3.PureComponent:extend("NativePageWrapper");
v21.defaultProps = {
    DisplayOrder = 0
};
v21.init = function(v22)
    v22._appInputEventConnection = v22.props.appNotificationService.RobloxEventReceived:Connect(function(v23)
        local l_navigation_0 = v22.props.navigation;
        if ((v22._isMounted and l_navigation_0 ~= nil) and v23.namespace == "AppInput") and v23.detailType == "Focused" then
            if not v20.canNativeWrapperParentHandleBackNavigation() or not v22.props.backNavigationHandledByParent then
                l_navigation_0.goBack();
            else
                return ;
            end;
        end;
    end);
end;
v21.render = function(v25)
    local _ = v25.props.isVisible;
    local l_notificationData_0 = v25.props.notificationData;
    local _ = v5.isNonNegativeNumber(v25.props.DisplayOrder, "NativePageWrapper:DisplayOrder");
    if not v19() then
        return l_withStyle_0(function(v29)
            local l_GRAY1_0 = v7.Color.GRAY1;
            local v31 = 0.5;
            if v29 then
                l_GRAY1_0 = v29.Theme.Overlay.Color;
                v31 = v29.Theme.Overlay.Transparency;
            end;
            if not v25.props.allowWebviews then
                local l_status_0, l_result_0 = pcall(function()
                    return l_HttpService_0:JSONDecode(l_notificationData_0);
                end);
                local v34 = (not not l_status_0 and typeof(l_result_0) == "table") and l_result_0.title or v25.props.titleText;
                local l_GRAY4_0 = v7.Color.GRAY4;
                local v36 = 0.5;
                if v29 then
                    l_GRAY4_0 = v29.Theme.BackgroundDefault.Color;
                    v36 = v29.Theme.BackgroundDefault.Transparency;
                end;
                v25.props.eventIngest:sendEventDeferred("open_disabled_web_view", "open_disabled_web_view_action", {
                    pageName = v34
                });
                return v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundColor3 = l_GRAY4_0, 
                    BackgroundTransparency = v36
                }, {
                    TopBar = v3.createElement(v10.Container, {
                        titleText = v34, 
                        leftItem = if not l_IsVRAppBuild_0() then v10.BackButton else v10.makeBackButton(nil, true)
                    }), 
                    WarningText = v3.createElement("TextLabel", {
                        Text = "Error: this functionality is currently unavailable on your device.", 
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextColor3 = v29.Theme.TextDefault.Color, 
                        TextSize = v29.Font.BaseSize, 
                        BackgroundColor3 = v29.Theme.BackgroundUIDefault.Color
                    })
                });
            else
                return v3.createElement("Frame", {
                    BackgroundColor3 = l_GRAY1_0, 
                    BackgroundTransparency = v31
                }, {
                    button = v3.createElement("TextButton", {
                        Text = "press", 
                        Size = UDim2.fromScale(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end);
    else
        return l_withLocalization_0({
            warningText = "CommonUI.Messages.Label.ActionNotAvailableOnVRHeadsetDevice"
        })(function(v37)
            return l_withStyle_0(function(v38)
                local l_GRAY1_1 = v7.Color.GRAY1;
                local v40 = 0.5;
                if v38 then
                    l_GRAY1_1 = v38.Theme.Overlay.Color;
                    v40 = v38.Theme.Overlay.Transparency;
                end;
                if not v25.props.allowWebviews then
                    local l_status_1, l_result_1 = pcall(function()
                        return l_HttpService_0:JSONDecode(l_notificationData_0);
                    end);
                    local v43 = (not not l_status_1 and typeof(l_result_1) == "table") and l_result_1.title or v25.props.titleText;
                    local l_GRAY4_1 = v7.Color.GRAY4;
                    local v45 = 0.5;
                    if v38 then
                        l_GRAY4_1 = v38.Theme.BackgroundDefault.Color;
                        v45 = v38.Theme.BackgroundDefault.Transparency;
                    end;
                    v25.props.eventIngest:sendEventDeferred("open_disabled_web_view", "open_disabled_web_view_action", {
                        pageName = v43
                    });
                    return v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundColor3 = l_GRAY4_1, 
                        BackgroundTransparency = v45
                    }, {
                        TopBar = v3.createElement(v10.Container, {
                            titleText = v43, 
                            leftItem = if not l_IsVRAppBuild_0() then v10.BackButton else v10.makeBackButton(nil, true)
                        }), 
                        WarningText = v3.createElement("TextLabel", {
                            Text = v37.warningText, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            TextColor3 = v38.Theme.TextDefault.Color, 
                            TextSize = v38.Font.BaseSize, 
                            BackgroundColor3 = v38.Theme.BackgroundUIDefault.Color
                        })
                    });
                else
                    return v3.createElement("Frame", {
                        BackgroundColor3 = l_GRAY1_1, 
                        BackgroundTransparency = v40
                    }, {
                        button = v3.createElement("TextButton", {
                            Text = "press", 
                            Size = UDim2.fromScale(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        })
                    });
                end;
            end);
        end);
    end;
end;
v21.didUpdate = function(v46, v47)
    if not v47.isVisible then
        v46:broadcastNotification();
    end;
end;
v21.didMount = function(v48)
    v48._isMounted = true;
    v48:broadcastNotification();
end;
v21.willUnmount = function(v49)
    v49._isMounted = false;
    if v49._appInputEventConnection then
        v49._appInputEventConnection:disconnect();
        v49._appInputEventConnection = nil;
    end;
    if v49.props.onClose ~= nil then
        v49.props.onClose();
    end;
end;
v21.broadcastNotification = function(v50)
    if v50.props.allowWebviews then
        local l_isVisible_1 = v50.props.isVisible;
        local l_notificationData_1 = v50.props.notificationData;
        if game:GetEngineFeature("SetWebViewTitle") and l_notificationData_1 == nil then
            l_notificationData_1 = l_HttpService_0:JSONEncode({
                title = v50.props.titleText, 
                url = v50.props.url, 
                transitionAnimation = v50.props.transitionAnimation, 
                animated = v50.props.animated
            });
        end;
        local l_notificationType_0 = v50.props.notificationType;
        local l_guiService_0 = v50.props.guiService;
        if (l_isVisible_1 and l_notificationData_1 ~= nil) and l_notificationType_0 ~= nil then
            l_guiService_0:BroadcastNotification(l_notificationData_1, l_notificationType_0);
        end;
        return ;
    else
        return ;
    end;
end;
return l_RoactAppPolicy_0.connect(function(v55, _)
    return {
        allowWebviews = v55.getWebViewSupport()
    };
end)((v14.withNavigation((l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    appNotificationService = l_AppNotificationService_0, 
    eventIngest = v6
})(v21)))));
