local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.React);
local l_CharacterUtility_0 = require(l_Parent_0.Thumbnailing).CharacterUtility;
local l_CameraUtility_0 = require(l_Parent_0.Thumbnailing).CameraUtility;
local l_CFrameUtility_0 = require(l_Parent_0.Thumbnailing).CFrameUtility;
local l_EmoteUtility_0 = require(l_Parent_0.Thumbnailing).EmoteUtility;
return function(v7)
    local v8 = v2.useRef(nil);
    local v9, v10 = v2.useBinding(nil);
    local v11 = v2.useRef(false);
    v2.useEffect(function()
        v11.current = true;
        return function()
            v11.current = false;
        end;
    end, {});
    v2.useEffect(function()
        task.spawn(function()
            local v12 = v7.model:Clone();
            assert(v12.PrimaryPart, "The Model should have a PrimaryPart for setting up Camera");
            v12.Parent = v8.current;
            v12:MoveTo((Vector3.new(0, 0, 0)));
            l_EmoteUtility_0.SetPlayerCharacterPoseWithMoodFallback(v12);
            l_RunService_0.PostSimulation:Wait();
            if v11.current then
                local l_Camera_0 = Instance.new("Camera");
                l_Camera_0.CameraType = Enum.CameraType.Scriptable;
                l_Camera_0.Parent = v8.current;
                local v14 = nil;
                local v15 = l_CFrameUtility_0.CalculateTargetCFrame(v12.Head.CFrame);
                v14 = (v15 - v15.Position) + v12.PrimaryPart.CFrame.Position;
                local v16, v17 = l_CharacterUtility_0.CalculateModelExtents(v12, v14);
                l_CameraUtility_0.SetupCamera(l_Camera_0, {
                    optFieldOfView = 30, 
                    targetCFrame = v14, 
                    minExtent = v16, 
                    maxExtent = v17, 
                    extentScale = 1, 
                    optCameraXRot = l_CameraUtility_0.XRotForFullBody, 
                    optCameraDistanceScale = l_CameraUtility_0.DistanceScaleForFullBody, 
                    extentScale = l_CameraUtility_0.DefaultBodyMarginScale
                });
                v10(l_Camera_0);
                return ;
            else
                return ;
            end;
        end);
    end, {});
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v7.Size, 
        Position = v7.Position, 
        LayoutOrder = v7.LayoutOrder
    }, {
        ViewportFrame = v2.createElement("ViewportFrame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LightColor = Color3.fromRGB(240, 240, 240), 
            Ambient = Color3.fromRGB(160, 160, 160), 
            LightDirection = Vector3.new(9.5, -12, 7.5), 
            CurrentCamera = v9
        }, {
            WorldModel = v2.createElement("WorldModel", {
                ref = v8
            })
        })
    });
end;
