local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
return function(v3, v4, v5, v6, v7, v8)
    local v9, v10 = v2.useState(false);
    v2.useEffect(function()
        if not v4 then
            if not v9 then
                v8();
            end;
        elseif not v9 then
            if v3 then
                v10(true);
                v5();
                local v11 = nil;
                local v12 = 0;
                local v13 = 0;
                local v14 = nil;
                v11 = l_RunService_0.Heartbeat:Connect(function()
                    if v12 == 1 then
                        v7();
                        v11:Disconnect();
                        return ;
                    else
                        v12 = v12 + 1;
                        return ;
                    end;
                end);
                v14 = l_RunService_0.Heartbeat:Connect(function()
                    if v13 == 10 then
                        v6();
                        v14:Disconnect();
                        return ;
                    else
                        v13 = v13 + 1;
                        return ;
                    end;
                end);
                return ;
            end;
        else
            v10(false);
            return ;
        end;
    end, {
        v4
    });
end;
