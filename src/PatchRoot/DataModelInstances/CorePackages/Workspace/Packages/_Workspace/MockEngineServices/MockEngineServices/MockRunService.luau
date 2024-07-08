local v0 = {};
v0.__index = v0;
v0.new = function(_)
    local v11 = {
        RenderStepped = {
            callCallbacksWith = function(v2, v3)
                for _, v5 in v2.callbacks, nil, nil do
                    v5(v3);
                end;
            end, 
            callbacks = {}, 
            Connect = function(v6, v7)
                local l_callbacks_0 = v6.callbacks;
                table.insert(l_callbacks_0, v7);
                return {
                    Disconnect = function()
                        for v9, v10 in l_callbacks_0, nil, nil do
                            if v10 == v7 then
                                table.remove(l_callbacks_0, v9);
                            end;
                        end;
                    end
                };
            end
        }, 
        Heartbeat = game:GetService("RunService").Heartbeat
    };
    setmetatable(v11, {
        __index = v0
    });
    return v11;
end;
return v0;
