local v0 = require(script.Parent.debugPrint);
local v1 = require(script.Parent.InputBindingKind);
local v2 = require(script.Parent.Config);
local v3 = {
    [Enum.UserInputType.Keyboard] = true, 
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local v4 = {};
local function _()
    return {
        gamepadConnectedConnection = nil, 
        gamepadDisconnectedConnection = nil, 
        onStepConnections = 0, 
        primaryGamepadState = {}
    };
end;
local function _(v6)
    if v4[v6] == nil then
        v4[v6] = {
            gamepadConnectedConnection = nil, 
            gamepadDisconnectedConnection = nil, 
            onStepConnections = 0, 
            primaryGamepadState = {}
        };
    end;
    return v4[v6];
end;
local function v16(v8)
    if v4[v8] == nil then
        v4[v8] = {
            gamepadConnectedConnection = nil, 
            gamepadDisconnectedConnection = nil, 
            onStepConnections = 0, 
            primaryGamepadState = {}
        };
    end;
    local v9 = v4[v8];
    local l_Gamepad1_0 = Enum.UserInputType.Gamepad1;
    for _, v12 in ipairs(v8.getNavigationGamepads()) do
        if v8.getGamepadConnected(v12) then
            l_Gamepad1_0 = v12;
            break;
        end;
    end;
    local v13 = v8.getGamepadState(l_Gamepad1_0);
    v9.primaryGamepadState = {};
    for _, v15 in ipairs(v13) do
        v9.primaryGamepadState[v15.KeyCode] = v15;
    end;
end;
local function _(v17, v18)
    return function(v19)
        if v18(v19) then
            v0("[EVENT] Process input: ", v19.KeyCode, "-", v19.UserInputState);
            v17(v19);
        end;
    end;
end;
local function v24(v21, v22)
    if v4[v21] == nil then
        v4[v21] = {
            gamepadConnectedConnection = nil, 
            gamepadDisconnectedConnection = nil, 
            onStepConnections = 0, 
            primaryGamepadState = {}
        };
    end;
    local v23 = v4[v21];
    if v23.onStepConnections == 0 then
        v16(v21);
        v23.gamepadConnectedConnection = v21.subscribeToGamepadConnected(function()
            v16(v21);
        end);
        v23.gamepadDisconnectedConnection = v21.subscribeToGamepadDisconnected(function()
            v16(v21);
        end);
    end;
    v23.onStepConnections = v23.onStepConnections + 1;
    return function()
        v22:Disconnect();
        v23.onStepConnections = v23.onStepConnections - 1;
        if v23.onStepConnections == 0 then
            v23.gamepadConnectedConnection:Disconnect();
            v23.gamepadConnectedConnection = nil;
            v23.gamepadDisconnectedConnection:Disconnect();
            v23.gamepadDisconnectedConnection = nil;
        end;
    end;
end;
local function v45(v25, v26)
    local function _(v27)
        if not v2.DebugKeyboardBindings or not table.find(v2.DebugKeyboardBindings[v25.keyCode] or {}, v27.KeyCode) then
            return v27.KeyCode == v25.keyCode;
        else
            return true;
        end;
    end;
    if v25.kind == v1.Begin then
        local function v31(v29)
            local v30 = v3[v29.UserInputType];
            if v30 then
                v30 = false;
                if v29.UserInputState == Enum.UserInputState.Begin then
                    if not v2.DebugKeyboardBindings or not table.find(v2.DebugKeyboardBindings[v25.keyCode] or {}, v29.KeyCode) then
                        v30 = v29.KeyCode == v25.keyCode;
                    else
                        return true;
                    end;
                end;
            end;
            return v30;
        end;
        local l_subscribeToInputBegan_0 = v26.subscribeToInputBegan;
        local l_action_0 = v25.action;
        l_subscribeToInputBegan_0 = l_subscribeToInputBegan_0(function(v34)
            if v31(v34) then
                v0("[EVENT] Process input: ", v34.KeyCode, "-", v34.UserInputState);
                l_action_0(v34);
            end;
        end);
        return function()
            l_subscribeToInputBegan_0:Disconnect();
        end;
    elseif v25.kind == v1.End then
        local function v37(v35)
            local v36 = v3[v35.UserInputType];
            if v36 then
                v36 = false;
                if v35.UserInputState == Enum.UserInputState.End then
                    if not v2.DebugKeyboardBindings or not table.find(v2.DebugKeyboardBindings[v25.keyCode] or {}, v35.KeyCode) then
                        v36 = v35.KeyCode == v25.keyCode;
                    else
                        return true;
                    end;
                end;
            end;
            return v36;
        end;
        local l_subscribeToInputEnded_0 = v26.subscribeToInputEnded;
        local l_action_1 = v25.action;
        l_subscribeToInputEnded_0 = l_subscribeToInputEnded_0(function(v40)
            if v37(v40) then
                v0("[EVENT] Process input: ", v40.KeyCode, "-", v40.UserInputState);
                l_action_1(v40);
            end;
        end);
        return function()
            l_subscribeToInputEnded_0:Disconnect();
        end;
    elseif v25.kind == v1.Step then
        if v4[v26] == nil then
            v4[v26] = {
                gamepadConnectedConnection = nil, 
                gamepadDisconnectedConnection = nil, 
                onStepConnections = 0, 
                primaryGamepadState = {}
            };
        end;
        local v41 = v4[v26];
        return (v24(v26, (v26.subscribeToRenderStepped(function(v42)
            v25.action(v41.primaryGamepadState[v25.keyCode], v42);
        end))));
    elseif v25.kind == v1.MoveStep then
        if v4[v26] == nil then
            v4[v26] = {
                gamepadConnectedConnection = nil, 
                gamepadDisconnectedConnection = nil, 
                onStepConnections = 0, 
                primaryGamepadState = {}
            };
        end;
        local v43 = v4[v26];
        return (v24(v26, (v26.subscribeToRenderStepped(function(v44)
            v25.action({
                [Enum.KeyCode.Thumbstick1] = v43.primaryGamepadState[Enum.KeyCode.Thumbstick1], 
                [Enum.KeyCode.DPadUp] = v43.primaryGamepadState[Enum.KeyCode.DPadUp], 
                [Enum.KeyCode.DPadDown] = v43.primaryGamepadState[Enum.KeyCode.DPadDown], 
                [Enum.KeyCode.DPadLeft] = v43.primaryGamepadState[Enum.KeyCode.DPadLeft], 
                [Enum.KeyCode.DPadRight] = v43.primaryGamepadState[Enum.KeyCode.DPadRight]
            }, v44);
        end))));
    else
        return nil;
    end;
end;
local function _(v46)
    return function(v47, v48, v49)
        local v50 = false;
        if typeof(v47) == "EnumItem" then
            v50 = v47.EnumType == Enum.KeyCode;
        end;
        assert(v50, "Invalid argument #1: expected a member of Enum.KeyCode");
        assert(typeof(v48) == "function", "Invalid argument #2: expected a function");
        return {
            kind = v46, 
            keyCode = v47, 
            action = v48, 
            meta = v49
        };
    end;
end;
local function v53(v52)
    return {
        kind = v1.MoveStep, 
        action = v52
    };
end;
local v55 = {
    getUniqueKey = function(v54)
        if not v54.keyCode then
            return (tostring(v54.kind));
        else
            return tostring(v54.kind) .. "-" .. tostring(v54.keyCode);
        end;
    end, 
    connectToEvent = v45
};
local v56 = {};
local l_Begin_0 = v1.Begin;
local l_l_Begin_0_0 = l_Begin_0 --[[ copy: 17 -> 18 ]];
v56.onBegin = function(v59, v60, v61)
    local v62 = false;
    if typeof(v59) == "EnumItem" then
        v62 = v59.EnumType == Enum.KeyCode;
    end;
    assert(v62, "Invalid argument #1: expected a member of Enum.KeyCode");
    assert(typeof(v60) == "function", "Invalid argument #2: expected a function");
    return {
        kind = l_l_Begin_0_0, 
        keyCode = v59, 
        action = v60, 
        meta = v61
    };
end;
l_Begin_0 = v1.End;
local l_l_Begin_0_1 = l_Begin_0 --[[ copy: 17 -> 19 ]];
v56.onEnd = function(v64, v65, v66)
    local v67 = false;
    if typeof(v64) == "EnumItem" then
        v67 = v64.EnumType == Enum.KeyCode;
    end;
    assert(v67, "Invalid argument #1: expected a member of Enum.KeyCode");
    assert(typeof(v65) == "function", "Invalid argument #2: expected a function");
    return {
        kind = l_l_Begin_0_1, 
        keyCode = v64, 
        action = v65, 
        meta = v66
    };
end;
l_Begin_0 = v1.Step;
v56.onStep = function(v68, v69, v70)
    local v71 = false;
    if typeof(v68) == "EnumItem" then
        v71 = v68.EnumType == Enum.KeyCode;
    end;
    assert(v71, "Invalid argument #1: expected a member of Enum.KeyCode");
    assert(typeof(v69) == "function", "Invalid argument #2: expected a function");
    return {
        kind = l_Begin_0, 
        keyCode = v68, 
        action = v69, 
        meta = v70
    };
end;
v56.onMoveStep = v53;
v55.PublicInterface = v56;
return v55;
