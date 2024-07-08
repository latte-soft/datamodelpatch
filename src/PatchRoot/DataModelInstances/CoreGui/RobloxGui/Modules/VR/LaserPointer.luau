local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = game:GetService("ContextActionService");
local _ = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local v7 = require(l_RobloxGui_0.Modules.Settings.Utility);
local _ = game:GetService("CorePackages");
local v9 = require(l_RobloxGui_0.Modules.VR.VRUtil);
require(l_RobloxGui_0.Modules.VR.Panel3D);
local v10 = game:DefineFastFlag("VRFixCursorJitterLua", false);
local v11 = game:DefineFastFlag("VRLaserPointerOptimization", false);
local v12 = game:DefineFastFlag("EnableUserInputCFrameLogging", false);
local v13 = game:DefineFastFlag("EnableUpdateduserInputCFrameUpdate", false);
local l_ContextActionService_1 = game:GetService("ContextActionService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.Changed:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local function _(v16)
    return Color3.new(v16.r ^ 2.2, v16.g ^ 2.2, v16.b ^ 2.2);
end;
local function _(v18)
    return Color3.new(v18.r ^ 0.45454545454545453, v18.g ^ 0.45454545454545453, v18.b ^ 0.45454545454545453);
end;
local function v26(...)
    local v20 = {
        ...
    };
    local l_CoreEffectFolder_0 = l_GuiService_0.CoreEffectFolder;
    if l_CoreEffectFolder_0 then
        for _, v23 in pairs(v20) do
            v23.Parent = l_CoreEffectFolder_0;
            v23.CanTouch = false;
            v23.CanCollide = false;
            v23.CanQuery = false;
        end;
        return ;
    else
        coroutine.wrap(function()
            while not not (l_GuiService_0.Changed:wait() ~= "CoreEffectFolder" and l_GuiService_0.CoreEffectFolder == nil) do
            end;
            for _, v25 in pairs(v20) do
                v25.Parent = l_CoreEffectFolder_0;
                v25.CanTouch = false;
                v25.CanCollide = false;
                v25.CanQuery = false;
            end;
        end)();
        return ;
    end;
end;
local function v29(...)
    for _, v28 in pairs({
        ...
    }) do
        v28.Parent = nil;
    end;
end;
local function v33()
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 then
        for _, v32 in pairs(l_Character_0:GetChildren()) do
            if v32:IsA("Humanoid") then
                return v32;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function _(v34, v35)
    local v36 = v34 ^ v35;
    if v36 ~= v36 then
        v36 = math.abs(v34) ^ v35;
    end;
    return v36;
end;
local v38 = Vector3.new(0.5, 0.5, 0);
local v39 = {
    Disabled = 0, 
    Pointer = 1, 
    Navigation = 2, 
    Hidden = 3, 
    DualPointer = 4
};
local v40 = {
    Right = 0, 
    Left = 1
};
local v41 = {
    MODE_ENABLED = true
};
local v42 = Color3.fromRGB(0, 162, 255);
v41.ARC_COLOR_GOOD = Color3.new(v42.r ^ 2.2, v42.g ^ 2.2, v42.b ^ 2.2);
v42 = Color3.fromRGB(253, 68, 72);
v41.ARC_COLOR_BAD = Color3.new(v42.r ^ 2.2, v42.g ^ 2.2, v42.b ^ 2.2);
v41.ARC_THICKNESS = 0.0125;
v41.PLOP_GOOD = "rbxasset://textures/ui/VR/VRPointerDiscBlue.png";
v41.PLOP_BAD = "rbxasset://textures/ui/VR/VRPointerDiscRed.png";
v41.PLOP_BALL_COLOR_GOOD = BrickColor.new("Bright green");
v41.PLOP_BALL_COLOR_BAD = BrickColor.new("Bright red");
v41.PLOP_BALL_SIZE = 0.5;
v41.PLOP_SIZE = 2;
v41.PLOP_PULSE_MIN_SIZE = 0;
v41.PLOP_PULSE_MAX_SIZE = 2;
v41.MAX_VALID_DISTANCE = 100;
v41.BUTTON_DOWN_THRESHOLD = 0.95;
v41.BUTTON_UP_THRESHOLD = 0.5;
v41.MIN_VELOCITY = 10;
v41.RANGE_T_EXP = 2;
v41.G = 10;
v41.PULSE_DURATION = 0.8;
v41.PULSE_PERIOD = 1;
v41.PULSE_EXP = 2;
v41.PULSE_SIZE_0 = 0.25;
v41.PULSE_SIZE_1 = 2;
v41.BALL_WAVE_PERIOD = 2;
v41.BALL_WAVE_AMPLITUDE = 0.5;
v41.BALL_WAVE_START = 0.25;
v41.BALL_WAVE_EXP = 0.8;
v41.FLOOR_OFFSET = 4.5;
v41.FADE_OUT_DURATION = 0.125;
v41.FADE_IN_DURATION = 0.125;
v41.TRANSITION_DURATION = 0.25;
v41.TRANSITION_FUNC = v7:GetEaseInOutQuad();
local v43 = {
    MODE_ENABLED = true, 
    ARC_COLOR_GOOD = v41.ARC_COLOR_GOOD, 
    ARC_COLOR_BAD = v41.ARC_COLOR_BAD
};
local v44 = Color3.fromRGB(0, 255, 162);
v43.ARC_COLOR_HIT = Color3.new(v44.r ^ 2.2, v44.g ^ 2.2, v44.b ^ 2.2);
v43.ARC_THICKNESS = 0.01;
v43.MAX_DISTANCE = 50;
v43.G = 0;
v43.SWITCH_AIM_THRESHOLD = 0.2617993877991494;
v43.TRANSITION_DURATION = 0.075;
v43.TRANSITION_FUNC = v7:GetEaseInOutQuad();
v42 = Vector2.new(0, 0);
v44 = Vector2.new(1, 1);
local v45 = Vector3.new(0, 0, 0);
local v46 = Vector3.new(1, 1, 1);
local v47 = Vector3.new(1, 0, 1);
local v48 = Vector3.new(0.2, 0.2, 0.2);
local _ = CFrame.new();
local _ = {
    [Enum.HumanoidStateType.Running] = true, 
    [Enum.HumanoidStateType.RunningNoPhysics] = true, 
    [Enum.HumanoidStateType.None] = true
};
local v51 = {};
v51.__index = v51;
v51.Mode = v39;
v51.new = function(_)
    local v53 = setmetatable({}, v51);
    v53.laserMaxDistance = l_VRService_0.LaserDistance;
    v53.mode = v39.Disabled;
    v53.lastMode = v53.mode;
    v53.laserHand = v40.Right;
    v53.inputUserCFrame = Enum.UserCFrame.RightHand;
    v53.equippedTool = false;
    v53.lastLaserModeHit = tick();
    v53.guiMenuIsOpen = false;
    v53.externalForcePointer = false;
    v53.forceDotActive = true;
    v53.navHitPoint = v45;
    v53.navHitNormal = Vector3.new(0, 1, 0);
    v53.navHitPart = nil;
    v53.navigationIsValid = false;
    v53.lastNavigationValidityChangeTime = tick();
    v53.plopBallBounceStart = tick();
    v53.buttonPressStart = 0;
    v53.showPlopBallOnPointer = false;
    v53.parabola = v7:Create("ParabolaAdornment")({
        Name = "LaserPointerParabola", 
        Parent = l_CoreGui_0, 
        A = -1, 
        B = 2, 
        C = 0, 
        Color3 = nil, 
        Thickness = v41.ARC_THICKNESS, 
        Visible = false
    });
    v53.originPart = v7:Create("Part")({
        Name = "LaserPointerOrigin", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.SmoothPlastic, 
        Size = v48, 
        Transparency = 1
    });
    v53.parabola.Adornee = v53.originPart;
    v53.parabolaOffhand = v7:Create("ParabolaAdornment")({
        Name = "LaserPointerparabolaOffhand", 
        Parent = l_CoreGui_0, 
        A = 0, 
        B = 1.0E-6, 
        C = 0, 
        Color3 = Color3.new(1, 1, 1), 
        Transparency = 0.5, 
        Thickness = v41.ARC_THICKNESS, 
        Visible = false
    });
    v53.originPartOffhand = v7:Create("Part")({
        Name = "LaserPointerOriginOffhand", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.SmoothPlastic, 
        Size = v48, 
        Transparency = 1
    });
    v53.parabolaOffhand.Adornee = v53.originPartOffhand;
    v53.plopPart = v7:Create("Part")({
        Name = "LaserPointerTeleportPlop", 
        Anchored = true, 
        CanCollide = false, 
        Size = v48, 
        Transparency = 1
    });
    v53.plopBall = v7:Create("Part")({
        Name = "LaserPointerTeleportPlopBall", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.Neon, 
        BrickColor = v41.PLOP_BALL_COLOR_GOOD, 
        Shape = Enum.PartType.Ball, 
        Size = v46 * v41.PLOP_BALL_SIZE
    });
    v53.plopAdorn = v7:Create("ImageHandleAdornment")({
        Name = "LaserPointerTeleportPlopAdorn", 
        Parent = v53.plopPart, 
        Adornee = v53.plopPart, 
        Size = v44 * v41.PLOP_SIZE, 
        Image = v41.PLOP_GOOD
    });
    v53.plopAdornPulse = v7:Create("ImageHandleAdornment")({
        Name = "LaserPointerTeleportPlopAdornPulse", 
        Parent = v53.plopPart, 
        Adornee = v53.plopPart, 
        Size = v42, 
        Image = v41.PLOP_GOOD, 
        Transparency = 0.5
    });
    v53.cursorPart = v7:Create("Part")({
        Name = "Cursor", 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false, 
        Anchored = true, 
        Transparency = 1
    });
    v53.cursorSurfaceGui = v7:Create("SurfaceGui")({
        Name = "CursorSurfaceGui", 
        Active = false, 
        AlwaysOnTop = true, 
        Enabled = false, 
        ZOffset = 10, 
        Parent = v53.cursorPart
    });
    v53.cursorImage = v7:Create("ImageLabel")({
        Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
        ImageColor3 = Color3.new(0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v53.cursorSurfaceGui, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    });
    l_GuiService_0.MenuOpened:connect(function()
        v53.guiMenuIsOpen = true;
    end);
    l_GuiService_0.MenuClosed:connect(function()
        v53.guiMenuIsOpen = false;
    end);
    v53.inputUserCFrame = l_VRService_0.GuiInputUserCFrame;
    l_VRService_0.Changed:connect(function(v54)
        if v54 == "GuiInputUserCFrame" then
            v53.inputUserCFrame = l_VRService_0.GuiInputUserCFrame;
            return ;
        elseif v10 and (not (v54 ~= "PointerHitCFrame") or v54 == "DidPointerHit") then
            v53:cursorInputsChanged();
            return ;
        else
            if (v13 and v54 == "VRSessionState") and l_VRService_0.VRSessionState == Enum.VRSessionState.Focused then
                v53:updateInputUserCFrame();
            end;
            return ;
        end;
    end);
    l_VRService_0.LaserPointerTriggered:connect(function(v55)
        if (not (((v55.KeyCode ~= Enum.KeyCode.ButtonR1 and v55.KeyCode ~= Enum.KeyCode.ButtonR2) and v55.KeyCode ~= Enum.KeyCode.ButtonR3) and v55.KeyCode ~= Enum.KeyCode.ButtonA) or v55.KeyCode == Enum.KeyCode.ButtonB) and v53.laserHand ~= v40.Right then
            v53.laserHand = v40.Right;
            v53:updateInputUserCFrame();
            return ;
        else
            if (not (((v55.KeyCode ~= Enum.KeyCode.ButtonL1 and v55.KeyCode ~= Enum.KeyCode.ButtonL2) and v55.KeyCode ~= Enum.KeyCode.ButtonL3) and v55.KeyCode ~= Enum.KeyCode.ButtonX) or v55.KeyCode == Enum.KeyCode.ButtonY) and v53.laserHand ~= v40.Left then
                v53.laserHand = v40.Left;
                v53:updateInputUserCFrame();
            end;
            return ;
        end;
    end);
    if v13 then
        l_VRService_0.UserCFrameEnabled:Connect(function(_, _)
            v53:updateInputUserCFrame();
        end);
    end;
    v53:onModeChanged(v53.mode);
    v53:updateInputUserCFrame();
    return v53;
end;
v51.hasAnyHandController = function()
    return l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
v51.getModeName = function(v58)
    for v59, v60 in pairs(v39) do
        if v58 == v60 then
            return v59;
        end;
    end;
    return "unknown";
end;
v51.updateInputUserCFrame = function(v61)
    local v62 = nil;
    if v12 then
        v62 = l_VRService_0.GuiInputUserCFrame;
    end;
    if l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and v61.laserHand == v40.Right then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.RightHand;
    elseif l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) and v61.laserHand == v40.Left then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.LeftHand;
    elseif not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
        if not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
            l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.Head;
        else
            l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.LeftHand;
        end;
    else
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.RightHand;
    end;
    if v12 and v62 ~= l_VRService_0.GuiInputUserCFrame then
        print("Updated GuiInputUserCFrame is: " .. tostring(l_VRService_0.GuiInputUserCFrame));
    end;
end;
v51.onModeChanged = function(v63, v64)
    v63:updateInputUserCFrame();
    if not (v64 ~= v39.Disabled) or v64 == v39.Hidden then
        v26(v63.originPart, v63.cursorPart);
        v29(v63.plopPart, v63.plopBall, v63.originPartOffhand);
        v63.forceDotActive = true;
        v63.parabola.Visible = false;
        v63.parabolaOffhand.Visible = false;
        v63:setNavigationActionEnabled(false);
        return ;
    elseif v64 == v39.Pointer then
        v26(v63.originPart, v63.cursorPart);
        v29(v63.plopPart, v63.plopBall, v63.originPartOffhand);
        v63.parabola.Visible = true;
        v63.parabolaOffhand.Visible = false;
        v63:setNavigationActionEnabled(false);
        v63.forceDotActive = false;
        return ;
    elseif v64 == v39.DualPointer then
        v26(v63.originPart, v63.originPartOffhand, v63.cursorPart);
        v29(v63.plopPart, v63.plopBall);
        v63.parabola.Visible = true;
        v63.parabolaOffhand.Visible = true;
        v63:setNavigationActionEnabled(false);
        v63.forceDotActive = false;
        return ;
    else
        if v64 == v39.Navigation then
            v26(v63.originPart, v63.plopPart, v63.plopBall, v63.cursorPart);
            v63.parabola.Visible = true;
            v63:setNavigationActionEnabled(true);
            v63.forceDotActive = false;
        end;
        return ;
    end;
end;
v51.setMode = function(v65, v66)
    if v11 and v66 == v39.Navigation then
        v66 = v39.Pointer;
    end;
    if v66 == v65.mode then
        return ;
    else
        local l_mode_0 = v65.mode;
        v65.mode = v66;
        v65.lastMode = l_mode_0;
        v65:onModeChanged(v66);
        return ;
    end;
end;
v51.setEnableAmbidexterousPointer = function(_, _)
end;
v51.getMode = function(v70)
    return v70.mode;
end;
v51.calculateLaunchVelocity = function(_, v72, v73, v74)
    return -(math.sqrt(v72 / 0.7071067811865476) * v73) / math.sqrt((2 * v74) * 0.7071067811865476 + (2 * v73) * 0.7071067811865476);
end;
v51.isHeadMounted = function(_)
    return l_VRService_0.GuiInputUserCFrame == Enum.UserCFrame.Head;
end;
v51.shouldForcePointer = function(v76)
    return v76.externalForcePointer or v76.guiMenuIsOpen;
end;
v51.setForcePointer = function(v77, v78)
    v77.externalForcePointer = v78;
end;
v51.getNavigationOrigin = function(_)
    local v80 = v33();
    if v80 then
        local l_Torso_0 = v80.Torso;
        if l_Torso_0 then
            local l_HipHeight_0 = v80.HipHeight;
            if v80.RigType == Enum.HumanoidRigType.R6 then
                l_HipHeight_0 = 2;
            end;
            return l_Torso_0.Position + Vector3.new(0, -(l_Torso_0.Size.Y / 2) - l_HipHeight_0, 0);
        else
            return ;
        end;
    else
        return ;
    end;
end;
v51.horzDistanceFromCharacter = function(_, v84)
    local l_Character_1 = l_LocalPlayer_0.Character;
    if l_Character_1 then
        local l_HumanoidRootPart_0 = l_Character_1:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 then
            return ((l_HumanoidRootPart_0:GetRenderCFrame().p - v84) * v47).magnitude;
        else
            return math.huge;
        end;
    else
        return math.huge;
    end;
end;
v51.onNavigateAction = function(v87, _, v89, _)
    if v89 == Enum.UserInputState.Begin then
        l_VRService_0:RequestNavigation(CFrame.new(v87.navHitPoint, v87.navHitPoint + v87.navHitNormal) * CFrame.Angles(1.5707963267948966, 0, 0), v87.inputUserCFrame);
    end;
end;
v51.setNavigationActionEnabled = function(v91, v92)
    if not v92 then
        l_ContextActionService_1:UnbindCoreAction("LaserPointerNavigate");
        return ;
    else
        l_ContextActionService_1:BindCoreAction("LaserPointerNavigate", function(...)
            v91:onNavigateAction(...);
        end, false, Enum.KeyCode.ButtonA);
        return ;
    end;
end;
v51.setArcLaunchParams = function(v93, v94, v95, v96, v97)
    local v98 = math.cos(v94) * v95;
    local v99 = math.sin(v94) * v95;
    if v98 == 0 then
        v98 = 1.0E-6;
    end;
    v93.parabola.A = -(0.5 * v96) * (1 / v98 ^ 2);
    v93.parabola.B = v99 / v98;
    v93.parabola.C = 0;
    v93.parabola.Range = v97 * 1.5;
end;
v51.renderAsParabola = function(v100, v101, v102)
    v100.originPart.CFrame = CFrame.new(v101, v101 + v102 * v47) * CFrame.Angles(0, 1.5707963267948966, 0);
end;
v51.renderAsLaser = function(v103, v104, v105)
    v103.originPart.CFrame = CFrame.new(v104, v105) * CFrame.Angles(0, 1.5707963267948966, 0);
    v103.parabola.A = 0;
    v103.parabola.B = 1.0E-6;
    v103.parabola.C = 0;
    v103.parabola.Range = (v105 - v104).magnitude;
end;
v51.renderOffhandLaser = function(v106, v107, v108)
    v106.originPartOffhand.CFrame = CFrame.new(v107, v108) * CFrame.Angles(0, 1.5707963267948966, 0);
    v106.parabolaOffhand.Range = (v108 - v107).magnitude;
end;
v51.getLaserHit = function(v109, v110, v111, v112)
    local l_workspace_PartOnRayWithIgnoreList_0, v114, v115, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(v110, v111 * v109.laserMaxDistance), v112);
    return l_workspace_PartOnRayWithIgnoreList_0, v114, v115, (v114 - v110).magnitude / math.max(v109.laserMaxDistance, 0.1);
