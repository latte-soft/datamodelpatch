local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_CorePackages_0.Regulations.ScreenTime.HttpRequests);
local v7 = require(l_CorePackages_0.Regulations.ScreenTime.Constants);
local v8 = require(l_CorePackages_0.Regulations.ScreenTime.GetFFlagScreenTimeSignalR);
local v9 = require(l_CorePackages_0.Regulations.ScreenTime.Utils);
local v10 = require(l_CorePackages_0.Roact);
local v11 = require(l_CorePackages_0.RoactRodux);
local v12 = require(l_CorePackages_0.Logging);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v17 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v18 = require(l_Modules_0.LuaApp.Components.AntiAddictionPrompt);
local v19 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v20 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v21 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local l_Toast_0 = require(l_CorePackages_0.UIBlox).App.Dialog.Toast;
local v23 = require(l_Modules_0.LuaApp.Constants);
local v24 = require(l_Modules_0.LuaApp.withLocalization);
local v25 = v10.Component:extend("ScreenTimeEventReceiver");
local v26 = {
    Normal = 1, 
    LockedOut = 2, 
    OpenWebView = 3
};
local v27 = {
    Default = 0, 
    LogoutOnClose = 1, 
    Toast = 2
};
local v28 = {
    FullScreen = "fullScreen"
};
v25.showScreenTimeHeartbeatConsecutiveFailurePrompt = function(v29)
    v29:setState({
        heartbeatConsecutiveFailure = true
    });
end;
v25.init = function(v30)
    local l_RobloxEventReceiver_0 = v30.props.RobloxEventReceiver;
    v30:setState({
        promptsCount = 0, 
        promptsIndex = 0, 
        prompts = {}, 
        heartbeatConsecutiveFailure = false
    });
    v30.setScreenTimePrompts = function(v32)
        local v33 = {};
        for _, v35 in ipairs(v32) do
            table.insert(v33, {
                type = v35.type, 
                instructionName = v35.instructionName, 
                id = v35.serialId, 
                title = v35.title, 
                text = v35.message, 
                url = v35.url, 
                modalType = v35.modalType
            });
        end;
        v30:setState({
            promptsIndex = 1, 
            promptsCount = #v33, 
            prompts = v33
        });
    end;
    v30.screenTimeHttpRequests = v6:new(l_HttpService_0);
    v30.screenTimeUtils = v9:new({
        globalGetter = function(v36)
            return l_MemStorageService_0:GetItem(v36);
        end, 
        globalSetter = function(v37, v38)
            l_MemStorageService_0:SetItem(v37, v38);
        end
    });
    v30.processInstructions = function(v39)
        local v40 = {};
        for _, v42 in ipairs(v39) do
            if v42.type == v26.LockedOut then
                v30.screenTimeUtils:setLockedOut();
            end;
            if not (v42.type == v26.Normal) or l_RunService_0:IsRunning() then
                table.insert(v40, v42);
            end;
        end;
        v30.setScreenTimePrompts(v40);
    end;
    v30.requestInstructions = function()
        v30.screenTimeHttpRequests:getInstructions(function(v43, v44, v45)
            if not v43 then
                if not v44 then
                    v12.warn("ScreenTimeEventReceiver" .. " requestInstructions failed: error");
                    return ;
                else
                    v12.warn("ScreenTimeEventReceiver" .. " requestInstructions failed: unauthorized");
                    v30.props.doLogout(v30.props.networking, v30.props.guiService);
                    return ;
                end;
            else
                v30.processInstructions(v45);
                return ;
            end;
        end);
    end;
    v30.tokens = {};
    if not v8() then
        table.insert(v30.tokens, (l_RobloxEventReceiver_0:observeEvent(v7.HEARTBEAT_NOTIFICATIONS_NAMESPACE, function(v46, v47)
            if v47 == v7.HEARTBEAT_CONSECUTIVE_FAILURE then
                v30:showScreenTimeHeartbeatConsecutiveFailurePrompt();
                return ;
            elseif v46.notifications == nil then
                v12.warn("ScreenTimeEventReceiver" .. " empty heartbeat notifications");
                return ;
            else
                for _, v49 in ipairs(v46.notifications) do
                    if v49.type == v7.HEARTBEAT_NOTIFICATION_TYPE_NEW_INSTRUCTION then
                        v30.requestInstructions();
                    end;
                end;
                return ;
            end;
        end)));
    else
        table.insert(v30.tokens, (l_RobloxEventReceiver_0:observeEvent(v7.SIGNALR_NAMESPACE, function(_, v51)
            if v51 == v7.SIGNALR_TYPE_NEW_INSTRUCTION then
                v30.requestInstructions();
            end;
        end)));
    end;
    v30.ok = function()
        local l_promptsIndex_0 = v30.state.promptsIndex;
        local v53 = v30.state.prompts[l_promptsIndex_0];
        v30.screenTimeHttpRequests:reportExecution(v53.instructionName, v53.id);
        if v53.type == v26.LockedOut then
            return ;
        else
            if v53.type == v26.OpenWebView then
                v30.openWebView(v53.url);
            end;
            l_promptsIndex_0 = l_promptsIndex_0 + 1;
            if v30.state.promptsCount < l_promptsIndex_0 then
                v30:setState({
                    promptsIndex = 0, 
                    promptsCount = 0
                });
                return ;
            else
                v30:setState({
                    promptsIndex = l_promptsIndex_0
                });
                return ;
            end;
        end;
    end;
    v30.toastDismissed = function()
        local l_promptsIndex_1 = v30.state.promptsIndex;
        local v55 = v30.state.prompts[l_promptsIndex_1];
        v30.screenTimeHttpRequests:reportExecution(v55.instructionName, v55.id);
        l_promptsIndex_1 = l_promptsIndex_1 + 1;
        if v30.state.promptsCount < l_promptsIndex_1 then
            v30:setState({
                promptsIndex = 0, 
                promptsCount = 0
            });
            return ;
        else
            v30:setState({
                promptsIndex = l_promptsIndex_1
            });
            return ;
        end;
    end;
    v30.heartbeatConsecutiveFailureLogoutCallback = function()
        l_RbxAnalyticsService_0:ReportCounter("ScreenTime-LogoutAfterConsecutiveHeartbeatFailure-FromApp");
    end;
    v30.openWebView = function(v56)
        v30.props.guiService:BroadcastNotification(l_HttpService_0:JSONEncode({
            url = v56, 
            encodeUrl = false, 
            type = v28.FullScreen
        }), v17.SDK_OPEN_URL);
    end;
