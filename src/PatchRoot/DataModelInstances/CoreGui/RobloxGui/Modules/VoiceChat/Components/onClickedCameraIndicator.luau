local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.SelfView.Analytics).new();
local v3 = require(l_Modules_0.SelfView.publicApi);
local v4 = require(l_Modules_0.SelfView.toggleSelfViewSignal);
return function()
    if not (not l_FaceAnimatorService_0 or not l_FaceAnimatorService_0:IsStarted()) then
        l_FaceAnimatorService_0.VideoAnimationEnabled = not l_FaceAnimatorService_0.VideoAnimationEnabled;
        v2:setLastCtx("bubbleChatToggle");
        local v5 = v3.getSelfViewIsOpenAndVisible();
        if not (not l_FaceAnimatorService_0.VideoAnimationEnabled or v5) then
            v4:fire();
        end;
    end;
end;
