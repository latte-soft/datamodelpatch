local l_act_0 = require(game:GetService("CorePackages").Packages.ReactRoblox).act;
return function(v1, v2)
    local v3 = v2 == nil and 1 or v2;
    local v4 = os.clock() + v3;
    local v5 = nil;
    while true do
        if os.clock() < v4 then
            local v6, v7, v8 = pcall(v1);
            if not v6 or not v7 then
                if not v6 then
                    v5 = v7;
                end;
                l_act_0(function()
                    task.wait();
                end);
            else
                return v8;
            end;
        else
            local v9 = ("operation has timed out (maximum time allowed was %f seconds)"):format(v3);
            if v5 ~= nil then
                v9 = v9 .. ": " .. tostring(v5);
            end;
            error(v9);
            return ;
        end;
    end;
end;
