local l_act_0 = require(script:FindFirstAncestor("FriendsLanding").dependencies).Roact.act;
local l_RunService_0 = game:GetService("RunService");
return function(v2, v3)
    local v4 = v3 or 1;
    local v5 = 0;
    while not (not (v5 < v4) or v2()) do
        l_act_0(function()
            v5 = v5 + l_RunService_0.Heartbeat:Wait();
        end);
    end;
end;
