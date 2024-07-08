local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_VRService_0 = game:GetService("VRService");
local l_Create_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("Common"):WaitForChild("Create"));
local v11 = require(l_RobloxGui_0.Modules.ErrorPrompt);
local v12 = require(l_RobloxGui_0.Modules.Common.Url);
local v13 = game:DefineFastFlag("DebugEnableErrorStringTesting", false);
local v14 = game:DefineFastFlag("ShouldMuteUnlocalizedError", false);
local v15 = game:DefineFastInt("PotentialClientTimeoutSeconds", 7200);
local v16 = game:DefineFastInt("MaxKickMessageLength", 200);
local v17 = game:DefineFastFlag("RefactorReconnectUnblockTeleport", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("CoreGuiOverflowDetection");
local v19 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreScriptShowTeleportPrompt);
local v20 = require(l_RobloxGui_0.Modules.Flags.GetFFlagFixChromeAllowlistWait);
local v21 = require(l_RobloxGui_0.Modules.Flags.FFlagErrorPromptResizesHeight);
local v22 = game:DefineFastFlag("CreatorBanWhitespaceSub", false);
local v23 = game:DefineFastFlag("CreatorBanReconnectDisabled", false);
local v24 = nil;
if not v20() then
    v24 = require(l_RobloxGui_0.Modules.TopBar.Constants);
end;
local function _(v25, v26)
    local l_status_0, l_result_0 = pcall(function()
        return (tonumber(settings():GetFVariable(v25)));
    end);
    return not not l_status_0 and l_result_0 or v26;
end;
local function _(v30, v31)
    local l_status_1, l_result_1 = pcall(function()
        return settings():GetFVariable(v30);
    end);
    return not not l_status_1 and l_result_1 or v31;
end;
local v35 = 36;
if not v20() then
    v35 = v24.TopBarHeight;
end;
local l_pcall_0 = pcall;
local v37 = "DefaultTimeoutTimeMs";
local l_v37_0 = v37 --[[ copy: 32 -> 70 ]];
local v39;
l_pcall_0, v39 = l_pcall_0(function()
    return (tonumber(settings():GetFVariable(l_v37_0)));
end);
local v40 = (not not l_pcall_0 and v39 or 10000) / 1000;
local l_FFlag_0 = settings():GetFFlag("ReconnectDisabled");
v39 = pcall;
local v42 = "ReconnectDisabledReason";
local l_v42_0 = v42 --[[ copy: 33 -> 71 ]];
v39, v37 = v39(function()
    return settings():GetFVariable(l_v42_0);
end);
l_pcall_0 = not not v39 and v37 or "We're sorry, Roblox is temporarily unavailable.  Please try again later.";
v39 = tick();
v37 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
v42 = nil;
local v44 = -1;
local l_X_0 = l_RobloxGui_0.AbsoluteSize.X;
local v46 = nil;
if v21() then
    v46 = l_RobloxGui_0.AbsoluteSize.Y;
