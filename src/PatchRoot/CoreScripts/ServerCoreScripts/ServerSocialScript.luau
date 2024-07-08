local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local _ = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local v6 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.Url);
game:DefineFastFlag("EnableSetUserBlocklistInitialized", false);
local v7 = {};
local v8 = {
    Admin = {
        GroupId = 1200769
    }, 
    Intern = {
        GroupId = 2868472, 
        GroupRank = 100
    }, 
    Star = {
        GroupId = 4199740
    }, 
    SpanishLocalizationExpert = {
        GroupId = 4265462, 
        GroupRank = 252
    }, 
    BrazilianLocalizationExpert = {
        GroupId = 4265456, 
        GroupRank = 252
    }, 
    FrenchLocalizationExpert = {
        GroupId = 4265443, 
        GroupRank = 252
    }, 
    GermanLocalizationExpert = {
        GroupId = 4265449, 
        GroupRank = 252
    }
};
if game.CreatorType == Enum.CreatorType.Group then
    v8.PlaceCreator = {
        GroupId = game.CreatorId, 
        GroupRank = 255
    };
end;
local v9 = {};
local v10 = {};
game:DefineFastInt("MaxBlockListSize", 500);
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "CanChatWith";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_1 = Instance.new("RemoteEvent");
l_RemoteEvent_1.Name = "SetPlayerBlockList";
l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_2 = Instance.new("RemoteEvent");
l_RemoteEvent_2.Name = "UpdatePlayerBlockList";
l_RemoteEvent_2.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_3 = Instance.new("RemoteEvent");
l_RemoteEvent_3.Name = "NewPlayerGroupDetails";
l_RemoteEvent_3.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_4 = Instance.new("RemoteEvent");
l_RemoteEvent_4.Name = "NewPlayerCanManageDetails";
l_RemoteEvent_4.Parent = l_RobloxReplicatedStorage_0;
local v16 = {};
local function _(v17)
    return type(v17) == "number";
end;
local function v22(v19)
    if not (#v19 ~= 0) or game:GetFastInt("MaxBlockListSize") < #v19 then
        return false;
    else
        for _, v21 in pairs(v19) do
            if not (type(v21) == "number") then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _(v23)
    l_RemoteEvent_3:FireClient(v23, v9);
end;
local function v34(v25)
    local v26 = {};
    for v27, v28 in pairs(v8) do
        if v28.GroupRank ~= nil then
            local l_status_0, l_result_0 = pcall(function()
                return v28.GroupRank <= v25:GetRankInGroup(v28.GroupId);
            end);
            v26[v27] = l_status_0 and l_result_0;
        else
            local l_status_1, l_result_1 = pcall(function()
                return v25:IsInGroup(v28.GroupId);
            end);
            v26[v27] = l_status_1 and l_result_1;
        end;
    end;
    if v25.Parent then
        local v33 = tostring(v25.UserId);
        v9[v33] = v26;
        l_RemoteEvent_3:FireAllClients({
            [v33] = v26
        });
    end;
end;
local function v41(v35)
    local v36 = {};
    for _, v38 in ipairs(l_Players_0:GetPlayers()) do
        local l_status_2, l_result_2 = pcall(function()
            return l_Chat_0:CanUsersChatAsync(v35.UserId, v38.UserId);
        end);
        v36[v38.userId] = l_status_2 and l_result_2;
        l_RemoteEvent_0:FireClient(v38, {
            [v35.userId] = l_status_2 and l_result_2
        });
    end;
    l_RemoteEvent_0:FireClient(v35, v36);
end;
local function v45(v42)
    for v43, v44 in pairs(v10) do
        l_RemoteEvent_4:FireClient(v42, v43, v44);
    end;
end;
local function v51(v46)
    local v47 = false;
    if v46.UserId > 0 then
        local l_status_3, l_result_3 = pcall(function()
            return l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:PostAsyncFullUrl(string.format(v6.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions"), (l_HttpService_0:JSONEncode({
                requests = {
                    {
                        subject = {
                            subjectType = "User", 
                            subjectId = v46.UserId
                        }, 
                        action = "Edit", 
                        assetId = game.PlaceId
                    }
                }
            })))));
        end);
        if l_status_3 then
            l_result_3 = l_result_3.results[1];
            if l_result_3.value and l_result_3.value.status == "HasPermission" then
                v47 = true;
            end;
        end;
    end;
    if v46.Parent then
        local v50 = tostring(v46.UserId);
        v10[v50] = v47;
        l_RemoteEvent_4:FireAllClients(v50, v47);
    end;
end;
local function v53(v52)
    l_RemoteEvent_3:FireClient(v52, v9);
    if v52.UserId > 0 then
        coroutine.wrap(v34)(v52);
    end;
    v45(v52);
    coroutine.wrap(v51)(v52);
    v41(v52);
end;
l_RemoteEvent_1.OnServerEvent:Connect(function(v54, v55)
    if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
        v54:SetBlockListInitialized();
    end;
    if not (not (type(v55) == "table") or not v22(v55)) then
        v54:AddToBlockList(v55);
    end;
end);
l_RemoteEvent_2.OnServerEvent:Connect(function(v56, v57, v58)
    if not (not (type(v58) == "boolean") or not (type(v57) == "number")) then
        v56:UpdatePlayerBlocked(v57, v58);
    end;
end);
l_Players_0.PlayerAdded:connect(v53);
for _, v60 in pairs(l_Players_0:GetPlayers()) do
    v53(v60);
end;
l_Players_0.PlayerRemoving:connect(function(v61)
    local v62 = tostring(v61.UserId);
    if v7[v62] then
        v7[v62] = nil;
        v16[v62] = nil;
    end;
    if v9[v62] then
        v9[v62] = nil;
    end;
    if v10[v62] ~= nil then
        v10[v62] = nil;
    end;
end);
local function v63()
end;
for _, v65 in ipairs(l_RobloxReplicatedStorage_0:GetChildren()) do
    if v65:IsA("RemoteEvent") then
        v65.OnServerEvent:Connect(v63);
    end;
end;
