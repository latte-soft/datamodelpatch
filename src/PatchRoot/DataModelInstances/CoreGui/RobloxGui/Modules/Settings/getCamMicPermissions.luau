local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v5 = require(l_CorePackages_0.Cryo);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getVoiceCameraAccountSettings);
local v8 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getPlaceVoiceCameraEnabled);
local v9 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v10 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
local v11 = require(l_CorePackages_0.Promise);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v13 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v14 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local v15 = require(l_CoreGui_0.RobloxGui.Modules.Flags.FFlagAvatarChatCoreScriptSupport);
local v16 = require(l_CoreGui_0.RobloxGui.Modules.SelfieView.Flags.GetFFlagSelfieViewEnabled);
local v17 = require(l_RobloxGui_0.Modules.Flags.GetFFlagAvatarChatServiceEnabled);
local v18 = require(l_RobloxGui_0.Modules.Flags.getFFlagDecoupleHasAndRequestPermissions);
local v19 = require(l_RobloxGui_0.Modules.Flags.getFFlagPermissionsEarlyOutStallsQueue);
local v20 = require(l_RobloxGui_0.Modules.Flags.getFFlagUseCameraDeviceGrantedSignal);
local v21 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v22 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAnalyticsForCameraDevicePermissions);
local v23 = require(l_RobloxGui_0.Modules.Flags.GetFFlagJoinWithoutMicPermissions);
local v24 = require(l_RobloxGui_0.Modules.Flags.getFFlagMicrophoneDevicePermissionsPromptLogging);
local v25 = game:DefineFastFlag("CheckCameraAvailabilityBeforePermissions", false);
local v26 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false);
local v27 = if not v17() then nil else game:GetService("AvatarChatService");
local v28 = nil;
local v29 = nil;
local v30 = {};
local v31 = false;
local function v35(v32, v33, v34)
    if not (v32.isCameraEnabled or not v5.List.find(v33, l_default_0.Permissions.CAMERA_ACCESS)) then
        v33 = v5.List.removeValue(v33, l_default_0.Permissions.CAMERA_ACCESS);
    end;
    if not v23() then
        if not (v32.isVoiceEnabled or not v5.List.find(v33, l_default_0.Permissions.MICROPHONE_ACCESS)) then
            v33 = v5.List.removeValue(v33, l_default_0.Permissions.MICROPHONE_ACCESS);
        end;
    elseif not v32.isVoiceEnabled and v5.List.find(v33, l_default_0.Permissions.MICROPHONE_ACCESS) or v34 == nil then
        v33 = v5.List.removeValue(v33, l_default_0.Permissions.MICROPHONE_ACCESS);
    end;
    if not (not v26 or not v5.List.find(v33, l_default_0.Permissions.MICROPHONE_ACCESS)) then
        v33 = v5.List.removeValue(v33, l_default_0.Permissions.MICROPHONE_ACCESS);
    end;
    if not ((not v25 or not v5.List.find(v33, l_default_0.Permissions.CAMERA_ACCESS)) or not v5.isEmpty((l_VideoCaptureService_0:GetCameraDevices()))) then
        v33 = v5.List.removeValue(v33, l_default_0.Permissions.CAMERA_ACCESS);
    end;
    return v33;
end;
local function v59(v36, v37, v38, v39, v40, v41)
    local v42 = true;
    local v43 = true;
    if not (not v15 and not v16()) then
        v42 = v5.List.find(v39, l_default_0.Permissions.CAMERA_ACCESS) ~= nil;
        v43 = v5.List.find(v39, l_default_0.Permissions.MICROPHONE_ACCESS) ~= nil;
    end;
    local v44 = v35(v36, v39, v40);
    local v45 = v5.List.find(v44, l_default_0.Permissions.CAMERA_ACCESS) ~= nil;
    local v46 = v5.List.find(v44, l_default_0.Permissions.MICROPHONE_ACCESS) ~= nil;
    if not v44 or #v44 <= 0 then
        v37({
            hasCameraPermissions = false, 
            hasMicPermissions = false
        });
        if v19() then
            v31 = false;
            v38();
        end;
        return ;
    elseif v18() and v40 == true then
        return v11.new(function(v47, _)
            local v49 = {};
            for _, v51 in ipairs(v44) do
                local v52, v53 = l_default_0:hasPermissions({
                    v51
                }):await();
                if not v52 then
                    v49[v51] = false;
                else
                    v49[v51] = v53.status == l_default_0.Status.AUTHORIZED;
                end;
            end;
            v37({
                hasCameraPermissions = v49[l_default_0.Permissions.CAMERA_ACCESS] or false, 
                hasMicPermissions = v49[l_default_0.Permissions.MICROPHONE_ACCESS] or false
            });
            v31 = false;
            v38();
            v47(v49);
        end);
    else
        return l_default_0:hasPermissions(v44):andThen(function(v54)
            if v54.status == l_default_0.Status.AUTHORIZED then
                v37({
                    hasCameraPermissions = v45, 
                    hasMicPermissions = v46
                });
                v31 = false;
                v38();
                return v54;
            else
                if not ((not v24() or not v46) or not v41) then
                    v10:logPromptImpression({
                        didAuthorize = false, 
                        uiContext = v41
                    });
                end;
                return l_default_0:requestPermissions(v44):andThen(function(v55)
                    if typeof(v55) == "table" then
                        local l_v45_0 = v45;
                        if l_v45_0 then
                            l_v45_0 = true;
                            if v55.status ~= l_default_0.Status.AUTHORIZED then
                                l_v45_0 = not v5.List.find(v55.missingPermissions, l_default_0.Permissions.CAMERA_ACCESS);
                            end;
                        end;
                        local l_v46_0 = v46;
                        if l_v46_0 then
                            l_v46_0 = true;
                            if v55.status ~= l_default_0.Status.AUTHORIZED then
                                l_v46_0 = not v5.List.find(v55.missingPermissions, l_default_0.Permissions.MICROPHONE_ACCESS);
                            end;
                        end;
                        v28 = if not v42 then nil else l_v45_0;
                        v29 = if not v43 then nil else l_v46_0;
                        if not (not v20() or not v28) then
                            v9:fire();
                        end;
                    elseif v55 == l_default_0.Status.AUTHORIZED then
                        if v20() then
                            v9:fire();
                        end;
                        v28 = v45;
                        v29 = v46;
                    else
                        v28 = false;
                        v29 = false;
                    end;
                    local v58 = {
                        hasCameraPermissions = v28 or false, 
                        hasMicPermissions = v29 or false
                    };
                    if not (not v22() or not v45) then
                        l_RbxAnalyticsService_0:SendEventDeferred(not l_RunService_0:IsStudio() and "client" or "studio", "avatarChat", "CameraDevicePermissionPrompted", {
                            didAuthorize = v28 or false
                        });
                    end;
                    if not ((not v24() or not v46) or not v41) then
                        v10:logPromptInteraction({
                            didAuthorize = v29, 
                            uiContext = v41
                        });
                    end;
                    if not ((not v45 or v28) or v21()) then
                        v13:showPrompt(v14.VideoNoPermission);
                    end;
                    v37(v58);
                    v31 = false;
                    v38();
                    return v55;
                end);
            end;
        end);
    end;
