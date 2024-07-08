local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v5 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.Url);
local v6 = {};
v6.__index = v6;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v8 = nil;
spawn(function()
    v8 = l_RobloxReplicatedStorage_0:WaitForChild("UpdatePlayerBlockList", math.huge);
end);
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local v12 = false;
local v13 = false;
local l_BindableEvent_3 = Instance.new("BindableEvent");
local v15 = {};
local v16 = {};
local function v23()
    local v17 = v5.ACCOUNT_SETTINGS_URL .. "v1/users/get-blocked-users";
    local v18 = nil;
    if (not pcall(function()
        local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl(v17, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        v18 = l_l_HttpRbxApiService_0_AsyncFullUrl_0 and l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
    end) or not v18) or not v18.blockedUserIds then
        return {};
    else
        local v20 = {};
        for _, v22 in pairs(v18.blockedUserIds) do
            v20[v22] = true;
        end;
        return v20;
    end;
end;
local _ = function()
    local v24 = {};
    for v25, _ in pairs(v15) do
        table.insert(v24, v25);
    end;
    return v24;
end;
local function v32()
    if l_LocalPlayer_0.UserId > 0 then
        local v28 = 0;
        while true do
            if not v12 then
                v28 = v28 + wait();
                if v28 > 5 then
                    return {};
                end;
            else
                local v29 = {};
                for v30, _ in pairs(v15) do
                    table.insert(v29, v30);
                end;
                return v29;
            end;
        end;
    else
        return {};
    end;
end;
local function v33()
    if not v12 then
        if not v13 then
            v13 = true;
            v15 = v23();
            v12 = true;
            l_BindableEvent_3:Fire();
            l_RobloxReplicatedStorage_0:WaitForChild("SetPlayerBlockList", math.huge):FireServer((v32()));
            return ;
        else
            l_BindableEvent_3.Event:Wait();
            return ;
        end;
    else
        return ;
    end;
end;
local function _(v34)
    if not v15[v34] then
        return false;
    else
        return true;
    end;
end;
local function _(v36)
    if v16[v36] ~= nil and v16[v36] == true then
        return true;
    else
        return false;
    end;
end;
local function v45(v38)
    if v38 and l_LocalPlayer_0 ~= v38 then
        local l_UserId_0 = v38.UserId;
        if l_UserId_0 > 0 then
            if not not v15[l_UserId_0] or false then
                return true;
            else
                v15[l_UserId_0] = true;
                l_BindableEvent_0:Fire(l_UserId_0, true);
                if v8 then
                    v8:FireServer(l_UserId_0, true);
                end;
                local v40 = nil;
                local v41 = nil;
                local l_status_0, l_result_0 = pcall(function()
                    local v42 = l_HttpRbxApiService_0:PostAsyncFullUrl(v5.ACCOUNT_SETTINGS_URL .. "v1/users/" .. tostring(v38.UserId) .. "/block", "");
                    if not v42 then
                        return ;
                    else
                        v42 = l_HttpService_0:JSONDecode(v42);
                        return v42 and not v42.errors;
                    end;
                end);
                v40 = l_status_0;
                v41 = l_result_0;
                if not (not v40 or not v41) then
                    l_BindableEvent_1:Fire(l_UserId_0, true);
                end;
                return v40 and v41;
            end;
        end;
    end;
    return false;
end;
local function v53(v46)
    if not v46 then
        return false;
    else
        local l_UserId_1 = v46.UserId;
        if not (not not v15[l_UserId_1] or false) then
            return true;
        else
            v15[l_UserId_1] = nil;
            l_BindableEvent_0:Fire(l_UserId_1, false);
            if v8 then
                v8:FireServer(l_UserId_1, false);
            end;
            local v48 = nil;
            local v49 = nil;
            local l_status_1, l_result_1 = pcall(function()
                local v50 = l_HttpRbxApiService_0:PostAsyncFullUrl(v5.ACCOUNT_SETTINGS_URL .. "v1/users/" .. tostring(v46.UserId) .. "/unblock", "");
                if not v50 then
                    return ;
                else
                    v50 = l_HttpService_0:JSONDecode(v50);
                    return v50 and not v50.errors;
                end;
            end);
            v48 = l_status_1;
            v49 = l_result_1;
            if not (not v48 or not v49) then
                l_BindableEvent_1:Fire(l_UserId_1, false);
            end;
            return v48 and v49;
        end;
    end;
end;
local function v56(v54)
    if v54 and l_LocalPlayer_0 ~= v54 then
        local l_UserId_2 = v54.UserId;
        if not (not (l_UserId_2 > 0) or v16[l_UserId_2] ~= nil and v16[l_UserId_2] == true) then
            v16[l_UserId_2] = true;
            l_BindableEvent_2:Fire(l_UserId_2, true);
        end;
    end;
end;
local function v59(v57)
    if v57 then
        local l_UserId_3 = v57.UserId;
        v16[l_UserId_3] = nil;
        l_BindableEvent_2:Fire(l_UserId_3, false);
    end;
end;
local l_BindableEvent_4 = Instance.new("BindableEvent");
local l_BindableEvent_5 = Instance.new("BindableEvent");
local l_BindableEvent_6 = Instance.new("BindableEvent");
local l_BindableEvent_7 = Instance.new("BindableEvent");
l_BindableEvent_0.Event:Connect(function(v64, v65)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v64);
    if l_l_Players_0_PlayerByUserId_0 then
        if not v65 then
            l_BindableEvent_5:Fire(l_l_Players_0_PlayerByUserId_0);
        else
            l_BindableEvent_4:Fire(l_l_Players_0_PlayerByUserId_0);
            return ;
        end;
    end;
end);
l_BindableEvent_2.Event:Connect(function(v67, v68)
    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v67);
    if l_l_Players_0_PlayerByUserId_1 then
        if not v68 then
            l_BindableEvent_7:Fire(l_l_Players_0_PlayerByUserId_1);
        else
            l_BindableEvent_6:Fire(l_l_Players_0_PlayerByUserId_1);
            return ;
        end;
    end;