end;
v51.canNavigateTo = function(_, v118, _, v120)
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Character_2 then
        if l_Character_2:FindFirstChild("HumanoidRootPart") then
            if v118 then
                if v120.Y < -1.0E-6 then
                    return false;
                else
                    return true;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v51.checkHeadMountedMode = function(v122, v123)
    if not v122:shouldForcePointer() then
        local l_CoreGuiFolder_0 = l_GuiService_0.CoreGuiFolder;
        if not v123 or not v123:IsDescendantOf(l_CoreGuiFolder_0) then
            v122:setMode(v39.Navigation);
            return ;
        else
            v122:setMode(v39.Pointer);
            return ;
        end;
    else
        v122:setMode(v39.Pointer);
        return ;
    end;
end;
v51.setNavigationValidState = function(v125, v126)
    if v126 == v125.navigationIsValid then
        return ;
    else
        v125.navigationIsValid = v126;
        v125.lastNavigationValidityChangeTime = tick();
        if not v126 then
            v125.parabola.Color3 = v41.ARC_COLOR_BAD;
            v125.plopAdorn.Visible = false;
            v125.plopAdorn.Image = v41.PLOP_BAD;
            v125.plopAdornPulse.Visible = false;
            v125.plopAdornPulse.Image = v41.PLOP_BAD;
            v125.plopBall.BrickColor = v41.PLOP_BALL_COLOR_BAD;
            return ;
        else
            v125.plopBallBounceStart = tick();
            v125.parabola.Color3 = v41.ARC_COLOR_GOOD;
            v125.plopAdorn.Visible = true;
            v125.plopAdorn.Image = v41.PLOP_GOOD;
            v125.plopAdornPulse.Visible = true;
            v125.plopAdornPulse.Image = v41.PLOP_GOOD;
            v125.plopBall.BrickColor = v41.PLOP_BALL_COLOR_GOOD;
            return ;
        end;
    end;
