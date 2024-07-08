local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v5 = require(l_CorePackages_0.Packages.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarStat);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedApplyingLayeredClothing);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.FinishedApplyingLayeredClothing);
local v11 = CFrame.new(-3.3, 3, 0.2, 0, 0, -1, 0, 1, 0, 1, 0, 0);
local v12 = CFrame.new(0, 150, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0);
if l_IsVRAppBuild_0() then
    v11 = CFrame.lookAt(Vector3.new(0, 0, -6), (Vector3.new(0, 0, 0)));
    v12 = CFrame.lookAt(Vector3.new(6, 1, 100), (Vector3.new(0, 1, 100)));
end;
local v13 = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000);
local v14 = {};
v14.__index = v14;
local function v17()
    local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6);
    local l_l_Players_0_HumanoidModelFromDescription_1 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    l_l_Players_0_HumanoidModelFromDescription_0.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    l_l_Players_0_HumanoidModelFromDescription_1.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    l_l_Players_0_HumanoidModelFromDescription_0.HumanoidRootPart.Anchored = true;
    l_l_Players_0_HumanoidModelFromDescription_1.HumanoidRootPart.Anchored = true;
    l_l_Players_0_HumanoidModelFromDescription_0.Parent = l_ReplicatedStorage_0;
    l_l_Players_0_HumanoidModelFromDescription_1.Parent = l_ReplicatedStorage_0;
    l_l_Players_0_HumanoidModelFromDescription_0.HumanoidRootPart.CFrame = v12;
    l_l_Players_0_HumanoidModelFromDescription_1:SetPrimaryPartCFrame(v12);
    return l_l_Players_0_HumanoidModelFromDescription_0, l_l_Players_0_HumanoidModelFromDescription_1;
end;
v14.new = function(v18, v19, v20, v21)
    local v22 = {};
    setmetatable(v22, v14);
    v22.store = v18;
    v22.analytics = v19;
    v22.characterMover = v20;
    v22.mockApplyDescription = v21;
    local v23, v24 = v17();
    v22.r6 = v23;
    v22.r6IsOffscreen = true;
    v22.r15current = v24;
    v22.r15offScreen = v24:Clone();
    v22.r15offScreen.Parent = l_ReplicatedStorage_0;
    v22.avatarType = v7.AvatarType.R15;
    v22.inProgressPromise = nil;
    v22.waitingPromise = nil;
    v22.r6Promise = nil;
    v22.destroyed = false;
    return v22;
end;
v14.setupAnimations = function(v25, v26, v27)
    v26.Parent = v25.r6;
    v27.Parent = v25.r15current;
    v27.Archivable = true;
    local v28 = v27:Clone();
    v28.Parent = v25.r15offScreen;
    v28.Archivable = false;
    v27.Archivable = false;
end;
v14.getCurrentCharacter = function(v29)
    if v29.avatarType == v7.AvatarType.R15 then
        return v29.r15current;
    else
        return v29.r6;
    end;
end;
v14.isR15 = function(v30)
    return v30.avatarType == v7.AvatarType.R15;
end;
v14.syncRotation = function(_, v32, v33)
    local _, _, _, v37, v38, v39, v40, v41, v42, v43, v44, v45 = v32.HumanoidRootPart.CFrame:components();
    local l_p_0 = v33.HumanoidRootPart.CFrame.p;
    v33.HumanoidRootPart.CFrame = CFrame.new(l_p_0.X, l_p_0.Y, l_p_0.Z, v37, v38, v39, v40, v41, v42, v43, v44, v45);
end;
local function v56(v47, v48)
    local l_v47_Accessories_0 = v47:GetAccessories(false);
    local l_v48_Accessories_0 = v48:GetAccessories(false);
    if #l_v48_Accessories_0 == 0 then
        return false;
    elseif #l_v47_Accessories_0 ~= #l_v48_Accessories_0 then
        return true;
    else
        local v51 = {};
        for _, v53 in l_v47_Accessories_0, nil, nil do
            v51[v53.AssetId] = true;
        end;
        for _, v55 in l_v48_Accessories_0, nil, nil do
            if not v51[v55.AssetId] then
                return true;
            end;
        end;
        return false;
    end;
end;
local function _(v57)
    return v57:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
end;
v14._doUpdateR6 = function(v59, v60)
    return v5.new(function(v61, _)
        if not v59.mockApplyDescription then
            v59.r6.Humanoid:ApplyDescription(v60);
        else
            v59.mockApplyDescription(v59.r6, v60);
        end;
        if v59.r6IsOffscreen then
            v59.r6.HumanoidRootPart.CFrame = v11;
            v59.r6IsOffscreen = false;
        end;
        v61(v59:getCurrentCharacter(), v59:_stillWaitingOnLCUpdates());
    end);
end;
v14._doSimpleUpdateR15 = function(v63, v64)
    return v5.new(function(v65, _)
        local v67 = tick();
        if not v63.mockApplyDescription then
            v63.r15current.Humanoid:ApplyDescription(v64);
        else
            v63.mockApplyDescription(v63.r15current, v64);
        end;
        v8(v63.analytics, "AXCharacterStandardUpdateTimer", (tick() - v67) * 1000);
        v65(v63.r15current, v63:_stillWaitingOnLCUpdates());
    end);
