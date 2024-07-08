local l_VRService_0 = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Common.CommonUtil);
local v4 = {
    Body = {
        size = Vector3.new(0.391, 0.277, 0.731), 
        meshId = "rbxassetid://433286977", 
        textureId = "rbxassetid://433287000", 
        offset = CFrame.new(0, -0.115, 0.213)
    }, 
    RightGrip = {
        meshId = "rbxassetid://433290663", 
        textureId = "rbxassetid://433290688", 
        offset = CFrame.new(0.057, -0.047, 0.29), 
        moveOffset = CFrame.new(-0.005, 0, 0)
    }, 
    LeftGrip = {
        meshId = "rbxassetid://433289821", 
        textureId = "rbxassetid://433289832", 
        offset = CFrame.new(-0.057, -0.047, 0.29), 
        moveOffset = CFrame.new(0.005, 0, 0)
    }, 
    SystemButton = {
        meshId = "rbxassetid://433291265", 
        textureId = "rbxassetid://433291278", 
        offset = CFrame.new(0, 0.005, 0.294), 
        moveOffset = CFrame.new(Vector3.new(0, 0.997420907, 0.071774438) * -0.001)
    }, 
    MenuButton = {
        meshId = "rbxassetid://433288124", 
        textureId = "rbxassetid://433288134", 
        offset = CFrame.new(0, 0.016, 0.068), 
        moveOffset = CFrame.new(Vector3.new(0, 0.999877751, -0.0156304892) * -0.001)
    }, 
    Trackpad = {
        meshId = "rbxassetid://433288821", 
        textureId = "rbxassetid://433288836", 
        offset = CFrame.new(0, 0, 0.163), 
        moveOffset = CFrame.new(Vector3.new(0, 0.993506849, 0.113772281) * -0.001)
    }, 
    Trigger = {
        meshId = "rbxassetid://433288767", 
        textureId = "rbxassetid://433288775", 
        offset = CFrame.new(0, -0.093, 0.163)
    }, 
    LED = {
        meshId = "rbxassetid://433293218", 
        textureId = "rbxassetid://433293231", 
        offset = CFrame.new(0, 0.007, 0.32)
    }, 
    ButtonA = {
        meshId = "rbxassetid://922444331", 
        textureId = "rbxasset://textures/ui/VR/ButtonA.png", 
        offset = CFrame.new(0, 0.0115499999, 0.197307006) * CFrame.Angles(0, 3.141592653589793, 0), 
        moveOffset = CFrame.new(0, -0.005, 0)
    }, 
    ButtonB = {
        meshId = "rbxassetid://922454202", 
        textureId = "rbxasset://textures/ui/VR/ButtonB.png", 
        offset = CFrame.new(0.0391042456, 0.0154935224, 0.161779419) * CFrame.Angles(0, 3.141592653589793, 0), 
        moveOffset = CFrame.new(0, -0.005, 0)
    }, 
    ButtonX = {
        meshId = "rbxassetid://922453111", 
        textureId = "rbxasset://textures/ui/VR/ButtonX.png", 
        offset = CFrame.new(-0.0390719995, 0.0154770007, 0.161733001) * CFrame.Angles(0, 3.141592653589793, 0), 
        moveOffset = CFrame.new(0, -0.005, 0)
    }, 
    ButtonY = {
        meshId = "rbxassetid://922455502", 
        textureId = "rbxasset://textures/ui/VR/ButtonY.png", 
        offset = CFrame.new(0, 0.0197229274, 0.126810834) * CFrame.Angles(0, 3.141592653589793, 0), 
        moveOffset = CFrame.new(0, -0.005, 0)
    }
};
local v5 = {
    [Enum.KeyCode.ButtonL1] = "LeftGrip", 
    [Enum.KeyCode.ButtonL2] = "Trigger", 
    [Enum.KeyCode.ButtonL3] = "Trackpad", 
    [Enum.KeyCode.ButtonR1] = "RightGrip", 
    [Enum.KeyCode.ButtonR2] = "Trigger", 
    [Enum.KeyCode.ButtonR3] = "Trackpad", 
    [Enum.KeyCode.Thumbstick1] = "Trackpad", 
    [Enum.KeyCode.Thumbstick2] = "Trackpad", 
    [Enum.KeyCode.ButtonSelect] = "MenuButton", 
    [Enum.KeyCode.ButtonStart] = "MenuButton", 
    [Enum.KeyCode.ButtonA] = "ButtonA", 
    [Enum.KeyCode.ButtonB] = "ButtonB", 
    [Enum.KeyCode.ButtonX] = "ButtonX", 
    [Enum.KeyCode.ButtonY] = "ButtonY"
};
local l_Granite_0 = Enum.Material.Granite;
local v7 = Vector3.new(0.033, 0.033, 0.033);
local v8 = {};
v8.__index = v8;
local v9 = {
    [Enum.UserCFrame.LeftHand] = Enum.VRTouchpad.Left, 
    [Enum.UserCFrame.RightHand] = Enum.VRTouchpad.Right
};
v8.new = function(v10)
    local v11 = setmetatable({}, v8);
    v11.userCFrame = v10;
    v11.touchpad = v9[v11.userCFrame];
    v11.touchpadMode = l_VRService_0:GetTouchpadMode(v11.touchpad);
    v11.onTouchpadModeChangedConn = l_VRService_0.TouchpadModeChanged:connect(function(...)
        v11:onTouchpadModeChanged(...);
    end);
    v11.model = v3.Create("Model")({
        Name = "ViveController", 
        Archivable = false
    });
    v11.origin = v3.Create("Part")({
        Parent = v11.model, 
        Name = "Origin", 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v11.scale = 1;
    v11.parts = {};
    for v12, v13 in pairs(v4) do
        local l_v7_0 = v7;
        if v13.scale then
            l_v7_0 = l_v7_0 * v13.scale;
        end;
        local v15 = v3.Create("Part")({
            Parent = v11.model, 
            Name = v12, 
            Anchored = true, 
            Material = l_Granite_0, 
            Size = v13.size or Vector3.new(0.05, 0.05, 0.05), 
            CFrame = v11.origin.CFrame * v13.offset, 
            CanCollide = false, 
            CanQuery = false, 
            CanTouch = false
        });
        local _ = v3.Create("SpecialMesh")({
            Parent = v15, 
            Name = "Mesh", 
            MeshId = v13.meshId, 
            TextureId = v13.textureId, 
            Scale = l_v7_0
        });
        local _ = v3.Create("Weld")({
            Parent = v15, 
            Name = "Weld", 
            Part0 = v11.origin, 
            Part1 = v15, 
            C0 = v13.offset
        });
        v11.parts[v12] = v15;
    end;
    local v18 = v3.Create("Part")({
        Parent = v11.model, 
        Name = "TrackpadIndicator", 
        Material = Enum.Material.Neon, 
        BrickColor = BrickColor.new("Institutional white"), 
        Shape = Enum.PartType.Ball, 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v3.Create("Weld")({
        Parent = v18, 
        Name = "Weld", 
        Part0 = v11.origin, 
        Part1 = v18, 
        C0 = v4.Trackpad.offset
    });
    v11.parts.TrackpadIndicator = v18;
    v11.model.PrimaryPart = v11.origin;
    v11:onTouchpadModeChanged(v11.touchpad, l_VRService_0:GetTouchpadMode(v11.touchpad));
    return v11;
end;
v8.setPartVisible = function(v19, v20, v21)
    local v22 = v19.parts[v20];
    if v22 then
        v22.Transparency = not v21 and 1 or 0;
    end;
end;
v8.setABXYEnabled = function(v23, v24)
    v23:setPartVisible("ButtonA", v24);
    v23:setPartVisible("ButtonB", v24);
    v23:setPartVisible("ButtonX", v24);
    v23:setPartVisible("ButtonY", v24);
end;
v8.setCFrame = function(v25, v26)
    v25.model:SetPrimaryPartCFrame(v26);
end;
v8.setCFrameAndScale = function(v27, v28, v29)
    v27.model:SetPrimaryPartCFrame(v28);
    if v27.scale ~= v29 then
        v27.scale = v29;
        for v30, v31 in pairs(v4) do
            local v32 = v27.parts[v30];
            if v32 then
                local l_v7_1 = v7;
                if v31.scale then
                    l_v7_1 = l_v7_1 * v31.scale;
                end;
                local l_Mesh_0 = v32:FindFirstChild("Mesh");
                local l_Weld_0 = v32:FindFirstChild("Weld");
                local v36 = CFrame.new(v31.offset.p * v27.scale) * (v31.offset - v31.offset.p);
                v32.CFrame = v28 * v36;
                if l_Mesh_0 then
                    l_Mesh_0.Scale = l_v7_1 * v27.scale;
                end;
                if l_Weld_0 then
                    l_Weld_0.C0 = v36;
                end;
            end;
        end;
    end;
end;
v8.setButtonState = function(v37, v38, v39)
    local v40 = v4[v38];
    if v40 then
        local l_offset_0 = v40.offset;
        local l_moveOffset_0 = v40.moveOffset;
        if not (not l_offset_0 or not l_moveOffset_0) then
            l_offset_0 = CFrame.new(l_offset_0.p * v37.scale) * (l_offset_0 - l_offset_0.p);
            l_moveOffset_0 = CFrame.new(l_moveOffset_0.p * v37.scale) * (l_moveOffset_0 - l_moveOffset_0.p);
            local v43 = v37.parts[v38];
            if v43 then
                local l_Mesh_1 = v43:FindFirstChild("Mesh");
                local l_Weld_1 = v43:FindFirstChild("Weld");
                if l_Weld_1 then
                    if not v39 then
                        v43.CFrame = v37.origin.CFrame * l_offset_0;
                        l_Weld_1.C0 = l_offset_0;
                    else
                        v43.CFrame = (v37.origin.CFrame * l_offset_0) * l_moveOffset_0;
                        l_Weld_1.C0 = l_offset_0 * l_moveOffset_0;
                    end;
                end;
                if l_Mesh_1 then
                    if not v39 then
                        l_Mesh_1.VertexColor = Vector3.new(1, 1, 1);
                    else
                        l_Mesh_1.VertexColor = Vector3.new(0.5, 0.5, 0.5);
                        return ;
                    end;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v8.setTriggerState = function(v46, v47)
    local l_offset_1 = v4.Trigger.offset;
    l_offset_1 = CFrame.new(l_offset_1.p * v46.scale) * (l_offset_1 - l_offset_1.p);
    local l_Trigger_0 = v46.parts.Trigger;
    local l_Weld_2 = l_Trigger_0:FindFirstChild("Weld");
    if l_Weld_2 then
        local v51 = Vector3.new(0, 0.05 * v46.scale, -0.025 * v46.scale);
        local v52 = ((l_offset_1 * CFrame.new(v51)) * CFrame.Angles(v47 * -0.3490658503988659 + 0, 0, 0)) * CFrame.new(-v51);
        l_Trigger_0.CFrame = v46.origin.CFrame * v52;
        l_Weld_2.C0 = v52;
    end;
end;
v8.setTrackpadState = function(v53, v54)
    local l_TrackpadIndicator_0 = v53.parts.TrackpadIndicator;
    local l_Weld_3 = l_TrackpadIndicator_0:FindFirstChild("Weld");
    local l_offset_2 = v4.Trackpad.offset;
    l_offset_2 = CFrame.new(l_offset_2.p * v53.scale) * (l_offset_2 - l_offset_2.p);
    if l_Weld_3 then
        local v58 = (l_offset_2 * CFrame.new(0, 0.01 * v53.scale, 0)) * (CFrame.Angles(0.11344640137963143, 0, 0) * CFrame.new(0, (0.002 * v53.scale) * v54.magnitude ^ 3, 0)):toWorldSpace(CFrame.new(Vector3.new(v54.X, 0, -v54.Y) * 0.055));
        l_TrackpadIndicator_0.CFrame = v53.origin.CFrame * v58;
        l_Weld_3.C0 = v58;
    end;
end;
v8.onButtonInputChanged = function(v59, v60, v61)
    if not (not (v59.userCFrame == Enum.UserCFrame.RightHand) or v60.KeyCode ~= Enum.KeyCode.ButtonR3) or v59.userCFrame == Enum.UserCFrame.LeftHand and v60.KeyCode == Enum.KeyCode.ButtonL3 then
        v59:setButtonState("Trackpad", v61);
        return ;
    elseif not (not (v59.userCFrame == Enum.UserCFrame.RightHand) or v60.KeyCode ~= Enum.KeyCode.ButtonR1) or v59.userCFrame == Enum.UserCFrame.LeftHand and v60.KeyCode == Enum.KeyCode.ButtonL1 then
        v59:setButtonState("LeftGrip", v61);
        v59:setButtonState("RightGrip", v61);
        return ;
    elseif not (not (v59.userCFrame == Enum.UserCFrame.RightHand) or v60.KeyCode ~= Enum.KeyCode.ButtonStart) or v59.userCFrame == Enum.UserCFrame.LeftHand and v60.KeyCode == Enum.KeyCode.ButtonSelect then
        v59:setButtonState("MenuButton", v61);
        return ;
    else
        if v59.touchpadMode == Enum.VRTouchpadMode.ABXY then
            if v60.KeyCode == Enum.KeyCode.ButtonA then
                v59:setButtonState("ButtonA", v61);
                return ;
            elseif v60.KeyCode == Enum.KeyCode.ButtonB then
                v59:setButtonState("ButtonB", v61);
                return ;
            elseif v60.KeyCode == Enum.KeyCode.ButtonX then
                v59:setButtonState("ButtonX", v61);
                return ;
            elseif v60.KeyCode == Enum.KeyCode.ButtonY then
                v59:setButtonState("ButtonY", v61);
                return ;
            end;
        end;
        return ;
    end;
end;
v8.onInputBegan = function(v62, v63)
    v62:onButtonInputChanged(v63, true);
    if not (not (v62.userCFrame == Enum.UserCFrame.RightHand) or v63.KeyCode ~= Enum.KeyCode.Thumbstick2) or v62.userCFrame == Enum.UserCFrame.LeftHand and v63.KeyCode == Enum.KeyCode.Thumbstick1 then
        v62:setPartVisible("TrackpadIndicator", true);
    end;
end;
v8.onInputChanged = function(v64, v65)
    if not (not (v64.userCFrame == Enum.UserCFrame.RightHand) or v65.KeyCode ~= Enum.KeyCode.ButtonR2) or v64.userCFrame == Enum.UserCFrame.LeftHand and v65.KeyCode == Enum.KeyCode.ButtonL2 then
        v64:setTriggerState(v65.Position.Z);
    end;
    if not (not (v64.userCFrame == Enum.UserCFrame.RightHand) or v65.KeyCode ~= Enum.KeyCode.Thumbstick2) or v64.userCFrame == Enum.UserCFrame.LeftHand and v65.KeyCode == Enum.KeyCode.Thumbstick1 then
        v64:setTrackpadState(v65.Position);
    end;
end;
v8.onInputEnded = function(v66, v67)
    v66:onButtonInputChanged(v67, false);
    if not (not (v66.userCFrame == Enum.UserCFrame.RightHand) or v67.KeyCode ~= Enum.KeyCode.Thumbstick2) or v66.userCFrame == Enum.UserCFrame.LeftHand and v67.KeyCode == Enum.KeyCode.Thumbstick1 then
        v66:setPartVisible("TrackpadIndicator", false);
    end;
end;
v8.onTouchpadModeChanged = function(v68, v69, v70)
    if v69 ~= v68.touchpad then
        return ;
    else
        v68.touchpadMode = v70;
        if v70 == Enum.VRTouchpadMode.ABXY then
            v68:setABXYEnabled(true);
            return ;
        else
            v68:setABXYEnabled(false);
            return ;
        end;
    end;
end;
v8.destroy = function(v71)
    if v71.onTouchpadModeChangedConn then
        v71.onTouchpadModeChangedConn:disconnect();
        v71.onTouchpadModeChangedConn = nil;
    end;
    v71.model:Destroy();
end;
v8.getButtonPart = function(v72, v73)
    local v74 = v5[v73];
    if not v74 then
        return nil;
    else
        return v72.parts[v74];
    end;
end;
return v8;
