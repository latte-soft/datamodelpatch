local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagGetClientReplicatorCheck);
local v1 = nil;
return function()
    if v1 == nil then
        local l_game_Service_0 = game:FindService("NetworkClient");
        if l_game_Service_0 then
            v1 = l_game_Service_0:FindFirstChildOfClass("ClientReplicator");
        end;
    end;
    if not v0() then
        return v1;
    elseif not v1 or not v1:IsDescendantOf(game) then
        return nil;
    else
        return v1;
    end;
end;
