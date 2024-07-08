local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.OptInStatus.SetVoiceChatOptInStatus);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
return function(v3, v4)
    v3 = v3 or {};
    if v4.type == v1.name then
        v3 = v2.Dictionary.join(v3, {
            isUserOptIn = v4.isUserOptIn
        });
    end;
    return v3;
end;
