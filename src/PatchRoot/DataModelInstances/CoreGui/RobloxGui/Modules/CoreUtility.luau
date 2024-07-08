local v0 = {};
local v1 = game:DefineFastInt("WaitForChildOfClassTimeout", 0);
if v1 > 0 then
    v0.waitForChildOfClass = function(v2, v3)
        local l_v2_FirstChildOfClass_0 = v2:FindFirstChildOfClass(v3);
        local v5 = tick() + v1;
        while not l_v2_FirstChildOfClass_0 and tick() < v5 do
            task.wait();
            l_v2_FirstChildOfClass_0 = v2:FindFirstChildOfClass(v3);
        end;
        return l_v2_FirstChildOfClass_0;
    end;
else
    v0.waitForChildOfClass = function(v6, v7)
        local l_v6_FirstChildOfClass_0 = v6:FindFirstChildOfClass(v7);
        while not l_v6_FirstChildOfClass_0 or l_v6_FirstChildOfClass_0.ClassName ~= v7 do
            l_v6_FirstChildOfClass_0 = v6.ChildAdded:Wait();
        end;
        return l_v6_FirstChildOfClass_0;
    end;
end;
v0.waitForChildWhichIsA = function(v9, v10)
    local l_v9_FirstChildWhichIsA_0 = v9:FindFirstChildWhichIsA(v10);
    while not (l_v9_FirstChildWhichIsA_0 and l_v9_FirstChildWhichIsA_0:IsA(v10)) do
        l_v9_FirstChildWhichIsA_0 = v9.ChildAdded:Wait();
    end;
    return l_v9_FirstChildWhichIsA_0;
end;
return v0;
