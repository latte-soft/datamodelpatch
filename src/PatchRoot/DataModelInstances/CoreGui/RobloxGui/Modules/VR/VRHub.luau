local _ = game:GetService("StarterGui");
local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_1 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v10 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v11 = require(l_RobloxGui_0.Modules.VR.LaserPointer);
local v12 = require(l_RobloxGui_0.Modules.VR.VRControllerModel);
local l_SplashScreenManager_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).SplashScreenManager;
local v14 = require(script.Parent.SafetyBubble);
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = l_HttpService_0:GenerateGUID(true);
v15.LaserPointer = nil;
v15.ControllerModelsEnabled = false;
v15.LeftControllerModel = nil;
v15.RightControllerModel = nil;
v15.ControllerModelsEnabledSetByDeveloper = true;
v15.isFPSAtTarget = l_SplashScreenManager_0.isFPSAtTarget();
v15.SafetyBubble = nil;
v15.IsFirstPerson = false;
l_StarterGui_1:RegisterSetCore("VRLaserPointerMode", function(v19)
    if v15.LaserPointer then
        if v19 and tostring(v19) then
            v15.LaserPointer:setMode(v11.Mode[tostring(v19)] or v11.Mode.Disabled);
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end);
local function v21(v20)
    if v20 ~= v15.ControllerModelsEnabled then
        v15.ControllerModelsEnabled = v20;
        if not v20 then
            if v15.LeftControllerModel then
                v15.LeftControllerModel:setEnabled(false);
            end;
            if v15.RightControllerModel then
                v15.RightControllerModel:setEnabled(false);
            end;
        else
            if not v15.LeftControllerModel then
                v15.LeftControllerModel = v12.new(Enum.UserCFrame.LeftHand);
            end;
            v15.LeftControllerModel:setEnabled(true);
            if not v15.RightControllerModel then
                v15.RightControllerModel = v12.new(Enum.UserCFrame.RightHand);
            end;
            v15.RightControllerModel:setEnabled(true);
            return ;
        end;
    end;
end;
l_StarterGui_1:RegisterSetCore("VREnableControllerModels", function(v22)
    v22 = not not v22 or false;
    v15.ControllerModelsEnabledSetByDeveloper = v22;
    v21(v22);
end);
local v23 = tick();
local function v26()
    local v24 = tick();
    local v25 = v24 - v23;
    v23 = v24;
    if v15.LaserPointer then
        v15.LaserPointer:update(v25);
    end;
    if v15.LeftControllerModel then
        v15.LeftControllerModel:update(v25);
    end;
    if v15.RightControllerModel then
        v15.RightControllerModel:update(v25);
    end;
    if v15.SafetyBubble then
        v15.SafetyBubble:update(v25);
    end;
end;
local function v27()
    if v15.LaserPointer then
        v15.LaserPointer:update(0);
    end;
    if v15.LeftControllerModel then
        v15.LeftControllerModel:update(0);
    end;
    if v15.RightControllerModel then
        v15.RightControllerModel:update(0);
    end;
end;
local v28 = nil;
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    if v28 then
        v28:disconnect();
    end;
    if workspace.CurrentCamera then
        v28 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v27);
    end;
end);
if v28 then
    v28:disconnect();
end;
if workspace.CurrentCamera then
    v28 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v27);
end;
local function v29()
    if not l_VRService_0.VREnabled then
        if v15.LaserPointer then
            v15.LaserPointer:setMode(v11.Mode.Disabled);
        end;
        l_RunService_0:UnbindFromRenderStep(v18);
        return ;
    else
        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.LockCenter;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        if not v15.LaserPointer then
            v15.LaserPointer = v11.new();
        end;
        if v15.LaserPointer then
            if not v15.isFPSAtTarget then
                v15.LaserPointer:setMode(v11.Mode.Disabled);
            else
                v15.LaserPointer:setMode(v11.Mode.Navigation);
            end;
        end;
        v21(v15.ControllerModelsEnabledSetByDeveloper);
        l_RunService_0:BindToRenderStep(v18, Enum.RenderPriority.Last.Value, v26);
        if v15.LaserPointer then
            v15.LaserPointer:setForcePointer(true);
        end;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        v15.SafetyBubble = v14.new();
        l_ContextActionService_0:BindCoreActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
        return ;
    end;
end;
local function _(v30)
    if v30 ~= "VREnabled" then
        return ;
    else
        v29();
        return ;
    end;
