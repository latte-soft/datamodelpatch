local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils();
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_CorePackages_0.Roact);
local v8 = require(l_Parent_0.RoactUtilities.ExternalEventConnection);
local v9 = require(l_CorePackages_0.Rodux);
local v10 = require(l_CorePackages_0.RoactRodux);
local v11 = require(l_CorePackages_0.Cryo);
local function v14(v12, v13)
    v12 = v12 or {
        left = 0, 
        right = 0, 
        up = 0, 
        pause = 0
    };
    if v13.type == "SetPlayerInput" then
        return v11.Dictionary.join(v12, {
            [v13.playerInput] = v13.value
        });
    else
        return v12;
    end;
end;
local function v19(v15, v16)
    v15 = v15 or {
        position = Vector2.new(0, 0), 
        velocity = Vector2.new(0, 0), 
        angle = 0, 
        turnRate = 1.5707963267948966, 
        throttleRate = 10
    };
    if v16.type == "GameStep" then
        local l_inputs_0 = v16.inputs;
        local l_delta_0 = v16.delta;
        return v11.Dictionary.join(v15, {
            position = v15.position + v15.velocity * l_delta_0, 
            velocity = v15.velocity + ((l_inputs_0.up * v15.throttleRate) * l_delta_0) * Vector2.new(math.sin(v15.angle), -math.cos(v15.angle)), 
            angle = v15.angle + ((l_inputs_0.right - l_inputs_0.left) * v15.turnRate) * l_delta_0
        });
    elseif v16.type == "SetPlayerRotation" then
        return v11.Dictionary.join(v15, {
            angle = v16.value
        });
    else
        return v15;
    end;
end;
local function _(v20, v21)
    v20 = v20 or 0;
    if v21.type == "GameStep" then
        return v20 + v21.delta;
    else
        return v20;
    end;
end;
local function v33(v23, v24)
    v23 = v23 or (function()
        return {
            {
                position = Vector2.new(-5, -5), 
                velocity = Vector2.new(1, 0), 
                size = 5
            }, 
            {
                position = Vector2.new(-5, 5), 
                velocity = Vector2.new(1, 0), 
                size = 3
            }, 
            {
                position = Vector2.new(5, 5), 
                velocity = Vector2.new(0, -1), 
                size = 5
            }, 
            {
                position = Vector2.new(5, -5), 
                velocity = Vector2.new(0, 1), 
                size = 3
            }
        };
    end)();
    if v24.type == "GameStep" then
        local l_delta_1 = v24.delta;
        local v26 = {};
        for v27, v28 in pairs(v23) do
            local l_X_0 = v28.position.X;
            local l_Y_0 = v28.position.Y;
            local l_X_1 = v28.velocity.X;
            local l_Y_1 = v28.velocity.Y;
            v26[v27] = {
                position = Vector2.new(l_X_0 + l_X_1 * l_delta_1, l_Y_0 + l_Y_1 * l_delta_1), 
                velocity = Vector2.new(l_X_1, l_Y_1), 
                size = v28.size
            };
        end;
        return v26;
    else
        return v23;
    end;
end;
local function _(v34)
    local v35 = false;
    if v34.playerInput == "pause" then
        v35 = v34.value == 1;
    end;
    return v35;
end;
local function _(v37, v38)
    v37 = v37 or false;
    if v38.type == "SetPlayerInput" then
        local v39 = false;
        if v38.playerInput == "pause" then
            v39 = v38.value == 1;
        end;
        if v39 then
            return not v37;
        end;
    end;
    return v37;
end;
local function v47(v41, v42)
    v41 = v41 or {};
    local v43 = {
        playerInputs = v14(v41.playerInputs, v42)
    };
    local v44 = v41.paused or false;
    local v45;
    if v42.type == "SetPlayerInput" then
        local v46 = false;
        if v42.playerInput == "pause" then
            v46 = v42.value == 1;
        end;
        if v46 then
            v45 = not v44;
            goto label0 --[[  true, true  ]];
        end;
    end;
    v45 = v44;
    ::label0::;
    v43.paused = v45;
    v43.player = v19(v41.player, v42);
    v44 = v41.time or 0;
    v43.time = if v42.type == "GameStep" then v44 + v42.delta else v44;
    v43.asteroids = v33(v41.asteroids, v42);
    return v43;
