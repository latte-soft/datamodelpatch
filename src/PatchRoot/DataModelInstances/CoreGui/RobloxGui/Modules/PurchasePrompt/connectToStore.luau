local _ = script.Parent;
local l_RoactRodux_0 = require(game:GetService("CorePackages").PurchasePromptDeps).RoactRodux;
return function(v2, v3)
    return function(v4)
        local v5 = l_RoactRodux_0.UNSTABLE_connect2(v2, v3)(v4);
        v5.getUnconnected = function()
            return v4;
        end;
        return v5;
    end;
end;
