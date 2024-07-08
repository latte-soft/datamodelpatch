local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v3 = {};
local v4 = 0;
local l_StringValue_0 = Instance.new("StringValue");
l_StringValue_0.Name = "LeaderstatsOrder";
l_StringValue_0.Parent = l_RobloxReplicatedStorage_0;
updateStats = function()
    l_StringValue_0.Value = l_HttpService_0:JSONEncode(v3);
end;
updateStats();
local function _(v6)
    if not v3[v6] then
        v3[v6] = v4;
        v4 = v4 + 1;
        updateStats();
        return ;
    else
        return ;
    end;
end;
local function v9(v8)
    return ((((v8:IsA("StringValue") or v8:IsA("IntValue")) or v8:IsA("BoolValue")) or v8:IsA("NumberValue")) or v8:IsA("DoubleConstrainedValue")) or v8:IsA("IntConstrainedValue");
end;
local function _(v10)
    return ((v10:IsA("ValueBase") or v10:IsA("Folder")) or v10:IsA("Configuration")) or v10:IsA("Model");
end;
local v12 = {};
local function _(v13, v14)
    if v12[v13] then
        return v12[v13].leaderstats[v14];
    else
        return nil;
    end;
end;
local function v22(v16, v17, v18)
    if v9(v18) then
        local v19 = if v12[v16] then v12[v16].leaderstats[v17] else nil;
        if v19 then
            assert(v19 ~= nil);
            v19.leaderStatNameChanged[v18] = v18:GetPropertyChangedSignal("Name"):Connect(function()
                local l_Name_0 = v18.Name;
                if not v3[l_Name_0] then
                    v3[l_Name_0] = v4;
                    v4 = v4 + 1;
                    updateStats();
                    return ;
                else
                    return ;
                end;
            end);
            local l_Name_1 = v18.Name;
            if not v3[l_Name_1] then
                v3[l_Name_1] = v4;
                v4 = v4 + 1;
                updateStats();
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function _(v23, v24, v25)
    local v26 = if v12[v23] then v12[v23].leaderstats[v24] else nil;
    if v26 then
        assert(v26 ~= nil);
        if v26.leaderStatNameChanged[v25] then
            v26.leaderStatNameChanged[v25]:Disconnect();
            v26.leaderStatNameChanged[v25] = nil;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function v36(v28, v29)
    if v12[v28] then
        v12[v28].leaderstats[v29] = {
            childAdded = v29.ChildAdded:Connect(function(v30)
                v22(v28, v29, v30);
            end), 
            childRemoved = v29.ChildRemoved:Connect(function(v31)
                local l_v28_0 = v28;
                local v33 = if v12[l_v28_0] then v12[l_v28_0].leaderstats[v29] else nil;
                if v33 then
                    assert(v33 ~= nil);
                    if v33.leaderStatNameChanged[v31] then
                        v33.leaderStatNameChanged[v31]:Disconnect();
                        v33.leaderStatNameChanged[v31] = nil;
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end), 
            leaderStatNameChanged = {}
        };
        for _, v35 in v29:GetChildren() do
            v22(v28, v29, v35);
        end;
        return ;
    else
        return ;
    end;
end;
local _ = function(v37)
    for _, v39 in v37, nil, nil do
        v39:Disconnect();
    end;