end;
local v48 = v7.Component:extend("Camera");
v48.init = function(v49)
    v49.cameraRef = v7.createRef();
end;
v48.render = function(v50)
    local l_focus_0 = v50.props.focus;
    return v7.createElement("Camera", {
        CameraType = Enum.CameraType.Scriptable, 
        CFrame = CFrame.new((Vector3.new(l_focus_0.x, 20, l_focus_0.y))) * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0), 
        FieldOfView = 90, 
        [v7.Ref] = v50.cameraRef
    });
end;
v48.didMount = function(v52)
    l_Workspace_0.CurrentCamera = v52.cameraRef.current;
end;
local v55 = v10.connect(function(v53, _)
    return {
        focus = v53.player.position
    };
end, nil)(v48);
local v56 = v7.Component:extend("Asteroid");
v56.render = function(v57)
    local l_position_0 = v57.props.position;
    local l_size_0 = v57.props.size;
    return v7.createElement("Part", {
        Anchored = true, 
        Shape = Enum.PartType.Ball, 
        Size = Vector3.new(l_size_0, l_size_0, l_size_0), 
        Color = Color3.fromRGB(170, 170, 170), 
        CFrame = CFrame.new((Vector3.new(l_position_0.x, 0, l_position_0.y))), 
        TopSurface = Enum.SurfaceType.Smooth
    });
end;
local v60 = v7.Component:extend("Asteroids");
v60.render = function(v61)
    local l_props_0 = v61.props;
    local v63 = {};
    for v64, v65 in pairs(l_props_0) do
        v63[v64] = v7.createElement(v56, {
            position = v65.position, 
            size = v65.size
        });
    end;
    return v7.createElement("Folder", {
        Name = "Asteroids"
    }, v63);
end;
v60 = v10.connect(function(v66, _)
    return v66.asteroids;
end, nil)(v60);
local v68 = v7.Component:extend("Ship");
v68.render = function(v69)
    local l_position_1 = v69.props.position;
    return v7.createElement("Part", {
        Anchored = true, 
        Size = Vector3.new(2, 2, 6), 
        Color = Color3.fromHSV((v69.props.time % 5) / 5, 1, 1), 
        CFrame = CFrame.new((Vector3.new(l_position_1.x, 0, l_position_1.y))) * CFrame.fromEulerAnglesXYZ(0, -v69.props.angle, 0), 
        FrontSurface = Enum.SurfaceType.Hinge
    });
end;
local v73 = v10.connect(function(v71, _)
    return {
        position = v71.player.position, 
        angle = v71.player.angle, 
        time = v71.time
    };
end, nil)(v68);
local v74 = v7.Component:extend("GameBackground");
v74.render = function(_)
    return v7.createElement("Part", {
        Anchored = true, 
        Size = Vector3.new(512, 10, 512), 
        CFrame = CFrame.new((Vector3.new(0, -5, 0))), 
        Color = Color3.new(0, 0, 0)
    });
