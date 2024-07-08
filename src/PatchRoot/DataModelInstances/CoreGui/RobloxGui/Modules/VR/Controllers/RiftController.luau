local _ = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Common.CommonUtil);
local l_Granite_0 = Enum.Material.Granite;
local v5 = Vector3.new(0.032, 0.032, 0.032);
local v6 = {};
v6.__index = v6;
v6.new = function(v7)
    local v8 = setmetatable({}, v6);
    v8.userCFrame = v7;
    v8.model = v3.Create("Model")({
        Name = "RiftController", 
        Archivable = false
    });
    v8.origin = v3.Create("Part")({
        Parent = v8.model, 
        Name = "Origin", 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v8.parts = {};
    local v9 = v3.Create("Part")({
        Parent = v8.model, 
        Name = "body", 
        Anchored = true, 
        Material = l_Granite_0, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        Transparency = 0.25, 
        CFrame = v8.origin.CFrame, 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v8.mesh = v3.Create("SpecialMesh")({
        Parent = v9, 
        Name = "Mesh", 
        MeshId = v7 == Enum.UserCFrame.LeftHand and "rbxassetid://9597097835" or "rbxassetid://9597101144", 
        TextureId = "rbxassetid://9597123835", 
        Scale = v5
    });
    local _ = v3.Create("Weld")({
        Parent = v9, 
        Name = "Weld", 
        Part0 = v8.origin, 
        Part1 = v9
    });
    v8.parts.body = v9;
    v8.model.PrimaryPart = v8.origin;
    return v8;
end;
v6.setCFrame = function(v11, v12)
    v11.model:SetPrimaryPartCFrame((v12 * CFrame.Angles(0.3490658503988659, 0, 0)) * CFrame.new(0, -0.03, 0.06));
end;
v6.setCFrameAndScale = function(v13, v14, v15)
    v13.model:SetPrimaryPartCFrame((v14 * CFrame.Angles(0.3490658503988659, 0, 0)) * CFrame.new(0, -0.03 * v15, 0.06 * v15));
    v13.mesh.Scale = v5 * v15;
end;
v6.onButtonInputChanged = function(_, _, _)
end;
v6.onInputBegan = function(v19, v20)
    v19:onButtonInputChanged(v20, true);
end;
v6.onInputChanged = function(_, _)
end;
v6.onInputEnded = function(v23, v24)
    v23:onButtonInputChanged(v24, false);
end;
v6.onTouchpadModeChanged = function(_, _, _)
end;
return v6;
