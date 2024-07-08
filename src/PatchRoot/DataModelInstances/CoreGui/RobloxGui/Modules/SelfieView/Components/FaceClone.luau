local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Utils.ModelUtils);
local l_CharacterUtility_0 = require(l_CorePackages_0.Thumbnailing).CharacterUtility;
local l_CFrameUtility_0 = require(l_CorePackages_0.Thumbnailing).CFrameUtility;
local v4 = nil;
local v5 = nil;
local v6 = game:DefineFastFlag("SelfViewLookUpHumanoidByType", false);
local v7 = game:DefineFastFlag("DebugSelfViewPerfBenchmark", false);
local v8 = require(script.Parent.Parent.Parent.SelfieView.Flags.GetFFlagSelfieViewDontWaitForCharacter);
local l_GetFFlagSelfViewAssertFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewAssertFix;
local l_GetFFlagSelfViewVisibilityFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix;
local l_RunService_0 = game:GetService("RunService");
local v12 = Vector3.new(0, 0.105, -0.25);
local v13 = Vector3.new(0, 1.5, 0);
local v14 = 1.31;
local v15 = 0;
local v16 = nil;
local v17 = nil;
local v18 = {};
local v19 = {};
local v20 = nil;
local v21 = {};
local v22 = {};
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = Vector3.new(1.1721, 1.1811, 1.1578);
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = false;
local v38 = 0;
local v39 = {};
local v40 = {
    AnimationPlayed = "AnimationPlayed", 
    AnimationPlayedCoreScript = "AnimationPlayedCoreScript", 
    DescendantAdded = "DescendantAdded", 
    DescendantRemoving = "DescendantRemoving", 
    HeadSize = "HeadSize", 
    Color = "Color", 
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving", 
    HumanoidStateChanged = "HumanoidStateChanged"
};
local l_Players_0 = game:GetService("Players");
if not l_Players_0.LocalPlayer then
    warn("Players.LocalPlayer does not exist");
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v43 = false;
setCloneDirty = function(v44)
    if not v44 then
        v15 = 0;
        return ;
    else
        v15 = 0.35;
        return ;
    end;
end;
createCloneAnchor = function()
    if v28 ~= nil then
        v28:Destroy();
        v28 = nil;
    end;
    local l_WorldModel_0 = Instance.new("WorldModel");
    l_WorldModel_0.Parent = v25;
    v28 = l_WorldModel_0;
end;
local function _(v46)
    if v39[v46] then
        v39[v46]:Disconnect();
        v39[v46] = nil;
    end;
end;
clearCloneCharacter = function()
    if v29 then
        v29:Destroy();
        v29 = nil;
    end;
    if v28 then
        assert(v28 ~= nil);
        local l_SelfAvatar_0 = v28:FindFirstChild("SelfAvatar");
        if l_SelfAvatar_0 then
            l_SelfAvatar_0:Destroy();
        end;
        createCloneAnchor();
        return ;
    else
        warn("cloneAnchor is nil, this shouldn't be possible");
        return ;
    end;
end;
local function v50()
    stopRenderStepped();
    local l_AnimationPlayed_0 = v40.AnimationPlayed;
    if v39[l_AnimationPlayed_0] then
        v39[l_AnimationPlayed_0]:Disconnect();
        v39[l_AnimationPlayed_0] = nil;
    end;
    l_AnimationPlayed_0 = v40.AnimationPlayedCoreScript;
    if v39[l_AnimationPlayed_0] then
        v39[l_AnimationPlayed_0]:Disconnect();
        v39[l_AnimationPlayed_0] = nil;
    end;
    v20 = nil;
    v21 = {};
    clearCloneCharacter();
end;
local function v54(v51, v52)
    if v51 and v52.Animation then
        local v53 = nil;
        if not v52.Animation or not v52.Animation:IsA("Animation") then
            if not v52.Animation or not v52.Animation:IsA("TrackerStreamAnimation") then
                warn("No animation to clone in SelfView");
            else
                v4 = Instance.new("TrackerStreamAnimation");
                assert(v4 ~= nil);
                v5 = v51:LoadStreamAnimationForSelfieView_deprecated(v4, l_LocalPlayer_0);
                v53 = v5;
            end;
        end;
        if v53 then
            v53:Play();
            v53.Priority = v52.Priority;
            v18[v52] = v52.Stopped:Connect(function()
                v53:Stop(0);
                if v18[v52] then
                    v18[v52]:Disconnect();
                end;
            end);
        end;
        return ;
    else
        return ;
    end;
