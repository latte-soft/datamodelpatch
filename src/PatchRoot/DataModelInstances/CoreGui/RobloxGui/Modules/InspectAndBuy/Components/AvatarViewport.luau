local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Cryo);
local v8 = require(l_Parent_0.Colors);
local v9 = require(l_Parent_0.CharacterModelPool);
local v10 = require(l_Parent_0.Components.InspectAndBuyContext);
local v11 = v5.PureComponent:extend("AvatarViewport");
v11.init = function(v12)
    v12.viewportFrameRef = v5.createRef();
    v12.worldModelRef = v5.createRef();
    v12.connections = {};
    v12.xRotation = 0;
    v12.yRotation = 0;
    v12.rotationDeltaX = 0;
    v12.rotationDeltaY = 0;
    v12.mouseOrTouchDown = false;
    v12.delta = 0;
    v12.keys = {};
    v12.lastPosition = Vector3.new(0, 0, 0);
    v12.viewportCamera = Instance.new("Camera");
    v12.viewportCamera.CameraType = Enum.CameraType.Scriptable;
    v12.model = v12.props.model;
    v12.lastInputTime = 2;
    v12.initialHrpPosition = v12.props.model ~= nil and v12.props.model.HumanoidRootPart.Position or nil;
end;
v11.didMount = function(v13)
    if not (not v13.props.humanoidDescription or not v13.model) then
        v13.viewportCamera.Parent = v13.viewportFrameRef.current;
        v13.viewportFrameRef.current.CurrentCamera = v13.viewportCamera;
        v13:setRotation();
        v13.characterModelPool = v9.new(v13.worldModelRef, v13.initialHrpPosition, v13.model.Humanoid.RigType);
    end;
    v13.isMounted = true;
    v13:handleSpin();
    v13:setUpGamepad();
end;
v11.didUpdate = function(v14, v15, _)
    if not (not (v14.props.visible and v14.props.humanoidDescription ~= v15.humanoidDescription) or not v14.model) then
        coroutine.wrap(function()
            v14.characterModelPool:maybeUpdateCharacter(v14.props.humanoidDescription);
        end)();
    end;
    v14.gamepadRotating = false;
    v14.viewportCamera.Parent = v14.viewportFrameRef.current;
    v14.viewportFrameRef.current.CurrentCamera = v14.viewportCamera;
    if v14.props.gamepadEnabled ~= v15.gamepadEnabled then
        if not v14.props.gamepadEnabled then
            v14:unbindActions();
        else
            v14:setUpGamepad();
            return ;
        end;
    end;
end;
v11.setRotation = function(v17)
    local l_model_0 = v17.model;
    local l_view_0 = v17.props.view;
    local v20 = nil;
    v20 = v17.props.views[l_view_0];
    if l_model_0 then
        local v21 = v17.initialHrpPosition or l_model_0.HumanoidRootPart.Position;
        local l_DefaultCameraOffset_0 = v20.DefaultCameraOffset;
        if v17.model:FindFirstChildOfClass("Tool") then
            l_DefaultCameraOffset_0 = v20.ToolOffset;
        end;
        v17.viewportCamera.CFrame = CFrame.new((((CFrame.new(v21) * CFrame.Angles(0, -v17.yRotation, 0)) * CFrame.Angles(v17.xRotation, 0, 0)) * l_DefaultCameraOffset_0).p, v21);
    end;
end;
v11.render = function(v23)
    local l_size_0 = v23.props.size;
    local l_position_0 = v23.props.position;
    local l_visible_0 = v23.props.visible;
    local l_backgroundTransparency_0 = v23.props.backgroundTransparency;
    local l_setScrollingEnabled_0 = v23.props.setScrollingEnabled;
    return v5.createElement("ViewportFrame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = l_position_0, 
        Size = l_size_0, 
        BackgroundTransparency = l_backgroundTransparency_0, 
        BackgroundColor3 = v8.Graphite, 
        BorderSizePixel = 0, 
        Active = true, 
        Visible = l_visible_0, 
        [v5.Ref] = v23.viewportFrameRef, 
        [v5.Event.InputBegan] = function(_, v30)
            if v30.UserInputState == Enum.UserInputState.Begin then
                v23.mouseOrTouchDown = true;
                v23.lastPosition = v30.Position;
                l_setScrollingEnabled_0(false);
                local v34 = l_UserInputService_0.InputChanged:connect(function(v31, _)
                    if v31.UserInputType == Enum.UserInputType.MouseMovement and v23.mouseOrTouchDown or v31.UserInputType == Enum.UserInputType.Touch then
                        local v33 = v31.Position - v23.lastPosition;
                        v23.lastPosition = v31.Position;
                        v23.yRotation = v23.yRotation + v33.x * 0.0065;
                        v23.xRotation = v23.xRotation + v33.y * 0.0065;
                        v23.lastInputTime = tick();
                    end;
                end);
                local v37 = l_UserInputService_0.InputEnded:connect(function(v35, _)
                    if not (v35.UserInputType ~= Enum.UserInputType.MouseButton1) or v35.UserInputType == Enum.UserInputType.Touch then
                        if v23.mouseOrTouchDown then
                            v23.mouseOrTouchDown = false;
                            v23.lastInputTime = tick();
                            v23:removeConnections();
                        end;
                        l_setScrollingEnabled_0(true);
                    end;
                end);
                table.insert(v23.connections, v34);
                table.insert(v23.connections, v37);
            end;
        end
    }, {
        WorldModel = v5.createElement("WorldModel", {
            [v5.Ref] = v23.worldModelRef
        })
    });
