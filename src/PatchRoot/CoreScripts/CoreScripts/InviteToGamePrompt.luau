local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_SocialService_0 = game:GetService("SocialService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules;
local l_Settings_0 = l_Modules_0.Settings;
local l_ShareGame_0 = l_Settings_0.Pages.ShareGame;
local v8 = require(l_Settings_0.SettingsHub);
local v9 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenuCustomization);
local v10 = require(l_Modules_0.Flags.GetFFlagEnableInvitePromptLoadingState);
local v11 = require(l_Modules_0.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local v12 = game:DefineFastFlag("LuaEnableGameInviteModalInvitePromptV2", false);
local v13 = require(l_Modules_0.Common.IXPServiceWrapper);
local l_Diag_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local l_GetFStringGameInviteMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
if v11() then
    v18 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
    v19 = v18.GameInviteModalManager;
    v20 = v18.GameInviteInviteExperimentVariant;
    v21 = v18.GetCustomizedInvitePromptTrigger;
    v22 = v18.GameInviteConstants;
    v23 = v18.GameInviteAnalyticsManager;
end;
local v24 = require(l_ShareGame_0.InviteToGamePrompt).new(l_CoreGui_0):withSocialServiceAndLocalPlayer(l_SocialService_0, l_Players_0.LocalPlayer):withAnalytics((l_GameInviteAnalytics_0.new():withEventStream((l_EventStream_0.new(l_RbxAnalyticsService_0))):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.ModalPrompt)));
local v25 = require(l_ShareGame_0.Thunks.ApiGetCanSendAndCanCustomizeInvites);
local v26 = require(l_ShareGame_0.getCustomizedInvitePromptParams);
local function _(v27)
    local l_status_0, l_result_0 = pcall(function()
        return l_SocialService_0:CanSendGameInviteAsync(v27);
    end);
    return l_status_0 and l_result_0;
end;
l_SocialService_0.PromptInviteRequested:Connect(function(v31, v32)
    local v33 = false;
    local v34 = l_GetFStringGameInviteMenuLayer_0();
    if not (not v11() or not v12) then
        local l_v13_LayerData_0 = v13:GetLayerData(v34);
        v13:LogUserLayerExposure(v34);
        local l_l_v13_LayerData_0_0 = l_v13_LayerData_0;
        if l_l_v13_LayerData_0_0 then
            l_l_v13_LayerData_0_0 = true;
            if l_v13_LayerData_0.inExperienceGameInviteUXRefresh2023 ~= v20.UxRefresh then
                l_l_v13_LayerData_0_0 = l_v13_LayerData_0.inExperienceGameInviteUXRefresh2023 == v20.InviteLimit;
            end;
        end;
        v33 = l_l_v13_LayerData_0_0 == true;
    end;
    if v33 then
        if v31 ~= l_Players_0.LocalPlayer then
            return ;
        elseif not v8:GetVisibility() then
            local v37 = v32 or nil;
            if v19 then
                local v38 = v21(v37);
                if v38 == v22.Triggers.DeveloperMultiple then
                    v23:withButtonName(v23.ButtonName.ModalPrompt);
                    v23:inputShareGameEntryPoint();
                    v19:openModal({
                        trigger = v38
                    }, v37);
                    return ;
                end;
            end;
        else
            if not (not l_Players_0 or not l_Players_0.LocalPlayer) then
                l_SocialService_0:InvokeGameInvitePromptClosed(l_Players_0.LocalPlayer, {});
            end;
            return ;
        end;
    end;
    if not v9() then
        if v31 == l_Players_0.LocalPlayer then
            local l_status_1, l_result_1 = pcall(function()
                return l_SocialService_0:CanSendGameInviteAsync(v31);
            end);
            if l_status_1 and l_result_1 then
                v24:show();
                goto label0 --[[  true, true  ]];
            end;
        end;
        return ;
    elseif v31 ~= l_Players_0.LocalPlayer then
        return ;
    else
        local v41 = v10();
        if v41 then
            v24:show({
                isLoading = true
            });
        end;
        local v42 = v26(v32 or nil, v25);
        if not v42 then
            if v41 then
                v24:hide();
                return ;
            end;
        else
            v24:show(v42);
            return ;
        end;
    end;
    ::label0::;
end);
