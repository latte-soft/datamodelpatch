local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.FormatStatString);
local v8 = require(l_Parent_0.Actions.AddGameStat);
local v9 = require(l_Parent_0.Actions.RemoveGameStat);
local v10 = require(l_Parent_0.Actions.SetPlayerLeaderstat);
local v11 = require(l_Parent_0.Actions.SetGameStatText);
local v12 = require(l_Parent_0.Actions.SetGameStatAddId);
local v13 = v4.PureComponent:extend("LeaderstatsConnector");
local v14 = require(l_Parent_0.Flags.FFlagLeaderstatsWithASideOfClient);
local function v16(v15)
    return ((((v15:IsA("StringValue") or v15:IsA("IntValue")) or v15:IsA("BoolValue")) or v15:IsA("NumberValue")) or v15:IsA("DoubleConstrainedValue")) or v15:IsA("IntConstrainedValue");
end;
local function _(v17)
    if not v17:IsA("DoubleConstrainedValue") and not v17:IsA("IntConstrainedValue") then
        if not v17:IsA("BoolValue") then
            return v17.Value;
        elseif not v17.Value then
            return 0;
        else
            return 1;
        end;
    else
        return v17.ConstrainedValue;
    end;
end;
local v19 = nil;
local v20 = nil;
if v14 then
    v20 = Instance.new("BindableEvent");
    v19 = l_RobloxReplicatedStorage_0:GetAttribute("LeaderstatsOrder") or {};
    l_RobloxReplicatedStorage_0:GetAttributeChangedSignal("LeaderstatsOrder"):Connect(function()
        v19 = l_RobloxReplicatedStorage_0:GetAttribute("LeaderstatsOrder") or {};
        v20:Fire(v19);
    end);
    local l_HttpService_0 = game:GetService("HttpService");
    local function v23(v22)
        return l_HttpService_0:JSONDecode(v22);
    end;
    local function _(v24)
        local l_status_0, l_result_0 = pcall(v23, v24);
        return not not l_status_0 and l_result_0 or {};
    end;
    local v28 = nil;
    do
        local l_v28_0 = v28;
        l_v28_0 = l_RobloxReplicatedStorage_0.ChildAdded:Connect(function(v30)
            if v30.Name ~= "LeaderstatsOrder" then
                return ;
            else
                l_v28_0:Disconnect();
                local l_status_1, l_result_1 = pcall(v23, v30.Value);
                v19 = not not l_status_1 and l_result_1 or {};
                v30.Changed:Connect(function(v33)
                    local l_status_2, l_result_2 = pcall(v23, v33);
                    v19 = not not l_status_2 and l_result_2 or {};
                    v20:Fire(v19);
                end);
                return ;
            end;
        end);
        for _, v37 in ipairs(l_RobloxReplicatedStorage_0:GetChildren()) do
            if not (v37.Name ~= "LeaderstatsOrder") then
                l_v28_0:Disconnect();
                local l_status_3, l_result_3 = pcall(v23, v37.Value);
                v19 = not not l_status_3 and l_result_3 or {};
                v37.Changed:Connect(function(v40)
                    local l_status_4, l_result_4 = pcall(v23, v40);
                    v19 = not not l_status_4 and l_result_4 or {};
                    v20:Fire(v19);
                end);
            end;
        end;
    end;
end;
v13.init = function(v43)
    v43.playerConnections = {};
end;
v13.checkGameStatsExist = function(v44, v45)
    local v46 = {};
    for _, v48 in ipairs(v44.props.gameStats) do
        v46[v48.name] = false;
    end;
    for _, v50 in ipairs(v44.props.players) do
        if v50 ~= v45 then
            local l_leaderstats_0 = v50:FindFirstChild("leaderstats");
            if l_leaderstats_0 then
                for v52 in pairs(v46) do
                    if l_leaderstats_0:FindFirstChild(v52) then
                        v46[v52] = true;
                    end;
                end;
            end;
        end;
    end;
    for v53, v54 in pairs(v46) do
        if not v54 then
            v44.props.removeGameStat(v53);
        end;
    end;
