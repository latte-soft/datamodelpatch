local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local l_IXPService_0 = game:GetService("IXPService");
local v5 = require(l_CorePackages_0.Packages.Dash);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.RoactNavigation);
local v10 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v10.App.ImageSet.Images;
local l_withStyle_0 = v10.Style.withStyle;
local l_IconButton_0 = v10.App.Button.IconButton;
local l_IconSize_0 = v10.App.ImageSet.Enum.IconSize;
local _ = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local v16 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.getIconButtonSize);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v18 = require(l_Modules_0.LuaApp.AppPage);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local _ = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local v21 = require(l_Modules_0.LuaApp.Components.NumericalBadge);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v23 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v25 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v26 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagReportNotificationStreamCTA);
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableTopBarShowItemsOnSearching);
local v29 = l_Images_0["icons/common/notificationOn"];
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppNewStreamNotificationsEnabled;
local l_StreamNotificationsBellIcon_0 = require(l_CorePackages_0.Workspace.Packages.StreamNotifications).StreamNotificationsBellIcon;
local v32 = v7.PureComponent:extend("NotificationsButton");
v32.validateProps = v6.strictInterface({
    formFactor = v6.string, 
    isCompactView = v6.boolean, 
    isUnderTitleSearchBarEnabled = v6.boolean, 
    isSearching = v6.boolean, 
    isSecondary = v6.optional(v6.boolean), 
    setVisible = v5.isCallable, 
    cancelSearch = v5.isCallable, 
    activateSearch = v5.isCallable, 
    buttonRef = v6.optional(v6.table), 
    newStreamNotificationsEnabled = v6.optional(v6.boolean), 
    numberOfNotifications = v6.integer, 
    openNotificationsPage = v5.isCallable, 
    analytics = v6.table, 
    enableNotifications = v6.boolean
});
v32.init = function(v33)
    v33.showNotificationsCallback = function()
        v33.props.openNotificationsPage(not not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() and v33.props.newStreamNotificationsEnabled);
        v33.props.analytics.reportNSButtonTouch((tonumber(v33.props.numberOfNotifications)));
        if l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then
            l_IXPService_0:LogUserLayerExposure(v25.NotificationsStreamNotificationUXLayer);
        end;
    end;
end;
local function _(v34)
    if v28() and v34.formFactor == l_FormFactor_0.WIDE then
        return v34.enableNotifications;
    else
        return v34.enableNotifications and (v34.isUnderTitleSearchBarEnabled or not v34.isSearching);
    end;
end;
v32.updateVisibility = function(v36, v37)
    local l_props_0 = v36.props;
    local v39 = if not not v28() and l_props_0.formFactor == l_FormFactor_0.WIDE then l_props_0.enableNotifications else l_props_0.enableNotifications and (l_props_0.isUnderTitleSearchBarEnabled or not l_props_0.isSearching);
    if v39 ~= v37 then
        v36.props.setVisible(v39);
    end;
end;
v32.reportCTAIfNecessary = function(v40, v41)
    if v27() then
        local v42 = tonumber(v40.props.numberOfNotifications);
        local v43 = not not v41 and tonumber(v41.numberOfNotifications) or 0;
        if v42 > 0 and v43 == 0 then
            v40.props.analytics.reportNSOpenCTAShown(v42);
        end;
    end;
end;
v32.didMount = function(v44)
    v44:updateVisibility(nil);
end;
v32.didUpdate = function(v45, v46, _)
    v45:updateVisibility(if not not v28() and v46.formFactor == l_FormFactor_0.WIDE then v46.enableNotifications else v46.enableNotifications and (v46.isUnderTitleSearchBarEnabled or not v46.isSearching));
    v45:reportCTAIfNecessary(v46);
end;
v32.render = function(v48)
    return l_withStyle_0(function(v49)
        local l_numberOfNotifications_0 = v48.props.numberOfNotifications;
        local v51 = v16(v48.props.formFactor);
        if not (not not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() and v48.props.newStreamNotificationsEnabled) then
            return v7.createElement(l_IconButton_0, {
                size = UDim2.new(0, v51, 1, 0), 
                icon = v29, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = v49.Theme.SystemPrimaryDefault.Color, 
                iconTransparency = v49.Theme.SystemPrimaryDefault.Transparency, 
                onActivated = not not v48.props.isSearching and v48.props.cancelSearch or v48.showNotificationsCallback, 
                buttonRef = v48.props.buttonRef
            }, {
                NotificationBadge = v7.createElement(v21, {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    badgeCount = l_numberOfNotifications_0 and tonumber(l_numberOfNotifications_0), 
                    redBadgeVariant = true
                })
            });
        else
            return v7.createElement(l_StreamNotificationsBellIcon_0, {
                notificationCount = l_numberOfNotifications_0 and tonumber(l_numberOfNotifications_0), 
                compactWidth = v48.props.formFactor == l_FormFactor_0.COMPACT
            });
        end;
    end);
end;
return (l_RoactAppPolicy_0.connect(function(v52, _)
    return {
        enableNotifications = v52.getWebViewSupport() and v52.getNotifications()
    };
end)((l_RoactServices_0.connect({
    analytics = v23
})((v8.connect(function(v54, _)
    return {
        numberOfNotifications = v54.NotificationBadgeCounts.TopBarNotificationIcon or 0
    };
end, function(v56, _)
    return {
        openNotificationsPage = function()
            return v56(v19({
                name = v18.Notifications
            }));
        end
    };
end)(if not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then v26.connectUserLayer({
    v25.NotificationsStreamNotificationUXLayer
}, function(v58)
    return {
        newStreamNotificationsEnabled = (v58[v25.NotificationsStreamNotificationUXLayer] or {}).newStreamNotificationsEnabled or false
    };
end)(v32) else v26.connectUserLayer({
    v25.NotificationsStreamNotificationUXLayer
}, function(v59)
    return {
        newStreamNotificationsEnabled = (v59[v25.NotificationsStreamNotificationUXLayer] or {}).newStreamNotificationsEnabled or false
    };
end, false)(v32)))))));
