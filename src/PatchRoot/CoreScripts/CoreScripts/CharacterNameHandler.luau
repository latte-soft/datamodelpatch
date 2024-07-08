local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.ApolloClient);
local v3 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local v4 = {};
local v5 = {
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving", 
    HumanoidDisplayNameChanged = "HumanoidDisplayNameChanged", 
    CharacterHumanoidAdded = "CharacterHumanoidAdded"
};
local function v11(v6, v7, v8)
    local l_combinedName_0 = v8.names.combinedName;
    local l_displayName_0 = v8.names.displayName;
    if v8.names.displayName == v6.DisplayName then
        v6.InternalDisplayName = l_combinedName_0;
        v4[v7][v5.HumanoidDisplayNameChanged] = v6:GetPropertyChangedSignal("DisplayName"):Connect(function()
            if l_displayName_0 ~= v6.DisplayName then
                v6.InternalDisplayName = "";
            end;
        end);
    end;
end;
local function v17(v12, v13, v14)
    local l_Humanoid_0 = v13:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 then
        v11(l_Humanoid_0, v12, v14);
    end;
    v4[v12][v5.CharacterHumanoidAdded] = v13.ChildAdded:Connect(function(v16)
        if v16:IsA("Humanoid") then
            v11(v16, v12, v14);
        end;
    end);
end;
local function v23(v18, v19)
    v4[v18] = {};
    if v18.Character then
        v17(v18, v18.Character, v19);
    end;
    v4[v18][v5.CharacterAdded] = v18.CharacterAdded:Connect(function(v20)
        v17(v18, v20, v19);
    end);
    v4[v18][v5.CharacterRemoving] = v18.CharacterRemoving:Connect(function()
        local v21 = v4[v18][v5.CharacterHumanoidAdded];
        local v22 = v4[v18][v5.HumanoidDisplayNameChanged];
        if v21 then
            v4[v18][v5.CharacterHumanoidAdded]:Disconnect();
        end;
        if v22 then
            v4[v18][v5.HumanoidDisplayNameChanged]:Disconnect();
        end;
    end);
end;
local function v32()
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    local v25 = {};
    local v26 = {};
    for _, v28 in pairs(l_l_Players_0_Players_0) do
        table.insert(v25, (tostring(v28.UserId)));
        v26[tostring(v28.UserId)] = v28;
    end;
    v2:query({
        query = v3.Queries.userProfilesAllNamesByUserIds, 
        variables = {
            userIds = v25
        }
    }):andThen(function(v29)
        for _, v31 in pairs(v29.data.userProfiles) do
            v23(v26[v31.id], v31);
        end;
    end, function()
    end);
end;
local function v35(v33)
    v2:query({
        query = v3.Queries.userProfilesAllNamesByUserIds, 
        variables = {
            userIds = {
                (tostring(v33.UserId))
            }
        }
    }):andThen(function(v34)
        v23(v33, v34.data.userProfiles[1]);
    end, function()
    end);
end;
local function v40(v36)
    local v37 = v4[v36];
    if v4[v36] then
        for _, v39 in pairs(v37) do
            v39:Disconnect();
        end;
        v4[v36] = nil;
    end;
end;
v32();
l_Players_0.PlayerAdded:Connect(v35);
l_Players_0.PlayerRemoving:Connect(v40);
