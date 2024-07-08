local l_Utility_0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"));
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Lighting_0 = game:GetService("Lighting");
local v4 = false;
local v5 = Color3.new(0.0784, 0.1686, 0.2353);
local v6 = l_Utility_0.Create("ColorCorrectionEffect")({
    Brightness = 0.3, 
    Contrast = 0.5, 
    Saturation = -1, 
    TintColor = v5, 
    Enabled = true, 
    Parent = l_Lighting_0
});
local v7 = l_Utility_0.Create("BlurEffect")({
    Size = 10, 
    Enabled = true, 
    Parent = l_Lighting_0
});
local v8 = l_Utility_0.Create("BloomEffect")({
    Intensity = 0.05, 
    Size = 24, 
    Threshold = 0.95, 
    Enabled = true, 
    Parent = l_Lighting_0
});
local function _()
    v7.Enabled = false;
    v6.Contrast = 0.35;
    v6.Saturation = 0.175;
    v6.TintColor = Color3.fromRGB(255, 255, 255);
    v6.Brightness = 0.02;
end;
local function v14(v10)
    local v11 = {};
    for _, v13 in pairs(v10:GetChildren()) do
        v11[tonumber(v13.Name:sub(4, -1))] = v13;
        v13.Transparency = 1;
    end;
    return v11;
end;
local v15 = nil;
local function v18()
    if v15 == nil then
        v15 = {};
        for _, v17 in pairs(workspace:WaitForChild("Cameras"):GetChildren()) do
            v15[v17.Name] = v14(v17);
        end;
    end;
    return v15;
end;
local function _()
    if workspace.CurrentCamera then
        workspace.CurrentCamera.CameraType = "Scriptable";
    end;
end;
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    if workspace.CurrentCamera then
        workspace.CurrentCamera.CameraType = "Scriptable";
    end;
end);
if workspace.CurrentCamera then
    workspace.CurrentCamera.CameraType = "Scriptable";
end;
local v20 = nil;
local v21 = Vector2.new(0, 0);
local v25 = {
    EnableCameraControl = function(_)
        v20 = l_Utility_0.DisconnectEvent(v20);
        v20 = l_UserInputService_0.InputChanged:connect(function(v23)
            if v23.KeyCode == Enum.KeyCode.Thumbstick2 then
                v21 = v23.Position or v21;
                v21 = Vector2.new(v21.X, v21.Y);
            end;
        end);
    end, 
    DisableCameraControl = function(_)
        v20 = l_Utility_0.DisconnectEvent(v20);
        v21 = Vector2.new(0, 0);
    end
};
local v26 = nil;
local v27 = Vector2.new(0, 0);
local v28 = tick();
do
    local l_v27_0, l_v28_0 = v27, v28;
    v26 = function()
        local v31 = tick();
        local v32 = v31 - l_v28_0;
        l_v28_0 = v31;
        local v33 = 0.125 ^ v32;
        l_v27_0 = l_v27_0 * v33 + v21 * (1 - v33);
        return (CFrame.new(l_v27_0.X / 8, l_v27_0.Y / 8, 0) * CFrame.Angles(0, -l_v27_0.X / 12, 0)) * CFrame.Angles(l_v27_0.Y / 12, 0, 0);
    end;
end;
v27 = CFrame.new();
local function v34()
    return {
        CFrame = v27, 
        Contrast = 0.5, 
        Saturation = -1, 
        TintColor = v5, 
        BlurSize = 10
    };
end;
local function _()
    v4 = true;
    l_RunService_0:BindToRenderStep("CameraScriptCutsceneLerp", Enum.RenderPriority.Camera.Value, function()
        local v35 = v34();
        workspace.CurrentCamera.CoordinateFrame = v35.CFrame;
        v6.Contrast = v35.Contrast;
        v6.Saturation = v35.Saturation;
        v6.TintColor = v35.TintColor;
        v7.Size = v35.BlurSize;
    end);
end;
local function _()
    v4 = false;
    l_RunService_0:UnbindFromRenderStep("CameraScriptCutsceneLerp");