end;
v51.updateNavPlop = function(v127, v128, v129)
    local v130 = tick() - v127.plopBallBounceStart;
    local v131 = CFrame.new(v128, v128 + v129);
    local v132 = 0;
    if v127.navigationIsValid then
        local v133 = math.sin(((v130 * 2) * 3.141592653589793) / v41.BALL_WAVE_PERIOD);
        local l_BALL_WAVE_EXP_0 = v41.BALL_WAVE_EXP;
        local v135 = v133 ^ l_BALL_WAVE_EXP_0;
        if v135 ~= v135 then
            v135 = math.abs(v133) ^ l_BALL_WAVE_EXP_0;
        end;
        v132 = v41.BALL_WAVE_START + v135 * v41.BALL_WAVE_AMPLITUDE;
    end;
    v127.plopPart.CFrame = v131;
    v127.plopBall.CFrame = v131 * CFrame.new(0, 0, -v132);
    local v136 = v130 % v41.PULSE_PERIOD;
    if v136 > 0 then
        local v137 = v136 / v41.PULSE_DURATION;
        if v137 < 1 then
            v127.plopAdornPulse.Visible = true;
            local l_plopAdornPulse_0 = v127.plopAdornPulse;
            local l_v44_0 = v44;
            local l_PULSE_SIZE_0_0 = v41.PULSE_SIZE_0;
            local l_PULSE_EXP_0 = v41.PULSE_EXP;
            local v142 = v137 ^ l_PULSE_EXP_0;
            if v142 ~= v142 then
                v142 = math.abs(v137) ^ l_PULSE_EXP_0;
            end;
            l_plopAdornPulse_0.Size = l_v44_0 * (l_PULSE_SIZE_0_0 + v142 * (v41.PULSE_SIZE_1 - v41.PULSE_SIZE_0));
            v127.plopAdornPulse.Transparency = 0.5 + v137 * 0.5;
            return ;
        else
            v127.plopAdornPulse.Visible = false;
            v127.plopAdornPulse.Size = v42;
            v127.pulseStartTime = tick() + v41.PULSE_PERIOD;
        end;
    end;