end;
v13.addGameStat = function(v55, v56)
    local v57 = false;
    local v58 = 0;
    local l_IsPrimary_0 = v56:FindFirstChild("IsPrimary");
    if l_IsPrimary_0 then
        v57 = not l_IsPrimary_0:IsA("BoolValue") and true or l_IsPrimary_0.Value;
    end;
    local l_Priority_0 = v56:FindFirstChild("Priority");
    if not (not l_Priority_0 or not l_Priority_0:IsA("IntValue") and not l_Priority_0:IsA("NumberValue")) then
        v58 = l_Priority_0.Value;
    end;
    v55.props.addGameStat(v56.Name, v57, v58);
end;
v13.onStatAdded = function(v61, v62, v63)
    table.insert(v61.playerConnections[v62], (v63.Changed:Connect(function()
        local l_setPlayerLeaderstat_0 = v61.props.setPlayerLeaderstat;
        local l_v62_0 = v62;
        local l_Name_0 = v63.Name;
        local l_v63_0 = v63;
        l_setPlayerLeaderstat_0(l_v62_0, l_Name_0, if l_v63_0:IsA("DoubleConstrainedValue") or l_v63_0:IsA("IntConstrainedValue") then l_v63_0.ConstrainedValue else if l_v63_0:IsA("BoolValue") then l_v63_0.Value and 1 or 0 else l_v63_0.Value);
        if v62 == l_Players_0.LocalPlayer then
            l_setPlayerLeaderstat_0 = v61.props.setGameStatText;
            l_v62_0 = v63.Name;
            l_Name_0 = v7;
            l_v63_0 = v63;
            l_setPlayerLeaderstat_0(l_v62_0, l_Name_0(if l_v63_0:IsA("DoubleConstrainedValue") or l_v63_0:IsA("IntConstrainedValue") then l_v63_0.ConstrainedValue else if l_v63_0:IsA("BoolValue") then l_v63_0.Value and 1 or 0 else l_v63_0.Value));
        end;
    end)));
    if v14 and v62 == l_Players_0.LocalPlayer then
        table.insert(v61.playerConnections[v62], (v63:GetPropertyChangedSignal("Name"):Connect(function()
            local l_setGameStatText_0 = v61.props.setGameStatText;
            local l_Name_1 = v63.Name;
            local l_v7_0 = v7;
            local l_v63_1 = v63;
            l_setGameStatText_0(l_Name_1, l_v7_0(if l_v63_1:IsA("DoubleConstrainedValue") or l_v63_1:IsA("IntConstrainedValue") then l_v63_1.ConstrainedValue else if l_v63_1:IsA("BoolValue") then l_v63_1.Value and 1 or 0 else l_v63_1.Value));
        end)));
        table.insert(v61.playerConnections[v62], (v20.Event:Connect(function(v72)
            local l_Name_2 = v63.Name;
            v61.props.setGameStatAddId(l_Name_2, v72[l_Name_2]);
        end)));
    end;
    table.insert(v61.playerConnections[v62], (v63.ChildAdded:Connect(function()
        v61:addGameStat(v63);
    end)));
    table.insert(v61.playerConnections[v62], (v63.ChildRemoved:Connect(function()
        v61:addGameStat(v63);
    end)));
    v61:addGameStat(v63);
    v61.props.setPlayerLeaderstat(v62, v63.Name, if v63:IsA("DoubleConstrainedValue") or v63:IsA("IntConstrainedValue") then v63.ConstrainedValue else if v63:IsA("BoolValue") then v63.Value and 1 or 0 else v63.Value);
    if v62 == l_Players_0.LocalPlayer then
        local l_Name_3 = v63.Name;
        if v14 then
            v61.props.setGameStatAddId(l_Name_3, v19[l_Name_3]);
        end;
        v61.props.setGameStatText(l_Name_3, v7(if v63:IsA("DoubleConstrainedValue") or v63:IsA("IntConstrainedValue") then v63.ConstrainedValue else if v63:IsA("BoolValue") then v63.Value and 1 or 0 else v63.Value));
    end;