end;
local function v64(v60)
    if v26 then
        v29 = true;
    end;
    if not (v28 ~= nil) or v29 == nil then
        return nil;
    else
        local v61 = false;
        for _, v63 in v60, nil, nil do
            if v63 ~= l_default_0.Permissions.MICROPHONE_ACCESS and v63 ~= l_default_0.Permissions.CAMERA_ACCESS then
                v61 = true;
            end;
        end;
        if not v61 then
            return {
                hasCameraPermissions = v28 or false, 
                hasMicPermissions = v29 or false
            };
        else
            return nil;
        end;
    end;
end;
local function v65(v66, v67, v68, v69)
    local v70 = {};
    v70 = v67 or {
        l_default_0.Permissions.MICROPHONE_ACCESS, 
        l_default_0.Permissions.CAMERA_ACCESS
    };
    local function v72()
        if v30[1] then
            local v71 = v30[1];
            table.remove(v30, 1);
            if not v18() then
                v65(v71.callback, v71.permsToCheck, nil, v71.context);
            else
                v65(v71.callback, v71.permissionsToRequest, v71.shouldNotRequestPerms, v71.context);
                return ;
            end;
        end;
    end;
    if not (not v15 and not v16()) then
        local v73 = v64(v70);
        if v73 then
            v66(v73);
            v72();
            return ;
        end;
    end;
    if not v31 then
        v31 = true;
        if not v15 and not v16() then
            return v11.new(function(v74, _)
                local v76 = v7();
                v74({
                    isVoiceEnabled = v76.isVoiceEnabledUserSettings, 
                    isCameraEnabled = v76.isCameraEnabledUserSettings
                });
            end):andThen(function(v77)
                v59(v77, v66, v72, v70, nil, v69);
            end);
        elseif not v17() then
            return v11.all({
                v11.new(function(v78, _)
                    local v80 = v8();
                    v78({
                        isVoiceEnabled = v80.isVoiceEnabledPlaceSettings, 
                        isCameraEnabled = v80.isCameraEnabledPlaceSettings
                    });
                end), 
                (v11.new(function(v81, _)
                    local v83 = v7();
                    v81({
                        isVoiceEnabled = v83.isVoiceEnabledUserSettings, 
                        isCameraEnabled = v83.isCameraEnabledUserSettings
                    });
                end))
            }):andThen(function(v84)
                local v85 = v84[1];
                local v86 = v84[2];
                return {
                    isVoiceEnabled = v85.isVoiceEnabled and v86.isVoiceEnabled, 
                    isCameraEnabled = v85.isCameraEnabled and v86.isCameraEnabled
                };
            end):andThen(function(v87)
                v59(v87, v66, v72, v70, v68, v69);
            end);
        else
            return v11.new(function(v88, _)
                if not v27.ClientFeaturesInitialized then
                    local v90 = nil;
                    v90 = v27:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
                        v90:Disconnect();
                        v88({
                            isVoiceEnabled = v27:IsEnabled(v27.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio), 
                            isCameraEnabled = v27:IsEnabled(v27.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
                        });
                    end);
                    return ;
                else
                    v88({
                        isVoiceEnabled = v27:IsEnabled(v27.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio), 
                        isCameraEnabled = v27:IsEnabled(v27.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
                    });
                    return ;
                end;
            end):andThen(function(v91)
                v59(v91, v66, v72, v70, v68, v69);
            end);
        end;
    else
        table.insert(v30, {
            callback = v66, 
            permissionsToRequest = v67, 
            shouldNotRequestPerms = v18() and v68, 
            context = v69
        });
        return ;
    end;
end;
return v65;
