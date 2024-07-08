local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CurrentCamera_0 = game:GetService("Workspace").CurrentCamera;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v9 = require(l_CorePackages_0.Packages.ReactOtter);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local v12 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v13 = require(l_Chrome_0.Service);
local v14 = require(l_Chrome_0.Unibar.Constants);
local v15 = require(l_RobloxGui_0.Modules.TopBar.Constants);
local v16 = require(l_RobloxGui_0.Modules.ContactList.dependencies);
local l_RoduxCall_0 = v16.RoduxCall;
local l_useSelector_0 = v16.Hooks.useSelector;
local l_useDispatch_0 = v16.Hooks.useDispatch;
local l_CallAction_0 = l_RoduxCall_0.Enums.CallAction;
local v21 = require(script.Parent.CallBar);
local v22 = Vector2.new(200, 44);
local v23 = {
    callProtocol = v5.CallProtocol.default
};
local v24 = {
    On = "On", 
    Off = "Off"
};
return function(v25)
    local v26 = v4.Dictionary.join(v23, v25);
    local v27 = l_useDispatch_0();
    local v28, v29 = v3.useState(false);
    local v30 = nil;
    local v31 = nil;
    local v33, v34 = v9.useAnimatedBinding({
        X = l_CurrentCamera_0.ViewportSize.X / 2 - v22.X / 2, 
        Y = -v22.Y
    }, function(v32)
        if not (not (v32.Y == -v22.Y) or not v28) then
            v29(false);
        end;
    end);
    v30 = v33;
    v31 = v34;
    v33 = v3.useCallback(function(v35)
        local v36 = l_CurrentCamera_0.ViewportSize.X / 2 - v22.X / 2;
        local v37 = nil;
        v37 = if v35 == v24.On then if v12() then v15.TopBarTopMargin + v15.TopBarButtonPadding else 4 else -v22.Y;
        if v12() then
            local l_Max_0 = v13:layout():get()[v13:status():get()].Max;
            if l_CurrentCamera_0.ViewportSize.X / 2 - v22.X / 2 < l_Max_0.X + 12 then
                if l_CurrentCamera_0.ViewportSize.X < (l_Max_0.X + 24) + v22.X then
                    if v35 == v24.On then
                        v37 = v15.TopBarHeight + 10;
                    end;
                else
                    v36 = l_Max_0.X + 12;
                end;
            end;
        end;
        v31({
            X = v9.spring(v36, v14.MENU_ANIMATION_SPRING), 
            Y = v9.spring(v37, v14.MENU_ANIMATION_SPRING)
        });
    end, {});
    local v40 = l_useSelector_0((v3.useCallback(function(v39)
        if v39.Call.currentCall ~= nil then
            return v39.Call.currentCall.status;
        else
            return nil;
        end;
    end, {})));
    local v43 = l_useSelector_0((v3.useCallback(function(v41)
        local v42 = 0;
        if not (not v41.Call.currentCall or not v41.Call.currentCall.activeUtc) then
            v42 = v41.Call.currentCall.activeUtc;
        end;
        return v42;
    end)));
    local v45 = l_useSelector_0((v3.useCallback(function(v44)
        if v44.Call.currentCall ~= nil then
            return v44.Call.currentCall.instanceId;
        else
            return nil;
        end;
    end)));
    v3.useEffect(function()
        local v47 = v26.callProtocol:listenToHandleConnectingCall(function(v46)
            l_SoundManager_0:PlaySound(l_Sounds_0.Ringtone.Name, {
                Volume = 0.5, 
                Looped = true
            }, l_SoundGroups_0.Iris);
            v27(l_RoduxCall_0.Actions.UpdateCall(v46));
        end);
        local v49 = v26.callProtocol:listenToHandleTeleportingCall(function(v48)
            l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
            l_SoundManager_0:PlaySound(l_Sounds_0.CallAccept.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            v27(l_RoduxCall_0.Actions.UpdateCall(v48));
        end);
        local v51 = v26.callProtocol:listenToHandleActiveCall(function(v50)
            v27(l_RoduxCall_0.Actions.UpdateCall(v50));
        end);
        local v53 = v26.callProtocol:listenToHandleTransferCallTeleportJoin(function()
            v26.callProtocol:getCallState():andThen(function(v52)
                v27(l_RoduxCall_0.Actions.UpdateCall(v52));
            end);
        end);
        v26.callProtocol:getCallState():andThen(function(v54)
            v27(l_RoduxCall_0.Actions.UpdateCall(v54));
        end);
        return function()
            v47:Disconnect();
            v49:Disconnect();
            v51:Disconnect();
            v53:Disconnect();
        end;
    end, {
        v26.callProtocol
    });
    local v55, v56 = v3.useState(false);
    if v12() then
        v3.useEffect(function()
            local v57 = v13:layout():connect(function()
                v56(true);
            end);
            return function()
                v57.disconnect();
            end;
        end, {});
    end;
    v3.useEffect(function()
        local v58 = true;
        if v40 ~= l_RoduxCall_0.Enums.Status.Connecting then
            v58 = true;
            if v40 ~= l_RoduxCall_0.Enums.Status.Teleporting then
                v58 = true;
                if v40 ~= l_RoduxCall_0.Enums.Status.Active then
                    v58 = false;
                    if v40 == l_RoduxCall_0.Enums.Status.Idle then
                        v58 = game.JobId == v45;
                    end;
                end;
            end;
        end;
        if v58 then
            v29(true);
        end;
        v33(if not v58 then v24.Off else v24.On);
        local v59 = nil;
        if v12() then
            v59 = v13:status():connect(function()
                v33(if not v58 then v24.Off else v24.On);
            end);
        end;
        local v60 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function()
            v33(if not v58 then v24.Off else v24.On);
        end);
        return function()
            if v12() then
                v59:disconnect();
            end;
            v60:Disconnect();
        end;
    end, {
        v40, 
        v45, 
        v55
    });
    v3.useEffect(function()
        local v62 = v26.callProtocol:listenToHandleEndCall(function(v61)
            if v61.callAction == l_CallAction_0.Cancel then
                l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
                l_SoundManager_0:PlaySound(l_Sounds_0.HangUp.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            elseif v61.callAction == l_CallAction_0.Decline then
                l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
                l_SoundManager_0:PlaySound(l_Sounds_0.CallDecline.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            elseif v61.callAction == l_CallAction_0.Finish then
                l_SoundManager_0:PlaySound(l_Sounds_0.HangUp.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            end;
            v27(l_RoduxCall_0.Actions.UpdateCall(v61));
        end);
        return function()
            v62:Disconnect();
        end;
    end, {
        v26.callProtocol
    });
    return if not v28 then nil else v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        CallBar = v3.createElement(v21, {
            size = v22, 
            activeUtc = v43, 
            position = v30:map(function(v63)
                return UDim2.fromOffset(math.round(v63.X), (math.round(v63.Y)));
            end)
        })
    });
end;
