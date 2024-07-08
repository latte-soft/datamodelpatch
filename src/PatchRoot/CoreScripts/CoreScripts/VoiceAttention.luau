local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default.participantsUpdate.Event:Connect(function(v3)
    for v4, v5 in pairs(v3) do
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v4);
        if l_l_Players_0_PlayerByUserId_0 then
            l_l_Players_0_PlayerByUserId_0:SetAttribute("RBXAttentionVoiceIsActive", v5.isSignalActive);
        end;
    end;
end);
local function v8()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        l_LocalPlayer_0:SetAttribute("RBXAttentionVideoAnimationEnabled", l_FaceAnimatorService_0.VideoAnimationEnabled);
    end;
end;
local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
if l_LocalPlayer_1 then
    l_LocalPlayer_1:SetAttribute("RBXAttentionVideoAnimationEnabled", l_FaceAnimatorService_0.VideoAnimationEnabled);
end;
l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v8);
