local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local l_RunService_0 = game:GetService("RunService");
local v2 = nil;
pcall(function()
    v2 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v2 == nil then
    v2 = {
        Get = function(_, _, v5)
            return v5;
        end
    };
end;
ProcessMessage = function(_, v7, _)
    local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
    if not (l_LocalPlayer_0 and l_LocalPlayer_0.UserId < 0) or l_RunService_0:IsStudio() then
        return false;
    else
        local l_v7_CurrentChannel_0 = v7:GetCurrentChannel();
        if l_v7_CurrentChannel_0 then
            l_Util_0:SendSystemMessageToSelf(v2:Get("GameChat_SwallowGuestChat_Message", "Create a free account to get access to chat permissions"), l_v7_CurrentChannel_0, {});
        end;
        return true;
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = ProcessMessage
};
