local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Otter);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_CFrameUtility_0 = require(l_CorePackages_0.Thumbnailing).CFrameUtility;
local l_CameraUtility_0 = require(l_CorePackages_0.Thumbnailing).CameraUtility;
local l_CharacterUtility_0 = require(l_CorePackages_0.Thumbnailing).CharacterUtility;
local v12 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFieldOfViewDeg);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v15 = {
    frequency = 1 / v5.FullscreenTweenTimeSeconds, 
    dampingRatio = 1
};
local v16 = {};
v16.__index = v16;
v16.new = function(v17, v18)
    local v19 = {};
    setmetatable(v19, v16);
    v19.started = false;
    v19.store = v17;
    v19.avatarRoute = v18;
    v19.updateConnection = nil;
    v19.camera = game.Workspace.CurrentCamera;
    v19.toFullscreenFraction = 0;
    v19.prevShowFullBodyPicture = v19:_showFullBodyPicture();
    v19.prevPage = v19.avatarRoute.opaque.name;
    return v19;
end;
v16._calculateCameraDetails = function(v20, _)
    local v22 = (v20.screenHeightPix / 2) / math.tan(math.rad(v5.CameraFieldOfViewDeg) / 2);
    v20.pixToCamera = v22;
    v20.focusAngleAboveCenterRad = math.atan2(v20.screenHeightPix / 2 - (v20.topYPix + v20.viewportSizePix / 2), v22);
    local v23 = v20.screenHeightPix / 2 - v20.topYPix;
    v20.fieldOfViewForDistanceScale = math.deg(math.atan2(v23, v22) - math.atan2(v23 - v20.viewportSizePix, v22));
    v20.store:dispatch(v12(v20.fieldOfViewForDistanceScale));