end;
local v47 = {
    NONE = 1, 
    RECONNECT_PLACELAUNCH = 2, 
    RECONNECT_DISCONNECT = 3, 
    TELEPORT_FAILED = 4, 
    IS_RECONNECTING = 5, 
    RECONNECT_DISABLED_DISCONNECT = 6, 
    RECONNECT_DISABLED_PLACELAUNCH = 7, 
    RECONNECT_DISABLED = 8, 
    OUT_OF_MEMORY_KEEPPLAYING_LEAVE = 9
};
local l_NONE_0 = v47.NONE;
local l_OK_0 = Enum.ConnectionError.OK;
local v50 = {
    [v47.RECONNECT_PLACELAUNCH] = "Join Error", 
    [v47.RECONNECT_DISABLED_PLACELAUNCH] = "Join Error", 
    [v47.RECONNECT_DISCONNECT] = "Disconnected", 
    [v47.RECONNECT_DISABLED_DISCONNECT] = "Disconnected", 
    [v47.TELEPORT_FAILED] = "Teleport Failed", 
    [v47.RECONNECT_DISABLED] = "Error", 
    [v47.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "Low Memory Warning"
};
local v51 = {
    [v47.RECONNECT_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError", 
    [v47.RECONNECT_DISABLED_PLACELAUNCH] = "InGame.ConnectionError.Title.JoinError", 
    [v47.RECONNECT_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected", 
    [v47.RECONNECT_DISABLED_DISCONNECT] = "InGame.ConnectionError.Title.Disconnected", 
    [v47.TELEPORT_FAILED] = "InGame.ConnectionError.Title.TeleportFailed", 
    [v47.RECONNECT_DISABLED] = "InGame.CommonUI.Title.Error", 
    [v47.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = "InGame.ConnectionError.Title.LowMemoryWarning"
};
local function v57(v52)
    local l_status_2, l_result_2 = pcall(l_HttpRbxApiService_0.GetAsyncFullUrl, l_HttpRbxApiService_0, v12.GAME_URL .. "v1/games" .. "?" .. "universeIds=" .. v52);
    if l_status_2 then
        local v55 = l_HttpService_0:JSONDecode(l_result_2);
        if not ((not v55 or not v55.data) or not v55.data[1]) then
            local l_rootPlaceId_0 = v55.data[1].rootPlaceId;
            if l_rootPlaceId_0 then
                return true, l_rootPlaceId_0;
            end;
        end;
    end;
    return false, -1;
end;
local v58 = l_Create_0("Frame")({
    Name = "promptOverlay", 
    BackgroundColor3 = Color3.new(0, 0, 0), 
    BackgroundTransparency = 1, 
    Size = UDim2.new(1, 0, 1, v35), 
    Position = UDim2.new(0, 0, 0, -v35), 
    Active = false, 
    Parent = l_Create_0("ScreenGui")({
        Parent = l_CoreGui_0, 
        Name = "RobloxPromptGui", 
        OnTopOfCoreBlur = true, 
        DisplayOrder = 9, 
        AutoLocalize = false
    })
});
if v20() then
    coroutine.wrap(function()
        local l_TopBarHeight_0 = require(l_RobloxGui_0.Modules.TopBar.Constants).TopBarHeight;
        v58.Size = UDim2.new(1, 0, 1, l_TopBarHeight_0);
        v58.Position = UDim2.new(0, 0, 0, -l_TopBarHeight_0);
    end)();
end;
local function v65()
    if l_NONE_0 == v47.IS_RECONNECTING then
        return ;
    else
        l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-ReconnectActivated");
        l_NONE_0 = v47.IS_RECONNECTING;
        v42:primaryShimmerPlay();
        local v60 = nil;
        local v61 = nil;
        if game.GameId > 0 then
            local v62, v63 = v57(game.GameId);
            v60 = v62;
            v61 = v63;
        end;
        local v64 = tick();
        if v64 < v44 then
            wait(v44 - v64);
        end;
        if v60 and v61 > 0 then
            l_TeleportService_0:Teleport(v61);
        else
            l_TeleportService_0:Teleport(game.PlaceId);
        end;
        if v19 then
            if not v17 then
                l_GuiService_0:SetMenuIsOpen(false, "ErrorPrompt");
            else
                l_TeleportService_0:UnblockAsync();
                return ;
            end;
        end;
        return ;
    end;
end;
local function v66()
    l_GuiService_0.SelectedCoreObject = nil;
    l_RunService_0.RenderStepped:wait();
    l_RunService_0.RenderStepped:wait();
    game:Shutdown();
end;
local function v67()
    l_GuiService_0:ClearError();
end;
local v68 = {
    [Enum.ConnectionError.DisconnectLuaKick] = true, 
    [Enum.ConnectionError.DisconnectSecurityKeyMismatch] = true, 
    [Enum.ConnectionError.DisconnectNewSecurityKeyMismatch] = true, 
    [Enum.ConnectionError.DisconnectDuplicateTicket] = true, 
    [Enum.ConnectionError.DisconnectWrongVersion] = true, 
    [Enum.ConnectionError.DisconnectProtocolMismatch] = true, 
    [Enum.ConnectionError.DisconnectBadhash] = true, 
    [Enum.ConnectionError.DisconnectIllegalTeleport] = true, 
    [Enum.ConnectionError.DisconnectDuplicatePlayer] = true, 
    [Enum.ConnectionError.DisconnectCloudEditKick] = true, 
    [Enum.ConnectionError.DisconnectOnRemoteSysStats] = true, 
    [Enum.ConnectionError.DisconnectPrivateServerKickout] = true, 
    [Enum.ConnectionError.DisconnectRaknetErrors] = true, 
    [Enum.ConnectionError.PlacelaunchFlooded] = true, 
    [Enum.ConnectionError.PlacelaunchHashException] = true, 
    [Enum.ConnectionError.PlacelaunchHashExpired] = true, 
    [Enum.ConnectionError.PlacelaunchUnauthorized] = true, 
    [Enum.ConnectionError.PlacelaunchUserLeft] = true, 
    [Enum.ConnectionError.PlacelaunchRestricted] = true, 
    [Enum.ConnectionError.PlacelaunchUserPrivacyUnauthorized] = true
};
if l_game_EngineFeature_0 then
    v68[Enum.ConnectionError.DisconnectClientFailure] = true;
end;
if v23 then
    v68[Enum.ConnectionError.PlacelaunchCreatorBan] = true;
end;
local v69 = {
    [v47.RECONNECT_PLACELAUNCH] = {
        {
            Text = "Retry", 
            LocalizationKey = "InGame.CommonUI.Button.Retry", 
            LayoutOrder = 2, 
            Callback = v65, 
            Primary = true
        }, 
        {
            Text = "Cancel", 
            LocalizationKey = "Feature.SettingsHub.Action.CancelSearch", 
            LayoutOrder = 1, 
            Callback = v66
        }
    }, 
    [v47.RECONNECT_DISCONNECT] = {
        {
            Text = "Reconnect", 
            LocalizationKey = "InGame.ConnectionError.Button.Reconnect", 
            LayoutOrder = 2, 
            Callback = v65, 
            Primary = true
        }, 
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v66
        }
    }, 
    [v47.TELEPORT_FAILED] = {
        {
            Text = "OK", 
            LocalizationKey = "InGame.CommonUI.Button.Ok", 
            LayoutOrder = 1, 
            Callback = v67, 
            Primary = true
        }
    }, 
    [v47.RECONNECT_DISABLED_DISCONNECT] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v66, 
            Primary = true
        }
    }, 
    [v47.RECONNECT_DISABLED_PLACELAUNCH] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v66, 
            Primary = true
        }
    }, 
    [v47.RECONNECT_DISABLED] = {
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 1, 
            Callback = v66, 
            Primary = true
        }
    }, 
    [v47.OUT_OF_MEMORY_KEEPPLAYING_LEAVE] = {
        {
            Text = "Keep Playing", 
            LocalizationKey = "InGame.CommonUI.Button.KeepPlaying", 
            LayoutOrder = 1, 
            Callback = v67
        }, 
        {
            Text = "Leave", 
            LocalizationKey = "Feature.SettingsHub.Label.LeaveButton", 
            LayoutOrder = 2, 
            Callback = v66, 
            Primary = true
        }
    }
};
local v70 = {
    [v47.NONE] = function()
        l_RunService_0:SetRobloxGuiFocused(false);
        v58.Active = false;
        v58.Transparency = 1;
    end, 
    [v47.RECONNECT_DISCONNECT] = function()
        if not l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(true);
        else
            l_RunService_0:SetRobloxGuiFocused(false);
        end;
        v58.Active = true;
        v58.Transparency = 1;
    end, 
    [v47.RECONNECT_PLACELAUNCH] = function()
        l_RunService_0:SetRobloxGuiFocused(false);
        v58.Active = true;
        v58.Transparency = 0.3;
    end, 
    [v47.TELEPORT_FAILED] = function()
        l_RunService_0:SetRobloxGuiFocused(false);
        v58.Active = true;
        v58.Transparency = 0.3;
    end, 
    [v47.RECONNECT_DISABLED_DISCONNECT] = function()
        if not l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(true);
        else
            l_RunService_0:SetRobloxGuiFocused(false);
        end;
        v58.Active = true;
        v58.Transparency = 1;
    end, 
    [v47.RECONNECT_DISABLED_PLACELAUNCH] = function()
        l_RunService_0:SetRobloxGuiFocused(false);
        v58.Active = true;
        v58.Transparency = 0.3;
    end, 
    [v47.RECONNECT_DISABLED] = function()
        if not l_VRService_0.VREnabled then
            l_RunService_0:SetRobloxGuiFocused(true);
        else
            l_RunService_0:SetRobloxGuiFocused(false);
        end;
        v58.Active = true;
        v58.Transparency = 1;
    end
};
local function v72(v71)
    if not v42 then
        v42 = v11.new("Default", {
            MenuIsOpenKey = "ConnectionErrorPrompt", 
            PlayAnimation = not v13
        });
        v42:setParent(v58);
        if not v21() then
            v42:resizeWidth(l_X_0);
        else
            v42:resizeWidthAndHeight(l_X_0, v46);
        end;
    end;
    if v70[v71] then
        v70[v71]();
    end;
    v42:setErrorTitle(v50[v71], v51[v71]);
    v42:updateButtons(v69[v71]);
