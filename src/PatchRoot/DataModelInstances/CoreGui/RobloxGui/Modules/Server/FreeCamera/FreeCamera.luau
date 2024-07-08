local l_abs_0 = math.abs;
local l_clamp_0 = math.clamp;
local l_exp_0 = math.exp;
local l_rad_0 = math.rad;
local l_sign_0 = math.sign;
local l_sqrt_0 = math.sqrt;
local l_tan_0 = math.tan;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
l_Workspace_0:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
    if l_CurrentCamera_1 then
        l_CurrentCamera_0 = l_CurrentCamera_1;
    end;
end);
local v17 = nil;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock");
end);
v17 = l_status_0 and l_result_0;
l_status_0 = nil;
local v20;
l_result_0, v20 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles");
end);
l_status_0 = l_result_0 and v20;
l_result_0 = Enum.ContextActionPriority.Low.Value;
v20 = Enum.ContextActionPriority.High.Value;
local v21 = {
    Enum.KeyCode.LeftShift, 
    Enum.KeyCode.P
};
local v22 = Vector3.new(1, 1, 1) * 64;
local v23 = Vector2.new(0.75, 1) * 8;
local v24 = {};
v24.__index = v24;
v24.new = function(v25, v26)
    local v27 = setmetatable({}, v24);
    v27.f = v25;
    v27.p = v26;
    v27.v = v26 * 0;
    return v27;
end;
v24.Update = function(v28, v29, v30)
    local v31 = (v28.f * 2) * 3.141592653589793;
    local l_p_0 = v28.p;
    local l_v_0 = v28.v;
    local v34 = v30 - l_p_0;
    local v35 = l_exp_0(-v31 * v29);
    local v36 = v30 + (l_v_0 * v29 - v34 * (v31 * v29 + 1)) * v35;
    local v37 = ((v31 * v29) * (v34 * v31 - l_v_0) + l_v_0) * v35;
    v28.p = v36;
    v28.v = v37;
    return v36;
end;
v24.Reset = function(v38, v39)
    v38.p = v39;
    v38.v = v39 * 0;
end;
local v40 = Vector3.new();
local v41 = Vector2.new();
local v42 = 0;
local v43 = v24.new(1.5, (Vector3.new()));
local v44 = v24.new(1, Vector2.new());
local v45 = v24.new(4, 0);
local v46 = {};
local v47 = nil;
local function v49(v48)
    return (l_exp_0(2 * v48) - 1) / 6.38905609893065;
end;
local function v51(v50)
    return (l_exp_0(2 * ((v50 - 0.15) / 0.85)) - 1) / 6.38905609893065;
end;
v47 = function(v52)
    return l_sign_0(v52) * l_clamp_0((l_exp_0(2 * ((l_abs_0(v52) - 0.15) / 0.85)) - 1) / 6.38905609893065, 0, 1);
