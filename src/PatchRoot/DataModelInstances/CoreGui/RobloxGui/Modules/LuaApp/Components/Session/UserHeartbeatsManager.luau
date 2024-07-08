local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.MessageBus);
local v5 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v11 = require(l_CorePackages_0.UIBlox);
local l_AppRunService_0 = v9.AppRunService;
local l_AppSessionService_0 = v9.AppSessionService;
local l_AppUserInputService_0 = v9.AppUserInputService;
local l_MessageBus_0 = v4.MessageBus;
local l_RoactNetworking_0 = v9.RoactNetworking;
local _ = require(l_Modules_0.LuaApp.AppPage);
local l_ExternalEventConnection_0 = v11.Utility.ExternalEventConnection;
local v19 = require(l_Modules_0.LuaApp.Thunks.PostUserHeartbeatsActionReport);
local v20 = require(l_Modules_0.LuaApp.Http.Requests.UserHeartbeats.PostUserHeartbeatsActionReport);
local v21 = require(l_Modules_0.LuaApp.Thunks.PostUserHeartbeatsPulse);
local l_selectCurrentLegacyPage_0 = v5.Selectors.selectCurrentLegacyPage;
local l_selectCurrentLegacyRoute_0 = v5.Selectors.selectCurrentLegacyRoute;
game:DefineFastInt("UserHeartbeatsActionReportRolloutPerMyriad", 0);
game:DefineFastInt("UserHeartbeatsPulseRolloutPerMyriad", 0);
local v24 = game:DefineFastInt("UserHeartbeatsPulseIntervalSeconds", 30);
local v25 = v6.Component:extend("UserHeartbeatsManager");
local v26 = {
    Invalid = 0, 
    Foregrounded = 1, 
    Backgrounded = 2, 
    Idle = 3
};
local v27 = l_MessageBus_0.getMessageId("Realtime", "appResume");
local v28 = l_MessageBus_0.getMessageId("Realtime", "appStop");
local v30 = {
    mid = v27, 
    validateParams = function(_)
        return true;
    end
};
local v32 = {
    mid = v28, 
    validateParams = function(_)
        return true;
    end
};
v25.init = function(v33)
    v33._isMounted = false;
    v33._nextPulseTick = tick();
    v33.state = {
        activeState = v26.Foregrounded
    };
    v33._subscriber = l_MessageBus_0.Subscriber.new();
    v33._rollout = Random.new():NextInteger(1, 10000);
    v33._isActionReportEnabled = v33._rollout <= game:GetFastInt("UserHeartbeatsActionReportRolloutPerMyriad");
    v33._isPulseEnabled = v33._rollout <= game:GetFastInt("UserHeartbeatsPulseRolloutPerMyriad");
    v33.onDataModelClose = function()
        if v33._isMounted then
            if v33._isActionReportEnabled then
                v20(v33.props.networking, {
                    logoutActionInfo = {}
                });
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v33.onBackgrounded = function()
        v33:setState({
            activeState = v26.Backgrounded
        });
    end;
    v33.onForegrounded = function()
        v33:setState({
            activeState = v26.Foregrounded
        });
    end;
    v33.heartbeatCallback = function()
        if v33._isPulseEnabled then
            if v24 <= 0 then
                return ;
            else
                local v34 = tick();
                if v34 < v33._nextPulseTick then
                    return ;
                else
                    v33._nextPulseTick = v34 + v24;
                    v33.props.postUserHeartbeatsPulse(v33.props.networking, v33.state.activeState, v33.props.currentPage.name);
                    return ;
                end;
            end;
        else
            return ;
        end;
    end;
end;
v25.render = function(v35)
    local l_runService_0 = v35.props.runService;
    local l_userInputService_0 = v35.props.userInputService;
    return v6.createFragment({
        HeartbeatListener = v6.createElement(l_ExternalEventConnection_0, {
            callback = v35.heartbeatCallback, 
            event = l_runService_0.Heartbeat
        }), 
        WindowFocusedListener = v6.createElement(l_ExternalEventConnection_0, {
            callback = v35.onForegrounded, 
            event = l_userInputService_0.WindowFocused
        }), 
        WindowFocusLostListener = v6.createElement(l_ExternalEventConnection_0, {
            callback = v35.onBackgrounded, 
            event = l_userInputService_0.WindowFocusReleased
        })
    });
end;
v25.didMount = function(v38)
    v38._isMounted = true;
    v38._subscriber:subscribe(v30, v38.onForegrounded);
    v38._subscriber:subscribe(v32, v38.onBackgrounded);
    if v38._isActionReportEnabled then
        if not l_RunService_0:IsStudio() then
            game:BindToClose(v38.onDataModelClose);
        end;
        v38.props.postUserHeartbeatsActionReport(v38.props.networking, {
            loginActionInfo = {}
        });
    end;
end;
v25.didUpdate = function(v39, _, v41)
    if v39._isActionReportEnabled then
        if v41.activeState ~= v39.state.activeState then
            v39.props.postUserHeartbeatsActionReport(v39.props.networking, {
                universalAppActiveStateChangeActionInfo = {
                    currentActiveState = v39.state.activeState, 
                    previousActiveState = v41.activeState
                }
            });
        end;
        return ;
    else
        return ;
    end;
end;
v25.willUnmount = function(v42)
    v42._subscriber:unsubscribeFromAllMessages();
    v42._isMounted = false;
end;
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    runService = l_AppRunService_0, 
    sessionService = l_AppSessionService_0, 
    userInputService = l_AppUserInputService_0
})((v7.connect(function(v43)
    return {
        currentPage = l_selectCurrentLegacyPage_0(v43), 
        route = l_selectCurrentLegacyRoute_0(v43)
    };
end, function(v44)
    return {
        postUserHeartbeatsActionReport = function(v45, v46)
            v44(v19(v45, v46));
        end, 
        postUserHeartbeatsPulse = function(v47, v48, v49)
            v44(v21(v47, v48, v49));
        end
    };
end)(v25)));