end;
local function _(v38, v39, v40, v41, v42)
    l_Utility_0.PropertyTweener(v6, "Brightness", v6.Brightness, -1, v39, l_Utility_0.EaseInOutQuad, true, function()
        v34 = v38:get_getFrameInfo();
        v7.Enabled = v41;
        v8.Enabled = v42;
        l_Utility_0.PropertyTweener(v6, "Brightness", v6.Brightness, v40, v39, l_Utility_0.EaseInOutQuad, true, function()
            if not v4 then
                v7.Enabled = false;
                v6.Contrast = 0.35;
                v6.Saturation = 0.175;
                v6.TintColor = Color3.fromRGB(255, 255, 255);
                v6.Brightness = 0.02;
            end;
        end);
    end);
end;
local function v44(v45, v46)
    local v47 = {};
    for v48 = 1, #v45 - 1 do
        v47[v48] = v45[v48]:lerp(v45[v48 + 1], v46);
    end;
    if #v47 == 1 then
        return v47[1];
    else
        return v44(v47, v46);
    end;
end;
local function _(v49)
    local v50 = {};
    for v51 = 1, #v49 do
        v50[v51] = v49[v51].CFrame;
    end;
    return v50;
end;
local function v81(v53, v54)
    local v55 = 0;
    local v56 = 0;
    local v57 = nil;
    local v58 = false;
    local v59 = {};
    local v60 = {
        Contrast = -1, 
        BlurSize = 50
    };
    local function v61()
        return {
            CFrame = v44(v57, (l_Utility_0.Clamp(0, 1, (tick() - v55) / v54))) * v26(), 
            Contrast = v60.Contrast, 
            Saturation = -1, 
            TintColor = v5, 
            BlurSize = v60.BlurSize
        };
    end;
    local function _()
        if v58 then
            v56 = v56 + 1;
            if #v53 < v56 then
                v56 = 1;
            end;
            v53[v56].init();
            local l_cameras_0 = v53[v56].cameras;
            local v63 = {};
            for v64 = 1, #l_cameras_0 do
                v63[v64] = l_cameras_0[v64].CFrame;
            end;
            v57 = v63;
            v55 = tick();
            return ;
        else
            return ;
        end;
    end;
    local function v72(v66)
        local v67 = tick() - v55;
        for v68 = #v59, 1, -1 do
            if v59[v68]:IsFinished() then
                table.remove(v59, v68);
            end;
        end;
        if v54 <= v67 then
            table.insert(v59, (l_Utility_0.PropertyTweener(v60, "Contrast", v60.Contrast, 0.5, v66, l_Utility_0.EaseInOutQuad, true)));
            table.insert(v59, (l_Utility_0.PropertyTweener(v60, "BlurSize", v60.BlurSize, 10, v66, l_Utility_0.EaseInOutQuad, true)));
            if v58 then
                v56 = v56 + 1;
                if #v53 < v56 then
                    v56 = 1;
                end;
                v53[v56].init();
                local l_cameras_1 = v53[v56].cameras;
                local v70 = {};
                for v71 = 1, #l_cameras_1 do
                    v70[v71] = l_cameras_1[v71].CFrame;
                end;
                v57 = v70;
                v55 = tick();
                return ;
            else
                return ;
            end;
        else
            if v54 - v66 <= v67 and #v59 == 0 then
                table.insert(v59, (l_Utility_0.PropertyTweener(v60, "Contrast", v60.Contrast, -1, v66, l_Utility_0.EaseInOutQuad, true)));
                table.insert(v59, (l_Utility_0.PropertyTweener(v60, "BlurSize", v60.BlurSize, 50, v66, l_Utility_0.EaseInOutQuad, true)));
            end;
            return ;
        end;
    end;
    local function v76()
        table.insert(v59, (l_Utility_0.PropertyTweener(v60, "Contrast", v60.Contrast, 0.5, 4, l_Utility_0.EaseInOutQuad, true)));
        table.insert(v59, (l_Utility_0.PropertyTweener(v60, "BlurSize", v60.BlurSize, 10, 4, l_Utility_0.EaseInOutQuad, true)));
        if v58 then
            v56 = v56 + 1;
            if #v53 < v56 then
                v56 = 1;
            end;
            v53[v56].init();
            local l_cameras_2 = v53[v56].cameras;
            local v74 = {};
            for v75 = 1, #l_cameras_2 do
                v74[v75] = l_cameras_2[v75].CFrame;
            end;
            v57 = v74;
            v55 = tick();
            return ;
        else
            return ;
        end;
    end;
    return {
        Start = function(_)
            v58 = true;
            v76();
            l_RunService_0:BindToRenderStep("runCameraSeries", Enum.RenderPriority.Camera.Value + 1, function()
                v72(1.7);
            end);
        end, 
        Stop = function(_)
            v58 = false;
            for v79 = #v59, 1, -1 do
                table.remove(v59, v79):Finish();
            end;
            v60 = {
                Contrast = 0.5, 
                BlurSize = 10
            };
            l_RunService_0:UnbindFromRenderStep("runCameraSeries");
        end, 
        get_getFrameInfo = function(_)
            return v61;
        end
    };
