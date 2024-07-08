local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v2 = require(script.Parent.mockTranslator);
return function()
    if not l_CoreGui_0:FindFirstChild("CoreScriptLocalization") then
        return v2;
    else
        return v1;
    end;
end;