end;
v14._updateOffscreenR15 = function(v68, v69)
    v68.store:dispatch(v9());
    return v5.new(function(v70, _)
        v68.r15offScreen.HumanoidRootPart.CFrame = v12;
        v68.r15offScreen.Parent = workspace;
        if not v68.mockApplyDescription then
            v68.r15offScreen.Humanoid:ApplyDescription(v69);
        else
            v68.mockApplyDescription(v68.r15offScreen, v69);
        end;
        v70(v68.r15offScreen);
    end);
end;
local function v73(v72)
    if not (v72:FindFirstChildWhichIsA("WrapLayer", true) ~= nil) then
        return v5.resolve(false);
    else
        return v5.race({
            v5.fromEvent(v72.Humanoid.ClusterCompositionFinished), 
            v5.delay(v13 * 0.001)
        }):andThen(function()
            return true;
        end);
    end;
end;
v14._stillWaitingOnLCUpdates = function(v74)
    if v74.avatarType == v7.AvatarType.R6 then
        return false;
    elseif (not (v74.avatarType == v7.AvatarType.R15) or not v74.queuedHumanoidDescription) or not v56(v74.r15current.Humanoid.HumanoidDescription, v74.queuedHumanoidDescription) then
        return false;
    else
        return true;
    end;
end;
v14._completeUpdate = function(v75, v76, v77)
    v75.r15offScreen.HumanoidRootPart.CFrame = v75.r15current.HumanoidRootPart.CFrame;
    v75.characterMover:cancelCurrentTween();
    v75.r15current.HumanoidRootPart.CFrame = v12;
    v75.r15current.Parent = l_ReplicatedStorage_0;
    local l_r15current_0 = v75.r15current;
    local l_r15offScreen_0 = v75.r15offScreen;
    v75.r15offScreen = l_r15current_0;
    v75.r15current = l_r15offScreen_0;
    v75.store:dispatch(v10());
    l_r15current_0 = (tick() - v76) * 1000;
    if not v77 then
        v8(v75.analytics, "AXCharacterStandardUpdateTimer", l_r15current_0);
    else
        v8(v75.analytics, "AXCharacterLayeredUpdateTimer", l_r15current_0);
    end;
    return v75.r15current, v75:_stillWaitingOnLCUpdates();
end;
v14._doUpdateR15 = function(v80, v81)
    if v56(v80.r15current.Humanoid:GetAppliedDescription(), v81) then
        local v82 = tick();
        v80.inProgressPromise = v80:_updateOffscreenR15(v81):andThen(v73):andThen(function(v83)
            return v80:_completeUpdate(v82, v83);
        end);
        return v80.inProgressPromise;
    else
        return v80:_doSimpleUpdateR15(v81);
    end;
end;
v14.maybeUpdateCharacter = function(v84, v85)
    if v84.avatarType == v7.AvatarType.R6 then
        v84.r6Promise = v84:_doUpdateR6(v85);
        return v84.r6Promise;
    elseif v84.inProgressPromise and v84.inProgressPromise:getStatus() == v5.Status.Started then
        if v84.waitingPromise then
            v84.waitingPromise:cancel();
        end;
        v84.queuedHumanoidDescription = v85;
        v84.waitingPromise = v84.inProgressPromise:andThen(function()
            v84.inProgressPromise = v84.waitingPromise;
            v84.waitingPromise = nil;
            v84.queuedHumanoidDescription = nil;
            return v84:_doUpdateR15(v85);
        end);
        return v84.waitingPromise;
    else
        return v84:_doUpdateR15(v85);
    end;
end;
v14.switchAvatarType = function(v86, v87)
    if v87 == v86.avatarType then
        return v86:getCurrentCharacter();
    else
        v86:_cancelPromises();
        v86.avatarType = v87;
        local v88 = nil;
        local v89 = nil;
        if v87 == v7.AvatarType.R6 then
            v88 = v86.r6;
            v89 = v86.r15current;
        else
            v88 = v86.r15current;
            v89 = v86.r6;
        end;
        v89.Parent = l_ReplicatedStorage_0;
        v89.Humanoid:UnequipTools();
        v86:syncRotation(v89, v88);
        return v88;
    end;
end;
v14.start = function(v90)
    if l_IsVRAppBuild_0() then
        v90.r15current.HumanoidRootPart.CFrame = v11;
    end;
end;
local function _(v91)
    if v91 then
        v91:cancel();
    end;
end;
v14._cancelPromises = function(v93)
    local l_inProgressPromise_0 = v93.inProgressPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v93.waitingPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v93.r6Promise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    v93.inProgressPromise = nil;
    v93.waitingPromise = nil;
    v93.r6Promise = nil;
end;
v14.stop = function(v95)
    v95.r6.Parent = l_ReplicatedStorage_0;
    v95.r15current.Parent = l_ReplicatedStorage_0;
    v95.r15offScreen.Parent = l_ReplicatedStorage_0;
    v95:_cancelPromises();
end;
v14.onDestroy = function(v96)
    v96:_cancelPromises();
    v96.r6:Destroy();
    v96.r15current:Destroy();
    v96.r15offScreen:Destroy();
end;
return v14;
