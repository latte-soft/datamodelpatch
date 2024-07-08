local _ = game:GetService("VRService");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_game_EngineFeature_0 = game:GetEngineFeature("OpenXrForWin32");
local v4 = require(l_CoreGui_0.RobloxGui.Modules.Common.CommonUtil);
local l_Granite_0 = Enum.Material.Granite;
local v6 = not not l_game_EngineFeature_0 and Vector3.new(3.4, 3.4, 3.4) or Vector3.new(3.6, 3.6, 3.6);
local v7 = {};
v7.__index = v7;
v7.new = function(v8)
    local v9 = setmetatable({}, v7);
    v9.userCFrame = v8;
    v9.model = v4.Create("Model")({
        Name = "IndexController", 
        Archivable = false
    });
    v9.origin = v4.Create("Part")({
        Parent = v9.model, 
        Name = "Origin", 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v9.parts = {};
    local v10 = v4.Create("Part")({
        Parent = v9.model, 
        Name = "body", 
        Anchored = true, 
        Material = l_Granite_0, 
        Size = Vector3.new(0.05, 0.05, 0.05), 
        Transparency = 0.25, 
        CFrame = v9.origin.CFrame, 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v9.mesh = v4.Create("SpecialMesh")({
        Parent = v10, 
        Name = "Mesh", 
        MeshId = v8 == Enum.UserCFrame.LeftHand and "rbxassetid://9605099531" or "rbxassetid://9605114549", 
        TextureId = v8 == Enum.UserCFrame.LeftHand and "rbxassetid://9605099774" or "rbxassetid://9605114771", 
        Scale = v6
    });
    local _ = v4.Create("Weld")({
        Parent = v10, 
        Name = "Weld", 
        Part0 = v9.origin, 
        Part1 = v10
    });
    v9.parts.body = v10;
    v9.model.PrimaryPart = v9.origin;
    return v9;
end;
v7.setCFrame = function(v12, v13)
    if not l_game_EngineFeature_0 then
        if v12.userCFrame == Enum.UserCFrame.RightHand then
            v12.model:SetPrimaryPartCFrame((v13 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0)) * CFrame.new(-0.1, -0.03, -0.4));
            return ;
        else
            v12.model:SetPrimaryPartCFrame((v13 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0)) * CFrame.new(0.1, -0.03, -0.4));
            return ;
        end;
    elseif v12.userCFrame == Enum.UserCFrame.RightHand then
        v12.model:SetPrimaryPartCFrame((v13 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0)) * CFrame.new(-0.1, 0.08, -0.01));
        return ;
    else
        v12.model:SetPrimaryPartCFrame((v13 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0)) * CFrame.new(0.1, 0.08, -0.01));
        return ;
    end;
end;
v7.setCFrameAndScale = function(v14, v15, v16)
    local v17 = v14.userCFrame == Enum.UserCFrame.RightHand and 1 or -1;
    if not l_game_EngineFeature_0 then
        v14.model:SetPrimaryPartCFrame((v15 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0)) * CFrame.new((-0.1 * v16) * v17, -0.03 * v16, -0.4 * v16));
    else
        v14.model:SetPrimaryPartCFrame((v15 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0)) * CFrame.new((-0.1 * v16) * v17, 0.08 * v16, -0.01 * v16));
    end;
    v14.mesh.Scale = v6 * v16;
end;
v7.onButtonInputChanged = function(_, _, _)
end;
v7.onInputBegan = function(v21, v22)
    v21:onButtonInputChanged(v22, true);
end;
v7.onInputChanged = function(_, _)
end;
v7.onInputEnded = function(v25, v26)
    v25:onButtonInputChanged(v26, false);
end;
v7.onTouchpadModeChanged = function(_, _, _)
end;
return v7;
