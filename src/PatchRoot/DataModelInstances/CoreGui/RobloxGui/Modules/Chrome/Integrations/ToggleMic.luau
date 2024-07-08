local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v7 = require(l_RobloxGui_0.Modules.Settings.Analytics.VoiceAnalytics);
local v8 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics);
local v9 = require(script.Parent.Parent.Flags.GetFFlagEnableChromeFTUX);
local v10 = require(script.Parent.Parent.Flags.GetFFlagTweakedMicPinning);
local v11 = require(script.Parent.Parent.Service);
local v12 = require(script.Parent.RedVoiceDot);
local v13 = require(script.Parent.Parent.Unibar.Constants);
local v14 = UDim2.new(0, v13.ICON_SIZE, 0, v13.ICON_SIZE);
local v15 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v16 = nil;
if v8() then
    v16 = v7.new(l_RbxAnalyticsService_0, "Chrome.Integrations.ToggleMic");
end;
local v17 = nil;
local function v19(_)
    l_default_0:ToggleMic("ChromeIntegrationsToggleMic");
    v15:setLastCtx("SelfView");
    if v16 then
        v16:onToggleMuteSelf(not l_default_0.localMuted);
    end;
end;
local function v21(_)
    l_default_0:RejoinPreviousChannel();
end;
local function v23(_)
    l_default_0:ShowVoiceChatLoadingMessage();
end;
v17 = v11:register({
    id = "toggle_mic_mute", 
    label = "CoreScripts.TopBar.ToggleMic", 
    activated = v19, 
    components = {
        Icon = function(_)
            return v4.createElement("Frame", {
                Size = v14, 
                BackgroundTransparency = 1
            }, {
                v4.createElement(v6, {
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    hideOnError = false, 
                    iconStyle = "MicLight", 
                    selectable = if not v9() then nil else false, 
                    size = v14, 
                    showConnectingShimmer = true
                }), 
                (v4.createElement(v12, {
                    position = UDim2.new(1, -7, 1, -7)
                }))
            });
        end
    }
});
local function v29(_, v26)
    if not (v26 ~= Enum.VoiceChatState.Ended) then
        v17.availability:unavailable();
    elseif not v10() then
        v17.availability:available();
    else
        v17.availability:pinned();
    end;
    local v27 = v26 == Enum.VoiceChatState.Failed;
    local v28 = true;
    if v26 ~= Enum.VoiceChatState.Joining then
        v28 = v26 == Enum.VoiceChatState.JoiningRetry;
    end;
    if not v27 then
        if not v28 then
            v17.activated = v19;
            return ;
        else
            v17.activated = v23;
            return ;
        end;
    else
        v17.activated = v21;
        return ;
    end;
end;
if game:GetEngineFeature("VoiceChatSupported") then
    l_default_0:asyncInit():andThen(function()
        local v30 = l_default_0:getService();
        if v30 then
            v30.StateChanged:Connect(v29);
            l_default_0:SetupParticipantListeners();
            if not v10() then
                v17.availability:available();
            else
                v17.availability:pinned();
                return ;
            end;
        end;
    end):catch(function()
    end);
end;
return v17;
