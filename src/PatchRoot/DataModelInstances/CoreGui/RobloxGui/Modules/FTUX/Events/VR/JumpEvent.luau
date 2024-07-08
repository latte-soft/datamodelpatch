local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local _ = require(script.Parent.Parent.EventType);
local v3 = {
    Name = "FirstPersonToggleEvent"
};
local v4 = false;
local v5 = nil;
local function v9(v6, v7, _)
    if v6 == "JumpAction" and v7 == Enum.UserInputState.Begin then
        v4 = true;
    end;
    return Enum.ContextActionResult.Pass;
end;
startJumpEventListener = function()
    l_ContextActionService_0:BindCoreAction("JumpAction", v9, false, Enum.KeyCode.Space);
end;
stopJumpEventListener = function()
    l_ContextActionService_0:UnbindAction("JumpAction");
end;
v3.StartEvent = function(v10)
    startJumpEventListener();
    v5 = l_RunService_0.RenderStepped:Connect(function(_)
        if v4 then
            stopJumpEventListener();
            v10();
            if v5 then
                v5:Disconnect();
                v5 = nil;
            end;
        end;
    end);
end;
v3.StopEvent = function()
    if v5 then
        v5:Disconnect();
        v5 = nil;
    end;
    stopJumpEventListener();
end;
return v3;