end;
local function _(v73)
    if v73 == v47.IS_RECONNECTING then
        v42:primaryShimmerStop();
    end;
end;
local function v78(v75, v76, v77)
    if v75 == Enum.ConnectionError.OK then
        return v47.NONE;
    else
        if v77 == v47.NONE then
            if not l_FFlag_0 then
                v39 = tick();
                if v75 == Enum.ConnectionError.DisconnectErrors then
                    v44 = tick() + v40;
                    l_OK_0 = Enum.ConnectionError.DisconnectErrors;
                    if v76 == Enum.ConnectionError.DisconnectOutOfMemoryKeepPlayingLeave then
                        return v47.OUT_OF_MEMORY_KEEPPLAYING_LEAVE;
                    elseif not v68[v76] then
                        l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-Disconnect");
                        return v47.RECONNECT_DISCONNECT;
                    else
                        return v47.RECONNECT_DISABLED_DISCONNECT;
                    end;
                elseif v75 == Enum.ConnectionError.PlacelaunchErrors then
                    l_OK_0 = Enum.ConnectionError.PlacelaunchErrors;
                    if not v68[v76] then
                        l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-PlaceLaunch");
                        return v47.RECONNECT_PLACELAUNCH;
                    else
                        return v47.RECONNECT_DISABLED_PLACELAUNCH;
                    end;
                elseif v75 == Enum.ConnectionError.TeleportErrors then
                    l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-TeleportFailed");
                    return v47.TELEPORT_FAILED;
                end;
            else
                return v47.RECONNECT_DISABLED;
            end;
        end;
        if v77 == v47.IS_RECONNECTING then
            l_RbxAnalyticsService_0:ReportCounter("ReconnectPrompt-ReconnectFailed");
            if v75 == Enum.ConnectionError.TeleportErrors then
                if v39 + v15 < tick() then
                    if l_OK_0 == Enum.ConnectionError.PlacelaunchErrors then
                        return v47.RECONNECT_DISABLED_PLACELAUNCH;
                    else
                        return v47.RECONNECT_DISABLED_DISCONNECT;
                    end;
                elseif l_OK_0 == Enum.ConnectionError.PlacelaunchErrors then
                    return v47.RECONNECT_PLACELAUNCH;
                elseif l_OK_0 == Enum.ConnectionError.DisconnectErrors then
                    return v47.RECONNECT_DISCONNECT;
                end;
            end;
        end;
        return v77;
    end;
