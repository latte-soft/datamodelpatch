local l_VRService_0 = game:GetService("VRService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v6 = require(l_RobloxGui_0.Modules.VR.Controllers.ViveController);
local v7 = require(l_RobloxGui_0.Modules.VR.Controllers.TouchController);
local v8 = require(l_RobloxGui_0.Modules.VR.Controllers.RiftController);
local v9 = require(l_RobloxGui_0.Modules.VR.Controllers.IndexController);
local v10 = require(l_RobloxGui_0.Modules.VR.VRUtil);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.Changed:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v12 = {};
v12.__index = v12;
v12.new = function(v13)
    local v14 = setmetatable({}, v12);
    v14.userCFrame = v13;
    v14.enabled = false;
    v14.currentModel = nil;
    v14.currentVRDeviceName = l_VRService_0.VRDeviceName;
    v14.modelIsInWorkspace = false;
    v14.onVRDeviceChangedConn = nil;
    v14.onCurrentCameraChangedConn = nil;
    v14.onUserCFrameEnabledChangedConn = nil;
    v14.onInputBeganConn = nil;
    v14.onInputChangedConn = nil;
    v14.onInputEndedConn = nil;
    v14.controllerModel = nil;
    return v14;
end;
v12.createControllerModel = function(v15)
    local v16 = v10.getCurrentControllerType();
    if v16 == "Vive" then
        v15.controllerModel = v6.new(v15.userCFrame);
        return ;
    elseif v16 == "Rift" then
        v15.controllerModel = v8.new(v15.userCFrame);
        return ;
    elseif v16 == "Index" then
        v15.controllerModel = v9.new(v15.userCFrame);
        return ;
    elseif v16 == "Touch" then
        v15.controllerModel = v7.new(v15.userCFrame);
        return ;
    else
        v15.controllerModel = v8.new(v15.userCFrame);
        return ;
    end;
end;
v12.setCurrentModel = function(v17)
    if v17.currentModel then
        v17:setModelInWorkspace(false);
    end;
    if not v17.controllerModel then
        v17:createControllerModel();
    end;
    v17.currentModel = v17.controllerModel;
    if v17.enabled then
        v17:setModelInWorkspace(l_VRService_0:GetUserCFrameEnabled(v17.userCFrame));
    end;
end;
v12.setModelInWorkspace = function(v18, v19)
    if v18.currentModel then
        if v19 ~= v18.modelIsInWorkspace then
            v18.modelIsInWorkspace = v19;
            if not v18.currentModel.model then
                v18.currentModel:setInWorkspace(v19);
            elseif not v18.modelIsInWorkspace then
                v18.currentModel.model.Parent = nil;
                return ;
            else
                v18.currentModel.model.Parent = workspace;
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v12.setEnabled = function(v20, v21)
    if v21 ~= v20.enabled then
        v20.enabled = v21;
        if not v20.enabled then
            if v20.onVRDeviceChangedConn then
                v20.onVRDeviceChangedConn:disconnect();
                v20.onVRDeviceChangedConn = nil;
            end;
            if v20.onCurrentCameraChangedConn then
                v20.onCurrentCameraChangedConn:disconnect();
                v20.onCurrentCameraChangedConn = nil;
            end;
            if v20.onUserCFrameEnabledChangedConn then
                v20.onUserCFrameEnabledChangedConn:disconnect();
                v20.onUserCFrameEnabledChangedConn = nil;
            end;
            if v20.onInputBeganConn then
                v20.onInputBeganConn:disconnect();
                v20.onInputBeganConn = nil;
            end;
            if v20.onInputChangedConn then
                v20.onInputChangedConn:disconnect();
                v20.onInputChangedConn = nil;
            end;
            if v20.onInputEndedConn then
                v20.onInputEndedConn:disconnect();
                v20.onInputEndedConn = nil;
            end;
            if v20.currentModel then
                v20:setModelInWorkspace(false);
            end;
        else
            v20:setCurrentModel();
            v20.onCurrentCameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
                v20:setModelInWorkspace(l_VRService_0:GetUserCFrameEnabled(v20.userCFrame));
            end);
            v20.onUserCFrameEnabledChangedConn = l_VRService_0.UserCFrameEnabled:connect(function(v22, v23)
                if v22 == v20.userCFrame then
                    v20:setModelInWorkspace(v23);
                end;
            end);
            v20.onInputBeganConn = l_UserInputService_0.InputBegan:connect(function(...)
                v20:onInputBegan(...);
            end);
            v20.onInputChangedConn = l_UserInputService_0.InputChanged:connect(function(...)
                v20:onInputChanged(...);
            end);
            v20.onInputEndedConn = l_UserInputService_0.InputEnded:connect(function(...)
                v20:onInputEnded(...);
            end);
            v20:setModelInWorkspace(l_VRService_0:GetUserCFrameEnabled(v20.userCFrame));
            return ;
        end;
    end;
end;
v12.update = function(v24, _)
    if v24.enabled then
        if v24.currentModel then
            v24.currentModel:setCFrameAndScale(v10.GetUserCFrameWorldSpace(v24.userCFrame), workspace.CurrentCamera.HeadScale);
        end;
        return ;
    else
        return ;
    end;
end;
v12.onInputBegan = function(v26, v27, _)
    if v26.enabled and v26.modelIsInWorkspace then
        if v26.currentModel then
            v26.currentModel:onInputBegan(v27);
        end;
        return ;
    else
        return ;
    end;
end;
v12.onInputChanged = function(v29, v30, _)
    if v29.enabled and v29.modelIsInWorkspace then
        if v29.currentModel then
            v29.currentModel:onInputChanged(v30);
        end;
        return ;
    else
        return ;
    end;
end;
v12.onInputEnded = function(v32, v33, _)
    if v32.currentModel then
        v32.currentModel:onInputEnded(v33);
    end;
end;
v12.getButtonPosition = function(v35, v36)
    if not (not v35.currentModel or not v35.currentModel.getButtonPart) then
        local v37 = v35.currentModel:getButtonPart(v36);
        if v37 then
            return v37.Position;
        end;
    end;
end;
return v12;
