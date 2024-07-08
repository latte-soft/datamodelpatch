local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Managers.PPECameraManager);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Managers.CameraManager);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0);
local function _(v10, v11)
    if math.abs(v10) < math.abs(v11) then
        return v10;
    else
        return v11;
    end;
end;
local function _(v13)
    return (v13 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
end;
local v15 = {};
v15.__index = v15;
v15.resetRotation = function(v16, v17)
    if v16.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter then
        local v18 = true;
        if v17 then
            v18 = false;
        end;
        v16:rotateByRadians(-v16.angleOffset.Y, 0, v18);
        return ;
    else
        return ;
    end;
end;
v15.cancelCurrentTween = function(v19)
    if v19.currentTween then
        v19.currentTween:Cancel();
        v19.currentTween = nil;
    end;
end;
v15.rotateByRadians = function(v20, v21, v22, v23)
    v21 = v21 or 0;
    v22 = v22 or 0;
    local l_CurrentCharacter_0 = v20.store:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if l_CurrentCharacter_0 then
        local l_HumanoidRootPart_0 = l_CurrentCharacter_0.HumanoidRootPart;
        if not v20.initialAngles then
            local v26, v27, _ = l_HumanoidRootPart_0.CFrame:ToEulerAnglesYXZ();
            v20.initialAngles = Vector2.new(v26, v27);
        end;
        v20.angleOffset = Vector2.new((v20.angleOffset.X + v22) % 6.283185307179586, (v20.angleOffset.Y + v21) % 6.283185307179586);
        local v29 = CFrame.new(l_HumanoidRootPart_0.CFrame.p) * CFrame.fromEulerAnglesYXZ(v20.initialAngles.X + v20.angleOffset.X, v20.initialAngles.Y + v20.angleOffset.Y, 0);
        if not v23 then
            l_HumanoidRootPart_0.CFrame = v29;
        else
            v20.yAngularVelocity = 0;
            v20:cancelCurrentTween();
            v20.currentTween = l_TweenService_0:Create(l_HumanoidRootPart_0, v9, {
                CFrame = v29
            });
            v20.currentTween:Play();
        end;
        if not ((not v20.cameraManager or not v20.cameraManager:boundPanOffset()) or v20.cameraManager.isTweening) then
            v20.cameraManager:handleCameraChange(true);
        end;
        return ;
    else
        return ;
    end;
end;
v15.rotateByPixels = function(v30, v31)
    if v30.cameraManager then
        v30:rotateByRadians(v30.cameraManager:pixelOffsetToPositionOffset(Vector2.new(v31, 0)).X * 0.436);
    end;
end;
v15.setAngularVelocityByPixels = function(v32, v33)
    if v32.cameraManager then
        v32.yAngularVelocity = math.clamp(v32.cameraManager:pixelOffsetToPositionOffset(Vector2.new(v33, 0)).X * 0.436, -14.835298641951802, 14.835298641951802);
        if not (not (v32.yAngularVelocity ~= 0) or v32.renderSteppedConnection) then
            v32.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function(...)
                v32:onRenderStepped(...);
            end);
        end;
    end;
end;
v15.onRenderStepped = function(v34, v35)
    local v36 = v35 * v34.yAngularVelocity;
    v34.yAngularVelocity = v34.yAngularVelocity * math.pow(0.010000000000000009, v35);
    if math.abs(v34.yAngularVelocity) < 1.0E-4 then
        v34.yAngularVelocity = 0;
    end;
    local v37 = (((not v34.store:getState().AvatarExperience.AvatarScene.Character.PlayingSwimAnimation and 0 or -1.0471975511965976) - v34.angleOffset.X) + 3.141592653589793) % 6.283185307179586 - 3.141592653589793;
    local v38 = (2.0943951023931953 * v35) * math.sign(v37);
    local v39 = if math.abs(v37) < math.abs(v38) then v37 else v38;
    if not (v39 == 0) or v36 ~= 0 then
        v34:rotateByRadians(v36, v39);
    end;
    if v34.yAngularVelocity == 0 and math.abs(v37) < 1.0E-4 then
        v34.renderSteppedConnection:Disconnect();
        v34.renderSteppedConnection = nil;
    end;