end;
v16._handleCameraChange = function(v24)
    v24.showFullBodyPicture = v24:_showFullBodyPicture();
    if v24.prevShowFullBodyPicture ~= v24.showFullBodyPicture then
        v24.prevFieldOfViewForDistanceScale = v24.fieldOfViewForDistanceScale;
        v24.prevXRotDeg = v24.xRotDeg;
        v24.prevYRotDeg = v24.yRotDeg;
        v24.prevCameraDistanceScale = v24.cameraDistanceScale;
        v24.prevTargetCFrame = v24.targetCFrame;
        v24.prevMinExtent = v24.minExtent;
        v24.prevMaxExtent = v24.maxExtent;
        v24.prevExtentScale = v24.extentScale;
        v24.prevCameraCFrame = v24.camera.CFrame;
    end;
    local v25 = v24.store:getState();
    v24.finalPageViewMode = v25.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
    v24.characterModelVersion = v25.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
    v24.lastSuccessfulPoseEmoteAssetId = v25.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
    local l_CurrentCharacter_0 = v25.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_0 then
        local l_Head_0 = l_CurrentCharacter_0:FindFirstChild("Head");
        if l_Head_0 then
            local v28 = v25.AvatarExperience.ProfilePictureEditor.PeekabooLayoutDetails[v24.avatarRoute.opaque.name];
            if v28 then
                v24.screenHeightPix = v28.screenHeightPix;
                v24.topYPix = v28.topYPix;
                v24.viewportSizePix = v28.viewportSizePix;
                v24:_calculateCameraDetails(l_CurrentCharacter_0);
                if v24.focusAngleAboveCenterRad then
                    if not v24.showFullBodyPicture then
                        v24.targetCFrame = l_CFrameUtility_0.CalculateTargetCFrame(l_Head_0.CFrame);
                        local v29, v30 = l_CharacterUtility_0.CalculateHeadExtents(l_CurrentCharacter_0, v24.targetCFrame);
                        v24.minExtent = v29;
                        v24.maxExtent = v30;
                    else
                        local v31 = l_CFrameUtility_0.CalculateTargetCFrame(l_Head_0.CFrame);
                        v24.targetCFrame = (v31 - v31.Position) + l_CurrentCharacter_0:GetPrimaryPartCFrame().Position;
                        local v32, v33 = l_CharacterUtility_0.CalculateModelExtents(l_CurrentCharacter_0, v24.targetCFrame);
                        v24.minExtent = v32;
                        v24.maxExtent = v33;
                    end;
                    local l_CameraSliders_0 = v25.AvatarExperience.ProfilePictureEditor.CameraSliders;
                    v24.yRotDeg = 0;
                    v24.xRotDeg = 0;
                    v24.cameraDistanceScale = 1;
                    if l_CameraSliders_0 then
                        v24.zoomSliderValue = l_CameraSliders_0.zoomSliderValue;
                        v24.rotateSliderValue = l_CameraSliders_0.rotateSliderValue;
                        v24.yRotDeg = v7.getYRotDegFromSliderValue(v24.rotateSliderValue);
                        if not v24.showFullBodyPicture then
                            v24.cameraDistanceScale = v7.getCameraDistanceScaleFromSliderValue(v24.zoomSliderValue);
                        else
                            v24.xRotDeg = l_CameraUtility_0.XRotForFullBody;
                            v24.cameraDistanceScale = l_CameraUtility_0.DistanceScaleForFullBody;
                        end;
                    end;
                    v24.extentScale = not not v24.showFullBodyPicture and l_CameraUtility_0.DefaultBodyMarginScale or l_CameraUtility_0.DefaultHeadMarginScale;
                    if v24.prevPage ~= v24.avatarRoute.opaque.name then
                        v24.prevShowFullBodyPicture = false;
                        v24.prevPage = v24.avatarRoute.opaque.name;
                        v24.fullscreenTweenMotor:stop();
                        v24.toFullscreenFraction = 0;
                    elseif v24.prevShowFullBodyPicture ~= v24.showFullBodyPicture then
                        local v35 = not v24.showFullBodyPicture and 0 or 1;
                        v24.prevShowFullBodyPicture = v24.showFullBodyPicture;
                        v24.fullscreenTweenMotor:stop();
                        v24.fullscreenTweenMotor:setGoal(v3.spring(v35, v15));
                        v24.fullscreenTweenMotor:start();
                    end;
                    v24:onUpdateFullscreenFraction();
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function _(v36, v37, v38)
    if v38 then
        return v37 * (1 - v36) + v38 * v36;
    else
        return v37;
    end;
end;
local function _(v40, v41, v42)
    if v42 then
        return v41:Lerp(v42, v40);
    else
        return v41;
    end;