end;
v49 = {
    ButtonX = 0, 
    ButtonY = 0, 
    DPadDown = 0, 
    DPadUp = 0, 
    ButtonL2 = 0, 
    ButtonR2 = 0, 
    Thumbstick1 = Vector2.new(), 
    Thumbstick2 = Vector2.new()
};
v51 = {
    W = 0, 
    A = 0, 
    S = 0, 
    D = 0, 
    E = 0, 
    Q = 0, 
    U = 0, 
    H = 0, 
    J = 0, 
    K = 0, 
    I = 0, 
    Y = 0, 
    Up = 0, 
    Down = 0, 
    LeftShift = 0, 
    RightShift = 0
};
local v53 = {
    Delta = Vector2.new(), 
    MouseWheel = 0
};
local v54 = Vector3.new(1, 1, 1);
local v55 = Vector3.new(1, 1, 1);
local v56 = Vector2.new(1, 1) * 0.04908738521234052;
local v57 = Vector2.new(1, 1) * 0.39269908169872414;
local v58 = 1;
local l_v51_0 = v51 --[[ copy: 34 -> 48 ]];
local l_v49_0 = v49 --[[ copy: 33 -> 49 ]];
local l_v54_0 = v54 --[[ copy: 36 -> 50 ]];
local l_v55_0 = v55 --[[ copy: 37 -> 51 ]];
do
    local l_v47_0, l_v58_0 = v47, v58;
    v46.Vel = function(v65)
        l_v58_0 = l_clamp_0(l_v58_0 + (v65 * (l_v51_0.Up - l_v51_0.Down)) * 0.75, 0.01, 4);
        return (Vector3.new(l_v47_0(l_v49_0.Thumbstick1.X), l_v47_0(l_v49_0.ButtonR2) - l_v47_0(l_v49_0.ButtonL2), l_v47_0(-l_v49_0.Thumbstick1.Y)) * l_v54_0 + Vector3.new(((l_v51_0.D - l_v51_0.A) + l_v51_0.K) - l_v51_0.H, ((l_v51_0.E - l_v51_0.Q) + l_v51_0.I) - l_v51_0.Y, ((l_v51_0.S - l_v51_0.W) + l_v51_0.J) - l_v51_0.U) * l_v55_0) * (l_v58_0 * (not (l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) and 1 or 0.25));
    end;
    local l_v57_0 = v57 --[[ copy: 39 -> 52 ]];
    local l_v53_0 = v53 --[[ copy: 35 -> 53 ]];
    local l_v56_0 = v56 --[[ copy: 38 -> 54 ]];
    v46.Pan = function(_)
        local v70 = Vector2.new(l_v47_0(l_v49_0.Thumbstick2.Y), l_v47_0(-l_v49_0.Thumbstick2.X)) * l_v57_0;
        local v71 = l_v53_0.Delta * l_v56_0;
        l_v53_0.Delta = Vector2.new();
        return v70 + v71;
    end;
    v46.Fov = function(_)
        local v73 = (l_v49_0.ButtonX - l_v49_0.ButtonY) * 0.25;
        local v74 = l_v53_0.MouseWheel * 1;
        l_v53_0.MouseWheel = 0;
        return v73 + v74;
    end;
    local function v78(_, v76, v77)
        l_v51_0[v77.KeyCode.Name] = v76 == Enum.UserInputState.Begin and 1 or 0;
        return Enum.ContextActionResult.Sink;
    end;
    local function v82(_, v80, v81)
        l_v49_0[v81.KeyCode.Name] = v80 == Enum.UserInputState.Begin and 1 or 0;
        return Enum.ContextActionResult.Sink;
    end;
    local function v87(_, _, v85)
        local l_Delta_0 = v85.Delta;
        l_v53_0.Delta = Vector2.new(-l_Delta_0.y, -l_Delta_0.x);
        return Enum.ContextActionResult.Sink;
    end;
    local function v91(_, _, v90)
        l_v49_0[v90.KeyCode.Name] = v90.Position;
        return Enum.ContextActionResult.Sink;
    end;
    local function v95(_, _, v94)
        l_v49_0[v94.KeyCode.Name] = v94.Position.z;
        return Enum.ContextActionResult.Sink;
    end;
    local function v99(_, _, v98)
        l_v53_0[v98.UserInputType.Name] = -v98.Position.z;
        return Enum.ContextActionResult.Sink;
    end;
    local function _(v100)
        for v101, v102 in pairs(v100) do
            v100[v101] = v102 * 0;
        end;
    end;
    local l_v78_0 = v78 --[[ copy: 41 -> 55 ]];
    local l_v87_0 = v87 --[[ copy: 43 -> 56 ]];
    local l_v82_0 = v82 --[[ copy: 42 -> 57 ]];
    v46.StartCapture = function()
        l_ContextActionService_0:BindActionAtPriority("FreecamKeyboard", l_v78_0, false, v20, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down);
        l_ContextActionService_0:BindActionAtPriority("FreecamMousePan", l_v87_0, false, v20, Enum.UserInputType.MouseMovement);
        l_ContextActionService_0:BindActionAtPriority("FreecamMouseWheel", v99, false, v20, Enum.UserInputType.MouseWheel);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadButton", l_v82_0, false, v20, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadTrigger", v95, false, v20, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadThumbstick", v91, false, v20, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2);
    end;
    v46.StopCapture = function()
        l_v58_0 = 1;
        local l_l_v49_0_0 = l_v49_0;
        for v108, v109 in pairs(l_l_v49_0_0) do
            l_l_v49_0_0[v108] = v109 * 0;
        end;
        l_l_v49_0_0 = l_v51_0;
        for v110, v111 in pairs(l_l_v49_0_0) do
            l_l_v49_0_0[v110] = v111 * 0;
        end;
        l_l_v49_0_0 = l_v53_0;
        for v112, v113 in pairs(l_l_v49_0_0) do
            l_l_v49_0_0[v112] = v113 * 0;
        end;
        l_ContextActionService_0:UnbindAction("FreecamKeyboard");
        l_ContextActionService_0:UnbindAction("FreecamMousePan");
        l_ContextActionService_0:UnbindAction("FreecamMouseWheel");
        l_ContextActionService_0:UnbindAction("FreecamGamepadButton");
        l_ContextActionService_0:UnbindAction("FreecamGamepadTrigger");
        l_ContextActionService_0:UnbindAction("FreecamGamepadThumbstick");
    end;