end;
local function v76(v55)
    stopRenderStepped();
    local l_AnimationPlayed_1 = v40.AnimationPlayed;
    if v39[l_AnimationPlayed_1] then
        v39[l_AnimationPlayed_1]:Disconnect();
        v39[l_AnimationPlayed_1] = nil;
    end;
    l_AnimationPlayed_1 = v40.AnimationPlayedCoreScript;
    if v39[l_AnimationPlayed_1] then
        v39[l_AnimationPlayed_1]:Disconnect();
        v39[l_AnimationPlayed_1] = nil;
    end;
    v20 = nil;
    v21 = {};
    clearCloneCharacter();
    if v55 then
        assert(v55 ~= nil);
        startRenderStepped(v55);
        l_AnimationPlayed_1 = v55.Character;
        if not v8() then
            if v55 and (v55.Character or v55.CharacterAdded:Wait()) then
                l_AnimationPlayed_1 = v55.Character or v55.CharacterAdded:Wait();
            else
                return ;
            end;
        elseif v55 and v55.Character then
            l_AnimationPlayed_1 = v55.Character;
            if not l_AnimationPlayed_1 then
                return ;
            end;
        else
            return ;
        end;
        assert(l_AnimationPlayed_1 ~= nil);
        local v57 = v1.getAnimator(l_AnimationPlayed_1, 10);
        clearCloneCharacter();
        local l_Archivable_0 = l_AnimationPlayed_1.Archivable;
        l_AnimationPlayed_1.Archivable = true;
        local v59 = v1.getHead(l_AnimationPlayed_1);
        if v59 then
            v29 = l_AnimationPlayed_1:Clone();
            if l_GetFFlagSelfViewAssertFix_0() and v29 == nil then
                return ;
            else
                assert(v29 ~= nil);
                v1.removeTags(v29);
                v1.resetPartOrientation(v29);
                v1.updateTransparency(v29, v19);
                v29.Name = "SelfAvatar";
                v1.removeScripts(v29);
                v1.sanitizeCharacter(v29);
                l_AnimationPlayed_1.Archivable = l_Archivable_0;
                v29.Parent = v28;
                local l_HumanoidRootPart_0 = v29:FindFirstChild("HumanoidRootPart");
                if l_HumanoidRootPart_0 then
                    l_HumanoidRootPart_0.CFrame = CFrame.new((Vector3.new(0, 0, 0)));
                    assert(v26 ~= nil);
                    if not v59 then
                        v26.CFrame = CFrame.lookAt((l_HumanoidRootPart_0.Position + l_HumanoidRootPart_0.CFrame.LookVector * 2.5) + v13, l_HumanoidRootPart_0.Position);
                        v26.CFrame = CFrame.new(v26.CFrame.Position) * CFrame.Angles(-6.981317007977319E-4, 3.141592653589793, 0);
                    else
                        local v61 = v1.getHead(v29);
                        assert(v61 ~= nil);
                        local v62, v63 = l_CharacterUtility_0.CalculateHeadExtents(v29, (l_CFrameUtility_0.CalculateTargetCFrame(v61.CFrame)));
                        v27 = Vector3.new(v63.X, v63.Y, v63.Z) - Vector3.new(v62.X, v62.Y, v62.Z);
                        assert(v27 ~= nil);
                        v14 = v61.Size.Y;
                        local v64 = math.min(v27.X, v27.Y);
                        v64 = math.min(v27.X, v27.Z);
                        local l_Model_0 = Instance.new("Model");
                        l_Model_0.Parent = v29;
                        v61 = v1.getHead(v29);
                        l_AnimationPlayed_1.Archivable = true;
                        v31 = v61:Clone();
                        assert(v31 ~= nil);
                        v31.CanCollide = false;
                        v31.Parent = l_Model_0;
                        v32 = v1.getNeck(v29, v31);
                        v33 = v31.CFrame;
                        v31:Destroy();
                        assert(v33 ~= nil);
                        v26.CFrame = CFrame.lookAt((v33.Position + v33.LookVector * (v64 * 2)) + v12, v33.Position);
                        v26.Focus = v33;
                        l_AnimationPlayed_1.Archivable = l_Archivable_0;
                        l_Model_0:Destroy();
                    end;
                end;
                if v29 == nil then
                    return ;
                else
                    local v66 = nil;
                    v66 = if not v6 then v29:FindFirstChild("Humanoid") else v29:FindFirstChildWhichIsA("Humanoid");
                    if v66 then
                        v66.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                    end;
                    v20 = v1.getAnimator(v29, 0);
                    if v20 then
                        local l_v20_PlayingAnimationTracks_0 = v20:GetPlayingAnimationTracks();
                        local l_v20_PlayingAnimationTracksCoreScript_0 = v20:GetPlayingAnimationTracksCoreScript();
                        for _, v70 in ipairs(l_v20_PlayingAnimationTracks_0) do
                            if v70 ~= nil then
                                v70:Stop(0);
                                v70:Destroy();
                            end;
                        end;
                        for _, v72 in ipairs(l_v20_PlayingAnimationTracksCoreScript_0) do
                            if v72 ~= nil then
                                v72:Stop(0);
                                v72:Destroy();
                            end;
                        end;
                        if v4 then
                            v4:Destroy();
                            v4 = nil;
                        end;
                        if v57 then
                            for _, v74 in ipairs(v57:GetPlayingAnimationTracksCoreScript()) do
                                v54(v20, v74);
                            end;
                            v39[v40.AnimationPlayedCoreScript] = v57.AnimationPlayedCoreScript:Connect(function(v75)
                                v54(v20, v75);
                            end);
                            setCloneDirty(false);
                            return ;
                        end;
                    end;
                    return ;
                end;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local _ = function(v77, v78)
    local _ = v77[v78];
