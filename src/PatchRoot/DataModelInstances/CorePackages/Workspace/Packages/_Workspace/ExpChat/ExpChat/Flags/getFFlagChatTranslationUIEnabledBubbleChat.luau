local l_TextChatService_0 = game:GetService("TextChatService");
local v1 = require(script.Parent.getFFlagChatTranslationUIEnabled);
return function()
    if not (l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService) then
        return v1();
    else
        return false;
    end;
end;
