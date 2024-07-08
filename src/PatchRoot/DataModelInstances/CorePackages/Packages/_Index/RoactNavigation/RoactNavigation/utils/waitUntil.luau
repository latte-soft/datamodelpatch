local v0 = require(script.Parent.Parent.Parent.Dev.ReactRoblox);
return function(v1, v2)
    v2 = v2 or 1;
    local v3 = 0;
    while not (not (v3 < v2) or v1()) do
        v0.act(function()
            v3 = v3 + task.wait();
        end);
    end;
end;