end;
local function v91(v79, v80, v81)
    if v80 == Enum.ConnectionError.OK then
        return "";
    elseif not v81 then
        if v80 == Enum.ConnectionError.DisconnectLuaKick then
            v79 = v79:gsub("%s+", " "):sub(1, v16);
            local l_status_3, l_result_3 = pcall(function()
                return v37:FormatByKey("InGame.ConnectionError.DisconnectLuaKickWithMessage", {
                    RBX_STR = v79
                });
            end);
            if not l_status_3 then
                return v79;
            else
                return l_result_3;
            end;
        elseif not (not v22 or v21()) and v80 == Enum.ConnectionError.PlacelaunchCreatorBan then
            return v79:gsub("%s+", " ");
        else
            local v84 = string.gsub(tostring(v80), "Enum", "InGame");
            if v37 then
                local l_status_4, l_result_4 = pcall(function()
                    if v80 == Enum.ConnectionError.DisconnectIdle then
                        return v37:FormatByKey(v84, {
                            RBX_NUM = tostring(20)
                        });
                    else
                        return v37:FormatByKey(v84);
                    end;
                end);
                if l_status_4 or not v14 then
                    if l_status_4 then
                        return l_result_4;
                    end;
                else
                    local l_status_5, l_result_5 = pcall(function()
                        return v37:FormatByKey("InGame.ConnectionError.UnknownError");
                    end);
                    return not not l_status_5 and l_result_5 or "";
                end;
            end;
            return v79;
        end;
    else
        local l_status_6, l_result_6 = pcall(function()
            return v37:FormatByKey("InGame.ConnectionError.ReconnectFailed");
        end);
        if not l_status_6 then
            return "Reconnect was unsuccessful. Please try again.";
        else
            return l_result_6;
        end;
    end;
