local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local l_Toast_0 = v6.App.Dialog.Toast;
local v8 = require(l_CorePackages_0.Workspace.Packages.RoactAppExperiment);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v12 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v13 = require(l_Modules_0.LuaApp.Actions.RemoveCurrentToastMessage);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local v15 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v16 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v17 = require(l_Modules_0.LuaApp.Components.Images);
local l_Images_0 = v6.App.ImageSet.Images;
local v19 = v17["LuaApp/graphic/ic_alert"];
local v20 = v17["LuaApp/graphic/ic_logo"];
local v21 = l_Images_0["icons/common/notificationOn"];
local v22 = l_Images_0["icons/common/notificationOff"];
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_GetFFlagAdjustVRFloor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAdjustVRFloor;
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local v26 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v26.VRReadyWrapper;
local l_VRConstants_0 = v26.VRConstants;
local v29 = v3.PureComponent:extend("ToastV2");
v29.defaultProps = {
    duration = 3, 
    springOptions = {
        frequency = 150, 
        damping = 1
    }
};
v29.validateProps = v5.strictInterface({
    duration = v5.optional(v5.integer), 
    springOptions = v5.optional(v5.table), 
    displayOrder = v5.optional(v5.integer), 
    localization = v5.table, 
    currentToastMessage = v5.optional(v5.table), 
    currentRoute = v5.table, 
    openGameDetails = v5.callback, 
    removeCurrentToastMessage = v5.callback, 
    enableNotificationsDiscoverability = v5.optional(v5.boolean)
});
v29.openLuaGameDetails = function(v30, v31)
    v30.props.openGameDetails(v31);
end;
v29.init = function(v32)
    v32.onDismissed = function()
        v32.props.removeCurrentToastMessage();
    end;
    v32.onButtonActivated = function()
        if v32.props.currentToastMessage then
            local l_currentToastMessage_0 = v32.props.currentToastMessage;
            local l_toastType_0 = l_currentToastMessage_0.toastType;
            local l_universeId_0 = l_currentToastMessage_0.universeId;
            if not (not (l_toastType_0 == v15.QuickLaunchError) or not l_universeId_0) then
                v32:openLuaGameDetails(l_universeId_0);
            end;
            v32.props.removeCurrentToastMessage();
        end;
    end;
end;
v29.onRender = function(v36)
    local l_localization_0 = v36.props.localization;
    local l_enableNotificationsDiscoverability_0 = v36.props.enableNotificationsDiscoverability;
    local l_currentToastMessage_1 = v36.props.currentToastMessage;
    local l_toastMessage_0 = l_currentToastMessage_1.toastMessage;
    local l_toastSubMessage_0 = l_currentToastMessage_1.toastSubMessage;
    local l_sequenceNumber_0 = l_currentToastMessage_1.sequenceNumber;
    local v43 = l_currentToastMessage_1.isLocalized or false;
    local v44 = nil;
    local v45 = nil;
    local l_toastType_1 = l_currentToastMessage_1.toastType;
    if l_toastType_1 == v15.QuickLaunchError then
        v45 = v36.onButtonActivated;
    elseif l_toastType_1 == v15.SuccessConfirmation then
        v44 = v20;
    elseif l_toastType_1 == v15.NetworkingError then
        v44 = v19;
    elseif l_toastType_1 == v15.InformationMessage then
        v44 = v20;
    elseif l_enableNotificationsDiscoverability_0 and l_toastType_1 == v15.NotificationsTurnedOn then
        v44 = v21;
    elseif l_enableNotificationsDiscoverability_0 and l_toastType_1 == v15.NotificationsTurnedOff then
        v44 = v22;
    end;
    local v47 = UDim2.new(0.5, 0, 0, (not not l_UserInputService_0.StatusBarSize and l_UserInputService_0.StatusBarSize.Y or 0) + 20);
    local function v49(v48)
        return v3.createElement(l_Toast_0, {
            position = v47, 
            show = true, 
            toastContent = {
                iconImage = v44, 
                onActivated = v45, 
                onDismissed = v36.onDismissed, 
                toastSubtitle = v48.toastSubMessage, 
                sequenceNumber = l_sequenceNumber_0, 
                toastTitle = v48.toastMessage
            }, 
            duration = v36.props.duration, 
            springOptions = v36.props.springOptions
        });
    end;
    if not v23() then
        return v49(not not v43 and {
            toastMessage = l_toastMessage_0, 
            toastSubMessage = l_toastSubMessage_0
        } or {
            toastMessage = not not l_toastMessage_0 and l_localization_0:Format(l_toastMessage_0) or nil, 
            toastSubMessage = not not l_toastSubMessage_0 and l_localization_0:Format(l_toastSubMessage_0) or nil
        });
    elseif not v43 then
        return l_withLocalization_0({
            toastMessage = l_toastMessage_0, 
            toastSubMessage = l_toastSubMessage_0
        })(v49);
    else
        return v49({
            toastMessage = l_toastMessage_0, 
            toastSubMessage = l_toastSubMessage_0
        });
    end;
end;
v29.render = function(v50)
    local l_displayOrder_0 = v50.props.displayOrder;
    if v50.props.currentToastMessage then
        return v3.createElement(l_VRReadyWrapper_0, {
            component = v16, 
            props = {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = l_displayOrder_0
            }, 
            vrProps = {
                partSize = l_VRConstants_0.ToastSize, 
                offset = not not l_GetFFlagAdjustVRFloor_0() and l_VRConstants_0.ToastPosition or CFrame.lookAt(l_VRConstants_0.ToastPosition, l_VRConstants_0.DefaultCameraPosition), 
                virtualScreenSize = l_VRConstants_0.ToastResolution, 
                curvature = l_VRConstants_0.ToastCurvature, 
                panelName = "Toast"
            }
        }, {
            Toast = v50:onRender()
        });
    else
        return nil;
    end;
end;
v29.didUpdate = function(v52, v53, _)
    local l_currentToastMessage_2 = v52.props.currentToastMessage;
    if l_currentToastMessage_2 then
        if not (next(l_currentToastMessage_2) and l_currentToastMessage_2.toastMessage) then
            v52.props.removeCurrentToastMessage();
        end;
        if v53.currentRoute ~= v52.props.currentRoute and l_currentToastMessage_2.toastType == v15.QuickLaunchError then
            v52.props.removeCurrentToastMessage();
        end;
    end;
end;
v29 = v4.connect(function(v56, _)
    return {
        currentToastMessage = v56.CurrentToastMessages.currentToastMessage, 
        currentRoute = v56.Navigation.history[#v56.Navigation.history]
    };
end, function(v58)
    return {
        removeCurrentToastMessage = function()
            return v58(v13());
        end, 
        openGameDetails = function(v59)
            v58(v14(v59));
        end
    };
end)(v29);
if l_GetNotificationsExperienceDetailsVariant_0.enableNotificationsEDPChanges then
    v29 = v8.connectUserLayer({
        v12.ExperienceDetailsPageLayer
    }, function(v60, _)
        return {
            enableNotificationsDiscoverability = ((v60[v12.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1) == 2
        };
    end)(v29);
end;
return l_RoactServices_0.connect({
    localization = v10
})(v29);
