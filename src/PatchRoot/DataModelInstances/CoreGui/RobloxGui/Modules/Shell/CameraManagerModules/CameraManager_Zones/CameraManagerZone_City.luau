local l_RunService_0 = game:GetService("RunService");
local l_Zones_0 = workspace:FindFirstChild("Zones");
local v2 = l_Zones_0 and l_Zones_0:FindFirstChild("City");
local v3 = {};
v3.GetAllParts = function(v4, v5)
    v5 = v5 or {};
    if v4:IsA("BasePart") then
        v5[#v5 + 1] = v4;
    end;
    local l_v4_Children_0 = v4:GetChildren();
    for v7 = 1, #l_v4_Children_0 do
        v3.GetAllParts(l_v4_Children_0[v7], v5);
    end;
    return v5;
end;
v3.GetAllPartOffsets = function(v8, v9)
    local v10 = {};
    local v11 = v9:inverse();
    for v12 = 1, #v8 do
        v10[v12] = v11 * v8[v12].CFrame;
    end;
    return v10;
end;
v3.newCFramer = function(v13, v14)
    return function(v15)
        for v16 = 1, #v13 do
            v13[v16].CFrame = v15 * v14[v16];
        end;
    end;
end;
v3.newCFramerFromModel = function(v17, v18)
    local v19 = v3.GetAllParts(v17);
    return v3.newCFramer(v19, (v3.GetAllPartOffsets(v19, v18)));
end;
local v20 = nil;
spawn(function()
    while not l_RunService_0:IsRunning() do
        wait(0.1);
    end;
    if not v2 then
        v2 = workspace:WaitForChild("Zones"):WaitForChild("City");
    end;
    local v21 = v2.Train:Clone();
    local function _()
        local v22 = v21:Clone();
        v22.Parent = workspace;
        return v3.newCFramerFromModel(v22.Parts, v22.Track.CFrame);
    end;
    local function v31(v24, v25)
        if not v25 then
            v25 = math.random(0, 1) * 2 - 1;
        end;
        local l_Y_0 = v24.Size.Y;
        local v27 = (v24.CFrame * CFrame.Angles(1.5707963267948966 * (v25 + 1), 0, 0)) * CFrame.new(0, -l_Y_0 / 2, 0);
        return function(v28, v29)
            local v30 = v29 * 48;
            if v30 >= 0 and v30 <= l_Y_0 then
                v28(v27 * CFrame.new(0, v30, 0));
            end;
        end, v24.Size.Y;
    end;
    local v32 = v21:Clone();
    v32.Parent = workspace;
    local v33 = v3.newCFramerFromModel(v32.Parts, v32.Track.CFrame);
    local v34 = v21:Clone();
    v34.Parent = workspace;
    v32 = v3.newCFramerFromModel(v34.Parts, v34.Track.CFrame);
    local v35 = v21:Clone();
    v35.Parent = workspace;
    v34 = v3.newCFramerFromModel(v35.Parts, v35.Track.CFrame);
    local v36 = v21:Clone();
    v36.Parent = workspace;
    v35 = v3.newCFramerFromModel(v36.Parts, v36.Track.CFrame);
    local v37 = v21:Clone();
    v37.Parent = workspace;
    v36 = v3.newCFramerFromModel(v37.Parts, v37.Track.CFrame);
    local v38 = v21:Clone();
    v38.Parent = workspace;
    v37 = v3.newCFramerFromModel(v38.Parts, v38.Track.CFrame);
    local v39 = v21:Clone();
    v39.Parent = workspace;
    v38 = v3.newCFramerFromModel(v39.Parts, v39.Track.CFrame);
    v39 = v2.Tracks;
    local v40 = v31(v39.TrackA1);
    local v41 = v31(v39.TrackA2);
    local v42 = v31(v39.TrackA3);
    local v43 = v31(v39.TrackB1);
    local _ = v31(v39.TrackB2);
    local _ = v31(v39.TrackC1);
    local v46 = v31(v39.TrackC2);
    local _ = v31(v39.TrackC3);
    v20 = function(v48)
        v40(v33, v48 % 15);
        v41(v32, (v48 - 3) % 20);
        v42(v34, (v48 - 5.5) % 18);
        v43(v35, (v48 - 5.5) % 25);
        v46(v36, (v48 - 2.5) % 30);
    end;
end);
local v49 = nil;
spawn(function()
    if not v2 then
        v2 = workspace:WaitForChild("Zones"):WaitForChild("City");
    end;
    local function v74(v50, v51)
        local v52 = {};
        local v53 = {};
        local v54 = {};
        local v55 = {};
        for _, v57 in pairs(v50:GetChildren()) do
            local v58 = tonumber(v57.Name);
            v52[v58] = v57;
            v55[v58] = v57.CFrame;
            local v59 = {};
            local v60 = {};
            for _, v62 in pairs(v57:GetChildren()) do
                if v62:IsA("BasePart") then
                    v59[#v59 + 1] = v62;
                    v60[#v60 + 1] = v57.CFrame:inverse() * v62.CFrame;
                end;
            end;
            v53[v58] = v59;
            v54[v58] = v60;
        end;
        local v63 = 0;
        local v64 = 0;
        local v65 = 0;
        return function(v66)
            if v66 < v65 then
                v65 = v66;
            end;
            local v67 = (v66 - v65) / v51 + v64;
            if v67 >= 1 then
                v63 = (v63 + math.floor(v67)) % #v52;
                v67 = v67 % 1;
                v64 = v67;
                v65 = v66;
            end;
            for v68 = 0, #v52 - 2 do
                local v69 = (v68 - v63) % #v55 + 1;
                local v70 = v55[v68 + 1]:lerp(v55[v68 + 2], v67);
                v52[v69].CFrame = v70;
                local v71 = v53[v69];
                local v72 = v54[v69];
                for v73 = 1, #v71 do
                    v71[v73].CFrame = v70 * v72[v73];
                end;
            end;
        end;
    end;
    local v75 = v74(v2.Pipe1.Flow, 0.5);
    local v76 = v74(v2.Pipe2.Flow, 0.65);
    v49 = function(v77)
        v75(v77);
        v76(v77);
    end;
end);
local v78 = nil;
return {
    SetEnabled = function(_, v80)
        if not v80 or not v78 then
            if v78 then
                v78:disconnect();
                v78 = nil;
            end;
            if v80 then
                local v81 = tick();
                v78 = game:GetService("RunService").RenderStepped:Connect(function()
                    local v82 = tick() - v81;
                    if v49 then
                        v49(v82);
                    end;
                    if v20 then
                        v20(v82);
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
