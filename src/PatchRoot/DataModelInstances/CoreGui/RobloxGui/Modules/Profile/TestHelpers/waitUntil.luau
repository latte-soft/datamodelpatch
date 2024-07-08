local l_RunService_0 = require(script:FindFirstAncestor("Profile").devDependencies).RunService;
local v1 = require(script.Parent.act);
return function(v2, v3)
    local v4 = v3 or 1;
    local v5 = 0;
    while not (not (v5 < v4) or v2()) do
        v1(function()
            v5 = v5 + l_RunService_0.Heartbeat:Wait();
        end);
    end;
end;
