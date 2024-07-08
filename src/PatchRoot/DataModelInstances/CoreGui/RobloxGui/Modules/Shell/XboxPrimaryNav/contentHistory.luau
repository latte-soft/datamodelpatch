local v0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell").Flags.GetFFlagXboxFixPrimaryNavABEvents);
return ((function()
    local v1 = {};
    local v2 = nil;
    v1.setLastSelectedContent = function(_, v4)
        v2 = v4;
    end;
    v1.getLastContentName = function(_)
        local l_status_0, l_result_0 = pcall(function()
            if not v0() then
                return v2:GetName();
            else
                return v2:GetId();
            end;
        end);
        if not l_status_0 then
            return ;
        else
            return l_result_0;
        end;
    end;
    return v1;
end)());
