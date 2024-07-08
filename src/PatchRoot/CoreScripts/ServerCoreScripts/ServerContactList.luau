local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_SocialService_0 = game:GetService("SocialService");
local l_TeleportService_0 = game:GetService("TeleportService");
local v7 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Common.Url);
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "ContactListInvokeIrisInvite";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteEvent_0.OnServerEvent:Connect(function(v9, v10, v11, v12, v13, v14)
    l_SocialService_0:InvokeIrisInvite(v9, v10, {
        {
            userId = v9.UserId, 
            combinedName = v9.DisplayName, 
            muted = v13, 
            camEnabled = v14
        }, 
        {
            userId = v11, 
            combinedName = v12
        }
    });
end);
local l_RemoteEvent_1 = Instance.new("RemoteEvent");
l_RemoteEvent_1.Name = "ContactListIrisInviteTeleport";
l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
local v16 = {};
l_Players_0.PlayerRemoving:Connect(function(v17)
    v16[v17.UserId] = nil;
end);
l_RemoteEvent_1.OnServerEvent:Connect(function(v18, v19, v20, v21)
    local v22 = v16[v18.UserId];
    if v22 ~= nil and v22 > 5 then
        return ;
    else
        if v22 == nil then
            v16[v18.UserId] = 1;
        else
            v16[v18.UserId] = v22 + 1;
        end;
        if not ((typeof(v20) == "string" and #v20 <= 1000) and typeof(v21) == "string") or #v21 > 1000 then
            return ;
        else
            local l_TeleportOptions_0 = Instance.new("TeleportOptions");
            if v21 ~= nil then
                l_TeleportOptions_0.ReservedServerAccessCode = v21;
            else
                l_TeleportOptions_0.ServerInstanceId = v20;
            end;
            l_TeleportService_0:TeleportAsync(v19, {
                v18
            }, l_TeleportOptions_0);
            return ;
        end;
    end;
end);
local l_RemoteEvent_2 = Instance.new("RemoteEvent");
l_RemoteEvent_2.Name = "UpdateCurrentCall";
l_RemoteEvent_2.Parent = l_RobloxReplicatedStorage_0;
local v25 = nil;
local v26 = {};
local function v32()
    if v25 ~= nil then
        local v27 = false;
        for _, v29 in pairs(l_Players_0:GetPlayers()) do
            if not (table.find(v25.participants, (tostring(v29.UserId))) ~= nil) then
                v27 = true;
                break;
            end;
        end;
        if v27 then
            for _, v31 in pairs(l_Players_0:GetPlayers()) do
                if table.find(v25.participants, (tostring(v31.UserId))) ~= nil then
                    v31:Kick();
                end;
            end;
            v25 = nil;
        end;
    end;
end;
local _ = function(v33)
    local l_status_0, _ = pcall(function()
        return l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:PostAsyncFullUrl(v7.APIS_URL .. "call/v1/force-terminate-call-rcc", (l_HttpService_0:JSONEncode({
            callId = v33
        })))));
    end);
    return l_status_0;
end;
local function v40(v37)
    if not (typeof(v37) == "table" and v37 ~= nil) or #v37 ~= 2 then
        return false;
    else
        for _, v39 in ipairs(v37) do
            if not (typeof(v39) == "string" and #v39 <= 50) or tonumber(v39) == nil then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v50(v41, v42, v43)
    if (typeof(v42) == "string" and #v42 <= 50) and v40(v43) then
        local l_status_1, _ = pcall(function()
            local v44 = v7.APIS_URL .. "call/v1/verify-valid-call";
            local v45 = {};
            for v46, v47 in ipairs(v43) do
                v45[v46] = tonumber(v47);
            end;
            return l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:PostAsyncFullUrl(v44, (l_HttpService_0:JSONEncode({
                callId = v42, 
                userId = v41.UserId, 
                instanceId = game.JobId, 
                callParticipants = v45
            })))));
        end);
        if not l_status_1 then
            return 400;
        else
            return 200;
        end;
    else
        return 400;
    end;
end;
l_RemoteEvent_2.OnServerEvent:Connect(function(v51, v52)
    if v26[v51.UserId] ~= nil and v26[v51.UserId] > 10 then
        return ;
    else
        if v26[v51.UserId] ~= nil then
            v26[v51.UserId] = v26[v51.UserId] + 1;
        else
            v26[v51.UserId] = 1;
        end;
        local v53 = true;
        if v52 ~= nil then
            v53 = v50(v51, v52.callId, v52.participants) == 200;
        end;
        if v53 then
            if (v25 ~= nil and v52 ~= nil) and v25.callId ~= v52.callId then
                local l_callId_0 = v25.callId;
                local _, _ = pcall(function()
                    return l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:PostAsyncFullUrl(v7.APIS_URL .. "call/v1/force-terminate-call-rcc", (l_HttpService_0:JSONEncode({
                        callId = l_callId_0
                    })))));
                end);
                v32();
            end;
            v25 = v52;
            v32();
            return ;
        else
            v51:Kick();
            return ;
        end;
    end;
end);
l_Players_0.PlayerAdded:Connect(function(_)
    v32();
end);
l_Players_0.PlayerRemoving:Connect(function(v58)
    v26[v58.UserId] = nil;
    if not (not (v25 ~= nil) or not (table.find(v25.participants, (tostring(v58.UserId))) ~= nil)) then
        local l_callId_1 = v25.callId;
        local l_status_3, _ = pcall(function()
            return l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:PostAsyncFullUrl(v7.APIS_URL .. "call/v1/force-terminate-call-rcc", (l_HttpService_0:JSONEncode({
                callId = l_callId_1
            })))));
        end);
        if l_status_3 then
            v25 = nil;
        end;
    end;
end);