end;
local function v93(v82, v83, v84)
    local v85 = 0;
    local v90 = {
        Reset = function(_)
            v85 = tick();
        end, 
        Update = function(_, v88, _)
            v82 = v88;
            v85 = tick();
        end
    };
    local function v91()
        return {
            CFrame = v44(v82, v84((l_Utility_0.Clamp(0, 1, (tick() - v85) / v83)))), 
            Contrast = 0.35, 
            Saturation = 0.175, 
            TintColor = Color3.fromRGB(255, 255, 255), 
            BlurSize = 1
        };
    end;
    v90.get_getFrameInfo = function(_)
        return v91;
    end;
    return v90;
end;
pcall(function()
    local function v94(v95)
        local l_v95_Children_0 = v95:GetChildren();
        for v97 = 1, #l_v95_Children_0 do
            local v98 = l_v95_Children_0[v97];
            if v98:IsA("BasePart") then
                v98.Locked = true;
                v98.Anchored = true;
                v98.CanCollide = false;
            end;
            v94(v98);
        end;
    end;
    v94(workspace);
end);
local l_ZoneManager_0 = require(script.Parent:WaitForChild("CameraManagerModules"):WaitForChild("ZoneManager"));
local v100 = nil;
local v101 = nil;
local v102 = false;
local v103 = {
    CFrame.new(10.2426682, 5.1197648, -30.9536419, -0.946675897, 0.123298854, -0.297661126, 0, 0.92387563, 0.382692933, 0.322187454, 0.36228618, -0.874610782), 
    CFrame.new(12.50625, 4.8365, -24.764325, -0.94241035, 0.0557777137, -0.329775006, 0, 0.98599577, 0.166770056, 0.334458828, 0.157165825, -0.92921263)
};
v25.CameraMoveToAsync = function(_)
    local v105 = v18();
    v4 = true;
    l_RunService_0:BindToRenderStep("CameraScriptCutsceneLerp", Enum.RenderPriority.Camera.Value, function()
        local v106 = v34();
        workspace.CurrentCamera.CoordinateFrame = v106.CFrame;
        v6.Contrast = v106.Contrast;
        v6.Saturation = v106.Saturation;
        v6.TintColor = v106.TintColor;
        v7.Size = v106.BlurSize;
    end);
    v101 = v81({
        {
            init = function()
                l_ZoneManager_0:SetZone("City");
            end, 
            cameras = v105.City
        }, 
        {
            init = function()
                l_ZoneManager_0:SetZone("Space");
            end, 
            cameras = v105.Space
        }, 
        {
            init = function()
                l_ZoneManager_0:SetZone("Volcano");
            end, 
            cameras = v105.Volcano
        }
    }, 60);
    v100 = v93(v103, 1, function(v107)
        v107 = l_Utility_0.Clamp(0, 1, v107);
        return v107 * (2 - v107);
    end);
    v101:Start();
    local l_v101_0 = v101;
    local l_PropertyTweener_0 = l_Utility_0.PropertyTweener;
    local l_v6_0 = v6;
    local v111 = "Brightness";
    local l_Brightness_0 = v6.Brightness;
    local v113 = -1;
    local v114 = 0.25;
    local l_EaseInOutQuad_0 = l_Utility_0.EaseInOutQuad;
    local v116 = true;
    local v117 = true;
    local v118 = false;
    local v119 = 0.3;
    local v120 = 0.25;
    l_PropertyTweener_0(l_v6_0, v111, l_Brightness_0, v113, v114, l_EaseInOutQuad_0, v116, function()
        v34 = l_v101_0:get_getFrameInfo();
        v7.Enabled = v117;
        v8.Enabled = v118;
        l_Utility_0.PropertyTweener(v6, "Brightness", v6.Brightness, v119, v120, l_Utility_0.EaseInOutQuad, true, function()
            if not v4 then
                v7.Enabled = false;
                v6.Contrast = 0.35;
                v6.Saturation = 0.175;
                v6.TintColor = Color3.fromRGB(255, 255, 255);
                v6.Brightness = 0.02;
            end;
        end);
    end);
    if v102 then
        v25:SwitchToAvatarEditor();
    end;
