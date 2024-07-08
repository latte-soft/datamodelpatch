local _ = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v4 = require(l_RobloxGui_0.Modules.Common.CommonUtil);
local v5 = require(l_RobloxGui_0.Modules.Flags.FIntVRTouchControllerTransparency);
local v6 = {
    [Enum.UserCFrame.RightHand] = {
        Body = {
            meshId = "rbxassetid://12954883737", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0)
        }, 
        Grip = {
            meshId = "rbxassetid://12954884971", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.015, -0.078, 0.005) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(-0.01, 0.005, 0) * CFrame.Angles(0, 0, -0.12217304763960307)
        }, 
        Stick = {
            meshId = "rbxassetid://12954884012", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.056, 0.027, -0.074) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.001, 0)
        }, 
        Trigger = {
            meshId = "rbxassetid://12954885295", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.014, -0.049, -0.131) * CFrame.Angles(0, 3.141592653589793, 0)
        }, 
        MenuButton = {
            meshId = "rbxassetid://12954884231", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.07, 0.017, -0.017) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.001, 0)
        }, 
        ButtonA = {
            meshId = "rbxassetid://12954884749", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.011, 0.014, -0.026) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.005, 0)
        }, 
        ButtonB = {
            meshId = "rbxassetid://12954884464", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(-0.013, 0.015, -0.07) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.005, 0)
        }
    }, 
    [Enum.UserCFrame.LeftHand] = {
        Body = {
            meshId = "rbxassetid://12954878407", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0)
        }, 
        Grip = {
            meshId = "rbxassetid://12954878772", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.015, -0.078, 0.005) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0.0125, 0.005, 0.001)
        }, 
        Stick = {
            meshId = "rbxassetid://12954879211", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.056, 0.027, -0.074) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.001, 0)
        }, 
        Trigger = {
            meshId = "rbxassetid://12954878599", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.014, -0.049, -0.131) * CFrame.Angles(0, 3.141592653589793, 0)
        }, 
        MenuButton = {
            meshId = "rbxassetid://12954879390", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.07, 0.017, -0.017) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.001, 0)
        }, 
        ButtonX = {
            meshId = "rbxassetid://12954879064", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.011, 0.013, -0.026) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.005, 0)
        }, 
        ButtonY = {
            meshId = "rbxassetid://12954878913", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(0.013, 0.015, -0.07) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.005, 0)
        }
    }
};
local v7 = {
    [Enum.KeyCode.ButtonL1] = "Grip", 
    [Enum.KeyCode.ButtonL2] = "Trigger", 
    [Enum.KeyCode.ButtonL3] = "Stick", 
    [Enum.KeyCode.ButtonR1] = "Grip", 
    [Enum.KeyCode.ButtonR2] = "Trigger", 
    [Enum.KeyCode.ButtonR3] = "Stick", 
    [Enum.KeyCode.Thumbstick1] = "Stick", 
    [Enum.KeyCode.Thumbstick2] = "Stick", 
    [Enum.KeyCode.ButtonSelect] = "MenuButton", 
    [Enum.KeyCode.ButtonStart] = "MenuButton", 
    [Enum.KeyCode.ButtonA] = "ButtonA", 
    [Enum.KeyCode.ButtonB] = "ButtonB", 
    [Enum.KeyCode.ButtonX] = "ButtonX", 
    [Enum.KeyCode.ButtonY] = "ButtonY"
};
local l_Granite_0 = Enum.Material.Granite;
local v9 = Vector3.new(0.032, 0.032, 0.032);
local v10 = {};
v10.__index = v10;
v10.new = function(v11)
    local v12 = setmetatable({}, v10);
    v12.userCFrame = v11;
    v12.model = v4.Create("Model")({
        Name = "TouchController", 
        Archivable = false
    });
    v12.origin = v4.Create("Part")({
        Parent = v12.model, 
        Name = "Origin", 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v12.scale = 1;
    v12.parts = {};
    for v13, v14 in pairs(v6[v11]) do
        local l_v9_0 = v9;
        if v14.scale then
            l_v9_0 = l_v9_0 * v14.scale;
        end;
        local v16 = v4.Create("Part")({
            Parent = v12.model, 
            Name = v13, 
            Anchored = true, 
            Material = l_Granite_0, 
            Size = v14.size or Vector3.new(0.05, 0.05, 0.05), 
            CFrame = v12.origin.CFrame * v14.offset, 
            CanCollide = false, 
            CanQuery = false, 
            CanTouch = false, 
            Transparency = v5 / 100
        });
        local _ = v4.Create("SpecialMesh")({
            Parent = v16, 
            Name = "Mesh", 
            MeshId = v14.meshId, 
            TextureId = v14.textureId, 
            Scale = l_v9_0
        });
        local _ = v4.Create("Weld")({
            Parent = v16, 
            Name = "Weld", 
            Part0 = v12.origin, 
            Part1 = v16, 
            C0 = v14.offset
        });
        v12.parts[v13] = v16;
    end;
    v12.model.PrimaryPart = v12.origin;
    return v12;
end;
v10.setCFrame = function(v19, v20)
    if v19.userCFrame == Enum.UserCFrame.RightHand then
        v19.model:SetPrimaryPartCFrame((v20 * CFrame.Angles(0.3490658503988659, 0, 0)) * CFrame.new(-0.03, 0.08, -0.06));
        return ;
    else
        v19.model:SetPrimaryPartCFrame((v20 * CFrame.Angles(0.3490658503988659, 0, 0)) * CFrame.new(0.03, 0.08, -0.06));
        return ;
    end;
end;
v10.setCFrameAndScale = function(v21, v22, v23)
    v21.model:SetPrimaryPartCFrame((v22 * CFrame.Angles(0.3490658503988659, 0, 0)) * CFrame.new((-0.03 * v23) * (v21.userCFrame == Enum.UserCFrame.RightHand and 1 or -1), 0.08 * v23, -0.06 * v23));
    if v21.scale ~= v23 then
        v21.scale = v23;
        for v24, v25 in pairs(v6[v21.userCFrame]) do
            local v26 = v21.parts[v24];
            if v26 then
                local l_v9_1 = v9;
                if v25.scale then
                    l_v9_1 = l_v9_1 * v25.scale;
                end;
                local l_Mesh_0 = v26:FindFirstChild("Mesh");
                local l_Weld_0 = v26:FindFirstChild("Weld");
                local l_offset_0 = v25.offset;
                local v31 = CFrame.new(l_offset_0.p * v21.scale) * (l_offset_0 - l_offset_0.p);
                v26.CFrame = v21.origin.CFrame * v31;
                if l_Mesh_0 then
                    l_Mesh_0.Scale = l_v9_1 * v21.scale;
                end;
                if l_Weld_0 then
                    l_Weld_0.C0 = v31;
                end;
            end;
        end;
    end;
end;
v10.setButtonState = function(v32, v33, v34)
    local v35 = v6[v32.userCFrame][v33];
    if v35 then
        local l_offset_1 = v35.offset;
        local l_moveOffset_0 = v35.moveOffset;
        if not (not l_offset_1 or not l_moveOffset_0) then
            l_offset_1 = CFrame.new(l_offset_1.p * v32.scale) * (l_offset_1 - l_offset_1.p);
            l_moveOffset_0 = CFrame.new(l_moveOffset_0.p * v32.scale) * (l_moveOffset_0 - l_moveOffset_0.p);
            local v38 = v32.parts[v33];
            if v38 then
                local l_Mesh_1 = v38:FindFirstChild("Mesh");
                local l_Weld_1 = v38:FindFirstChild("Weld");
                if l_Weld_1 then
                    if not v34 then
                        v38.CFrame = v32.origin.CFrame * l_offset_1;
                        l_Weld_1.C0 = l_offset_1;
                    else
                        v38.CFrame = (v32.origin.CFrame * l_offset_1) * l_moveOffset_0;
                        l_Weld_1.C0 = l_offset_1 * l_moveOffset_0;
                    end;
                end;
                if l_Mesh_1 then
                    if not v34 then
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
v10.setTriggerState = function(v41, v42)
    local l_offset_2 = v6[v41.userCFrame].Trigger.offset;
    l_offset_2 = CFrame.new(l_offset_2.p * v41.scale) * (l_offset_2 - l_offset_2.p);
    local l_Trigger_0 = v41.parts.Trigger;
    local l_Weld_2 = l_Trigger_0:FindFirstChild("Weld");
    if l_Weld_2 then
        local v46 = Vector3.new(0, 0.05, 0.025) * v41.scale;
        local v47 = ((l_offset_2 * CFrame.new(v46)) * CFrame.Angles(v42 * 0.3490658503988659 + 0, 0, 0)) * CFrame.new(-v46);
        l_Trigger_0.CFrame = v41.origin.CFrame * v47;
        l_Weld_2.C0 = v47;
    end;
end;
v10.setStickState = function(v48, v49)
    local l_offset_3 = v6[v48.userCFrame].Stick.offset;
    l_offset_3 = CFrame.new(l_offset_3.p * v48.scale) * (l_offset_3 - l_offset_3.p);
    local l_Stick_0 = v48.parts.Stick;
    local l_Weld_3 = l_Stick_0:FindFirstChild("Weld");
    if l_Weld_3 then
        local v53 = Vector3.new(-8.0E-4, -0.0269, 0.0013) * v48.scale;
        local v54 = ((l_offset_3 * CFrame.new(v53)) * CFrame.Angles(v49.Y * 0.3490658503988659 + 0, 0, v49.X * 0.3490658503988659 + 0)) * CFrame.new(-v53);
        l_Stick_0.CFrame = v48.origin.CFrame * v54;
        l_Weld_3.C0 = v54;
    end;
end;
v10.onInputPositionChanged = function(v55, v56)
    if not (not (v55.userCFrame == Enum.UserCFrame.RightHand) or v56.KeyCode ~= Enum.KeyCode.ButtonR2) or v55.userCFrame == Enum.UserCFrame.LeftHand and v56.KeyCode == Enum.KeyCode.ButtonL2 then
        v55:setTriggerState(v56.Position.Z);
        return ;
    elseif not (not (v55.userCFrame == Enum.UserCFrame.RightHand) or v56.KeyCode ~= Enum.KeyCode.Thumbstick2) or v55.userCFrame == Enum.UserCFrame.LeftHand and v56.KeyCode == Enum.KeyCode.Thumbstick1 then
        v55:setStickState(v56.Position);
        return ;
    else
        return ;
    end;
end;
v10.onButtonInputChanged = function(v57, v58, v59)
    if not (((((((((not (v57.userCFrame == Enum.UserCFrame.LeftHand) or v58.KeyCode ~= Enum.KeyCode.ButtonL1) and (not (v57.userCFrame == Enum.UserCFrame.RightHand) or v58.KeyCode ~= Enum.KeyCode.ButtonR1)) and (not (v57.userCFrame == Enum.UserCFrame.LeftHand) or v58.KeyCode ~= Enum.KeyCode.ButtonL3)) and (not (v57.userCFrame == Enum.UserCFrame.RightHand) or v58.KeyCode ~= Enum.KeyCode.ButtonR3)) and (not (v57.userCFrame == Enum.UserCFrame.LeftHand) or v58.KeyCode ~= Enum.KeyCode.ButtonSelect)) and (not (v57.userCFrame == Enum.UserCFrame.RightHand) or v58.KeyCode ~= Enum.KeyCode.ButtonStart)) and v58.KeyCode ~= Enum.KeyCode.ButtonA) and v58.KeyCode ~= Enum.KeyCode.ButtonB) and v58.KeyCode ~= Enum.KeyCode.ButtonX) or v58.KeyCode == Enum.KeyCode.ButtonY then
        v57:setButtonState(v7[v58.KeyCode], v59);
    end;
end;
v10.onInputBegan = function(v60, v61)
    v60:onButtonInputChanged(v61, true);
end;
v10.onInputChanged = function(v62, v63)
    v62:onInputPositionChanged(v63);
end;
v10.onInputEnded = function(v64, v65)
    v64:onInputPositionChanged(v65);
    v64:onButtonInputChanged(v65, false);
end;
v10.onTouchpadModeChanged = function(_, _, _)
end;
v10.destroy = function(v69)
    v69.model:Destroy();
end;
v10.getButtonPart = function(v70, v71)
    local v72 = v7[v71];
    if not v72 then
        return nil;
    else
        return v70.parts[v72];
    end;
end;
return v10;
