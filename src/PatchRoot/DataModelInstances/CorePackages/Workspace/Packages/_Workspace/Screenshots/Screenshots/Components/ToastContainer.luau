local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.Localization);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_Toast_0 = v7.App.Dialog.Toast;
local v10 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v14 = require(l_Parent_0.Actions.CarouselOpened);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_Parent_0.Analytics.EventNames);
local v17 = require(l_Parent_0.Thunks.ShareCapture);
local v18 = require(l_Parent_0.Enums.ShotsToastType);
local v19 = require(l_Parent_0.Actions.ToastVanished);
local _ = require(l_Parent_0.Types);
local v21 = require(l_Parent_0.Flags.FFlagDecomposeDesktopCapturesEligibilityCheck);
local v22 = {
    captureSaved = "captureSaved", 
    captureSavedToDevice = "captureSavedToDevice", 
    capturesEnabled = "capturesEnabled", 
    openInFiles = "openInFiles", 
    shareAction = "shareAction", 
    shareCaptureDescription = "shareCaptureDescription", 
    viewAction = "viewAction"
};
local v23 = true;
if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Windows then
    v23 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
end;
local v31 = {
    [v18.CaptureSavedToDeviceWithOpenCTA] = {
        iconImage = l_Images_0["icons/status/success"], 
        onActivated = function(v24)
            v24.fireEvent(v16.CapturesSavedToDeviceToastOpenButtonActivated);
            game:OpenScreenshotsFolder();
        end, 
        toastCTAKey = v22.openInFiles, 
        toastTitleKey = v22.captureSavedToDevice
    }, 
    [v18.CaptureSavedToDevice] = {
        iconImage = l_Images_0["icons/status/success"], 
        onActivated = (not not v21 and v23) and function(v25)
            v25.fireEvent(v16.CapturesSavedToDeviceToastOpenButtonActivated);
            game:OpenScreenshotsFolder();
        end or nil, 
        toastCTAKey = if not not v21 and v23 then v22.openInFiles else nil, 
        toastTitleKey = v22.captureSavedToDevice
    }, 
    [v18.ShotsActivated] = {
        iconImage = l_Images_0["icons/status/success"], 
        toastTitleKey = v22.capturesEnabled
    }, 
    [v18.ShotsCaptureTaken] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v26, v27, v28)
            v26.fireEvent(v16.CapturesShareToastButtonActivated);
            if not (not v28 or not v28.captureInfo) then
                v27(v17(v28.captureInfo));
            end;
        end, 
        toastCTAKey = v22.shareAction, 
        toastSubtitleKey = v22.shareCaptureDescription, 
        toastTitleKey = v22.captureSaved
    }, 
    [v18.ViewCapture] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v29, v30)
            v29.fireEvent(v16.CapturesViewToastButtonActivated);
            v30(v14(1));
        end, 
        toastCTAKey = v22.viewAction, 
        toastTitleKey = v22.captureSaved
    }
};
return function(_)
    local v33 = v10();
    local v34 = l_useDispatch_0();
    local v35 = l_useLocalization_0({
        [v22.captureSaved] = "Feature.Captures.Toast.CaptureSaved", 
        [v22.captureSavedToDevice] = "Feature.Captures.Toast.CaptureSavedToDevice", 
        [v22.capturesEnabled] = "Feature.Captures.Toast.CapturesEnabled", 
        [v22.openInFiles] = "Feature.Captures.Action.OpenInFiles", 
        [v22.shareAction] = "Feature.Captures.Action.Share", 
        [v22.shareCaptureDescription] = "Feature.Captures.Description.ShareCTA", 
        [v22.viewAction] = "Feature.Captures.Action.ViewCapture"
    });
    local v37 = l_useSelector_0(function(v36)
        return v36.Screenshots.Toast.ToastType;
    end);
    local v39 = l_useSelector_0(function(v38)
        return v38.Screenshots.Toast.ToastConfig;
    end);
    local v41 = l_useSelector_0(function(v40)
        return v40.Screenshots.Toast.IsDismissed;
    end);
    local v42 = v5.useCallback(function()
        v34(v19());
    end);
    local v44 = v5.useCallback(function(v43)
        if not v43 then
            return nil;
        else
            return v35[v43];
        end;
    end);
    local v47 = v5.useMemo(function()
        if v37 == v18.None then
            return nil;
        else
            local v45 = v31[v37];
            local v46 = nil;
            if v45.onActivated then
                v46 = function()
                    v45.onActivated(v33, v34, v39);
                    v42();
                end;
            end;
            return v3.join(v45, {
                buttonText = v44(v45.toastCTAKey), 
                onActivated = v46, 
                onDismissed = v42, 
                toastCTAKey = v3.None, 
                toastSubtitle = v44(v45.toastSubtitleKey), 
                toastSubtitleKey = v3.None, 
                toastTitle = v44(v45.toastTitleKey), 
                toastTitleKey = v3.None
            });
        end;
    end, {
        v37, 
        v39
    });
    if v37 == v18.None then
        return nil;
    else
        return v5.createElement(l_Toast_0, {
            duration = v15.ToastDuration, 
            show = not v41, 
            toastContent = v47
        });
    end;
end;
