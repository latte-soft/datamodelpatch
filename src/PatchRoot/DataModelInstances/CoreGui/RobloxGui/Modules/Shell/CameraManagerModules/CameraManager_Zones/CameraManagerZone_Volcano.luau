local l_RunService_0 = game:GetService("RunService");
local v1 = nil;
local v2 = nil;
spawn(function()
    while not l_RunService_0:IsRunning() do
        wait(0.1);
    end;
    v1 = workspace:WaitForChild("Zones"):WaitForChild("Volcano");
    v2 = v1.Lightning:GetChildren();
    for v3 = 1, #v2 do
        v2[v3].Parent = nil;
    end;
end);
local function _(v4)
    if v4 and v1 then
        v4.Parent = v1.Lightning;
        wait(0.125);
        v4.Parent = nil;
        return ;
    else
        return ;
    end;
end;
local v6 = nil;
local v7 = nil;
return {
    SetEnabled = function(_, v9)
        if not v9 or not v6 then
            if v6 then
                v6:disconnect();
                v6 = nil;
            end;
            v7 = nil;
            if v9 then
                local v10 = {};
                v7 = v10;
                coroutine.wrap(function()
                    while v7 == v10 do
                        wait(math.random() * 16 + 1);
                        if v2 then
                            local v11 = v2[math.random(1, #v2)];
                            if v11 and v1 then
                                v11.Parent = v1.Lightning;
                                wait(0.125);
                                v11.Parent = nil;
                            end;
                        end;
                    end;
                end)();
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end
};
