local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui", math.huge).Modules.Common.Constants);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v2 = game:DefineFastFlag("GetJoinDataRemoteFunctionEnabled", false);
local l_RemoteFunction_0 = Instance.new("RemoteFunction");
l_RemoteFunction_0.Name = "GetServerType";
l_RemoteFunction_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteFunction_0.OnServerInvoke = function()
    if game.PrivateServerId ~= "" then
        if game.PrivateServerOwnerId ~= 0 then
            return v0.VIP_SERVER;
        else
            return v0.RESERVED_SERVER;
        end;
    else
        return v0.STANDARD_SERVER;
    end;
end;
if v2 then
    local l_RemoteFunction_1 = Instance.new("RemoteFunction");
    l_RemoteFunction_1.Name = "GetJoinData";
    l_RemoteFunction_1.Parent = l_RobloxReplicatedStorage_0;
    l_RemoteFunction_1.OnServerInvoke = function(v5)
        return v5:GetJoinData();
    end;
end;
