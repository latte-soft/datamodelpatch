local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Lighting_0 = game:GetService("Lighting");
local v3 = nil;
local v4 = {};
local l_v4_0 = v4 --[[ copy: 4 -> 7 ]];
local function v9(v6)
    if not l_v4_0[v6] then
        local l_FirstChild_0 = script.Parent:WaitForChild("CameraManager_Zones"):FindFirstChild("CameraManagerZone_" .. tostring(v6));
        if l_FirstChild_0 then
            local v8 = require(l_FirstChild_0);
            l_v4_0[v6] = v8;
            return v8;
        else
            return ;
        end;
    else
        return l_v4_0[v6];
    end;
end;
v3 = {
    CurrentZone = nil
};
local v10 = nil;
do
    local l_v10_0 = v10;
    v3.SetZone = function(_, v13)
        if v3.CurrentZone == v13 then
            return ;
        else
            v3.CurrentZone = v13;
            if l_v10_0 then
                l_v10_0:disconnect();
                l_v10_0 = nil;
            end;
            local v14;
            if not l_v4_0[v13] then
                local l_FirstChild_1 = script.Parent:WaitForChild("CameraManager_Zones"):FindFirstChild("CameraManagerZone_" .. tostring(v13));
                if l_FirstChild_1 then
                    local v16 = require(l_FirstChild_1);
                    l_v4_0[v13] = v16;
                    v14 = v16;
                else
                    v14 = nil;
                end;
            else
                v14 = l_v4_0[v13];
            end;
            if v14 then
                v14:SetEnabled(true);
                l_v10_0 = {
                    disconnect = function()
                        v14:SetEnabled(false);
                    end
                };
                return ;
            else
                return ;
            end;
        end;
    end;
end;
v4 = nil;
v4 = {};
v9 = nil;
do
    local l_v9_0 = v9;
    v4.SetZone = function(_, v19)
        if l_v9_0 then
            l_v9_0.Parent = nil;
            l_v9_0:Destroy();
            l_v9_0 = nil;
        end;
        local l_FirstChild_2 = l_ReplicatedStorage_0:WaitForChild("Skyboxes"):FindFirstChild(v19 or "default");
        if l_FirstChild_2 then
            l_v9_0 = l_FirstChild_2:Clone();
            l_v9_0.Parent = l_Lighting_0;
            pcall(function()
                for _, v22 in ipairs(l_v9_0:GetChildren()) do
                    l_Lighting_0[v22.Name] = v22.Value;
                end;
            end);
        end;
    end;
end;
v9 = {
    Zone = nil
};
v10 = function(v23)
    v9.Zone = v23;
    v4:SetZone(v23);
    v3:SetZone(v23);
end;
v9.SetZone = function(_, v25)
    if v25 == v9.Zone then
        return ;
    elseif not l_RunService_0:IsRunning() then
        spawn(function()
            while not l_RunService_0:IsRunning() do
                wait();
            end;
            local l_v25_0 = v25;
            v9.Zone = l_v25_0;
            v4:SetZone(l_v25_0);
            v3:SetZone(l_v25_0);
        end);
        return ;
    else
        v9.Zone = v25;
        v4:SetZone(v25);
        v3:SetZone(v25);
        return ;
    end;
end;
return v9;