end;
local v76 = v7.Component:extend("PauseText");
v76.render = function(_)
    return v7.createElement("TextLabel", {
        Text = "Paused", 
        TextColor3 = Color3.fromRGB(255, 255, 255), 
        Font = Enum.Font.Arcade, 
        TextSize = 70, 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
end;
local v78 = v7.Component:extend("InputConnector");
v78.render = function(v79)
    local function v81(v80)
        if v79.props.onInputBegan then
            v79.props.onInputBegan(v80);
        end;
    end;
    local function v83(v82)
        if v79.props.onInputChanged then
            v79.props.onInputChanged(v82);
        end;
    end;
    local function v85(v84)
        if v79.props.onInputEnded then
            v79.props.onInputEnded(v84);
        end;
    end;
    if not v5 then
        return v7.createElement(v8, {
            event = l_UserInputService_0.InputBegan, 
            callback = v81
        }, {
            v7.createElement(v8, {
                event = l_UserInputService_0.InputChanged, 
                callback = v83
            }, {
                v7.createElement(v8, {
                    event = l_UserInputService_0.InputEnded, 
                    callback = v85
                })
            })
        });
    else
        return v7.createFragment({
            InputBeganConnection = v7.createElement(v8, {
                event = l_UserInputService_0.InputBegan, 
                callback = v81
            }), 
            InputChangedConnection = v7.createElement(v8, {
                event = l_UserInputService_0.InputChanged, 
                callback = v83
            }), 
            InputEndedConnection = v7.createElement(v8, {
                event = l_UserInputService_0.InputEnded, 
                callback = v85
            })
        });
    end;
end;
local v86 = {
    [Enum.KeyCode.Left] = "left", 
    [Enum.KeyCode.A] = "left", 
    [Enum.KeyCode.Right] = "right", 
    [Enum.KeyCode.D] = "right", 
    [Enum.KeyCode.Up] = "up", 
    [Enum.KeyCode.W] = "up", 
    [Enum.KeyCode.P] = "pause"
};
local function _(v87)
    if v87.UserInputType ~= Enum.UserInputType.Keyboard then
        return nil;
    else
        return v86[v87.KeyCode];
    end;
end;
local v94 = v10.connect(nil, function(v89)
    return {
        onInputBegan = function(v90)
            local v91 = if v90.UserInputType ~= Enum.UserInputType.Keyboard then nil else v86[v90.KeyCode];
            if v91 then
                v89({
                    type = "SetPlayerInput", 
                    playerInput = v91, 
                    value = 1
                });
            end;
        end, 
        onInputEnded = function(v92)
            local v93 = if v92.UserInputType ~= Enum.UserInputType.Keyboard then nil else v86[v92.KeyCode];
            if v93 then
                v89({
                    type = "SetPlayerInput", 
                    playerInput = v93, 
                    value = 0
                });
            end;
        end
    };
end)(v78);
local v95 = v7.Component:extend("RenderSteppedConnector");
v95.render = function(v96)
    local l_playerInputs_0 = v96.props.playerInputs;
    return v7.createElement(v8, {
        event = l_RunService_0.RenderStepped, 
        callback = function(v98)
            v96.props.onStepped(v98, l_playerInputs_0);
        end
    });
end;
v95 = v10.connect(function(v99, _)
    return {
        playerInputs = v99.playerInputs
    };
end, function(v101)
    return {
        onStepped = function(v102, v103)
            v101({
                type = "GameStep", 
                delta = v102, 
                inputs = v103
            });
        end
    };
end)(v95);
local v110 = v10.connect(function(v104, _)
    return {
        paused = v104.paused
    };
end, nil)(function(v106)
    local l_paused_0 = v106.paused;
    local l_match_0 = v106.match;
    local l_component_0 = v106.component;
    if l_paused_0 == l_match_0 then
        return v7.createElement(l_component_0);
    else
        return nil;
    end;
end);
local v111 = v7.Component:extend("App");
v111.render = function(_)
    return v7.createElement("Folder", {}, {
        Player = v7.createElement(v73), 
        PlayerCamera = v7.createElement(v55), 
        GameBackground = v7.createElement(v74), 
        Asteroids = v7.createElement(v60), 
        KeyboardInputConnector = v7.createElement(v94), 
        RenderSteppedConnector = v7.createElement(v110, {
            match = false, 
            component = v95
        })
    });
end;
local v113 = v7.Component:extend("Ui");
v113.render = function(_)
    return v7.createElement("ScreenGui", nil, {
        PauseText = v7.createElement(v110, {
            match = true, 
            component = v76
        })
    });
end;
return function()
    l_RunService_0.Stepped:Wait();
    local v115 = v9.Store.new(v47);
    local v116 = v7.createElement(v10.StoreProvider, {
        store = v115
    }, {
        App = v7.createElement(v111)
    });
    local v117 = v7.createElement(v10.StoreProvider, {
        store = v115
    }, {
        Ui = v7.createElement(v113)
    });
    v7.mount(v116, l_Workspace_0, "Roact-asteroids");
    v7.mount(v117, l_CoreGui_0, "Roact-asteroids-ui");
end;
