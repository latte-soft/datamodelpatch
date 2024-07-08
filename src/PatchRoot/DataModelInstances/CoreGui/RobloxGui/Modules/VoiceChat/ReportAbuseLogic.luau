local _ = require(script.Parent.VoiceChatServiceManager);
local v1 = {
    voice = "voice", 
    text = "text", 
    other = "other"
};
GetDefaultMethodOfAbuse = function(v2, v3)
    if not v2 then
        if not v3:GetMutedAnyone() then
            return v1.text;
        else
            return v1.voice;
        end;
    elseif not v3:getRecentUsersInteractionData()[tostring(v2.UserId)] then
        return v1.text;
    else
        return v1.voice;
    end;
end;
return {
    MethodsOfAbuse = v1, 
    GetDefaultMethodOfAbuse = GetDefaultMethodOfAbuse
};
