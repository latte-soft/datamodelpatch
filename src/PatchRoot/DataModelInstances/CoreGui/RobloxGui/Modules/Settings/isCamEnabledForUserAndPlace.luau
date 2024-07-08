local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v4 = require(l_CorePackages_0.Cryo);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_IXPService_0 = game:GetService("IXPService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v8 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAvatarChatServiceEnabled);
local v9 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAlwaysAvailableCamera);
local v10 = require(l_RobloxGui_0.Modules.Flags.getFFlagUseCameraDevicesListener);
local v11 = require(l_RobloxGui_0.Modules.Settings.cameraDevicesHelper);
local v12 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v13 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v14 = game:DefineFastFlag("DisableCameraOnLowSpecDevices", false);
local v15 = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPLayer", "AvatarChat.DisableOnLowSpecAndroid");
local v16 = game:DefineFastString("DisableCameraOnLowSpecDevicesIXPField", "DisableOnAndroid");
local v17 = game:DefineFastFlag("OnlyShowToastOnce", false);
local v18 = game:DefineFastFlag("DebugAlwaysShowDisableCameraToast", false);
local function _()
    if not v14 then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function()
            return l_IXPService_0:GetUserLayerVariables(v15);
        end);
        if not (not l_status_0 or not l_result_0) and l_result_0[v16] then
            return l_result_0[v16];
        else
            return false;
        end;
    end;
end;
return function()
    if v8() and not _G.__TESTEZ_RUNNING_TEST__ then
        local l_status_1, l_result_1 = pcall(l_AvatarChatService_0.GetClientFeaturesAsync, l_AvatarChatService_0);
        if l_status_1 then
            local v24 = l_AvatarChatService_0:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.DeviceCapture);
            if not v24 then
                l_IXPService_0:LogUserLayerExposure(v15);
            end;
            local v25;
            if not v14 then
                v25 = false;
            else
                local l_status_2, l_result_2 = pcall(function()
                    return l_IXPService_0:GetUserLayerVariables(v15);
                end);
                v25 = not not l_status_2 and if l_result_2 and l_result_2[v16] then l_result_2[v16] else false;
            end;
            if not v25 or v24 then
                v25 = l_AvatarChatService_0:IsEnabled(l_result_1, Enum.AvatarChatServiceFeature.PlaceVideo);
                local v28 = l_AvatarChatService_0:IsEnabled(l_result_1, Enum.AvatarChatServiceFeature.UserVideo);
                local v29 = l_AvatarChatService_0:IsEnabled(l_result_1, Enum.AvatarChatServiceFeature.UserVideoEligible);
                if not v9() then
                    return (v25 and v29) and v28;
                else
                    local _ = nil;
                    return ((v25 and v29) and v28) and not v4.isEmpty(if not v10() then l_VideoCaptureService_0:GetCameraDevices() else v11.GetDevices());
                end;
            else
                if not v17 then
                    v12:showPrompt(v13.CameraUnavailable);
                elseif not (l_MemStorageService_0:GetItem("ShownDisableCameraToast") == "true") or v18 then
                    v12:showPrompt(v13.CameraUnavailable);
                    l_MemStorageService_0:SetItem("ShownDisableCameraToast", "true");
                end;
                return false;
            end;
        else
            warn("Unable to get Client Features from AvatarChatService");
            return false;
        end;
    else
        return false;
    end;
end;