end;
v13.leaderstatsAdded = function(v75, v76, v77)
    table.insert(v75.playerConnections[v76], (v77.ChildAdded:Connect(function(v78)
        if v16(v78) then
            v75:onStatAdded(v76, v78);
        end;
    end)));
    table.insert(v75.playerConnections[v76], (v77.ChildRemoved:Connect(function(v79)
        v75.props.setPlayerLeaderstat(v76, v79.Name, v3.None);
        if v76 == l_Players_0.LocalPlayer then
            v75.props.setGameStatText(v79.Name, v7(nil));
        end;
        v75:checkGameStatsExist();
    end)));
    for _, v81 in ipairs((v77:GetChildren())) do
        if v16(v81) then
            v75:onStatAdded(v76, v81);
        end;
    end;
end;
v13.onPlayerChildAdded = function(v82, v83, v84)
    local v85 = v84.Name == "leaderstats";
    local v86 = (v84:IsA("ValueBase") or v84:IsA("Folder")) or v84:IsA("Model");
    if v85 or v86 then
        table.insert(v82.playerConnections[v83], (v84.Changed:Connect(function(v87)
            if v87 == "Name" and v84.Name == "leaderstats" then
                v82:leaderstatsAdded(v83, v84);
            end;
        end)));
        if v84.Name == "leaderstats" then
            v82:leaderstatsAdded(v83, v84);
        end;
        return ;
    else
        return ;
    end;
end;
v13.connectLeaderstatsEvents = function(v88, v89)
    v88.playerConnections[v89] = {};
    table.insert(v88.playerConnections[v89], (v89.ChildAdded:Connect(function(v90)
        v88:onPlayerChildAdded(v89, v90);
    end)));
    table.insert(v88.playerConnections[v89], (v89.ChildRemoved:Connect(function(v91)
        if v91.Name == "leaderstats" then
            for _, v93 in pairs((v91:GetChildren())) do
                v88.props.setPlayerLeaderstat(v89, v93.Name, v3.None);
                if v89 == l_Players_0.LocalPlayer then
                    v88.props.setGameStatText(v93.Name, v7(nil));
                end;
            end;
            v88:checkGameStatsExist();
        end;
    end)));
    local l_leaderstats_1 = v89:FindFirstChild("leaderstats");
    if not l_leaderstats_1 then
        for _, v96 in ipairs(v89:GetChildren()) do
            v88:onPlayerChildAdded(v89, v96);
        end;
        return ;
    else
        v88:leaderstatsAdded(v89, l_leaderstats_1);
        return ;
    end;
end;
v13.didMount = function(v97)
    for _, v99 in ipairs(v97.props.players) do
        v97:connectLeaderstatsEvents(v99);
    end;
end;
v13.didUpdate = function(v100)
    local v101 = {};
    for _, v103 in ipairs(v100.props.players) do
        v101[v103] = true;
        if not v100.playerConnections[v103] then
            v100:connectLeaderstatsEvents(v103);
        end;
    end;
    for v104 in pairs(v100.playerConnections) do
        if not v101[v104] then
            for _, v106 in ipairs(v100.playerConnections[v104]) do
                v106:Disconnect();
            end;
            v100.playerConnections[v104] = nil;
        end;
    end;
end;
v13.render = function(_)
    return nil;
end;
v13.willUnmount = function(v108)
    for _, v110 in pairs(v108.playerConnections) do
        for _, v112 in ipairs(v110) do
            v112:Disconnect();
        end;
    end;
    v108.playerConnections = {};
end;
return v5.connect(function(v113)
    return {
        players = v113.players, 
        gameStats = v113.gameStats
    };
end, function(v114)
    return {
        addGameStat = function(v115, v116, v117)
            return v114(v8(v115, v116, v117));
        end, 
        removeGameStat = function(v118)
            return v114(v9(v118));
        end, 
        setPlayerLeaderstat = function(v119, v120, v121)
            return v114(v10(v119, v120, v121));
        end, 
        setGameStatText = function(v122, v123)
            return v114(v11(v122, v123));
        end, 
        setGameStatAddId = not not v14 and function(v124, v125)
            return v114(v12(v124, v125));
        end or nil
    };
end)(v13);