end;
v51.updateNavigationMode = function(v143, v144, v145, v146)
    v143.navHitPoint = v144;
    v143.navHitNormal = v145;
    v143.navHitPart = v146;
    v143:updateNavPlop(v144, v145);
    v143:setNavigationValidState(v143:canNavigateTo(v143.navHitPart, v143.navHitPoint, v143.navHitNormal));
end;
v51.showHitBallOnLaserPointer = function(v147, v148)
    if not v148 then
        if v147.showPlopBallOnPointer then
            v29(v147.plopBall);
            v147.showPlopBallOnPointer = false;
        end;
    elseif not v147.showPlopBallOnPointer then
        v147.showPlopBallOnPointer = true;
        v26(v147.plopBall);
        return ;
    end;
end;
v51.cursorInputsChanged = function(v149)
    local l_DidPointerHit_0 = l_VRService_0.DidPointerHit;
    v149.cursorSurfaceGui.Enabled = l_DidPointerHit_0;
    if l_DidPointerHit_0 then
        local l_PointerHitCFrame_0 = l_VRService_0.PointerHitCFrame;
        local l_magnitude_0 = (v9.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position - l_PointerHitCFrame_0.Position).magnitude;
        local v153 = 1;
        local v154 = l_magnitude_0 * 0.01;
        if v154 < 0.05 then
            v153 = v154 / 0.05;
            v154 = 0.05;
        end;
        v149.cursorPart.Size = Vector3.new(v154, v154, v154);
        v149.cursorPart.CFrame = l_PointerHitCFrame_0 * CFrame.new(0, 0, v154 * 0.5);
        v149.cursorImage.Size = UDim2.new(v153, 0, v153, 0);
    end;
