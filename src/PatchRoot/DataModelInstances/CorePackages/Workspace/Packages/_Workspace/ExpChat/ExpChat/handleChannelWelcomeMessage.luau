local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Set_0 = require(l_script_FirstAncestor_0.Parent.llama).Set;
local v2 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v3 = {};
return function(v4, v5)
    if not ((not v4.TextChannel or not string.find(v4.TextChannel.Name, "^RBXWhisper")) or l_Set_0.has(v3, v4.TextChannel)) then
        local v6 = v2(v4.TextChannel, v5);
        if v6 then
            v3 = l_Set_0.add(v3, v4.TextChannel);
            return {
                key = "CoreScripts.TextChat.Notification.WhisperChat.Created", 
                args = {
                    RBX_NAME = v6
                }, 
                metadata = "Roblox.Whisper.Welcome.Sent"
            };
        end;
    end;
    return nil;
end;
