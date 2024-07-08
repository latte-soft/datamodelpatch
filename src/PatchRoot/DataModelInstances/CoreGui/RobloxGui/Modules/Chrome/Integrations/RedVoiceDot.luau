local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_RobloxGui_0.Modules.VoiceChat.Hooks.useVoiceState);
local v6 = require(l_RobloxGui_0.Modules.InGameChat.BubbleChat.Constants);
if require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveInGameChatBubbleChatReferences)() then
    v6 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
end;
local v7 = Color3.new(0.918, 0.2, 0.137);
local v8 = UDim2.new(0, 4, 0, 4);
return function(v9)
    local v10 = v5(not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0);
    local v11 = true;
    if v10 ~= v6.VOICE_STATE.INACTIVE then
        v11 = v10 == v6.VOICE_STATE.TALKING;
    end;
    return v2.createElement("Frame", {
        Name = "RedVoiceDot", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v9.position, 
        Size = v8, 
        BackgroundColor3 = v7, 
        Visible = v11
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;
