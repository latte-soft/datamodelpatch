local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local _ = require(l_Parent_0.AppCommonLib);
local v7 = require(l_script_FirstAncestor_0.dependencies);
local l_NetworkingSquads_0 = v7.NetworkingSquads;
local l_CentralOverlayType_0 = v7.RobloxAppEnums.CentralOverlayType;
local l_React_0 = v7.React;
local l_RoduxSquads_0 = v7.RoduxSquads;
local l_SetCentralOverlay_0 = v7.CentralOverlay.Actions.SetCentralOverlay;
local l_SharedFlags_0 = v7.SharedFlags;
local l_ToastNotification_0 = v7.ToastNotification;
local l_ToastNotificationsProtocol_0 = v7.ToastNotificationsProtocol;
local l_clearInterval_0 = v7.LuauPolyfill.clearInterval;
local l_dependencyArray_0 = v7.Hooks.dependencyArray;
local l_setInterval_0 = v7.LuauPolyfill.setInterval;
local l_useDispatch_0 = v7.Hooks.useDispatch;
local l_useSelector_0 = v7.Hooks.useSelector;
local l_ExperienceDetailResultStatus_0 = l_RoduxSquads_0.Enums.ExperienceDetailResultStatus;
local l_ExperienceInviteState_0 = l_RoduxSquads_0.Enums.ExperienceInviteState;
local l_ExperienceInviteVoteType_0 = l_RoduxSquads_0.Enums.ExperienceInviteVoteType;
local l_GetFIntSquadExperienceInvitePollingIntervalSeconds_0 = l_SharedFlags_0.GetFIntSquadExperienceInvitePollingIntervalSeconds;
local l_default_0 = l_ToastNotificationsProtocol_0.ToastNotificationProtocol.default;
local l_ToastNotificationTypeModule_0 = l_ToastNotification_0.ToastNotificationTypeModule;
local v27 = require(l_script_FirstAncestor_0.Enums.NonSendableResponses);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("ToastNotifications", "userActionOnToastNotification");
local l_l_MessageBusService_0_MessageId_1 = l_MessageBusService_0:GetMessageId("ToastNotifications", "receivedToastNotification");
return function(v31)
    local v32 = l_useDispatch_0();
    local v33 = l_React_0.useRef({});
    local v35 = l_useSelector_0((l_React_0.useCallback(function(v34)
        if not v34.Squad or not v34.Squad.Squad then
            return nil;
        else
            return v34.Squad.Squad.currentSquad;
        end;
    end, {})));
    local v37 = l_useSelector_0((l_React_0.useCallback(function(v36)
        if not v36.Squad or not v36.Squad.Squad then
            return nil;
        else
            return v36.Squad.Squad.currentExperienceInvite;
        end;
    end, {})));
    local v40 = l_React_0.useCallback(function(v38, v39)
        return v32(l_NetworkingSquads_0.JoinSquad.API({
            squadId = v38, 
            channelId = v39
        }));
    end, l_dependencyArray_0(v32));
    local v42 = l_React_0.useCallback(function(v41)
        return v32(l_NetworkingSquads_0.GetExperienceInvite.API({
            experienceInviteId = v41
        }));
    end, l_dependencyArray_0(v32));
    local v45 = l_React_0.useCallback(function(v43, v44)
        return v32(l_NetworkingSquads_0.VoteForExperienceInvite.API({
            experienceInviteId = v43, 
            voteType = v44, 
            mockedExperienceInvite = v37, 
            userId = l_LocalPlayer_0.UserId
        }));
    end, l_dependencyArray_0(v37, v32));
    local v48 = l_React_0.useMemo(function()
        if v37 then
            for _, v47 in ipairs(v37.votes) do
                if v47.userId == l_LocalPlayer_0.UserId then
                    return v47.voteType;
                end;
            end;
            return v27.NoResponse;
        else
            return v27.NoExperienceInv;
        end;
    end, l_dependencyArray_0(v37));
    local v51 = l_React_0.useCallback(function(v49, v50)
        return v49 - v50 .. "SpotsOpen";
    end, {});
    l_React_0.useEffect(function()
        local v52 = l_GetFIntSquadExperienceInvitePollingIntervalSeconds_0();
        local v53 = nil;
        if v37 and (not (v37.state ~= l_ExperienceInviteState_0.Active) or v37.state == l_ExperienceInviteState_0.Reserving) then
            v53 = l_setInterval_0(function()
                v42(v37.experienceInviteId);
            end, v52 * 1000);
        end;
        return function()
            if v53 then
                l_clearInterval_0(v53);
            end;
        end;
    end, l_dependencyArray_0(v37, v42));
    l_React_0.useEffect(function()
        if v37 then
            local v54 = "";
            for v55, v56 in pairs(v33.current) do
                if v37.experienceInviteId == v56 then
                    v54 = v55;
                    break;
                end;
            end;
            if v54 == "" then
                return ;
            else
                if v37.state == l_ExperienceInviteState_0.ReservationEnded and v37.experienceDetail.experienceResultStatus == l_ExperienceDetailResultStatus_0.Reserved then
                    l_default_0:dismissNotification(v54);
                end;
                if v37.inviterId ~= l_LocalPlayer_0.UserId then
                    if v37.state == l_ExperienceInviteState_0.Cancelled then
                        l_default_0:updateNotification(v54, "cancelled");
                        return ;
                    elseif not (v48 ~= l_ExperienceInviteVoteType_0.Decline) or v48 == l_ExperienceInviteVoteType_0.Dismiss then
                        l_default_0:dismissNotification(v54);
                        return ;
                    elseif v48 == v27.NoResponse then
                        if v37.state == l_ExperienceInviteState_0.Reserving then
                            l_default_0:updateNotification(v54, "expired");
                            return ;
                        elseif v37.totalSpots <= v37.spotsTaken then
                            l_default_0:updateNotification(v54, "slotsFull");
                            return ;
                        end;
                    end;
                elseif v37.state == l_ExperienceInviteState_0.Reserving then
                    l_default_0:updateNotification(v54, "launching");
                    return ;
                elseif v37.state == l_ExperienceInviteState_0.Cancelled then
                    l_default_0:dismissNotification(v54);
                    return ;
                elseif v37.spotsTaken ~= 1 then
                    l_default_0:updateNotification(v54, v51(v37.totalSpots, v37.spotsTaken));
                end;
                return ;
            end;
        else
            return ;
        end;
    end, l_dependencyArray_0(v37, v51, v48));
    l_React_0.useEffect(function()
        if not v31.RobloxEventReceiver then
            local v58 = l_NotificationService_0.RobloxEventReceived:Connect(function(v57)
                if v57.namespace == "SquadsToastUpdateNotification" then
                    v32(l_RoduxSquads_0.Actions.CurrentExperienceInviteUpdated(v57.detail));
                end;
            end);
            return function()
                v58:Disconnect();
            end;
        else
            local v60 = v31.RobloxEventReceiver:observeEvent("SquadsToastUpdateNotification", function(v59)
                v32(l_RoduxSquads_0.Actions.CurrentExperienceInviteUpdated(v59));
            end);
            return function()
                v60:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v31.RobloxEventReceiver));
    l_React_0.useEffect(function()
        local v63 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v61)
            if not (not ((v61.userActionType == "click" and v61.notificationType == l_ToastNotificationTypeModule_0.NotificationTypeEnum.SquadInvitation) and v61.visualItemName == "JoinSquadButton") or not v61.parameters) then
                local v62 = l_HttpService_0:JSONDecode(v61.parameters);
                l_default_0:dismissNotification(v61.notificationId);
                if v35 == nil then
                    v40(v62.squadId, "28260122478");
                    return ;
                else
                    v32(l_SetCentralOverlay_0(l_CentralOverlayType_0.SquadLeavePrompt, {
                        isJoiningSquad = true, 
                        onLeave = function()
                            v40(v62.squadId, "28260122478");
                        end
                    }));
                end;
            end;
        end, false, true);
        return function()
            v63:Disconnect();
        end;
    end, {
        v35, 
        v40
    });
    l_React_0.useEffect(function()
        local v65 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_0, function(v64)
            if v64.userActionType == "click" and v64.notificationType == "SquadExperienceInvitation" then
                if v64.visualItemName == "GroupUpSquadExperienceButton" then
                    v45(v37.experienceInviteId, l_ExperienceInviteVoteType_0.Accept):andThen(function()
                        l_default_0:updateNotification(v64.notificationId, "waiting");
                    end);
                    return ;
                elseif v64.visualItemName == "DismissExperienceInviteButton" then
                    v45(v37.experienceInviteId, l_ExperienceInviteVoteType_0.Decline);
                    return ;
                elseif v64.visualItemName == "CancelExperienceInviteButton" then
                    v45(v37.experienceInviteId, l_ExperienceInviteVoteType_0.Cancel);
                end;
            end;
        end, false, true);
        return function()
            v65:Disconnect();
        end;
    end, {
        v37, 
        v45
    });
    l_React_0.useEffect(function()
        local v68 = l_MessageBusService_0:Subscribe(l_l_MessageBusService_0_MessageId_1, function(v66)
            if v66.notificationType == "SquadExperienceInvitation" then
                local v67 = l_HttpService_0:JSONDecode(v66.lifecycleData);
                v33.current[v66.notificationId] = v67.experienceInviteId;
                v32(l_RoduxSquads_0.Actions.CurrentExperienceInviteUpdated(v67));
            end;
        end, false, true);
        local v71 = l_default_0:listenToDisplayNotification(function(v69)
            if v69.notificationType == "SquadExperienceInvitation" then
                local v70 = l_HttpService_0:JSONDecode(v69.lifecycleData);
                if not v33.current[v69.notificationId] then
                    v33.current[v69.notificationId] = v70.experienceInviteId;
                    v42(v70.experienceInviteId);
                end;
            end;
        end);
        local v74 = l_default_0:listenToDismissNotification(function(v72)
            local v73 = v33.current[v72.notificationId];
            if v73 then
                if v48 == v27.NoResponse then
                    v45(v73, l_ExperienceInviteVoteType_0.Dismiss);
                end;
                v33.current[v72.notificationId] = nil;
            end;
        end);
        return function()
            v68:Disconnect();
            v74:Disconnect();
            v71:Disconnect();
        end;
    end, l_dependencyArray_0(v37, v45, v48));
    return nil;
end;