end;
v25.render = function(v57)
    local v58 = nil;
    if v57.state.promptsCount > 0 then
        local v59 = v57.state.prompts[v57.state.promptsIndex];
        local l_type_0 = v59.type;
        local v61 = v59.id or "";
        local l_text_0 = v59.text;
        v58 = if v59.modalType == v27.Toast then v10.createElement(v10.Portal, {
            target = l_CoreGui_0
        }, {
            ["prompt:" .. v61] = v10.createElement(v21, {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v23.DisplayOrder.AntiAddictionPrompt
            }, {
                Toast = v10.createElement(l_Toast_0, {
                    toastContent = {
                        toastTitle = l_text_0, 
                        onDismissed = v57.toastDismissed
                    }, 
                    duration = 5
                })
            })
        }) else v10.createElement(v10.Portal, {
            target = l_CoreGui_0
        }, {
            ["prompt:" .. v61] = v10.createElement(v18, {
                okCallback = v57.ok, 
                logoutCallback = v57.ok, 
                message = l_text_0, 
                lockOut = l_type_0 == v26.LockedOut
            })
        });
    end;
    if v57.state.heartbeatConsecutiveFailure then
        v58 = v24({
            heartbeatConsecutiveFailureMessage = "Feature.Screentime.Description.HeartbeatConsecutiveFailure"
        })(function(v63)
            return v10.createElement(v10.Portal, {
                target = l_CoreGui_0
            }, {
                hearbeatFailurePrompt = v10.createElement(v18, {
                    logoutCallback = v57.heartbeatConsecutiveFailureLogoutCallback, 
                    message = v63.heartbeatConsecutiveFailureMessage, 
                    lockOut = true
                })
            });
        end);
    end;
    return v58;
end;
v25.willUnmount = function(v64)
    for _, v66 in pairs(v64.tokens) do
        v66:disconnect();
    end;
end;
return l_RoactServices_0.connect({
    networking = v15, 
    guiService = l_AppGuiService_0
})((v11.connect(nil, function(v67)
    return {
        doLogout = function(v68, v69)
            v67(v19(v68, v69, v20.ScreenTimeEvent));
        end
    };
end)(v25)));
