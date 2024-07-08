local l_RunService_0 = game:GetService("RunService");
local v1 = {};
local v8 = {
    Connect = function(_, v3)
        v1[v3] = true;
        return {
            Disconnect = function()
                v1[v3] = nil;
            end
        };
    end, 
    Fire = function(_, v5)
        for v6, _ in v1, nil, nil do
            v6(v5);
        end;
    end
};
return {
    Connect = function(_, v10)
        if not _G.__OTTER_MOCK_HEARTBEAT__ then
            return l_RunService_0.Heartbeat:Connect(v10);
        else
            return v8:Connect(v10);
        end;
    end, 
    Fire = function(_, v12)
        if not _G.__OTTER_MOCK_HEARTBEAT__ then
            error("Cannot manually fire real Heartbeat");
            return ;
        else
            v8:Fire(v12 or 0.016666666666666666);
            return ;
        end;
    end
};