end;
v47 = function(v114)
    local v115 = v43:Update(v114, v46.Vel(v114));
    local v116 = v44:Update(v114, v46.Pan(v114));
    local v117 = v45:Update(v114, v46.Fov(v114));
    local v118 = l_sqrt_0(0.7002075382097097 / l_tan_0((l_rad_0(v42 / 2))));
    v42 = l_clamp_0(v42 + (v117 * 300) * (v114 / v118), 1, 120);
    v41 = v41 + (v116 * v23) * (v114 / v118);
    v41 = Vector2.new(l_clamp_0(v41.x, -1.5707963267948966, 1.5707963267948966), v41.y % 6.283185307179586);
    local v119 = (CFrame.new(v40) * CFrame.fromOrientation(v41.x, v41.y, 0)) * CFrame.new((v115 * v22) * v114);
    v40 = v119.p;
    l_CurrentCamera_0.CFrame = v119;
    l_CurrentCamera_0.Focus = v119;
    l_CurrentCamera_0.FieldOfView = v42;
end;
v49 = function()
    return ((l_Players_0.LocalPlayer.DevEnableMouseLock and l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch) and not (l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove)) and not (l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable);
end;
v51 = {};
v53 = nil;
v54 = nil;
v55 = nil;
v56 = nil;
v57 = nil;
v58 = nil;
local v120 = {};
local v121 = {
    Backpack = true, 
    Chat = true, 
    Health = true, 
    PlayerList = true
};
local v122 = {
    BadgesNotificationsActive = true, 
    PointsNotificationsActive = true
};
do
    local l_v53_1, l_v54_1, l_v55_1, l_v56_1, l_v57_1, l_v58_1 = v53, v54, v55, v56, v57, v58;
    v51.Push = function()
        for v129 in pairs(v121) do
            v121[v129] = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType[v129]);
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType[v129], false);
        end;
        for v130 in pairs(v122) do
            v122[v130] = l_StarterGui_0:GetCore(v130);
            l_StarterGui_0:SetCore(v130, false);
        end;
        local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        if l_PlayerGui_0 then
            for _, v133 in pairs(l_PlayerGui_0:GetChildren()) do
                if not (not v133:IsA("ScreenGui") or not v133.Enabled) then
                    v120[#v120 + 1] = v133;
                    v133.Enabled = false;
                end;
            end;
        end;
        l_v58_1 = l_CurrentCamera_0.FieldOfView;
        l_CurrentCamera_0.FieldOfView = 70;
        l_v55_1 = l_CurrentCamera_0.CameraType;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_v57_1 = l_CurrentCamera_0.CFrame;
        l_v56_1 = l_CurrentCamera_0.Focus;
        l_v54_1 = l_UserInputService_0.MouseIconEnabled;
        l_UserInputService_0.MouseIconEnabled = false;
        if not v17 or not (((l_Players_0.LocalPlayer.DevEnableMouseLock and l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch) and not (l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove)) and not (l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable)) then
            l_v53_1 = l_UserInputService_0.MouseBehavior;
        else
            l_v53_1 = Enum.MouseBehavior.Default;
        end;
        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
    end;
    v51.Pop = function()
        for v134, v135 in pairs(v121) do
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType[v134], v135);
        end;
        for v136, v137 in pairs(v122) do
            l_StarterGui_0:SetCore(v136, v137);
        end;
        for _, v139 in pairs(v120) do
            if v139.Parent then
                v139.Enabled = true;
            end;
        end;
        l_CurrentCamera_0.FieldOfView = l_v58_1;
        l_v58_1 = nil;
        l_CurrentCamera_0.CameraType = l_v55_1;
        l_v55_1 = nil;
        l_CurrentCamera_0.CFrame = l_v57_1;
        l_v57_1 = nil;
        l_CurrentCamera_0.Focus = l_v56_1;
        l_v56_1 = nil;
        l_UserInputService_0.MouseIconEnabled = l_v54_1;
        l_v54_1 = nil;
        l_UserInputService_0.MouseBehavior = l_v53_1;
        l_v53_1 = nil;
    end;
