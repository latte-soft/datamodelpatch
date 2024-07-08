local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui", math.huge);
assert(v2 ~= nil, "RobloxGui should exist");
local v3 = require(v2.Modules.Common.Flags.GetFFlagPlayerViewRemoteEnabled);
local v4 = require(v2.Modules.Common.Flags.GetFFlagPlayerViewValidateRequesteeEnabled);
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "RequestDeviceCameraOrientationCapability";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteEvent_0.OnServerEvent:Connect(function(v6, v7)
    local l_OsPlatform_0 = v7.OsPlatform;
    local l_l_RemoteEvent_0_0 = l_RemoteEvent_0;
    local l_v6_0 = v6;
    local l_v7_0 = v7;
    local v12 = true;
    if l_OsPlatform_0 ~= "iOS" then
        v12 = l_OsPlatform_0 == "Android";
    end;
    l_l_RemoteEvent_0_0:FireClient(l_v6_0, l_v7_0, v12);
end);
if v3() then
    local l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "RequestDeviceCameraCFrame";
    l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
    local l_UnreliableRemoteEvent_0 = Instance.new("UnreliableRemoteEvent");
    l_UnreliableRemoteEvent_0.Name = "ReplicateDeviceCameraCFrame";
    l_UnreliableRemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
    local v15 = {};
    if v4() then
        l_Players_0.PlayerRemoving:Connect(function(v16)
            v15[tostring(v16.UserId)] = nil;
        end);
    end;
    l_RemoteEvent_1.OnServerEvent:Connect(function(v17, v18)
        if not v4() then
            local v19 = tostring(v18);
            if not v15[v19] then
                v15[v19] = {};
            end;
            v15[v19][tostring(v17.UserId)] = os.clock();
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v18);
            if l_l_Players_0_PlayerByUserId_0 then
                l_RemoteEvent_1:FireClient(l_l_Players_0_PlayerByUserId_0);
            end;
            return ;
        else
            local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v18);
            if l_l_Players_0_PlayerByUserId_1 then
                local v22 = tostring(v18);
                if not v15[v22] then
                    v15[v22] = {};
                end;
                v15[v22][tostring(v17.UserId)] = os.clock();
                l_RemoteEvent_1:FireClient(l_l_Players_0_PlayerByUserId_1);
                return ;
            else
                return ;
            end;
        end;
    end);
    l_UnreliableRemoteEvent_0.OnServerEvent:Connect(function(v23, v24, v25)
        local v26 = tostring(v23.UserId);
        if v15[v26] then
            local v27 = {};
            for v28, v29 in v15[v26], nil, nil do
                if os.clock() - v29 > 5 then
                    table.insert(v27, v28);
                else
                    local v30 = tonumber(v28);
                    if v30 then
                        local l_l_Players_0_PlayerByUserId_2 = l_Players_0:GetPlayerByUserId(v30);
                        if l_l_Players_0_PlayerByUserId_2 then
                            l_UnreliableRemoteEvent_0:FireClient(l_l_Players_0_PlayerByUserId_2, v23, v24, v25);
                        end;
                    end;
                end;
            end;
            for _, v33 in v27, nil, nil do
                v15[v26][v33] = nil;
            end;
        end;
    end);
end;