end;
v51.updateCursor_DEPRECATED = function(v155)
    if l_VRService_0.DidPointerHit then
        local l_PointerHitCFrame_1 = l_VRService_0.PointerHitCFrame;
        local v157 = v9.GetUserCFrameWorldSpace(v155.inputUserCFrame);
        if v155:isHeadMounted() then
            v157 = v9.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
        end;
        local l_p_0 = v157.p;
        local l_lookVector_0 = v157.lookVector;
        local l_Position_0 = l_PointerHitCFrame_1.Position;
        local l_lookVector_1 = l_PointerHitCFrame_1.lookVector;
        local v162 = l_lookVector_1:Dot(l_lookVector_0);
        if math.abs(v162) > 0.001 then
            l_PointerHitCFrame_1 = l_PointerHitCFrame_1.Rotation + (l_p_0 + ((l_Position_0 - l_p_0):Dot(l_lookVector_1) / v162) * l_lookVector_0);
        end;
        local l_magnitude_1 = (workspace.CurrentCamera.CFrame.Position - l_PointerHitCFrame_1.Position).magnitude;
        local v164 = 1;
        local v165 = l_magnitude_1 * 0.01;
        if v165 < 0.05 then
            v164 = v165 / 0.05;
            v165 = 0.05;
        end;
        v155.cursorPart.Size = Vector3.new(v165, v165, v165);
        v155.cursorPart.CFrame = l_PointerHitCFrame_1 * CFrame.new(0, 0, v165 * 0.5);
        v155.cursorImage.Size = UDim2.new(v164, 0, v164, 0);
    end;
    v155.cursorSurfaceGui.Enabled = l_VRService_0.DidPointerHit;