end;
local function v32()
    if l_VRService_0.VRSessionState == Enum.VRSessionState.Focused then
        if not (not v15.LaserPointer or not v15.LaserPointer.Mode.Disabled) then
            v15.LaserPointer:setMode(v11.Mode.Navigation);
            v21(v15.ControllerModelsEnabledSetByDeveloper);
        end;
        if not v15.ControllerModelsEnabled then
            v21(v15.ControllerModelsEnabledSetByDeveloper);
            return ;
        end;
    else
        if not (not v15.LaserPointer or not v15.LaserPointer.Mode.Navigation) then
            v15.LaserPointer:setMode(v11.Mode.Disabled);
        end;
        if v15.ControllerModelsEnabled then
            v21(false);
        end;
    end;
end;
local function v34(v33)
    if v33 == "VREnabled" then
        v29();
        return ;
    else
        if v33 == "VRSessionState" then
            v32();
        end;
        return ;
    end;
end;
v29();
l_VRService_0.Changed:connect(v34);
v15.RegisterModule = function(_, v36)
    v16[v36.ModuleName] = v36;
end;
v15.GetModule = function(_, v38)
    return v16[v38];
end;
v15.IsModuleOpened = function(_, v40)
    return v17[v40] ~= nil;
end;
v15.GetOpenedModules = function(_)
    local v42 = {};
    for _, v44 in pairs(v17) do
        table.insert(v42, v44);
    end;
    return v42;
end;
v15.ModuleOpened = v10:Create("BindableEvent")({
    Name = "VRModuleOpened"
});
v15.FireModuleOpened = function(_, v46)
    if not v16[v46] then
        error("Tried to open module that is not registered: " .. v46);
    end;
    if v17[v46] ~= v16[v46] then
        v17[v46] = v16[v46];
        v15.ModuleOpened:Fire(v46);
    end;
end;
v15.ModuleClosed = v10:Create("BindableEvent")({
    Name = "VRModuleClosed"
});
v15.FireModuleClosed = function(_, v48)
    if not v16[v48] then
        error("Tried to close module that is not registered: " .. v48);
    end;
    if v17[v48] ~= nil then
        v17[v48] = nil;
        v15.ModuleClosed:Fire(v48);
    end;
end;
v15.KeepVRTopbarOpen = function(_)
    for _, v51 in pairs(v17) do
        if v51.KeepVRTopbarOpen then
            return true;
        end;
    end;
    return false;
end;
v15.ShowHighlightedLeaveGameIcon = false;
v15.ShowHighlightedLeaveGameIconToggled = v10:Create("BindableEvent")({
    Name = "ShowHighlightedLeaveGameIconToggled"
});
v15.SetShowHighlightedLeaveGameIconToggled = function(_, v53)
    if v15.ShowHighlightedLeaveGameIcon ~= v53 then
        v15.ShowHighlightedLeaveGameIcon = v53;
        v15.ShowHighlightedLeaveGameIconToggled:Fire();
    end;
end;
v15.ShowTopBar = true;
v15.ShowMoreMenu = false;
v15.ShowTopBarChanged = v10:Create("BindableEvent")({
    Name = "ShowTopBarChanged"
});
v15.ShowMoreMenuChanged = v10:Create("BindableEvent")({
    Name = "ShowMoreMenuChanged"
});
v15.SetShowTopBar = function(_, v55)
    if v15.ShowTopBar ~= v55 then
        v15.ShowTopBar = v55;
        v15.ShowTopBarChanged:Fire();
    end;
end;
v15.SetShowMoreMenu = function(_, v57)
    if v15.ShowMoreMenu ~= v57 then
        v15.ShowMoreMenu = v57;
        v15.ShowMoreMenuChanged:Fire();
    end;
end;
v15.ToggleSafetyBubble = function(_)
    if v15.SafetyBubble then
        v15.SafetyBubble:ToggleEnabled();
    end;
end;
v15.GetControllerModel = function(_, v60)
    if v60 == Enum.UserCFrame.LeftHand then
        return v15.LeftControllerModel;
    elseif v60 == Enum.UserCFrame.RightHand then
        return v15.RightControllerModel;
    else
        return nil;
    end;
end;
v15.GetControllerButtonPosition = function(_, v62)
    return v15.LeftControllerModel and v15.LeftControllerModel:getButtonPosition(v62), v15.RightControllerModel and v15.RightControllerModel:getButtonPosition(v62);
end;
l_SplashScreenManager_0.addStatusChangeListener(function(v63)
    v15.isFPSAtTarget = v63;
    v29();
end);
return v15;
