local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Cryo);
return (require(l_CorePackages_0.Packages.Rodux).createReducer({
    bubbleChatEnabled = false, 
    voiceEnabled = false
}, {
    [require(script.Parent.Parent.Actions.BubbleChatEnabledChanged).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            bubbleChatEnabled = v4.enabled
        });
    end, 
    [require(l_RobloxGui_0.Modules.VoiceChat.Actions.VoiceEnabledChanged).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            voiceEnabled = v6.enabled
        });
    end
}));
