local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatConstants_0 = require(l_ClientChatModules_0:WaitForChild("ChatConstants"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
return function(v3)
    if not (not l_ChatSettings_0 or not l_ChatSettings_0.AllowMeCommand) then
        v3:RegisterFilterMessageFunction("me_command", function(_, v5, _)
            local l_Message_0 = v5.Message;
            if l_Message_0 and string.sub(l_Message_0, 1, 4):lower() == "/me " then
                v5.MessageType = l_ChatConstants_0.MessageTypeMeCommand;
            end;
        end);
    end;
end;
