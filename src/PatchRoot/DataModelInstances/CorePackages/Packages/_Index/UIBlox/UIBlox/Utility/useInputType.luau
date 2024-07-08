local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Enums.InputType);
local v4 = require(l_Parent_1.React);
local l_useEventConnection_0 = require(l_Parent_1.ReactUtils).useEventConnection;
local v6 = {
    [Enum.UserInputType.Gamepad1] = v3.Gamepad, 
    [Enum.UserInputType.Gamepad2] = v3.Gamepad, 
    [Enum.UserInputType.Gamepad3] = v3.Gamepad, 
    [Enum.UserInputType.Gamepad4] = v3.Gamepad, 
    [Enum.UserInputType.Gamepad5] = v3.Gamepad, 
    [Enum.UserInputType.Gamepad6] = v3.Gamepad, 
    [Enum.UserInputType.Gamepad7] = v3.Gamepad, 
    [Enum.UserInputType.Gamepad8] = v3.Gamepad, 
    [Enum.UserInputType.MouseButton1] = v3.MouseAndKeyboard, 
    [Enum.UserInputType.MouseButton2] = v3.MouseAndKeyboard, 
    [Enum.UserInputType.MouseButton3] = v3.MouseAndKeyboard, 
    [Enum.UserInputType.MouseWheel] = v3.MouseAndKeyboard, 
    [Enum.UserInputType.MouseMovement] = v3.MouseAndKeyboard, 
    [Enum.UserInputType.Keyboard] = v3.MouseAndKeyboard, 
    [Enum.UserInputType.TextInput] = v3.MouseAndKeyboard, 
    [Enum.UserInputType.Touch] = v3.Touch
};
return function(v7)
    local v8 = v7 or l_UserInputService_0;
    local function _()
        return v6[v8:GetLastInputType()];
    end;
    local v10, v11 = v4.useState(v6[v8:GetLastInputType()]);
    l_useEventConnection_0(v8.LastInputTypeChanged, (v4.useCallback(function(v12)
        local v13 = v6[v12];
        if v13 ~= nil then
            v11(v13);
        end;
    end)));
    v4.useEffect(function()
        v11(v6[v8:GetLastInputType()]);
    end, {});
    return v10;
end;