end;
v16.onUpdateFullscreenFraction = function(v44)
    local v45 = math.abs((not v44.showFullBodyPicture and 0 or 1) - v44.toFullscreenFraction);
    local v46 = {};
    local l_fieldOfViewForDistanceScale_0 = v44.fieldOfViewForDistanceScale;
    local l_prevFieldOfViewForDistanceScale_0 = v44.prevFieldOfViewForDistanceScale;
    v46.optFieldOfViewForDistanceScale = if l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 * (1 - v45) + l_prevFieldOfViewForDistanceScale_0 * v45 else l_fieldOfViewForDistanceScale_0;
    l_fieldOfViewForDistanceScale_0 = v44.xRotDeg;
    l_prevFieldOfViewForDistanceScale_0 = v44.prevXRotDeg;
    v46.optCameraXRot = if l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 * (1 - v45) + l_prevFieldOfViewForDistanceScale_0 * v45 else l_fieldOfViewForDistanceScale_0;
    l_fieldOfViewForDistanceScale_0 = v44.yRotDeg;
    l_prevFieldOfViewForDistanceScale_0 = v44.prevYRotDeg;
    v46.optCameraYRot = if l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 * (1 - v45) + l_prevFieldOfViewForDistanceScale_0 * v45 else l_fieldOfViewForDistanceScale_0;
    l_fieldOfViewForDistanceScale_0 = v44.cameraDistanceScale;
    l_prevFieldOfViewForDistanceScale_0 = v44.prevCameraDistanceScale;
    v46.optCameraDistanceScale = if l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 * (1 - v45) + l_prevFieldOfViewForDistanceScale_0 * v45 else l_fieldOfViewForDistanceScale_0;
    l_fieldOfViewForDistanceScale_0 = v44.targetCFrame;
    l_prevFieldOfViewForDistanceScale_0 = v44.prevTargetCFrame;
    v46.targetCFrame = if l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0:Lerp(l_prevFieldOfViewForDistanceScale_0, v45) else l_fieldOfViewForDistanceScale_0;
    l_fieldOfViewForDistanceScale_0 = v44.minExtent;
    l_prevFieldOfViewForDistanceScale_0 = v44.prevMinExtent;
    v46.minExtent = if l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 * (1 - v45) + l_prevFieldOfViewForDistanceScale_0 * v45 else l_fieldOfViewForDistanceScale_0;
    l_fieldOfViewForDistanceScale_0 = v44.maxExtent;
    l_prevFieldOfViewForDistanceScale_0 = v44.prevMaxExtent;
    v46.maxExtent = if l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 * (1 - v45) + l_prevFieldOfViewForDistanceScale_0 * v45 else l_fieldOfViewForDistanceScale_0;
    l_fieldOfViewForDistanceScale_0 = v44.extentScale;
    l_prevFieldOfViewForDistanceScale_0 = v44.prevExtentScale;
    v46.extentScale = if l_prevFieldOfViewForDistanceScale_0 then l_fieldOfViewForDistanceScale_0 * (1 - v45) + l_prevFieldOfViewForDistanceScale_0 * v45 else l_fieldOfViewForDistanceScale_0;
    l_CameraUtility_0.SetupCamera(v44.camera, v46);
    l_fieldOfViewForDistanceScale_0 = v44.camera.CFrame * CFrame.fromEulerAnglesXYZ(-v44.focusAngleAboveCenterRad, 0, 0);
    l_prevFieldOfViewForDistanceScale_0 = v44.store:getState().GlobalGuiInset;
    local l_ScreenSize_0 = v44.store:getState().ScreenSize;
    local v50 = l_ScreenSize_0.X - l_getSafeAreaSize_0(l_ScreenSize_0, l_prevFieldOfViewForDistanceScale_0).X.Offset;
    if v50 > 0 then
        local v51 = -l_fieldOfViewForDistanceScale_0.RightVector * (((l_fieldOfViewForDistanceScale_0.Position - v46.targetCFrame.Position).Magnitude * v50) / (2 * v44.pixToCamera));
        l_fieldOfViewForDistanceScale_0 = CFrame.new(v51.X, v51.Y, v51.Z) * l_fieldOfViewForDistanceScale_0;
    end;
    local l_camera_0 = v44.camera;
    local l_l_fieldOfViewForDistanceScale_0_0 = l_fieldOfViewForDistanceScale_0;
    local l_prevCameraCFrame_0 = v44.prevCameraCFrame;
    l_camera_0.CFrame = if l_prevCameraCFrame_0 then l_l_fieldOfViewForDistanceScale_0_0:Lerp(l_prevCameraCFrame_0, v45) else l_l_fieldOfViewForDistanceScale_0_0;
end;
v16._peekabooLayoutDetailsChanged = function(v55, v56)
    local v57 = v56.AvatarExperience.ProfilePictureEditor.PeekabooLayoutDetails[v55.avatarRoute.opaque.name];
    if v57 then
        local v58 = true;
        if v55.screenHeightPix == v57.screenHeightPix then
            v58 = true;
            if v55.topYPix == v57.topYPix then
                v58 = v55.viewportSizePix ~= v57.viewportSizePix;
            end;
        end;
        return v58;
    else
        return false;
    end;