end);
l_StarterGui_0:RegisterGetCore("PlayerBlockedEvent", function()
    return l_BindableEvent_4;
end);
l_StarterGui_0:RegisterGetCore("PlayerUnblockedEvent", function()
    return l_BindableEvent_5;
end);
l_StarterGui_0:RegisterGetCore("PlayerMutedEvent", function()
    return l_BindableEvent_6;
end);
l_StarterGui_0:RegisterGetCore("PlayerUnmutedEvent", function()
    return l_BindableEvent_7;
end);
v6.InitBlockListAsync = function(_)
    v33();
end;
v6.BlockPlayerAsync = function(_, v72)
    return (v45(v72));
end;
v6.UnblockPlayerAsync = function(_, v74)
    return (v53(v74));
end;
v6.MutePlayer = function(_, v76)
    return v56(v76);
end;
v6.UnmutePlayer = function(_, v78)
    return v59(v78);
end;
v6.IsPlayerBlockedByUserId = function(_, v80)
    v33();
    if not v15[v80] then
        return false;
    else
        return true;
    end;
end;
v6.GetBlockedStatusChangedEvent = function(_)
    return l_BindableEvent_0.Event;
end;
v6.GetAfterBlockedStatusChangedEvent = function(_)
    return l_BindableEvent_1.Event;
end;
v6.GetMutedStatusChangedEvent = function(_)
    return l_BindableEvent_2.Event;
end;
v6.IsPlayerMutedByUserId = function(_, v85)
    if v16[v85] ~= nil and v16[v85] == true then
        return true;
    else
        return false;
    end;
end;
v6.GetBlockedUserIdsAsync = function(_)
    return (v32());
end;
return v6;
