local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v2 = require(game:GetService("CorePackages").Packages.Promise);
local v3 = CFrame.new((Vector3.new(0, 150, 0)));
local v4 = game:DefineFastInt("InspectAndBuyClusterCompositionTimeoutMs", 3000);
local v5 = {};
v5.__index = v5;
local function v9(v6)
    local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6);
    local l_l_Players_0_HumanoidModelFromDescription_1 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    l_l_Players_0_HumanoidModelFromDescription_0.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    l_l_Players_0_HumanoidModelFromDescription_1.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    l_l_Players_0_HumanoidModelFromDescription_0.HumanoidRootPart.Anchored = true;
    l_l_Players_0_HumanoidModelFromDescription_1.HumanoidRootPart.Anchored = true;
    l_l_Players_0_HumanoidModelFromDescription_0.Parent = l_RobloxReplicatedStorage_0;
    l_l_Players_0_HumanoidModelFromDescription_1.Parent = l_RobloxReplicatedStorage_0;
    l_l_Players_0_HumanoidModelFromDescription_0.HumanoidRootPart.CFrame = CFrame.new(v6);
    l_l_Players_0_HumanoidModelFromDescription_1:SetPrimaryPartCFrame(l_l_Players_0_HumanoidModelFromDescription_0.HumanoidRootPart.CFrame);
    return l_l_Players_0_HumanoidModelFromDescription_0, l_l_Players_0_HumanoidModelFromDescription_1;
end;
v5.new = function(v10, v11, v12, v13)
    local v14 = {};
    setmetatable(v14, v5);
    v14.mockApplyDescription = v13;
    local v15, v16 = v9(v11);
    v14.r6 = v15;
    v14.r15current = v16;
    v14.r15offScreen = v16:Clone();
    v14.r15offScreen.Parent = l_RobloxReplicatedStorage_0;
    v14.avatarType = v12;
    v14.worldModelRef = v10;
    v14.inProgressPromise = nil;
    v14.waitingPromise = nil;
    v14.r6Promise = nil;
    v14.destroyed = false;
    return v14;
end;
v5.setupAnimations = function(v17, v18, v19)
    v18.Parent = v17.r6;
    v19.Parent = v17.r15current;
    v19.Archivable = true;
    local v20 = v19:Clone();
    v20.Parent = v17.r15offScreen;
    v20.Archivable = false;
    v19.Archivable = false;
end;
v5.getCurrentCharacter = function(v21)
    if v21.avatarType == Enum.HumanoidRigType.R15 then
        return v21.r15current;
    else
        return v21.r6;
    end;
end;
v5.isR15 = function(v22)
    return v22.avatarType == Enum.HumanoidRigType.R15;
end;
v5.syncRotation = function(_, v24, v25)
    local _, _, _, v29, v30, v31, v32, v33, v34, v35, v36, v37 = v24.HumanoidRootPart.CFrame:components();
    local l_p_0 = v25.HumanoidRootPart.CFrame.p;
    v25.HumanoidRootPart.CFrame = CFrame.new(l_p_0.X, l_p_0.Y, l_p_0.Z, v29, v30, v31, v32, v33, v34, v35, v36, v37);
end;
local function v48(v39, v40)
    local l_v39_Accessories_0 = v39:GetAccessories(false);
    local l_v40_Accessories_0 = v40:GetAccessories(false);
    if #l_v40_Accessories_0 == 0 then
        return false;
    elseif #l_v39_Accessories_0 ~= #l_v40_Accessories_0 then
        return true;
    else
        local v43 = {};
        for _, v45 in ipairs(l_v39_Accessories_0) do
            v43[v45.AssetId] = true;
        end;
        for _, v47 in ipairs(l_v40_Accessories_0) do
            if not v43[v47.AssetId] then
                return true;
            end;
        end;
        return false;
    end;
end;
local function _(v49)
    return v49:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
end;
v5._doUpdateR6 = function(v51, v52)
    return v2.new(function(v53, _)
        v51.r6.Parent = v51.worldModelRef:getValue();
        if not v51.mockApplyDescription then
            v51.r6.Humanoid:ApplyDescription(v52);
        else
            v51.mockApplyDescription(v51.r6, v52);
        end;
        v53(v51:getCurrentCharacter());
    end);