end;
v16._cameraSliderDetailsChanged = function(v59, v60)
    local l_CameraSliders_1 = v60.AvatarExperience.ProfilePictureEditor.CameraSliders;
    local v62 = true;
    if v59.zoomSliderValue == l_CameraSliders_1.zoomSliderValue then
        v62 = v59.rotateSliderValue ~= l_CameraSliders_1.rotateSliderValue;
    end;
    return v62;
end;
v16._finalPageViewModeChanged = function(v63, v64)
    return v63.finalPageViewMode ~= v64.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
end;
v16._lastSuccessfulPoseEmoteAssetIdChanged = function(v65, v66)
    return v65.lastSuccessfulPoseEmoteAssetId ~= v66.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.lastSuccessfulPoseEmoteAssetId;
end;
v16._characterModelVersionChanged = function(v67, v68)
    return v67.characterModelVersion ~= v68.AvatarExperience.AvatarScene.Character.CharacterModelVersion;
end;
v16._update = function(v69, v70)
    if not (not (((v69:_peekabooLayoutDetailsChanged(v70) or v69:_cameraSliderDetailsChanged(v70)) or v69:_characterModelVersionChanged(v70)) or v69:_finalPageViewModeChanged(v70)) and not v69:_lastSuccessfulPoseEmoteAssetIdChanged(v70)) then
        v69:_handleCameraChange();
    end;
end;
v16._updateState = function(v71, v72, _)
    v71:_update(v72);
end;
v16._showFullBodyPicture = function(v74)
    if v74.store:getState().AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode == v6.FullBody and v74.avatarRoute.opaque.name == v13.ProfilePictureEditorFinal then
        return true;
    else
        return false;
    end;
end;
v16.updateAvatarRoute = function(v75, v76, _)
    v75.avatarRoute = v76;
    if v75.started then
        v75:_update((v75.store:getState()));
    end;
end;
v16.watchCharacterToAdjustCamera = function(v78, v79)
    if v79 then
        v78.watchCharacterToolConnection = v79.DescendantAdded:Connect(function(v80)
            if v80:IsA("Tool") then
                l_RunService_0.Heartbeat:Wait();
                v78:_handleCameraChange();
            end;
        end);
    end;
end;
v16.onPPEPoseChanged = function(v81)
    l_RunService_0.Heartbeat:Wait();
    v81:_handleCameraChange();
end;
v16.stopWatchingCharacter = function(v82)
    if v82.watchCharacterToolConnection then
        v82.watchCharacterToolConnection:Disconnect();
        v82.watchCharacterToolConnection = nil;
    end;
end;
v16.start = function(v83)
    if not v83.started then
        v83.started = true;
        local v84 = v83.store:getState();
        v83.fullscreenTweenMotor = v3.createSingleMotor(0);
        v83.fullscreenTweenMotor:onStep(function(v85)
            v83.toFullscreenFraction = v85;
            v83:onUpdateFullscreenFraction();
        end);
        v83.updateConnection = v83.store.changed:connect(function(...)
            v83:_updateState(...);
        end);
        v83.camera.CameraType = Enum.CameraType.Scriptable;
        v83.camera.FieldOfView = v5.CameraFieldOfViewDeg;
        local l_CurrentCharacter_1 = v84.AvatarExperience.AvatarScene.Character.CurrentCharacter;
        if l_CurrentCharacter_1 then
            v83:_handleCameraChange();
            v83:watchCharacterToAdjustCamera(l_CurrentCharacter_1);
        end;
        return ;
    else
        return ;
    end;
end;
v16.stop = function(v87)
    if v87.started then
        v87.started = false;
        v87:stopWatchingCharacter();
        if v87.fullscreenTweenMotor then
            v87.fullscreenTweenMotor:destroy();
            v87.fullscreenTweenMotor = nil;
        end;
        if v87.updateConnection then
            v87.updateConnection:disconnect();
            v87.updateConnection = nil;
        end;
        return ;
    else
        return ;
    end;
end;
v16.onDestroy = function(_)
end;
return v16;