end;
v11.handleSpin = function(v38)
    local v39 = false;
    spawn(function()
        while v38.isMounted do
            if (not (tick() - v38.lastInputTime > 2) or v38.mouseOrTouchDown) or v38.gamepadRotating then
                v39 = false;
            else
                v39 = true;
            end;
            local function _(v40, v41)
                v40 = v40 % 6.283185307179586;
                if v40 > 3.141592653589793 then
                    v40 = v40 + v41;
                    if v40 > 6.283185307179586 then
                        return 0;
                    end;
                else
                    v40 = v40 - v41;
                    if v40 < 0 then
                        return 0;
                    end;
                end;
                return v40;
            end;
            if not v39 then
                if v38.gamepadRotating then
                    v38.yRotation = v38.yRotation + v38.delta * v38.rotationDeltaY;
                    v38.xRotation = v38.xRotation + v38.delta * v38.rotationDeltaX;
                end;
            else
                local l_v38_0 = v38;
                local v44 = v38.xRotation % 6.283185307179586;
                local v45;
                if v44 > 3.141592653589793 then
                    v44 = v44 + 0.03490658503988659;
                    if v44 > 6.283185307179586 then
                        v45 = 0;
                        goto label0 --[[  true, true  ]];
                    end;
                else
                    v44 = v44 - 0.03490658503988659;
                    if v44 < 0 then
                        v45 = 0;
                        goto label0 --[[  true, true  ]];
                    end;
                end;
                v45 = v44;
                ::label0::;
                l_v38_0.xRotation = v45;
                v38.yRotation = v38.yRotation + 0.012217304763960306;
            end;
            v38:setRotation();
            v38.delta = l_RunService_0.RenderStepped:wait();
        end;
    end);
end;
v11.setUpGamepad = function(v46)
    if l_UserInputService_0.GamepadEnabled then
        local v47 = Vector2.new(0, 0);
        l_ContextActionService_0:UnbindCoreAction("RotateModel");
        do
            local l_v47_0 = v47;
            l_ContextActionService_0:BindCoreAction("RotateModel", function(_, v50, v51)
                if v50 == Enum.UserInputState.Change then
                    l_v47_0 = v51.Position or l_v47_0;
                    l_v47_0 = Vector2.new(l_v47_0.X, l_v47_0.Y);
                    if not (math.abs(l_v47_0.X) <= 0.2) or math.abs(l_v47_0.Y) > 0.2 then
                        v46.lastInputTime = tick();
                        v46.gamepadRotating = true;
                        v46.rotationDeltaY = 3 * l_v47_0.X;
                        v46.rotationDeltaX = 3 * l_v47_0.Y;
                    else
                        v46.gamepadRotating = false;
                    end;
                end;
                return Enum.ContextActionResult.Sink;
            end, false, Enum.KeyCode.Thumbstick2, Enum.KeyCode.ButtonA);
        end;
    end;
end;
v11.unbindActions = function(_)
    l_ContextActionService_0:UnbindCoreAction("RotateModel");
end;
v11.removeConnections = function(v53)
    for _, v55 in pairs(v53.connections) do
        v55:disconnect();
    end;
end;
v11.willUnmount = function(v56)
    v56.isMounted = false;
    if v56.characterModelPool then
        v56.characterModelPool:onDestroy();
    end;
    v56:unbindActions();
    v56:removeConnections();
end;
return v6.UNSTABLE_connect2(function(v57, _)
    return {
        view = v57.view, 
        tryingOnInfo = v57.tryingOnInfo, 
        gamepadEnabled = v57.gamepadEnabled
    };
end)(function(v59)
    return v5.createElement(v10.Consumer, {
        render = function(v60)
            return v5.createElement(v11, (v7.Dictionary.join(v59, {
                views = v60
            })));
        end
    });
end);