end;
v15.update = function(v40, v41, v42, v43, v44)
    if not (not (v41.AvatarExperience.AvatarScene.Character.PlayingSwimAnimation ~= v42.AvatarExperience.AvatarScene.Character.PlayingSwimAnimation) or v40.renderSteppedConnection) then
        v40.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function(...)
            v40:onRenderStepped(...);
        end);
    end;
    if v4.getCategoryInfoFromState(v41, v43) ~= v4.getCategoryInfoFromState(v42, v44) then
        v40:resetRotation();
    end;
end;
v15.updateState = function(v45, v46, v47)
    local l_avatarRoute_0 = v45.avatarRoute;
    v45:update(v46, v47, l_avatarRoute_0, l_avatarRoute_0);
end;
v15.updateAvatarRoute = function(v49, v50, v51)
    if not (not v49.ppeCameraManager and not v49.cameraManager) then
        v49.ppeCameraManager:updateAvatarRoute(v50, v51);
        v49.cameraManager:updateAvatarRoute(v50, v51);
        local v52 = v6.isPPEScreenUsingPeekabooWidget(v50.opaque.name);
        local v53 = v6.isPPEScreenUsingPeekabooWidget(v51.opaque.name);
        if not v52 or v53 then
            if not (v52 or not v53) then
                v49.cameraManager:start();
                v49.ppeCameraManager:stop();
            end;
        else
            v49:resetRotation(true);
            v49.cameraManager:stop();
            v49.ppeCameraManager:start();
        end;
    end;
    v49.avatarRoute = v50;
    local v54 = v49.store:getState();
    v49:update(v54, v54, v50, v51);
end;
v15.onPPEPoseChanged = function(v55)
    if v55.ppeCameraManager then
        v55.ppeCameraManager:onPPEPoseChanged();
    end;
end;
v15.new = function(v56, v57, v58, v59, v60)
    local v61 = {};
    setmetatable(v61, v15);
    v61.cameraManager = nil;
    v61.ppeCameraManager = nil;
    if v60 then
        v61.cameraManager = v7.new(v56, v58, v59);
        v61.ppeCameraManager = v5.new(v56, v58);
    end;
    v61.store = v56;
    v61.avatarExperienceAnalytics = v57;
    v61.avatarRoute = v58;
    v61.events = v59;
    v61.bulkConnections = {};
    v61.camera = game.Workspace.CurrentCamera;
    v61.initialAngles = nil;
    v61.angleOffset = Vector2.new();
    v61.yAngularVelocity = 0;
    v61.currentTween = nil;
    return v61;
end;
v15.shouldUsePPECameraManager = function(v62)
    return v4.routeIsPPEStaticImagePage(v62.avatarRoute);
end;
v15.start = function(v63)
    if not v63:shouldUsePPECameraManager() then
        if v63.cameraManager then
            v63.cameraManager:start();
        end;
    elseif v63.ppeCameraManager then
        v63.ppeCameraManager:start();
    end;
    table.insert(v63.bulkConnections, v63.store.changed:connect(function(...)
        v63:updateState(...);
    end));
    table.insert(v63.bulkConnections, v63.events.rotateByRadians:Connect(function(...)
        v63:rotateByRadians(...);
    end));
    table.insert(v63.bulkConnections, v63.events.rotateByPixels:Connect(function(...)
        v63:rotateByPixels(...);
    end));
    table.insert(v63.bulkConnections, v63.events.setAngularVelocityByPixels:Connect(function(...)
        v63:setAngularVelocityByPixels(...);
    end));
    v63:resetRotation();
end;
v15.stop = function(v64)
    for _, v66 in v64.bulkConnections, nil, nil do
        v66:disconnect();
    end;
    v64.bulkConnections = {};
    if v64.renderSteppedConnection then
        v64.renderSteppedConnection:Disconnect();
        v64.renderSteppedConnection = nil;
    end;
    if v64.cameraManager then
        v64.cameraManager:stop();
    end;
    if v64.ppeCameraManager then
        v64.ppeCameraManager:stop();
    end;
    v64:cancelCurrentTween();
end;
v15.onDestroy = function(v67)
    if v67.cameraManager then
        v67.cameraManager:onDestroy();
    end;
end;
return v15;
