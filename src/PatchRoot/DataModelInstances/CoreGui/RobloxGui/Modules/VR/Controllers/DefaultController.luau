local _ = game:GetService("VRService");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.Common.CommonUtil);
local l_Granite_0 = Enum.Material.Granite;
local v3 = Vector3.new(1, 1, 1);
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    local v6 = setmetatable({}, v4);
    v6.userCFrame = v5;
    v6.model = v1.Create("Model")({
        Name = "TouchController", 
        Archivable = false
    });
    v6.origin = v1.Create("Part")({
        Parent = v6.model, 
        Name = "Origin", 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v6.parts = {};
    local v7 = v1.Create("Part")({
        Parent = v6.model, 
        Name = "body", 
        Anchored = false, 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false, 
        Material = l_Granite_0, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        Transparency = 0.5, 
        CFrame = v6.origin.CFrame
    });
    local _ = v1.Create("SpecialMesh")({
        Parent = v7, 
        Name = "Mesh", 
        MeshId = v5 == Enum.UserCFrame.LeftHand and "rbxassetid://8650168403" or "rbxassetid://8650168401", 
        Scale = v3
    });
    local _ = v1.Create("Weld")({
        Parent = v7, 
        Name = "Weld", 
        Part0 = v6.origin, 
        Part1 = v7, 
        C0 = CFrame.new(0, -0.115, 0.213)
    });
    v6.parts.body = v7;
    v6.model.PrimaryPart = v6.origin;
    return v6;
end;
v4.setCFrame = function(v10, v11)
    v10.model:SetPrimaryPartCFrame(v11 * CFrame.Angles(1.5707963267948966, 0, 0));
end;
v4.onButtonInputChanged = function(_, _, _)
end;
v4.onInputBegan = function(v15, v16)
    v15:onButtonInputChanged(v16, true);
end;
v4.onInputChanged = function(_, _)
end;
v4.onInputEnded = function(v19, v20)
    v19:onButtonInputChanged(v20, false);
end;
v4.onTouchpadModeChanged = function(_, _, _)
end;
return v4;
