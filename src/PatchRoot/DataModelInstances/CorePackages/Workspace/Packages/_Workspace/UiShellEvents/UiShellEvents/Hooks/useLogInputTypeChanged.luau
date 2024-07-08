local l_script_FirstAncestor_0 = script:FindFirstAncestor("UiShellEvents");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Analytics.logInputTypeChanged);
local l_useInputType_0 = require(l_Parent_0.RoactUtils).Hooks.useInputType;
return function(v6, v7)
    local v8 = l_useInputType_0();
    v3.useEffect(function()
        v4(v6, "inputTypeChanged", {
            inputType = v8, 
            gamepadConnected = l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1), 
            playSessionId = v7
        });
    end, {
        v8
    });
end;
