local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v1 = require(script:FindFirstAncestor("Rhodium").VirtualInputUtils);
local v2 = {};
v2.__index = v2;
local v3 = 123;
v2.KeyCode = {
    ButtonX = Enum.KeyCode.ButtonX, 
    ButtonY = Enum.KeyCode.ButtonY, 
    ButtonA = Enum.KeyCode.ButtonA, 
    ButtonB = Enum.KeyCode.ButtonB, 
    ButtonR1 = Enum.KeyCode.ButtonR1, 
    ButtonL1 = Enum.KeyCode.ButtonL1, 
    ButtonR2 = Enum.KeyCode.ButtonR2, 
    ButtonL2 = Enum.KeyCode.ButtonL2, 
    ButtonR3 = Enum.KeyCode.ButtonR3, 
    ButtonL3 = Enum.KeyCode.ButtonL3, 
    ButtonStart = Enum.KeyCode.ButtonStart, 
    ButtonSelect = Enum.KeyCode.ButtonSelect, 
    DPadLeft = Enum.KeyCode.DPadLeft, 
    DPadRight = Enum.KeyCode.DPadRight, 
    DPadUp = Enum.KeyCode.DPadUp, 
    DPadDown = Enum.KeyCode.DPadDown, 
    Thumbstick1 = Enum.KeyCode.Thumbstick1, 
    Thumbstick2 = Enum.KeyCode.Thumbstick2
};
v2.new = function()
    local v4 = {
        deviceId = v3
    };
    v3 = v3 + 1;
    setmetatable(v4, v2);
    l_VirtualInputManager_0:HandleGamepadConnect(v4.deviceId);
    return v4;
end;
v2.disconnect = function(v5)
    l_VirtualInputManager_0:HandleGamepadDisconnect(v5.deviceId);
end;
v2.pressButton = function(v6, v7)
    l_VirtualInputManager_0:HandleGamepadButtonInput(v6.deviceId, v7, 1);
end;
v2.releaseButton = function(v8, v9)
    l_VirtualInputManager_0:HandleGamepadButtonInput(v8.deviceId, v9, 0);
end;
v2.hitButton = function(v10, v11)
    v10:pressButton(v11);
    v10:releaseButton(v11);
    v1.waitForInputEventsProcessed();
end;
v2.moveStickTo = function(v12, v13, v14)
    l_VirtualInputManager_0:HandleGamepadAxisInput(v12.deviceId, v13, v14.X, v14.Y, 0);
end;
v2.smoothMoveStickTo = function(v15, v16, v17, v18, v19)
    v19 = v19 or 0;
    if v19 == 0 then
        v15:moveStickTo(v16, v18);
        return ;
    else
        local v20 = 0;
        v1.__syncRun(function(v21)
            local v22 = v20 / v19;
            v20 = v20 + v21;
            if v22 < 1 then
                v15:moveStickTo(v16, v17 + (v18 - v17) * v22);
                return false;
            else
                v15:moveStickTo(v16, v18);
                return true;
            end;
        end);
        return ;
    end;
end;
v2.swingStick = function(v23, v24, v25, v26)
    v26 = v26 or 0;
    assert(v26);
    local v27 = Vector2.new(0, 0);
    v23:moveStickTo(v24, v27);
    v23:smoothMoveStickTo(v24, v27, v25, v26 / 2);
    v23:smoothMoveStickTo(v24, v25, v27, v26 / 2);
end;
v2.swingLeft = function(v28, v29, v30)
    v28:swingStick(v29, Vector2.new(-1, 0), v30);
end;
v2.swingRight = function(v31, v32, v33)
    v31:swingStick(v32, Vector2.new(1, 0), v33);
end;
v2.swingTop = function(v34, v35, v36)
    v34:swingStick(v35, Vector2.new(0, 1), v36);
end;
v2.swingDown = function(v37, v38, v39)
    v37:swingStick(v38, Vector2.new(0, -1), v39);
end;
return v2;
