local l_RunService_0 = game:GetService("RunService");
local l_LogService_0 = game:GetService("LogService");
local function v5(v2, v3)
    v3 = v3 or 1;
    local v4 = 0;
    while not (not (v4 < v3) or v2()) do
        v4 = v4 + l_RunService_0.Heartbeat:Wait();
    end;
end;
return function()
    v5(function()
        for _, v7 in ipairs((l_LogService_0:GetLogHistory())) do
            if string.match(v7.message, "%d+ passed, %d+ failed, %d+ skipped") then
                return true;
            end;
        end;
        return false;
    end, 300);
end;
