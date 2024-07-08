local l_RunService_0 = game:GetService("RunService");
local v1 = nil;
local v2 = {};
local l_v2_0 = v2 --[[ copy: 2 -> 5 ]];
local function v7(v4)
    if not l_v2_0[v4] then
        local l_FirstChild_0 = script.Parent:WaitForChild("CameraManager_Zones"):FindFirstChild("CameraManagerZone_" .. tostring(v4));
        if l_FirstChild_0 then
            local v6 = require(l_FirstChild_0);
            l_v2_0[v4] = v6;
            return v6;
        else
            return ;
        end;
    else
        return l_v2_0[v4];
    end;
end;
v1 = {
    CurrentZone = nil
};
local v8 = nil;
do
    local l_v8_0 = v8;
    v1.SetZone = function(_, v11)
        if v1.CurrentZone == v11 then
            return ;
        else
            v1.CurrentZone = v11;
            if l_v8_0 then
                l_v8_0:disconnect();
                l_v8_0 = nil;
            end;
            local v12;
            if not l_v2_0[v11] then
                local l_FirstChild_1 = script.Parent:WaitForChild("CameraManager_Zones"):FindFirstChild("CameraManagerZone_" .. tostring(v11));
                if l_FirstChild_1 then
                    local v14 = require(l_FirstChild_1);
                    l_v2_0[v11] = v14;
                    v12 = v14;
                else
                    v12 = nil;
                end;
            else
                v12 = l_v2_0[v11];
            end;
            if v12 then
                v12:SetEnabled(true);
                l_v8_0 = {
                    disconnect = function()
                        v12:SetEnabled(false);
                    end
                };
                return ;
            else
                return ;
            end;
        end;
    end;
end;
v2 = nil;
v2 = {};
v7 = nil;
do
    local l_v7_0 = v7;
    v2.SetZone = function(_, v17)
        if l_v7_0 then
            l_v7_0.Parent = nil;
            l_v7_0 = nil;
        end;
        local l_FirstChild_2 = game:GetService("ReplicatedStorage"):WaitForChild("Skyboxes"):FindFirstChild(v17 or "default");
        if l_FirstChild_2 then
            l_v7_0 = l_FirstChild_2:Clone();
            local l_Lighting_0 = game:GetService("Lighting");
            l_FirstChild_2.Parent = l_Lighting_0;
            pcall(function()
                for _, v21 in pairs(l_FirstChild_2:GetChildren()) do
                    l_Lighting_0[v21.Name] = v21.Value;
                end;
            end);
        end;
    end;
end;
v7 = {
    Zone = nil
};
v8 = function(v22)
    v7.Zone = v22;
    v2:SetZone(v22);
    v1:SetZone(v22);
end;
v7.SetZone = function(_, v24)
    if v24 == v7.Zone then
        return ;
    elseif not l_RunService_0:IsRunning() then
        spawn(function()
            while not l_RunService_0:IsRunning() do
                wait();
            end;
            local l_v24_0 = v24;
            v7.Zone = l_v24_0;
            v2:SetZone(l_v24_0);
            v1:SetZone(l_v24_0);
        end);
        return ;
    else
        v7.Zone = v24;
        v2:SetZone(v24);
        v1:SetZone(v24);
        return ;
    end;
end;
return v7;