end;
v53 = function()
    if l_status_0 then
        script:SetAttribute("FreecamEnabled", true);
    end;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    v41 = Vector2.new(l_CFrame_0:toEulerAnglesYXZ());
    v40 = l_CFrame_0.p;
    v42 = l_CurrentCamera_0.FieldOfView;
    v43:Reset((Vector3.new()));
    v44:Reset(Vector2.new());
    v45:Reset(0);
    v51.Push();
    l_RunService_0:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, v47);
    v46.StartCapture();
end;
v54 = function()
    if l_status_0 then
        script:SetAttribute("FreecamEnabled", false);
    end;
    v46.StopCapture();
    l_RunService_0:UnbindFromRenderStep("Freecam");
    v51.Pop();
end;
v55 = false;
do
    local l_v55_2 = v55;
    v56 = function()
        if not l_v55_2 then
            v53();
        else
            if l_status_0 then
                script:SetAttribute("FreecamEnabled", false);
            end;
            v46.StopCapture();
            l_RunService_0:UnbindFromRenderStep("Freecam");
            v51.Pop();
        end;
        l_v55_2 = not l_v55_2;
    end;
    v57 = function(v142)
        for v143 = 1, #v142 - 1 do
            if not l_UserInputService_0:IsKeyDown(v142[v143]) then
                return ;
            end;
        end;
        if not l_v55_2 then
            v53();
        else
            if l_status_0 then
                script:SetAttribute("FreecamEnabled", false);
            end;
            v46.StopCapture();
            l_RunService_0:UnbindFromRenderStep("Freecam");
            v51.Pop();
        end;
        l_v55_2 = not l_v55_2;
    end;
    l_ContextActionService_0:BindActionAtPriority("FreecamToggle", function(_, v145, v146)
        if v145 == Enum.UserInputState.Begin and v146.KeyCode == v21[#v21] then
            v57(v21);
        end;
        return Enum.ContextActionResult.Pass;
    end, false, l_result_0, v21[#v21]);
    if l_status_0 then
        script:SetAttribute("FreecamEnabled", l_v55_2);
        script:GetAttributeChangedSignal("FreecamEnabled"):Connect(function()
            local l_script_Attribute_0 = script:GetAttribute("FreecamEnabled");
            if typeof(l_script_Attribute_0) ~= "boolean" then
                script:SetAttribute("FreecamEnabled", l_v55_2);
                return ;
            else
                if l_script_Attribute_0 ~= l_v55_2 then
                    if not l_script_Attribute_0 then
                        if l_status_0 then
                            script:SetAttribute("FreecamEnabled", false);
                        end;
                        v46.StopCapture();
                        l_RunService_0:UnbindFromRenderStep("Freecam");
                        v51.Pop();
                        l_v55_2 = false;
                    else
                        v53();
                        l_v55_2 = true;
                        return ;
                    end;
                end;
                return ;
            end;
        end);
    end;
end;