end;
v25.SwitchToFlyThrough = function(_)
    v102 = false;
    if v101 then
        if not v4 then
            v4 = true;
            l_RunService_0:BindToRenderStep("CameraScriptCutsceneLerp", Enum.RenderPriority.Camera.Value, function()
                local v122 = v34();
                workspace.CurrentCamera.CoordinateFrame = v122.CFrame;
                v6.Contrast = v122.Contrast;
                v6.Saturation = v122.Saturation;
                v6.TintColor = v122.TintColor;
                v7.Size = v122.BlurSize;
            end);
        end;
        local l_v101_1 = v101;
        local l_PropertyTweener_1 = l_Utility_0.PropertyTweener;
        local l_v6_1 = v6;
        local v126 = "Brightness";
        local l_Brightness_1 = v6.Brightness;
        local v128 = -1;
        local v129 = 0.25;
        local l_EaseInOutQuad_1 = l_Utility_0.EaseInOutQuad;
        local v131 = true;
        local v132 = true;
        local v133 = false;
        local v134 = 0.3;
        local v135 = 0.25;
        l_PropertyTweener_1(l_v6_1, v126, l_Brightness_1, v128, v129, l_EaseInOutQuad_1, v131, function()
            v34 = l_v101_1:get_getFrameInfo();
            v7.Enabled = v132;
            v8.Enabled = v133;
            l_Utility_0.PropertyTweener(v6, "Brightness", v6.Brightness, v134, v135, l_Utility_0.EaseInOutQuad, true, function()
                if not v4 then
                    v7.Enabled = false;
                    v6.Contrast = 0.35;
                    v6.Saturation = 0.175;
                    v6.TintColor = Color3.fromRGB(255, 255, 255);
                    v6.Brightness = 0.02;
                end;
            end);
        end);
        v101:Start();
        return ;
    else
        return ;
    end;
end;
v25.SwitchToAvatarEditor = function(_)
    if v101 and v100 then
        v4 = false;
        l_RunService_0:UnbindFromRenderStep("CameraScriptCutsceneLerp");
        v101:Stop();
        l_ZoneManager_0:SetZone("AvatarEditor");
        v100:Reset();
        v7.Enabled = false;
        v6.Contrast = 0.35;
        v6.Saturation = 0.175;
        v6.TintColor = Color3.fromRGB(255, 255, 255);
        v6.Brightness = 0.02;
        return ;
    else
        v102 = true;
        return ;
    end;
end;
local v137 = v103[2];
v25.UpdateAvatarEditorCamera = function(_, v139)
    if v100 then
        v137 = v139;
        v100:Update({
            v100:get_getFrameInfo()().CFrame, 
            v137
        }, 0.5);
        return ;
    else
        return ;
    end;
end;
return v25;
