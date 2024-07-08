local l_StarterGui_0 = game:GetService("StarterGui");
local v1 = require(script.Parent.Parent.Actions.SetRespawnBehavior);
return function(v2)
    l_StarterGui_0:RegisterSetCore("ResetButtonCallback", function(v3)
        local v4 = true;
        local v5 = nil;
        if typeof(v3) == "boolean" then
            v4 = v3;
            v5 = nil;
        elseif not (typeof(v3) == "Instance") or not v3:IsA("BindableEvent") then
            error("ResetButtonCallback must be set to a BindableEvent or a boolean", 0);
        else
            v4 = true;
            v5 = v3;
        end;
        v2:dispatch(v1(v4, v5));
    end);
end;
