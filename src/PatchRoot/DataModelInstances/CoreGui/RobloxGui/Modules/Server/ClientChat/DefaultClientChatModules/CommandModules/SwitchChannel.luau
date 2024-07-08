local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v1 = nil;
pcall(function()
    v1 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v1 == nil then
    v1 = {
        Get = function(_, _, v4)
            return v4;
        end
    };
end;
ProcessMessage = function(v5, v6, v7)
    if string.sub(v5, 1, 3):lower() ~= "/c " then
        return false;
    else
        local v8 = string.sub(v5, 4);
        local l_v6_Channel_0 = v6:GetChannel(v8);
        if not l_v6_Channel_0 then
            local l_v6_CurrentChannel_0 = v6:GetCurrentChannel();
            if l_v6_CurrentChannel_0 then
                l_Util_0:SendSystemMessageToSelf(string.gsub(v1:Get("GameChat_SwitchChannel_NotInChannel", string.format("You are not in channel: '%s'", v8), {
                    RBX_NAME = v8
                }), "{RBX_NAME}", v8), l_v6_CurrentChannel_0, {
                    ChatColor = Color3.fromRGB(245, 50, 50)
                });
            end;
        else
            v6:SwitchCurrentChannel(v8);
            if not (v7.ShowChannelsBar or not v6:GetCurrentChannel()) then
                l_Util_0:SendSystemMessageToSelf(string.gsub(v1:Get("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: '%s'", v8), {
                    RBX_NAME = v8
                }), "{RBX_NAME}", v8), l_v6_Channel_0, {});
            end;
        end;
        return true;
    end;
end;
return {
    [l_Util_0.KEY_COMMAND_PROCESSOR_TYPE] = l_Util_0.COMPLETED_MESSAGE_PROCESSOR, 
    [l_Util_0.KEY_PROCESSOR_FUNCTION] = ProcessMessage
};
