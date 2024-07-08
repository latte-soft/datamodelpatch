local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "SetDialogInUse";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
local v3 = {};
local function v7(v4, v5, v6)
    if typeof(v5) == "Instance" and v5:IsA("Dialog") then
        if type(v6) ~= "boolean" then
            return ;
        elseif typeof(v4) == "Instance" and v4:IsA("Player") then
            if v5 then
                v5:SetPlayerIsUsing(v4, v6);
                v3[v4] = not not v6 and v5 or nil;
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
l_Players_0.PlayerRemoving:Connect(function(v8)
    local v9 = v3[v8];
    if v9 then
        v9:SetPlayerIsUsing(v8, false);
        v3[v8] = nil;
    end;
end);
l_RemoteEvent_0.OnServerEvent:Connect(v7);
