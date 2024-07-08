local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.GetAllParts = function(v2, v3)
    v3 = v3 or {};
    if v2:IsA("BasePart") then
        v3[#v3 + 1] = v2;
    end;
    local l_v2_Children_0 = v2:GetChildren();
    for v5 = 1, #l_v2_Children_0 do
        v1.GetAllParts(l_v2_Children_0[v5], v3);
    end;
    return v3;
end;
v1.GetAllPartOffsets = function(v6, v7)
    local v8 = {};
    local v9 = v7:inverse();
    for v10 = 1, #v6 do
        v8[v10] = v9 * v6[v10].CFrame;
    end;
    return v8;
end;
v1.newOffsetter = function(v11, v12, v13)
    return function(v14)
        local v15 = v13 * v14;
        for v16 = 1, #v11 do
            v11[v16].CFrame = v15 * v12[v16];
        end;
    end;
end;
v1.newOffsetterFromModel = function(v17, v18)
    local v19 = v1.GetAllParts(v17);
    return v1.newOffsetter(v19, v1.GetAllPartOffsets(v19, v18), v18);
end;
local l_newOffsetterFromModel_0 = v1.newOffsetterFromModel;
local v21 = nil;
spawn(function()
    while not l_RunService_0:IsRunning() do
        wait(0.1);
    end;
    local l_Station_0 = workspace:WaitForChild("Zones"):WaitForChild("Space").Station;
    local l_CFrame_0 = l_Station_0.rings.center.CFrame;
    local v24 = l_newOffsetterFromModel_0(l_Station_0.rings.Ring1, l_CFrame_0);
    local v25 = l_newOffsetterFromModel_0(l_Station_0.rings.Ring2, l_CFrame_0);
    local v26 = l_newOffsetterFromModel_0(l_Station_0.rings.Ring3, l_CFrame_0);
    local v27 = l_newOffsetterFromModel_0(l_Station_0.station, l_CFrame_0);
    v21 = function(v28)
        v24(CFrame.Angles(0, (v28 / 6) % 6.283185307179586, 0) * CFrame.new(0, math.sin((v28 / 4) % 6.283185307179586) * 1, 0));
        v25(CFrame.Angles(0, -((v28 / 4) % 6.283185307179586), 0) * CFrame.new(0, math.sin(2 + (v28 / 2) % 6.283185307179586) * 1, 0));
        v26(CFrame.Angles(0, (v28 / 3.5) % 6.283185307179586, 0) * CFrame.new(0, math.sin(1 + (v28 / 2) % 6.283185307179586) * 1, 0));
        v27(CFrame.Angles(0, (v28 / -32) % 6.283185307179586, 0) * CFrame.new(0, math.sin((v28 / 4) % 6.283185307179586) * 3 - 2, 0));
    end;
end);
local v29 = nil;
spawn(function()
    while not l_RunService_0:IsRunning() do
        wait(0.1);
    end;
    local l_Space_0 = workspace:WaitForChild("Zones"):WaitForChild("Space");
    local l_Orbit_0 = l_Space_0.Orbit;
    local v32 = l_newOffsetterFromModel_0(l_Orbit_0, l_Orbit_0.center.CFrame);
    local v33 = {
        l_Space_0.Disk, 
        l_Space_0.Disk2, 
        l_Space_0.Disk3
    };
    local v34 = {};
    for v35 = 1, #v33 do
        v34[v35] = l_newOffsetterFromModel_0(v33[v35], v33[v35].CFrame);
    end;
    v29 = function(v36)
        v32(CFrame.Angles((v36 / 80) % 6.283185307179586, (v36 / 60) % 6.283185307179586, (v36 / 40) % 6.283185307179586));
        for v37 = 1, #v34 do
            v34[v37](CFrame.Angles(0, 0.25 + (v36 / 60) % 6.283185307179586, 0));
        end;
    end;
end);
local v38 = nil;
return {
    SetEnabled = function(_, v40)
        if not v40 or not v38 then
            if v38 then
                v38:disconnect();
                v38 = nil;
            end;
            if v40 then
                local v41 = tick();
                v38 = game:GetService("RunService").RenderStepped:Connect(function()
                    local v42 = tick() - v41;
                    if v21 then
                        v21(v42);
                    end;
                    if v29 then
                        v29(v42);
                    end;
                end);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end
};
