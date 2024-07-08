local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.Rodux);
local l_Modules_0 = l_RobloxGui_0.Modules;
local l_Settings_0 = l_Modules_0.Settings;
local v9 = require(l_Modules_0.Settings.Pages.ShareGame.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local l_ShareGame_0 = l_Settings_0.Pages.ShareGame;
local v12 = require(l_ShareGame_0.Components.FullModalShareGameComponent);
local v13 = require(l_ShareGame_0.AppReducer);
local v14 = require(l_ShareGame_0.InviteStore);
local v15 = require(l_Modules_0.Flags.GetFFlagEnableSharedInviteStore);
local v16 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v17 = {};
v17.__index = v17;
v17.new = function(v18)
    local v19 = {
        mountTarget = v18, 
        isActive = false
    };
    setmetatable(v19, v17);
    return v19;
end;
v17.withSocialServiceAndLocalPlayer = function(v20, v21, v22)
    v20.socialService = v21;
    v20.localPlayer = v22;
    return v20;
end;
v17.withAnalytics = function(v23, v24)
    v23.analytics = v24;
    return v23;
end;
v17._createTree = function(v25, v26, v27)
    return v5.createElement(v12, {
        store = if not v15() then v6.Store.new(v13, nil, {
            v6.thunkMiddleware
        }) else v14, 
        isVisible = v26, 
        analytics = v25.analytics, 
        promptMessage = v27 and v27.promptMessage, 
        inviteUserId = v27 and v27.inviteUserId, 
        inviteMessageId = v27 and v27.inviteMessageId, 
        launchData = v27 and v27.launchData, 
        isLoading = v27 and v27.isLoading, 
        onAfterClosePage = function(_)
            v25:hide({});
        end
    });
end;
v17.show = function(v29, v30)
    if not v29.isActive then
        v29.isLoading = v30 and v30.isLoading;
        v29.isActive = not v29.isLoading;
        if v30 then
            local v31 = if not v30.inviteUserId then v9.Triggers.DeveloperMultiple else v9.Triggers.DeveloperSingle;
            local v32 = false;
            if v30.launchData ~= nil then
                v32 = v30.launchData ~= "";
            end;
            v29.analytics:sendEvent(v31, l_GameInviteEvents_0.ModalOpened, if not v16() then nil else {
                isLaunchDataProvided = v32
            });
        end;
        if v29.instance then
            v29.instance = v5.update(v29.instance, v29:_createTree(true, v30));
        else
            v29.instance = v5.mount(v29:_createTree(true, v30), v29.mountTarget, "invitePrompt");
        end;
        if not (not v29.analytics or v29.isLoading) then
            v29.analytics:inputShareGameEntryPoint();
        end;
        l_ContextActionService_0:BindCoreAction("hideInvitePrompt", function(_, v34, _)
            if v34 == Enum.UserInputState.Begin then
                v29:hide();
            end;
        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace);
        return ;
    else
        return ;
    end;
end;
v17.hide = function(v36, _)
    if v36.isActive or v36.isLoading then
        v36.isLoading = false;
        v36.isActive = false;
        v36.instance = v5.update(v36.instance, v36:_createTree(false));
        if not (not v36.socialService or not v36.localPlayer) then
            v36.socialService:InvokeGameInvitePromptClosed(v36.localPlayer, {});
        end;
        l_ContextActionService_0:UnbindCoreAction("hideInvitePrompt");
        l_GuiService_0.SelectedCoreObject = nil;
        l_GuiService_0:RemoveSelectionGroup("invitePrompt");
        return ;
    else
        return ;
    end;
end;
v17.destruct = function(v38)
    if v38.instance then
        v5.unmount(v38.instance);
    end;
end;
return v17;