end;
local function v96(v92, v93, v94)
    local v95 = v78(v94, v93, l_NONE_0);
    if v95 ~= l_NONE_0 then
        if l_NONE_0 == v47.IS_RECONNECTING then
            v42:primaryShimmerStop();
        end;
        l_NONE_0 = v95;
        v72(v95);
    end;
    v92 = if v94 == Enum.ConnectionError.TeleportErrors and l_NONE_0 ~= v47.TELEPORT_FAILED then v91(v92, v93, true) else v91(v92, v93);
    if l_NONE_0 == v47.RECONNECT_DISABLED then
        v92 = l_pcall_0;
    end;
    if v42 then
        v42:onErrorChanged(v92, v93);
    end;
end;
local function v97()
    v96(l_GuiService_0:GetErrorMessage(), l_GuiService_0:GetErrorCode(), (l_GuiService_0:GetErrorType()));
end;
local function v100()
    if v42 then
        local l_X_1 = l_RobloxGui_0.AbsoluteSize.X;
        if not v21() then
            if l_X_0 ~= l_X_1 then
                l_X_0 = l_X_1;
                v42:resizeWidth(l_X_0);
            end;
        else
            local l_Y_0 = l_RobloxGui_0.AbsoluteSize.Y;
            if not (l_X_0 == l_X_1) or v46 ~= l_Y_0 then
                l_X_0 = l_X_1;
                v46 = l_Y_0;
                v42:resizeWidthAndHeight(l_X_0, v46);
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v101()
    v37 = l_CoreGui_0.CoreScriptLocalization:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
end;
l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(v100);
l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):connect(v101);
v96(l_GuiService_0:GetErrorMessage(), l_GuiService_0:GetErrorCode(), (l_GuiService_0:GetErrorType()));
l_GuiService_0.ErrorMessageChanged:connect(v97);
if v13 then
    for v102, v103 in pairs((require(l_RobloxGui_0.Modules.ErrorTestSets))) do
        for _, v105 in pairs(v103) do
            v96("Should show localized strings, please file a jira ticket for missing translation.", v105, v102);
            wait(2);
            l_NONE_0 = v47.NONE;
        end;
    end;
end;
if l_game_EngineFeature_0 then
    l_GuiService_0.CoreGuiRenderOverflowed:Connect(function()
        for _, v107 in pairs(l_CoreGui_0:GetChildren()) do
            if v107:IsA("ScreenGui") and v107.Name ~= "RobloxPromptGui" then
                v107.Enabled = false;
            end;
        end;
    end);
end;