end;
v5._doSimpleUpdateR15 = function(v55, v56)
    return v2.new(function(v57, _)
        v55.r15current.Parent = v55.worldModelRef:getValue();
        if not v55.mockApplyDescription then
            v55.r15current.Humanoid:ApplyDescription(v56);
        else
            v55.mockApplyDescription(v55.r15current, v56);
        end;
        v57(v55.r15current);
    end);
end;
v5._updateOffscreenR15 = function(v59, v60)
    return v2.new(function(v61, _)
        v59.r15offScreen.HumanoidRootPart.CFrame = v3;
        v59.r15offScreen.Parent = v59.worldModelRef:getValue();
        if not v59.mockApplyDescription then
            v59.r15offScreen.Humanoid:ApplyDescription(v60);
        else
            v59.mockApplyDescription(v59.r15offScreen, v60);
        end;
        v61(v59.r15offScreen);
    end);
end;
local function v64(v63)
    if not (v63:FindFirstChildWhichIsA("WrapLayer", true) ~= nil) then
        return v2.resolve(false);
    else
        return v2.race({
            v2.fromEvent(v63.Humanoid.ClusterCompositionFinished), 
            v2.delay(v4 * 0.001)
        }):andThen(function()
            return true;
        end);
    end;
end;
v5._completeUpdate = function(v65)
    v65.r15offScreen.HumanoidRootPart.CFrame = v65.r15current.HumanoidRootPart.CFrame;
    v65.r15current.HumanoidRootPart.CFrame = v3;
    v65.r15current.Parent = l_RobloxReplicatedStorage_0;
    local l_r15current_0 = v65.r15current;
    local l_r15offScreen_0 = v65.r15offScreen;
    v65.r15offScreen = l_r15current_0;
    v65.r15current = l_r15offScreen_0;
    return v65.r15current;
end;
v5._doUpdateR15 = function(v68, v69)
    if v48(v68.r15current.Humanoid:GetAppliedDescription(), v69) then
        v68.inProgressPromise = v68:_updateOffscreenR15(v69):andThen(v64):andThen(function()
            return v68:_completeUpdate();
        end);
        return v68.inProgressPromise;
    else
        return v68:_doSimpleUpdateR15(v69);
    end;
end;
v5.maybeUpdateCharacter = function(v70, v71)
    if v70.avatarType == Enum.HumanoidRigType.R6 then
        v70.r6Promise = v70:_doUpdateR6(v71);
        return v70.r6Promise;
    elseif v70.inProgressPromise and v70.inProgressPromise:getStatus() == v2.Status.Started then
        local l_waitingPromise_0 = v70.waitingPromise;
        v70.waitingPromise = v70.inProgressPromise:andThen(function()
            return v70:_doUpdateR15(v71);
        end);
        if l_waitingPromise_0 then
            l_waitingPromise_0:cancel();
        end;
        return v70.waitingPromise;
    else
        return v70:_doUpdateR15(v71);
    end;
end;
v5.switchAvatarType = function(v73, v74)
    if v74 == v73.avatarType then
        return v73:getCurrentCharacter();
    else
        v73:_cancelPromises();
        v73.avatarType = v74;
        local v75 = nil;
        local v76 = nil;
        if v74 == Enum.HumanoidRigType.R6 then
            v75 = v73.r6;
            v76 = v73.r15current;
        else
            v75 = v73.r15current;
            v76 = v73.r6;
        end;
        v76.Parent = l_RobloxReplicatedStorage_0;
        v76.Humanoid:UnequipTools();
        v73:syncRotation(v76, v75);
        return v75;
    end;
end;
v5.start = function(_)
end;
local function _(v78)
    if v78 then
        v78:cancel();
    end;
end;
v5._cancelPromises = function(v80)
    local l_inProgressPromise_0 = v80.inProgressPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v80.waitingPromise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    l_inProgressPromise_0 = v80.r6Promise;
    if l_inProgressPromise_0 then
        l_inProgressPromise_0:cancel();
    end;
    v80.inProgressPromise = nil;
    v80.waitingPromise = nil;
    v80.r6Promise = nil;
end;
v5.stop = function(v82)
    v82.r6.Parent = l_RobloxReplicatedStorage_0;
    v82.r15current.Parent = l_RobloxReplicatedStorage_0;
    v82.r15offScreen.Parent = l_RobloxReplicatedStorage_0;
    v82:_cancelPromises();
end;
v5.onDestroy = function(v83)
    v83:_cancelPromises();
    v83.r6:Destroy();
    v83.r15current:Destroy();
    v83.r15offScreen:Destroy();
end;
return v5;