end;
v51.update_DEPRECATED = function(v166, _)
    if not (v166.mode == v39.Disabled) or v166.forceDotActive then
        local v168 = v33();
        local v169 = {
            l_LocalPlayer_0.Character or l_LocalPlayer_0, 
            v166.originPart, 
            v166.plopPart, 
            v166.plopBall, 
            l_GuiService_0.CoreEffectFolder
        };
        local _ = v43.ARC_THICKNESS;
        local _ = v41.ARC_THICKNESS;
        local _ = v43.G;
        local _ = v41.G;
        if not v10 then
            v166:updateCursor_DEPRECATED();
        end;
        if not v166:isHeadMounted() then
            local v174 = v9.GetUserCFrameWorldSpace(v166.inputUserCFrame);
            local l_p_1 = v174.p;
            local l_lookVector_2 = v174.lookVector;
            local l_G_2 = v41.G;
            local v178 = math.asin(l_lookVector_2.Y);
            local v179 = not not v168 and l_p_1.Y - v166:getNavigationOrigin().Y or 0;
            local l_MAX_VALID_DISTANCE_0 = v41.MAX_VALID_DISTANCE;
            v166:setArcLaunchParams(v178, v166:calculateLaunchVelocity(l_G_2, l_MAX_VALID_DISTANCE_0, v179), l_G_2, l_MAX_VALID_DISTANCE_0);
            v169[6] = nil;
            local _, v182, v183, _ = v166:getLaserHit(l_p_1, l_lookVector_2, v169);
            if not v166.forceDotActive then
                v166:setMode(v39.Pointer);
            end;
            if v166.mode == v39.Navigation then
                v166.parabola.Range = v166.parabola.Range * nil;
                v166.parabola.Thickness = v41.ARC_THICKNESS;
                v166:updateNavigationMode(nil, nil, nil);
                return ;
            else
                v166.parabola.Thickness = v43.ARC_THICKNESS;
                v166.parabola.Color3 = not not l_VRService_0.DidPointerHit and v43.ARC_COLOR_HIT or v43.ARC_COLOR_GOOD;
                if not ((not l_LocalPlayer_0 or not l_LocalPlayer_0.Character) or not l_LocalPlayer_0.Character:FindFirstChildOfClass("Tool")) then
                    v166.parabola.Color3 = v43.ARC_COLOR_BAD;
                end;
                v182 = if not l_VRService_0.DidPointerHit then l_p_1 + l_lookVector_2 * v166.laserMaxDistance else if v10 then l_p_1 + l_lookVector_2 * (l_VRService_0.PointerHitCFrame.Position - l_p_1).magnitude else l_VRService_0.PointerHitCFrame.Position;
                v166.parabola.Thickness = v43.ARC_THICKNESS * workspace.CurrentCamera.HeadScale;
                if not v166.forceDotActive then
                    v166:renderAsLaser(l_p_1, v182);
                    if v166.showPlopBallOnPointer then
                        v166:updateNavPlop(v182, v183);
                    end;
                end;
            end;
        else
            v166.parabola.Thickness = v43.ARC_THICKNESS * 0.25;
            local v185 = v9.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
            local v186, v187, v188, _ = v166:getLaserHit(v185.p, v185.lookVector, v169);
            v166:checkHeadMountedMode(v186);
            if not v166.forceDotActive then
                v166:renderAsLaser(v185:pointToWorldSpace(v38 * workspace.CurrentCamera.HeadScale), v187);
                if v166.showPlopBallOnPointer then
                    v166:updateNavPlop(v187, v188);
                end;
                if v166.mode == v39.Navigation then
                    v166:updateNavigationMode(v187, v188, v186, v187);
                    return ;
                else
                    v166.parabola.Color3 = not not l_VRService_0.DidPointerHit and v43.ARC_COLOR_HIT or v43.ARC_COLOR_GOOD;
                    return ;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v51.update = function(v190, v191)
    if v11 then
        if v190.mode ~= v39.Pointer and v190.mode ~= v39.DualPointer then
            return ;
        else
            v190.parabola.Thickness = v43.ARC_THICKNESS * workspace.CurrentCamera.HeadScale;
            v190.parabolaOffhand.Thickness = v43.ARC_THICKNESS * workspace.CurrentCamera.HeadScale;
            if (not l_LocalPlayer_0 or not l_LocalPlayer_0.Character) or not l_LocalPlayer_0.Character:FindFirstChildOfClass("Tool") then
                v190.parabola.Color3 = not not l_VRService_0.DidPointerHit and v43.ARC_COLOR_HIT or v43.ARC_COLOR_GOOD;
            else
                v190.parabola.Color3 = v43.ARC_COLOR_BAD;
            end;
            local v192 = v9.GetUserCFrameWorldSpace(v190.inputUserCFrame);
            local l_p_2 = v192.p;
            local l_lookVector_3 = v192.lookVector;
            local v195 = nil;
            v195 = if not l_VRService_0.DidPointerHit then l_p_2 + l_lookVector_3 * v190.laserMaxDistance else l_p_2 + l_lookVector_3 * (l_VRService_0.PointerHitCFrame.Position - l_p_2).magnitude;
            if not v190:isHeadMounted() then
                v190.parabola.Visible = true;
                v190:renderAsLaser(l_p_2, v195);
            else
                v190.parabola.Visible = false;
            end;
            if v190.mode == v39.DualPointer then
                if not v190:isHeadMounted() then
                    v190.parabolaOffhand.Visible = true;
                    local v196 = v9.GetUserCFrameWorldSpace(if v190.inputUserCFrame == Enum.UserCFrame.RightHand then Enum.UserCFrame.LeftHand else Enum.UserCFrame.RightHand);
                    local l_p_3 = v196.p;
                    v190:renderOffhandLaser(l_p_3, l_p_3 + v196.lookVector * 3);
                else
                    v190.parabolaOffhand.Visible = false;
                    return ;
                end;
            end;
            return ;
        end;
    else
        v190:update_DEPRECATED(v191);
        return ;
    end;
end;
return v51;
