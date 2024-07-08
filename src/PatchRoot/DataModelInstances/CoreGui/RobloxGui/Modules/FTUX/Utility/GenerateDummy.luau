local v0 = {};
local v1 = {};
local v2 = {
    ID = 0, 
    Type = "Model", 
    Properties = {
        Name = "Safety Bubble Dummy", 
        PrimaryPart = "_R:1_"
    }, 
    Children = {
        {
            ID = 1, 
            Type = "Part", 
            Properties = {
                Transparency = 0.5, 
                Name = "HumanoidRootPart", 
                Size = Vector3.new(2, 2, 1), 
                Anchored = true, 
                BottomSurface = Enum.SurfaceType.Smooth, 
                TopSurface = Enum.SurfaceType.Smooth
            }, 
            Children = {
                {
                    ID = 2, 
                    Type = "Motor6D", 
                    Properties = {
                        Part1 = "_R:3_", 
                        Name = "Root Hip", 
                        C1 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), 
                        C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), 
                        Part0 = "_R:1_", 
                        MaxVelocity = 0.10000000149011612
                    }, 
                    Children = {}
                }
            }
        }, 
        {
            ID = 3, 
            Type = "Part", 
            Properties = {
                Size = Vector3.new(2, 2, 1), 
                BottomSurface = Enum.SurfaceType.Smooth, 
                Name = "Torso", 
                TopSurface = Enum.SurfaceType.Smooth
            }, 
            Children = {
                {
                    ID = 4, 
                    Type = "Motor6D", 
                    Properties = {
                        Part1 = "_R:9_", 
                        Name = "Left Hip", 
                        C1 = CFrame.new(-0.5, 1, 0, -4.371138828673793E-8, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793E-8), 
                        C0 = CFrame.new(-1, -1, 0, -4.371138828673793E-8, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793E-8), 
                        Part0 = "_R:3_", 
                        MaxVelocity = 0.10000000149011612
                    }, 
                    Children = {}
                }, 
                {
                    ID = 5, 
                    Type = "Motor6D", 
                    Properties = {
                        Part1 = "_R:10_", 
                        Name = "Right Hip", 
                        C1 = CFrame.new(0.5, 1, 0, -4.371138828673793E-8, 0, 1, 0, 0.9999999403953552, 0, -1, 0, -4.371138828673793E-8), 
                        C0 = CFrame.new(1, -1, 0, -4.371138828673793E-8, 0, 1, 0, 0.9999999403953552, 0, -1, 0, -4.371138828673793E-8), 
                        Part0 = "_R:3_", 
                        MaxVelocity = 0.10000000149011612
                    }, 
                    Children = {}
                }, 
                {
                    ID = 6, 
                    Type = "Motor6D", 
                    Properties = {
                        Part1 = "_R:11_", 
                        Name = "Left Shoulder", 
                        C1 = CFrame.new(0.5, 0.5, 0, -4.371138828673793E-8, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793E-8), 
                        C0 = CFrame.new(-1, 0.5, 0, -4.371138828673793E-8, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793E-8), 
                        Part0 = "_R:3_", 
                        MaxVelocity = 0.10000000149011612
                    }, 
                    Children = {}
                }, 
                {
                    ID = 7, 
                    Type = "Motor6D", 
                    Properties = {
                        Part1 = "_R:12_", 
                        Name = "Right Shoulder", 
                        C1 = CFrame.new(-0.5, 0.5, 0, -4.371138828673793E-8, 0, 1, 0, 0.9999999403953552, 0, -1, 0, -4.371138828673793E-8), 
                        C0 = CFrame.new(1, 0.5, 0, -4.371138828673793E-8, 0, 1, 0, 0.9999999403953552, 0, -1, 0, -4.371138828673793E-8), 
                        Part0 = "_R:3_", 
                        MaxVelocity = 0.10000000149011612
                    }, 
                    Children = {}
                }, 
                {
                    ID = 8, 
                    Type = "Motor6D", 
                    Properties = {
                        Part1 = "_R:13_", 
                        Name = "Neck", 
                        C1 = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), 
                        C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0), 
                        Part0 = "_R:3_", 
                        MaxVelocity = 0.10000000149011612
                    }, 
                    Children = {}
                }
            }
        }, 
        {
            ID = 9, 
            Type = "Part", 
            Properties = {
                Size = Vector3.new(1, 2, 1), 
                Name = "Left Leg", 
                CanCollide = false, 
                BottomSurface = Enum.SurfaceType.Smooth, 
                CFrame = CFrame.new(-0.5, -1.9999998807907104, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1), 
                Position = Vector3.new(-0.5, -1.9999998807907104, 0), 
                TopSurface = Enum.SurfaceType.Smooth
            }, 
            Children = {}
        }, 
        {
            ID = 10, 
            Type = "Part", 
            Properties = {
                Size = Vector3.new(1, 2, 1), 
                Name = "Right Leg", 
                CanCollide = false, 
                BottomSurface = Enum.SurfaceType.Smooth, 
                CFrame = CFrame.new(0.5, -1.9999998807907104, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1), 
                Position = Vector3.new(0.5, -1.9999998807907104, 0), 
                TopSurface = Enum.SurfaceType.Smooth
            }, 
            Children = {}
        }, 
        {
            ID = 11, 
            Type = "Part", 
            Properties = {
                Size = Vector3.new(1, 2, 1), 
                Name = "Left Arm", 
                CanCollide = false, 
                BottomSurface = Enum.SurfaceType.Smooth, 
                CFrame = CFrame.new(-1.5, 5.960464477539063E-8, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1), 
                Position = Vector3.new(-1.5, 5.960464477539063E-8, 0), 
                TopSurface = Enum.SurfaceType.Smooth
            }, 
            Children = {}
        }, 
        {
            ID = 12, 
            Type = "Part", 
            Properties = {
                Size = Vector3.new(1, 2, 1), 
                Name = "Right Arm", 
                CanCollide = false, 
                BottomSurface = Enum.SurfaceType.Smooth, 
                CFrame = CFrame.new(1.5, 5.960464477539063E-8, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1), 
                Position = Vector3.new(1.5, 5.960464477539063E-8, 0), 
                TopSurface = Enum.SurfaceType.Smooth
            }, 
            Children = {}
        }, 
        {
            ID = 13, 
            Type = "Part", 
            Properties = {
                Name = "Head", 
                Position = Vector3.new(0, 1.5, 0), 
                Size = Vector3.new(2, 1, 1), 
                CFrame = CFrame.new(0, 1.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), 
                BottomSurface = Enum.SurfaceType.Smooth, 
                TopSurface = Enum.SurfaceType.Smooth
            }, 
            Children = {
                {
                    ID = 14, 
                    Type = "Decal", 
                    Properties = {
                        Name = "Face", 
                        Texture = "rbxasset://textures/face.png"
                    }, 
                    Children = {}
                }, 
                {
                    ID = 15, 
                    Type = "SpecialMesh", 
                    Properties = {
                        Scale = Vector3.new(1.25, 1.25, 1.25)
                    }, 
                    Children = {}
                }
            }
        }, 
        {
            ID = 16, 
            Type = "Humanoid", 
            Properties = {}, 
            Children = {}
        }
    }
};
local function v3(v4, v5, v6, v7)
    local v8 = Instance.new(v4.Type);
    if v4.ID then
        local v9 = v1[v4.ID];
        if not v9 then
            v0[v4.ID] = v8;
        else
            v9[1][v9[2]] = v8;
            v1[v4.ID] = nil;
        end;
    end;
    for v10, v11 in pairs(v4.Properties) do
        if type(v11) == "string" then
            local v12 = tonumber(v11:match("^_R:(%w+)_$"));
            if v12 then
                if not v0[v12] then
                    v1[v12] = {
                        v8, 
                        v10
                    };
                    v11 = nil;
                else
                    v11 = v0[v12];
                end;
            end;
        end;
        v8[v10] = v11;
    end;
    for _, v14 in pairs(v4.Children) do
        v3(v14, v8, v6, v7);
    end;
    v8.Parent = v5;
    if v8:IsA("Part") then
        v8.Position = v8.Position + v6;
        v8.Orientation = v8.Orientation + v7;
        v8.Anchored = true;
    end;
    return v8;
end;
return function(v15, v16)
    return (v3(v2, nil, v15, v16));
end;
