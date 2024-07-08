local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.usePanel3DRenderStep);
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v7 = require(l_Parent_3.React);
local v8 = require(l_Parent_3.Roact);
local l_Object_0 = require(l_Parent_3.LuauPolyfill).Object;
local v10 = require(l_Parent_2.Core.Utility.GetEngineFeatureSafe);
local v11 = require(l_Parent_1.Spatial.SurfaceGuiWithAdornee);
local v12 = require(l_Parent_2.UIBloxConfig);
local v13 = v10("CurvedSurfaceGuisEnabled");
local v14 = {
    partSize = Vector2.new(10, 10), 
    virtualScreenSize = Vector2.new(10, 10), 
    offset = CFrame.new(0, 0, 0), 
    lerp = false, 
    tilt = 0, 
    anchoring = v2.AnchoringTypes.World, 
    faceCamera = false, 
    panelName = "PanelBase", 
    movementUpdateEvent = l_RunService_0.RenderStepped, 
    vrService = game:GetService("VRService"), 
    alwaysOnTop = true, 
    parent = workspace, 
    hidden = false, 
    curvature = 1, 
    zOffset = 0
};
return function(v15)
    local v16 = l_Object_0.assign({}, v14, v15);
    if not v12.refactorPanel3D then
        local v17 = v7.useRef(nil);
        local v18 = v7.useRef(nil);
        local v19 = v7.useRef(nil);
        v3(v16, v17);
        return (v7.createElement("Folder", {
            ref = v19, 
            Archivable = false
        }, {
            WorkspacePortal = v7.createElement(v8.Portal, {
                target = v16.parent
            }, {
                GUIPart = if not v16.hidden then v7.createElement("Part", {
                    Name = v16.panelName .. "_Part", 
                    ref = v17, 
                    Anchored = true, 
                    CFrame = v16.offset * CFrame.Angles(math.rad(v16.tilt), 0, 0), 
                    Size = Vector3.new(v16.partSize.X, v16.partSize.Y, 0.05), 
                    Transparency = 1, 
                    Color = Color3.new(0, 0, 0), 
                    CanCollide = false, 
                    CanTouch = false
                }) else nil
            }), 
            AppUI = v7.createElement("SurfaceGui", {
                Name = v16.panelName .. "_SurfaceGui", 
                ref = v18, 
                Adornee = v17, 
                Active = true, 
                Enabled = not v16.hidden, 
                CanvasSize = v16.virtualScreenSize, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                LightInfluence = 0, 
                children = v16.children, 
                AlwaysOnTop = v16.alwaysOnTop, 
                Shape = if not not v13 and v16.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else nil, 
                HorizontalCurvature = if not v13 then nil else v16.curvature, 
                ZOffset = v16.zOffset
            })
        }));
    else
        local v20, v21 = v3(v16, nil);
        return v7.createElement(v11, {
            name = v16.panelName, 
            detached = true, 
            adorneeProps = {
                Size = v20, 
                CFrame = v21, 
                Parent = v16.parent
            }, 
            surfaceGuiProps = {
                Enabled = not v16.hidden, 
                CanvasSize = v16.virtualScreenSize, 
                Shape = if not not v13 and v16.curvature ~= 0 then Enum.SurfaceGuiShape.CurvedHorizontally else nil, 
                HorizontalCurvature = if not v13 then nil else v16.curvature, 
                ZOffset = v16.zOffset
            }
        }, v16.children);
    end;
end;
