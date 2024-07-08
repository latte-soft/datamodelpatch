local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v6 = require(script.Parent.GetFStringFTUXVersion);
local v7 = require(script.Parent.GetFIntFTUXDelay);
local v8 = nil;
v8 = if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppCommonInputHooks() then require(l_CorePackages_0.Packages.ReactFocusNavigation).useLastInputMode else require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useLastInputMode;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v10 = require(l_CorePackages_0.Packages.React);
local l_Parent_0 = script.Parent.Parent;
local v12 = require(l_CorePackages_0.Cryo);
local v13 = require(l_Parent_0.Service);
local v14 = require(l_RobloxGui_0.Modules.Chrome.Service.LocalStore);
local v15 = require(script.Parent.OnboardingTooltipAnchor);
local v16 = require(script.Parent.OnboardingAnalytics);
local v17 = v6() .. "_LAST";
local v18 = v6() .. "_DISMISSED_TS";
local v19 = v6() .. "_DISMISSED_COUNT";
local v20 = v6() .. "_COMPLETED";
local v21 = {
    [1] = 86400, 
    [2] = 259200, 
    [3] = 604800
};
return function(_)
    local v23, v24 = v10.useState(0);
    local v25 = {};
    local v26 = v10.useRef(nil);
    local v27, v28 = v10.useState(false);
    local v29, v30 = v10.useState(true);
    local v31, v32 = v10.useState(false);
    local v33 = v8();
    local v34 = v10.useRef(os.time());
    local v35 = l_useLocalization_0({
        onboardHeader = "CoreScripts.FTUX.Onboard.Header", 
        onboardBody = "CoreScripts.FTUX.Onboard.Body", 
        micHeader = "CoreScripts.FTUX.Mic.Header", 
        micBody = "CoreScripts.FTUX.Mic.Body", 
        selfViewHeader = "CoreScripts.FTUX.SelfView.Header", 
        selfViewBody = "CoreScripts.FTUX.SelfView.Body", 
        toolsHeader = "CoreScripts.FTUX.Tools.Header", 
        toolsBody = "CoreScripts.FTUX.Tools.Body", 
        completeLabel = "Feature.SettingsHub.Prompt.GotIt", 
        next = "CoreScripts.VRFTUX.Action.Next", 
        showMe = "CoreScripts.FTUX.Onboard.ShowMe"
    });
    local v47 = v10.useMemo(function()
        local v46 = v12.List.filter({
            {
                id = "unibar-open", 
                canShow = function()
                    local v36 = not v14.getValue("unibar-open") and not v14.getValue("chrome_toggle");
                    if not v36 then
                        v30(false);
                    end;
                    return v36;
                end, 
                before = function()
                    v13:open(true);
                end, 
                target = function()
                    local v37 = nil;
                    local l_TopBarApp_0 = l_CoreGui_0:WaitForChild("TopBarApp");
                    if l_TopBarApp_0 then
                        v37 = l_TopBarApp_0:FindFirstChild("chrome_toggle", true);
                    end;
                    return v37;
                end, 
                headerText = v35.onboardHeader, 
                bodyText = v35.onboardBody, 
                buttonText = v35.showMe
            }, 
            {
                id = "opportunistic-open", 
                canShow = function()
                    return v14.getValue("unibar-open") or v14.getValue("chrome_toggle");
                end, 
                before = function()
                    v28(true);
                end, 
                target = function()
                    return nil;
                end, 
                after = function()
                    v28(false);
                end
            }, 
            {
                id = "9-dot", 
                before = function()
                end, 
                canShow = function()
                    return not v14.getValue("9-dot") and not v14.getValue("nine_dot");
                end, 
                target = function()
                    local v39 = nil;
                    local l_TopBarApp_1 = l_CoreGui_0:WaitForChild("TopBarApp");
                    if l_TopBarApp_1 then
                        v39 = l_TopBarApp_1:FindFirstChild("nine_dot", true);
                    end;
                    return v39;
                end, 
                headerText = v35.toolsHeader, 
                bodyText = v35.toolsBody, 
                buttonText = v35.next
            }, 
            {
                id = "mic", 
                canShow = function()
                    return l_default_0:getService() and not (v14.getValue("mic") or v14.getValue("toggle_mic_mute"));
                end, 
                before = function()
                end, 
                target = function()
                    local v41 = nil;
                    local l_TopBarApp_2 = l_CoreGui_0:WaitForChild("TopBarApp");
                    if l_TopBarApp_2 then
                        v41 = l_TopBarApp_2:FindFirstChild("toggle_mic_mute", true);
                    end;
                    return v41;
                end, 
                headerText = v35.micHeader, 
                bodyText = v35.micBody, 
                buttonText = v35.next
            }, 
            {
                id = "self-view", 
                before = function()
                end, 
                canShow = function()
                    return not v14.getValue("self-view") and not v14.getValue("selfie_view");
                end, 
                target = function()
                    local v43 = nil;
                    local l_TopBarApp_3 = l_CoreGui_0:WaitForChild("TopBarApp");
                    if l_TopBarApp_3 then
                        v43 = l_TopBarApp_3:FindFirstChild("selfie_view", true);
                    end;
                    return v43;
                end, 
                headerText = v35.selfViewHeader, 
                bodyText = v35.selfViewBody, 
                buttonText = v35.next
            }
        }, function(v45)
            return not v45.canShow or v45.canShow();
        end);
        if #v46 == 1 and (not (v46[1].id ~= "unibar-open") or v46[1].id == "opportunistic-open") then
            v46 = {};
        end;
        return v46;
    end, {});
    local v51 = v10.useCallback(function()
        local v48 = not v34.current and 0 or v34.current;
        local v49 = os.time() - v48;
        v32(true);
        local v50 = v47[v23];
        if v50 then
            v16.dismissEvent({
                id = v50.id, 
                deliver_timestamp = v48, 
                duration = v49, 
                step = v23, 
                hard_dismiss = false, 
                maxSteps = #v47
            });
        end;
        if v23 == #v47 then
            v14.storeForLocalPlayer(v20, os.time());
            return ;
        else
            v14.storeForLocalPlayer(v19, (v14.getValue(v19) or 0) + 1);
            v14.storeForLocalPlayer(v18, os.time());
            return ;
        end;
    end, {
        #v47, 
        v23, 
        v16
    });
    local v55 = v10.useCallback(function()
        local v52 = not v34.current and 0 or v34.current;
        local v53 = os.time() - v52;
        local v54 = v47[v23];
        if v54 then
            v16.dismissEvent({
                id = v54.id, 
                deliver_timestamp = v52, 
                duration = v53, 
                step = v23, 
                hard_dismiss = true, 
                maxSteps = #v47
            });
        end;
        v24(#v47);
        v32(true);
        v14.storeForLocalPlayer(v20, os.time());
    end, {
        #v47, 
        v23, 
        v16
    });
    local v56 = v10.useMemo(function()
        if v47[v23] ~= nil then
            return v47[v23].target();
        else
            return nil;
        end;
    end, {
        v23, 
        v47
    });
    v10.useEffect(function()
        local v57 = nil;
        if v56 ~= nil then
            v57 = l_GuiService_0.MenuOpened:Connect(function()
                if v57 then
                    v57:Disconnect();
                    v57 = nil;
                end;
                if not v31 then
                    v51();
                end;
            end);
        end;
        return function()
            if v57 then
                v57:Disconnect();
                v57 = nil;
            end;
        end;
    end, {
        v56, 
        v31, 
        v51
    });
    v10.useEffect(function()
        local v58 = nil;
        if not (not (v56 ~= nil) or v31) then
            v58 = l_UserInputService_0.InputBegan:Connect(function(v59)
                if (not (v59.UserInputType ~= Enum.UserInputType.Touch) or v59.UserInputType == Enum.UserInputType.MouseButton1) and v26.current ~= nil then
                    local l_Position_0 = v59.Position;
                    local l_AbsolutePosition_0 = v26.current.AbsolutePosition;
                    local l_AbsoluteSize_0 = v26.current.AbsoluteSize;
                    if not ((l_AbsolutePosition_0.X <= l_Position_0.X and l_Position_0.X <= l_AbsolutePosition_0.X + l_AbsoluteSize_0.X) and l_AbsolutePosition_0.Y <= l_Position_0.Y) or l_Position_0.Y > l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then
                        v51();
                    end;
                end;
            end);
        end;
        return function()
            if v58 then
                v58:Disconnect();
                v58 = nil;
            end;
        end;
    end, {
        v56, 
        v31, 
        v51
    });
    v10.useEffect(function()
        if v33 == "Focus" then
            return ;
        else
            local v63 = os.time();
            if v14.getValue(v20) ~= nil then
                return ;
            else
                local v64 = v14.getValue(v19) or 0;
                local v65 = v14.getValue(v18) or 0;
                local v66 = v21[v64];
                if (v64 > 0 and v66 ~= nil) and v63 - v65 < v66 then
                    return ;
                else
                    coroutine.wrap(function(v67)
                        if #v47 > 0 then
                            task.wait(v7());
                            if v33 == "Focus" then
                                return ;
                            else
                                local v68 = v47[1];
                                if v68.before ~= nil then
                                    v68.before();
                                end;
                                task.wait(0.2);
                                v67(1);
                                if v68.id ~= "opportunistic-open" then
                                    v14.storeForLocalPlayer(v17, os.time());
                                    v34.current = os.time();
                                    return ;
                                else
                                    v16.displayEvent({
                                        id = v68.id, 
                                        step = 1, 
                                        maxSteps = #v47, 
                                        deliver_timestamp = v34.current
                                    });
                                end;
                            end;
                        end;
                    end)(v24);
                    return ;
                end;
            end;
        end;
    end, {
        v47
    });
    local v75 = v10.useCallback(function(v69)
        local v70 = v69 or v23 + 1;
        local v71 = v47[v70];
        local v72 = os.time() - (not v34.current and 0 or v34.current);
        local v73 = v47[v23];
        if v73 then
            v14.storeForLocalPlayer(v73.id, true);
            if v73.after ~= nil then
                v73.after();
            end;
            v16.interactEvent({
                id = v73.id, 
                deliver_timestamp = v34.current, 
                duration = v72, 
                step = v23, 
                maxSteps = #v47
            });
        end;
        coroutine.wrap(function(v74)
            task.wait(0.2);
            v74(v70);
            v34.current = os.time();
            if v71 then
                v16.displayEvent({
                    id = v71.id, 
                    deliver_timestamp = v34.current, 
                    step = v70, 
                    maxSteps = #v47
                });
            end;
        end)(v24);
    end, {
        v56, 
        v23, 
        v24, 
        v13, 
        v47, 
        v14
    });
    local v77 = v10.useMemo(function()
        return function(v76)
            if v27 and v76 == v13.MenuStatus.Open then
                v14.storeForLocalPlayer(v17, os.time());
                v75(2);
            end;
        end;
    end, {
        v27, 
        v75, 
        v13, 
        v23, 
        v24
    });
    v10.useEffect(function()
        v13:status():connect(v77);
    end, {
        v27, 
        v75, 
        v13, 
        v23
    });
    if v56 ~= nil and v13:status():get() == v13.MenuStatus.Open then
        v25.Target = v10.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v56.AbsoluteSize.X, 0, v56.AbsoluteSize.Y), 
            Position = UDim2.new(0, v56.AbsolutePosition.X, 0, 12)
        }, {
            TooltipAnchor = v10.createElement(v15, {
                ref = v26, 
                step = v23, 
                maxSteps = #v47, 
                showLabels = v29, 
                completeLabel = v35.completeLabel, 
                onboardingStep = v47[v23], 
                onNext = v75, 
                onDismiss = v55
            })
        });
    end;
    if v31 then
        return nil;
    else
        return (v10.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v25));
    end;
end;
