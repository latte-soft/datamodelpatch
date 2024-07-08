local l_StarterGui_0 = game:GetService("StarterGui");
local _ = require(script.Parent.types);
return {
    name = script.Name, 
    alias = {
        "/console"
    }, 
    clientRun = function()
        local l_status_0, l_result_0 = pcall(function()
            return l_StarterGui_0:GetCore("DevConsoleVisible");
        end);
        if l_status_0 then
            pcall(function()
                l_StarterGui_0:SetCore("DevConsoleVisible", not l_result_0);
            end);
        end;
        return nil;
    end
};
