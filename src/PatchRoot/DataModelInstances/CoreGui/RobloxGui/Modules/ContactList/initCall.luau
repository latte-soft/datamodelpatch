local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_default_0 = require(l_CoreGui_0.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default;
local _ = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local v7 = require(script.Parent.dependencies);
local l_RoduxCall_0 = v7.RoduxCall;
local l_CallAction_0 = l_RoduxCall_0.Enums.CallAction;
local l_teleportToRootPlace_0 = v7.teleportToRootPlace;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
return function(v17)
    local function _(v18)
        coroutine.wrap(function()
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", math.huge):FireServer(v18);
        end)();
    end;
    v17:getCallState():andThen(function(v20)
        if not (not (not (v20.status == l_RoduxCall_0.Enums.Status.Teleporting) or not l_Players_0.LocalPlayer) and v20.callerId == l_Players_0.LocalPlayer.UserId) or not v20.callId then
            if not (not (not (not (v20.status == l_RoduxCall_0.Enums.Status.Accepting) or not l_Players_0.LocalPlayer) and v20.calleeId == l_Players_0.LocalPlayer.UserId) or not v20.callId) then
                if v20.instanceId == game.JobId then
                    v17:answerSuccessCall(v20.callId);
                    return ;
                else
                    v17:rejectCall(v20.callId);
                end;
            end;
            return ;
        elseif v20.instanceId == game.JobId then
            v17:teleportSuccessCall(v20.callId);
            return ;
        else
            v17:finishCall(v20.callId);
            return ;
        end;
    end);
    l_FaceAnimatorService_0:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(function()
        v17:updateMicAndCamState(nil, l_FaceAnimatorService_0.VideoAnimationEnabled);
    end);
    l_default_0.muteChanged.Event:Connect(function(v21)
        local v22 = l_default_0:getService();
        if (v22 and v22.VoiceChatState ~= Enum.VoiceChatState.Leaving) and v22.VoiceChatState ~= Enum.VoiceChatState.Ended then
            v17:updateMicAndCamState(v21, nil);
        end;
    end);
    v11 = v17:listenToHandleMicAndCamChanged(function(v23)
        local v24 = l_default_0:getService();
        if (((v24 and v24.VoiceChatState == Enum.VoiceChatState.Joined) and l_default_0.localMuted ~= nil) and v23.muted ~= nil) and v23.muted ~= l_default_0.localMuted then
            l_default_0:ToggleMic("CallAPI");
        end;
        if (l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled ~= v23.camEnabled) and v23.camEnabled ~= nil then
            l_FaceAnimatorService_0.VideoAnimationEnabled = v23.camEnabled;
        end;
    end);
    v12 = v17:listenToHandleTeleportingCall(function(v25)
        if not ((not (v25.status == l_RoduxCall_0.Enums.Status.Teleporting) or not l_Players_0.LocalPlayer) or not v25.callId) and v25.callerId == l_Players_0.LocalPlayer.UserId then
            coroutine.wrap(function()
                if v25.instanceId == game.JobId then
                    v17:teleportSuccessCall(v25.callId);
                    return ;
                else
                    l_RobloxReplicatedStorage_0:WaitForChild("ContactListIrisInviteTeleport", math.huge):FireServer(v25.placeId, v25.instanceId, v25.reservedServerAccessCode);
                    return ;
                end;
            end)();
        end;
    end);
    v13 = v17:listenToHandleTransferCallTeleportJoin(function(v26)
        local v27 = {
            callId = v26.callId, 
            participants = {
                tostring(v26.callerId), 
                (tostring(v26.calleeId))
            }
        };
        coroutine.wrap(function()
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", math.huge):FireServer(v27);
        end)();
    end);
    v14 = v17:listenToHandleTransferCallTeleportLeave(function(_)
        local l_wrap_0 = coroutine.wrap;
        local v30 = nil;
        l_wrap_0(function()
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", math.huge):FireServer(v30);
        end)();
    end);
    v15 = v17:listenToHandleActiveCall(function(v31)
        local v32 = {
            callId = v31.callId, 
            participants = {
                tostring(v31.callerId), 
                (tostring(v31.calleeId))
            }
        };
        coroutine.wrap(function()
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", math.huge):FireServer(v32);
        end)();
    end);
    v16 = v17:listenToHandleEndCall(function(v33)
        local l_wrap_1 = coroutine.wrap;
        local v35 = nil;
        l_wrap_1(function()
            l_RobloxReplicatedStorage_0:WaitForChild("UpdateCurrentCall", math.huge):FireServer(v35);
        end)();
        if v33.callAction == l_CallAction_0.Finish and game.JobId == v33.instanceId then
            l_teleportToRootPlace_0();
        end;
    end);
end;
