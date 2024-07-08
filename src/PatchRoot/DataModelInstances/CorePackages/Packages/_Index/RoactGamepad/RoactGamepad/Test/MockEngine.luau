local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.createSignal);
local v2 = {};
v2.__index = v2;
local v3 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true, 
    [Enum.UserInputType.Keyboard] = true
};
local v4 = {
    Enum.KeyCode.Thumbstick2, 
    Enum.KeyCode.DPadDown, 
    Enum.KeyCode.DPadUp, 
    Enum.KeyCode.ButtonL3, 
    Enum.KeyCode.ButtonL2, 
    Enum.KeyCode.DPadRight, 
    Enum.KeyCode.ButtonR1, 
    Enum.KeyCode.ButtonSelect, 
    Enum.KeyCode.ButtonStart, 
    Enum.KeyCode.ButtonY, 
    Enum.KeyCode.DPadLeft, 
    Enum.KeyCode.ButtonR2, 
    Enum.KeyCode.ButtonR3, 
    Enum.KeyCode.ButtonX, 
    Enum.KeyCode.Thumbstick1, 
    Enum.KeyCode.ButtonB, 
    Enum.KeyCode.ButtonA, 
    Enum.KeyCode.ButtonL1
};
local v5 = {
    [Enum.KeyCode.DPadUp] = "NextSelectionUp", 
    [Enum.KeyCode.Up] = "NextSelectionUp", 
    [Enum.KeyCode.DPadDown] = "NextSelectionDown", 
    [Enum.KeyCode.Down] = "NextSelectionDown", 
    [Enum.KeyCode.DPadLeft] = "NextSelectionLeft", 
    [Enum.KeyCode.Left] = "NextSelectionLeft", 
    [Enum.KeyCode.DPadRight] = "NextSelectionRight", 
    [Enum.KeyCode.Right] = "NextSelectionRight"
};
local function _(v6)
    return {
        KeyCode = v6, 
        Delta = Vector3.new(), 
        Position = Vector3.new(), 
        UserInputType = Enum.UserInputType.Gamepad1, 
        UserInputState = Enum.UserInputState.End
    };
end;
local function _(v8)
    return {
        Disconnect = v8
    };
end;
v2.new = function()
    local v10 = setmetatable({
        __mockSelected = nil, 
        __connectedGamepads = {}, 
        __gamepadStates = {}, 
        __selectionChangedSignal = v1(), 
        __inputSignal = v1(), 
        __renderStepped = v1(), 
        __gamepadConnected = v1(), 
        __gamepadDisconnected = v1(), 
        __interface = nil
    }, v2);
    local v22 = {
        getSelection = function()
            return v10.__mockSelected;
        end, 
        setSelection = function(v11)
            v10.__mockSelected = v11;
            v10.__selectionChangedSignal:fire();
        end, 
        getGamepadConnected = function(v12)
            return v10.__connectedGamepads[v12] or false;
        end, 
        getGamepadState = function(v13)
            if v10.__gamepadStates[v13] == nil then
                v10:__initializeGamepadState(v13);
            end;
            return v10.__gamepadStates[v13];
        end, 
        getNavigationGamepads = function(_)
            return v0.Dictionary.keys(v10.__connectedGamepads);
        end, 
        subscribeToSelectionChanged = function(v15)
            return {
                Disconnect = v10.__selectionChangedSignal:subscribe(v15)
            };
        end, 
        subscribeToInputBegan = function(v16)
            return {
                Disconnect = v10.__inputSignal:subscribe(v16)
            };
        end, 
        subscribeToInputChanged = function(v17)
            return {
                Disconnect = v10.__inputSignal:subscribe(v17)
            };
        end, 
        subscribeToInputEnded = function(v18)
            return {
                Disconnect = v10.__inputSignal:subscribe(v18)
            };
        end, 
        subscribeToRenderStepped = function(v19)
            return {
                Disconnect = v10.__renderStepped:subscribe(v19)
            };
        end, 
        subscribeToGamepadConnected = function(v20)
            return {
                Disconnect = v10.__gamepadConnected:subscribe(v20)
            };
        end, 
        subscribeToGamepadDisconnected = function(v21)
            return {
                Disconnect = v10.__gamepadDisconnected:subscribe(v21)
            };
        end
    };
    v10.__interface = v22;
    return v10, v22;
end;
v2.__initializeGamepadState = function(v23, v24)
    v23.__gamepadStates[v24] = v0.List.map(v4, function(v25)
        return {
            KeyCode = v25, 
            Delta = Vector3.new(), 
            Position = Vector3.new(), 
            UserInputType = Enum.UserInputType.Gamepad1, 
            UserInputState = Enum.UserInputState.End
        };
    end);
end;
v2.simulateSelectionChanged = function(v26, v27)
    v26.__mockSelected = v27;
    v26.__selectionChangedSignal:fire();
end;
v2.simulateInput = function(v28, v29)
    v29 = v0.Dictionary.join({
        Delta = Vector3.new(), 
        Position = Vector3.new(), 
        UserInputType = Enum.UserInputType.Gamepad1
    }, v29);
    local v30 = false;
    if typeof(v29.KeyCode) == "EnumItem" then
        v30 = v29.KeyCode.EnumType == Enum.KeyCode;
    end;
    assert(v30, "Invalid inputObject.KeyCode: expected a member of Enum.KeyCode");
    assert(v3[v29.UserInputType], "Invalid inputObject.UserInputType");
    local l_KeyCode_0 = v29.KeyCode;
    v30 = v5[l_KeyCode_0];
    if v30 ~= nil and v28.__interface.getSelection() ~= nil then
        v28.__interface.setSelection(v28.__interface.getSelection()[v30]);
    end;
    if v29.UserInputType ~= Enum.UserInputType.Keyboard then
        local l_UserInputType_0 = v29.UserInputType;
        if not v28.__connectedGamepads[l_UserInputType_0] then
            v28:connectGamepad(l_UserInputType_0);
        end;
        local v33 = v28.__gamepadStates[l_UserInputType_0];
        local v35 = v0.List.findWhere(v33, function(v34)
            return v34.KeyCode == l_KeyCode_0;
        end);
        if v35 == nil then
            error(("Invalid InputObject: KeyCode %s is not possible on %s"):format(tostring(l_KeyCode_0), (tostring(l_UserInputType_0))), 2);
        end;
        for v36, v37 in pairs(v29) do
            v33[v35][v36] = v37;
        end;
    end;
    v28.__inputSignal:fire(v29);
end;
v2.renderStep = function(v38, v39)
    if v39 == nil then
        v39 = 0.03333333333333333;
    end;
    v38.__renderStepped:fire(v39);
end;
v2.connectGamepad = function(v40, v41)
    local v42 = false;
    if typeof(v41) == "EnumItem" then
        v42 = v41.EnumType == Enum.UserInputType;
    end;
    assert(v42, "Invalid argument #1: expected a member of Enum.UserInputType");
    v40.__connectedGamepads[v41] = true;
    v40:__initializeGamepadState(v41);
    v40.__gamepadConnected:fire(v41);
end;
v2.disconnectGamepad = function(v43, v44)
    local v45 = false;
    if typeof(v44) == "EnumItem" then
        v45 = v44.EnumType == Enum.UserInputType;
    end;
    assert(v45, "Invalid argument #1: expected a member of Enum.UserInputType");
    v43.__connectedGamepads[v44] = nil;
    v43.__gamepadDisconnected:fire(v44);
end;
return v2;