end;
local _ = function(v41, v42)
    if v12[v41] then
        local v43 = v12[v41].leaderstats[v42];
        if v43 then
            v43.childAdded:Disconnect();
            v43.childRemoved:Disconnect();
            for _, v45 in v43.leaderStatNameChanged, nil, nil do
                v45:Disconnect();
            end;
            v12[v41].leaderstats[v42] = nil;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local _ = function(v47, v48)
    if v48.Name == "leaderstats" then
        v36(v47, v48);
        return ;
    elseif v12[v47] then
        local v49 = v12[v47].leaderstats[v48];
        if v49 then
            v49.childAdded:Disconnect();
            v49.childRemoved:Disconnect();
            for _, v51 in v49.leaderStatNameChanged, nil, nil do
                v51:Disconnect();
            end;
            v12[v47].leaderstats[v48] = nil;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local function v63(v53, v54)
    if ((v54:IsA("ValueBase") or v54:IsA("Folder")) or v54:IsA("Configuration")) or v54:IsA("Model") then
        if v12[v53] then
            v12[v53].namedChanged[v54] = v54:GetPropertyChangedSignal("Name"):Connect(function()
                local l_v53_0 = v53;
                local l_v54_0 = v54;
                if l_v54_0.Name == "leaderstats" then
                    v36(l_v53_0, l_v54_0);
                    return ;
                elseif v12[l_v53_0] then
                    local v57 = v12[l_v53_0].leaderstats[l_v54_0];
                    if v57 then
                        v57.childAdded:Disconnect();
                        v57.childRemoved:Disconnect();
                        for _, v59 in v57.leaderStatNameChanged, nil, nil do
                            v59:Disconnect();
                        end;
                        v12[l_v53_0].leaderstats[l_v54_0] = nil;
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end);
            if v54.Name == "leaderstats" then
                v36(v53, v54);
                return ;
            elseif v12[v53] then
                local v60 = v12[v53].leaderstats[v54];
                if v60 then
                    v60.childAdded:Disconnect();
                    v60.childRemoved:Disconnect();
                    for _, v62 in v60.leaderStatNameChanged, nil, nil do
                        v62:Disconnect();
                    end;
                    v12[v53].leaderstats[v54] = nil;
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
local _ = function(v64, v65)
    if v12[v64] then
        if v12[v64].namedChanged[v65] then
            v12[v64].namedChanged[v65]:Disconnect();
            v12[v64].namedChanged[v65] = nil;
        end;
        if v65.Name == "leaderstats" then
            if v12[v64] then
                local v66 = v12[v64].leaderstats[v65];
                if v66 then
                    v66.childAdded:Disconnect();
                    v66.childRemoved:Disconnect();
                    for _, v68 in v66.leaderStatNameChanged, nil, nil do
                        v68:Disconnect();
                    end;
                    v12[v64].leaderstats[v65] = nil;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v79(v70)
    v12[v70] = {
        childAdded = v70.ChildAdded:Connect(function(v71)
            v63(v70, v71);
        end), 
        childRemoved = v70.ChildRemoved:Connect(function(v72)
            local l_v70_0 = v70;
            if v12[l_v70_0] then
                if v12[l_v70_0].namedChanged[v72] then
                    v12[l_v70_0].namedChanged[v72]:Disconnect();
                    v12[l_v70_0].namedChanged[v72] = nil;
                end;
                if v72.Name == "leaderstats" then
                    if v12[l_v70_0] then
                        local v74 = v12[l_v70_0].leaderstats[v72];
                        if v74 then
                            v74.childAdded:Disconnect();
                            v74.childRemoved:Disconnect();
                            for _, v76 in v74.leaderStatNameChanged, nil, nil do
                                v76:Disconnect();
                            end;
                            v12[l_v70_0].leaderstats[v72] = nil;
                        else
                            return ;
                        end;
                    else
                        return ;
                    end;
                end;
                return ;
            else
                return ;
            end;
        end), 
        namedChanged = {}, 
        leaderstats = {}
    };
    for _, v78 in v70:GetChildren() do
        v63(v70, v78);
    end;
end;
local function v87(v80)
    if v12[v80] then
        v12[v80].childAdded:Disconnect();
        v12[v80].childRemoved:Disconnect();
        for _, v82 in v12[v80].namedChanged, nil, nil do
            v82:Disconnect();
        end;
        for _, v84 in v12[v80].leaderstats, nil, nil do
            v84.childAdded:Disconnect();
            v84.childRemoved:Disconnect();
            for _, v86 in v84.leaderStatNameChanged, nil, nil do
                v86:Disconnect();
            end;
        end;
        v12[v80] = nil;
        return ;
    else
        return ;
    end;
end;
l_Players_0.PlayerAdded:Connect(v79);
l_Players_0.PlayerRemoving:Connect(v87);
for _, v89 in l_Players_0:GetPlayers() do
    v79(v89);
end;
