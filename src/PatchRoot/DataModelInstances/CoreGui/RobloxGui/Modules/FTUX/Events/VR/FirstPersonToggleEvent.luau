local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RunService_0 = game:GetService("RunService");
local _ = require(script.Parent.Parent.EventType);
local v3 = {
    Name = "FirstPersonToggleEvent"
};
local v4 = false;
local v5 = nil;
local function v9(v6, v7, _)
    if v6 == "FirstPersonToggleAction" and v7 == Enum.UserInputState.Begin then
        v4 = true;
    end;
    return Enum.ContextActionResult.Pass;
end;
startFirstPersonToggleListener = function()
    l_ContextActionService_0:BindCoreAction("FirstPersonToggleAction", v9, false, Enum.KeyCode.ButtonR3);
end;
stopFirstPersonToggleListener = function()
    l_ContextActionService_0:UnbindAction("FirstPersonToggleAction");
end;
v3.StartEvent = function(v10)
    startFirstPersonToggleListener();
    v5 = l_RunService_0.RenderStepped:Connect(function(_)
        if v4 then
            stopFirstPersonToggleListener();
            task.wait(0.2);
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
    end;
    stopFirstPersonToggleListener();
end;
return v3;