end;
updateCachedHeadColor = function(v81)
    if v81 == nil then
        return ;
    else
        assert(v81 ~= nil);
        if pcall(function()
            local _ = v81.Color;
        end) then
            v23 = v81.Color;
            if pcall(function()
                local _ = v81.Size;
            end) then
                v24 = v81.Size;
            end;
        end;
        return ;
    end;
end;
local function _(v84)
    if v84 then
        if not v39[v40.HumanoidStateChanged] then
            v39[v40.HumanoidStateChanged] = v84.StateChanged:Connect(function(v85, v86)
                if v85 == Enum.HumanoidStateType.PlatformStanding and v86 == Enum.HumanoidStateType.Running then
                    setCloneDirty(true);
                end;
                if v86 == Enum.HumanoidStateType.GettingUp then
                    setCloneDirty(true);
                end;
            end);
        end;
        return ;
    else
        return ;
    end;
end;
local function v99(v88)
    if not v8() or v88 then
        v30 = v1.getHead(v88);
        updateCachedHeadColor(v30);
        local l_DescendantAdded_0 = v40.DescendantAdded;
        if v39[l_DescendantAdded_0] then
            v39[l_DescendantAdded_0]:Disconnect();
            v39[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v40.DescendantRemoving;
        if v39[l_DescendantAdded_0] then
            v39[l_DescendantAdded_0]:Disconnect();
            v39[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v40.HeadSize;
        if v39[l_DescendantAdded_0] then
            v39[l_DescendantAdded_0]:Disconnect();
            v39[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = v40.Color;
        if v39[l_DescendantAdded_0] then
            v39[l_DescendantAdded_0]:Disconnect();
            v39[l_DescendantAdded_0] = nil;
        end;
        l_DescendantAdded_0 = nil;
        l_DescendantAdded_0 = if not v6 then v88:FindFirstChild("Humanoid") else v88:FindFirstChildWhichIsA("Humanoid");
        if l_DescendantAdded_0 then
            local l_l_DescendantAdded_0_0 = l_DescendantAdded_0;
            if not (not l_l_DescendantAdded_0_0 or v39[v40.HumanoidStateChanged]) then
                v39[v40.HumanoidStateChanged] = l_l_DescendantAdded_0_0.StateChanged:Connect(function(v91, v92)
                    if v91 == Enum.HumanoidStateType.PlatformStanding and v92 == Enum.HumanoidStateType.Running then
                        setCloneDirty(true);
                    end;
                    if v92 == Enum.HumanoidStateType.GettingUp then
                        setCloneDirty(true);
                    end;
                end);
            end;
        end;
        v39[v40.DescendantAdded] = v88.DescendantAdded:Connect(function(v93)
            if v93.Name == "Head" then
                v30 = v1.getHead(v88);
                updateCachedHeadColor(v30);
            end;
            if not v6 then
                if not (not (not (v93.Name ~= "Humanoid" and not v93:IsA("Humanoid")) and v93) or v39[v40.HumanoidStateChanged]) then
                    v39[v40.HumanoidStateChanged] = v93.StateChanged:Connect(function(v94, v95)
                        if v94 == Enum.HumanoidStateType.PlatformStanding and v95 == Enum.HumanoidStateType.Running then
                            setCloneDirty(true);
                        end;
                        if v95 == Enum.HumanoidStateType.GettingUp then
                            setCloneDirty(true);
                        end;
                    end);
                end;
            elseif not (not (v93:IsA("Humanoid") and v93) or v39[v40.HumanoidStateChanged]) then
                v39[v40.HumanoidStateChanged] = v93.StateChanged:Connect(function(v96, v97)
                    if v96 == Enum.HumanoidStateType.PlatformStanding and v97 == Enum.HumanoidStateType.Running then
                        setCloneDirty(true);
                    end;
                    if v97 == Enum.HumanoidStateType.GettingUp then
                        setCloneDirty(true);
                    end;
                end);
            end;
            if v1.shouldMarkCloneDirtyForDescendant(v93) then
                setCloneDirty(true);
            end;
        end);
        v39[v40.DescendantRemoving] = v88.DescendantRemoving:Connect(function(v98)
            if not (not v98 or not v98:IsA("MeshPart") and not v98:IsA("Accessory")) then
                if v98:IsA("MeshPart") and v98.MeshId == "" then
                    return ;
                elseif v1.shouldMarkCloneDirtyForDescendant(v98) then
                    setCloneDirty(true);
                end;
            end;
        end);
        setCloneDirty(true);
        v37 = true;
        return ;
    else
        return ;
    end;
end;
local function v101()
    if v25 then
        v25:Destroy();
    end;
    v25 = Instance.new("ViewportFrame");
    v25.Position = UDim2.new(0, 0, 0, 0);
    v25.Size = UDim2.new(1, 0, 1, 0);
    v25.BackgroundTransparency = 1;
    v25.Parent = v34;
    v25.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902);
    v25.LightColor = Color3.new(1, 0.9960784314, 0.9960784314);
    v25.LightDirection = Vector3.new(9.5, -12, 7.5);
    v25.IsMirrored = true;
    local _ = Instance.new("UICorner");
    Instance.new("UICorner").Parent = v25;
    createCloneAnchor();
    v26 = Instance.new("Camera");
    assert(v26 ~= nil);
    v26.FieldOfView = 70;
    v25.CurrentCamera = v26;
    v26.Parent = v25;
end;
ReInit = function(v102)
    assert(v102.Character ~= nil);
    if (not l_GetFFlagSelfViewVisibilityFix_0() or not v36) or v36.Visible then
        v30 = v1.getHead(v102.Character);
        updateCachedHeadColor(v30);
        setCloneDirty(false);
        local l_CharacterAdded_0 = v40.CharacterAdded;
        if v39[l_CharacterAdded_0] then
            v39[l_CharacterAdded_0]:Disconnect();
            v39[l_CharacterAdded_0] = nil;
        end;
        l_CharacterAdded_0 = v40.CharacterRemoving;
        if v39[l_CharacterAdded_0] then
            v39[l_CharacterAdded_0]:Disconnect();
            v39[l_CharacterAdded_0] = nil;
        end;
        stopRenderStepped();
        l_CharacterAdded_0 = v40.AnimationPlayed;
        if v39[l_CharacterAdded_0] then
            v39[l_CharacterAdded_0]:Disconnect();
            v39[l_CharacterAdded_0] = nil;
        end;
        l_CharacterAdded_0 = v40.AnimationPlayedCoreScript;
        if v39[l_CharacterAdded_0] then
            v39[l_CharacterAdded_0]:Disconnect();
            v39[l_CharacterAdded_0] = nil;
        end;
        v20 = nil;
        v21 = {};
        clearCloneCharacter();
        v101();
        playerAdded(v102);
        startRenderStepped(v102);
        return ;
    else
        v43 = false;
        return ;
    end;
end;
local function v109(v104)
    if v17 then
        v17:Disconnect();
    end;
    if not v8() then
        ReInit(l_LocalPlayer_0);
    elseif v37 then
        ReInit(l_LocalPlayer_0);
    else
        v99(v104);
    end;
    local l_HumanoidStateChanged_0 = v40.HumanoidStateChanged;
    if v39[l_HumanoidStateChanged_0] then
        v39[l_HumanoidStateChanged_0]:Disconnect();
        v39[l_HumanoidStateChanged_0] = nil;
    end;
    l_HumanoidStateChanged_0 = nil;
    l_HumanoidStateChanged_0 = if not v6 then v104:FindFirstChild("Humanoid") else v104:FindFirstChildWhichIsA("Humanoid");
    if l_HumanoidStateChanged_0 then
        local l_l_HumanoidStateChanged_0_0 = l_HumanoidStateChanged_0;
        if l_l_HumanoidStateChanged_0_0 then
            if not v39[v40.HumanoidStateChanged] then
                v39[v40.HumanoidStateChanged] = l_l_HumanoidStateChanged_0_0.StateChanged:Connect(function(v107, v108)
                    if v107 == Enum.HumanoidStateType.PlatformStanding and v108 == Enum.HumanoidStateType.Running then
                        setCloneDirty(true);
                    end;
                    if v108 == Enum.HumanoidStateType.GettingUp then
                        setCloneDirty(true);
                    end;
                end);
            end;
        else
            return ;
        end;
    end;
end;
local function _(v110)
    if v110 then
        if v34 then
            assert(v34 ~= nil, "Wrapper Frame cannot be nil");
            assert(v110 ~= nil, "Frame name cannot be nil ");
            return v34:FindFirstAncestor(v110);
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
_clearViewportFrame = function()
    if v25 then
        v25:Destroy();
    end;
end;
local function v112()
    if v36 then
        if not v36.Visible then
            v43 = false;
        elseif v37 then
            v43 = true;
            return ;
        else
            return ;
        end;
    end;
end;
playerAdded = function(v113)
    if v113 ~= nil and v113 == l_LocalPlayer_0 then
        if v17 ~= nil then
            v17:Disconnect();
            v17 = nil;
            local l_CharacterAdded_1 = v40.CharacterAdded;
            if v39[l_CharacterAdded_1] then
                v39[l_CharacterAdded_1]:Disconnect();
                v39[l_CharacterAdded_1] = nil;
            end;
        end;
        local l_Character_0 = v113.Character;
        l_Character_0 = if not v8() then v113.Character or v113.CharacterAdded:Wait() else v113.Character;
        v17 = v113.CharacterAdded:Connect(v109);
        if not v8() then
            assert(l_Character_0 ~= nil);
            v99(l_Character_0);
        elseif l_Character_0 then
            v99(l_Character_0);
        end;
        v39[v40.CharacterAdded] = v113.CharacterAdded:Connect(v99);
        v39[v40.CharacterRemoving] = v113.CharacterRemoving:Connect(function()
            local l_DescendantAdded_1 = v40.DescendantAdded;
            if v39[l_DescendantAdded_1] then
                v39[l_DescendantAdded_1]:Disconnect();
                v39[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v40.DescendantRemoving;
            if v39[l_DescendantAdded_1] then
                v39[l_DescendantAdded_1]:Disconnect();
                v39[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v40.HeadSize;
            if v39[l_DescendantAdded_1] then
                v39[l_DescendantAdded_1]:Disconnect();
                v39[l_DescendantAdded_1] = nil;
            end;
            l_DescendantAdded_1 = v40.Color;
            if v39[l_DescendantAdded_1] then
                v39[l_DescendantAdded_1]:Disconnect();
                v39[l_DescendantAdded_1] = nil;
            end;
            v76(nil);
            l_DescendantAdded_1 = v40.CharacterRemoving;
            if v39[l_DescendantAdded_1] then
                v39[l_DescendantAdded_1]:Disconnect();
                v39[l_DescendantAdded_1] = nil;
            end;
        end);
    end;
end;
stopRenderStepped = function()
    if v16 then
        v16:Disconnect();
        v16 = nil;
    end;
end;
updateClonePartsColor = function(v117)
    if not (not pcall(function()
        local _ = v30.Color;
    end) or not v30) and v30.Color ~= v23 then
        local l_Character_1 = l_LocalPlayer_0.Character;
        if l_Character_1 then
            assert(l_Character_1 ~= nil);
            if v29 then
                assert(v29 ~= nil);
                for _, v121 in pairs(l_Character_1:GetChildren()) do
                    if v121:IsA("MeshPart") then
                        local l_v29_FirstChild_0 = v29:FindFirstChild(v121.Name);
                        if not (((not l_v29_FirstChild_0 or not l_v29_FirstChild_0:IsA("MeshPart")) or not l_v29_FirstChild_0.Color) or not v121.Color) then
                            l_v29_FirstChild_0.Color = v121.Color;
                        end;
                    end;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v23 = v117;
end;
startRenderStepped = function(v123)
    stopRenderStepped();
    v16 = (if not v7 then l_RunService_0.RenderStepped else l_RunService_0.Heartbeat):Connect(function(v124)
        if v7 then
            debug.profilebegin("faceclone");
        end;
        if (not l_GetFFlagSelfViewVisibilityFix_0() or not v29) or v43 then
            if l_LocalPlayer_0 then
                local l_Character_2 = l_LocalPlayer_0.Character;
                if not l_Character_2 or l_Character_2.Parent == nil then
                    return ;
                else
                    assert(l_Character_2 ~= nil);
                    if not (v30 ~= nil) or v30.Parent ~= l_Character_2 then
                        v30 = v1.getHead(l_Character_2);
                    end;
                    if v30 then
                        local v126 = v1.getAnimator(l_Character_2, 0);
                        if v20 ~= nil and v126 ~= nil then
                            assert(v20 ~= nil);
                            for _, v128 in pairs((v20:GetPlayingAnimationTracks())) do
                                if v128 ~= nil then
                                    v128:Stop(0);
                                end;
                            end;
                            local l_v126_PlayingAnimationTracks_0 = v126:GetPlayingAnimationTracks();
                            local v130 = nil;
                            v22 = {};
                            for _, v132 in ipairs(l_v126_PlayingAnimationTracks_0) do
                                v130 = v132.Animation;
                                if not (not v130 or not v130:IsA("Animation")) then
                                    if not l_GetFFlagSelfViewAssertFix_0() then
                                        v22[v130.AnimationId] = v132;
                                        if not v21[v130.AnimationId] then
                                            v21[v130.AnimationId] = v20:LoadAnimation(v130);
                                        end;
                                        local v133 = v21[v130.AnimationId];
                                        v133:Play();
                                        v133.TimePosition = v132.TimePosition;
                                        v133.Priority = v132.Priority;
                                        v133:AdjustWeight(v132.WeightCurrent, 0.1);
                                    elseif v130.AnimationId ~= "" then
                                        v22[v130.AnimationId] = v132;
                                        if not v21[v130.AnimationId] then
                                            v21[v130.AnimationId] = v20:LoadAnimation(v130);
                                        end;
                                        local v134 = v21[v130.AnimationId];
                                        v134:Play();
                                        v134.TimePosition = v132.TimePosition;
                                        v134.Priority = v132.Priority;
                                        v134:AdjustWeight(v132.WeightCurrent, 0.1);
                                    end;
                                end;
                            end;
                            for v135 in v21, nil, nil do
                                local v136 = v21[v135];
                                if v136 then
                                    v130 = v136.Animation;
                                    if not (not v130 or v22[v130.AnimationId]) then
                                        if v21[v130.AnimationId] ~= nil then
                                            v21[v130.AnimationId]:Stop(0);
                                        end;
                                        v21[v130.AnimationId] = nil;
                                    end;
                                end;
                            end;
                            for _, v138 in ipairs(v126:GetPlayingAnimationTracksCoreScript()) do
                                for _, v140 in pairs((v20:GetPlayingAnimationTracksCoreScript())) do
                                    if v140.Animation:IsA("TrackerStreamAnimation") then
                                        v140.Priority = v138.Priority;
                                        v140:AdjustWeight(v138.WeightCurrent, 0);
                                    end;
                                end;
                            end;
                        end;
                    end;
                    v38 = v38 + 1;
                    if v38 == 1 then
                        v38 = 0;
                        if v29 then
                            if not v31 then
                                v31 = v1.getHead(v29);
                                if v31 then
                                    v32 = v1.getNeck(v29, v31);
                                end;
                            end;
                            if v31 then
                                v33 = v31.CFrame;
                            end;
                        end;
                        if not (not v26 or not v31) then
                            local l_Position_0 = v31.Position;
                            local l_Position_1 = v31.Position;
                            local l_CFrame_0 = v31.CFrame;
                            if v32 then
                                local l_Part0_0 = v32.Part0;
                                local _ = v32.Part1;
                                local l_C0_0 = v32.C0;
                                local l_C1_0 = v32.C1;
                                local l_Transform_0 = v32.Transform;
                                if not (not l_Part0_0 or not l_C0_0) then
                                    l_CFrame_0 = ((l_Part0_0.CFrame * l_C0_0) * l_Transform_0) * l_C1_0:Inverse();
                                    l_Position_1 = Vector3.new(l_CFrame_0.Position.X * 0.25, ((v31.CFrame.Position.Y + l_CFrame_0.Position.Y) + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                    l_Position_0 = Vector3.new(l_CFrame_0.Position.X * 0.6, ((v31.CFrame.Position.Y + l_CFrame_0.Position.Y) + l_CFrame_0.Position.Y * 0.75) * 0.33333, l_CFrame_0.Position.Z);
                                end;
                            end;
                            if not v27 then
                                warn("boundsSize is nil, this shouldn't be possible");
                            end;
                            assert(v27 ~= nil);
                            v26.CFrame = CFrame.lookAt(l_Position_0 + Vector3.new(0, v14 * 0.25, -(v27.Z + 1)), l_Position_1);
                            v26.Focus = v31.CFrame;
                        end;
                    end;
                    if v30 then
                        if v30.Size ~= v24 then
                            v24 = v30.Size;
                            setCloneDirty(true);
                        end;
                        if pcall(function()
                            local _ = v30.Color;
                        end) and v30.Color ~= v23 then
                            updateClonePartsColor(v30.Color);
                        end;
                    end;
                end;
            end;
            if v15 > 0 then
                v15 = v15 - v124;
                if v15 <= 0 then
                    v76(v123);
                    v15 = 0;
                end;
            end;
            if v7 then
                debug.profileend();
            end;
            return ;
        else
            if v20 ~= nil then
                for _, v151 in pairs((v20:GetPlayingAnimationTracks())) do
                    if v151 ~= nil then
                        v151:Stop(0);
                    end;
                end;
            end;
            return ;
        end;
    end);
end;
return function(v152, v153, v154)
    if not v153 then
        return ;
    else
        v34 = v153;
        if not (not l_GetFFlagSelfViewVisibilityFix_0() or not v154) then
            v35 = v154;
            local l_v35_0 = v35;
            local v156;
            if l_v35_0 then
                if v34 then
                    assert(v34 ~= nil, "Wrapper Frame cannot be nil");
                    assert(l_v35_0 ~= nil, "Frame name cannot be nil ");
                    v156 = v34:FindFirstAncestor(l_v35_0);
                else
                    v156 = nil;
                end;
            else
                v156 = nil;
            end;
            v36 = v156;
            if v36 then
                v36:GetPropertyChangedSignal("Visible"):Connect(v112);
            end;
        end;
        v101();
        playerAdded(v152);
        l_Players_0.PlayerAdded:Connect(playerAdded);
        l_Players_0.PlayerRemoving:Connect(function(v157)
            if v157 == l_LocalPlayer_0 then
                local l_HumanoidStateChanged_1 = v40.HumanoidStateChanged;
                if v39[l_HumanoidStateChanged_1] then
                    v39[l_HumanoidStateChanged_1]:Disconnect();
                    v39[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v40.CharacterAdded;
                if v39[l_HumanoidStateChanged_1] then
                    v39[l_HumanoidStateChanged_1]:Disconnect();
                    v39[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v40.CharacterRemoving;
                if v39[l_HumanoidStateChanged_1] then
                    v39[l_HumanoidStateChanged_1]:Disconnect();
                    v39[l_HumanoidStateChanged_1] = nil;
                end;
                stopRenderStepped();
                l_HumanoidStateChanged_1 = v40.AnimationPlayed;
                if v39[l_HumanoidStateChanged_1] then
                    v39[l_HumanoidStateChanged_1]:Disconnect();
                    v39[l_HumanoidStateChanged_1] = nil;
                end;
                l_HumanoidStateChanged_1 = v40.AnimationPlayedCoreScript;
                if v39[l_HumanoidStateChanged_1] then
                    v39[l_HumanoidStateChanged_1]:Disconnect();
                    v39[l_HumanoidStateChanged_1] = nil;
                end;
                v20 = nil;
                v21 = {};
                clearCloneCharacter();
            end;
        end);
        startRenderStepped(v152);
        return v50;
    end;
end;
