local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v1 = require(l_Parent_0.React);
local l_useInputType_0 = require(l_Parent_0.RoactUtils).Hooks.useInputType;
local l_InputTypeConstants_0 = require(l_Parent_0.InputType).InputTypeConstants;
local v4 = require(script.Parent.useGamepadConnectedEvent);
local l_GetFFlagGamepadAnalytics_0 = require(l_Parent_0.SharedFlags).GetFFlagGamepadAnalytics;
return function(v6, v7, v8, v9)
    local v10 = l_useInputType_0() == l_InputTypeConstants_0.Gamepad;
    local v11 = v1.useRef(false);
    v4(v1.useCallback(function()
        if v11.current then
            if l_GetFFlagGamepadAnalytics_0() then
                v8:sendEventDeferred(v9 or "", "gamepadConnectionEvent", {
                    connectionEvent = "gamepadReconnected"
                });
            end;
            v11.current = false;
            v7();
        end;
    end, {
        v7
    }), (v1.useCallback(function()
        if v10 then
            if not v11.current then
                if l_GetFFlagGamepadAnalytics_0() then
                    v8:sendEventDeferred(v9 or "", "gamepadConnectionEvent", {
                        connectionEvent = "gamepadDisconnected"
                    });
                end;
                v11.current = true;
                v6();
            end;
            return ;
        else
            return ;
        end;
    end, {
        v10, 
        v6
    })));
end;
