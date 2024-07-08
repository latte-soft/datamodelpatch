local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RealtimeDelivery);
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(l_script_FirstAncestor_0.AppChatEntryPoint);
local v7 = require(l_script_FirstAncestor_0.App.Components.DevToggleButton);
local v8 = require(l_script_FirstAncestor_0.App.Hooks.useDisplaying);
local v9 = require(l_script_FirstAncestor_0.Components.EventReceivers.ChatEventReceiver);
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Players_0 = game:GetService("Players");
local l_GetFFlagDebugEnableAppChatInExperienceToggleButton_0 = v5.GetFFlagDebugEnableAppChatInExperienceToggleButton;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxEventReceiver_0 = v4.RobloxEventReceiver;
local l_Signal_0 = v2.Signal;
local l_useMemo_0 = v3.useMemo;
local l_useState_0 = v3.useState;
return function()
    local v18 = v8();
    local v19, v20 = l_useState_0(0);
    return v3.createElement(v3.Fragment, {}, {
        AppChatEntryPoint = if not v18 then nil else v3.createElement(v6, {
            setActiveConversationId = v20, 
            localUserId = if not l_LocalPlayer_0 then nil else l_LocalPlayer_0.UserId, 
            isVisible = true, 
            wideMode = true
        }), 
        DevToggleButton = if not l_GetFFlagDebugEnableAppChatInExperienceToggleButton_0() then nil else v3.createElement(v7, {
            displaying = v18
        }), 
        ChatEventReceiver = v3.createElement(v9, {
            robloxEventReceiver = l_useMemo_0(function()
                return l_RobloxEventReceiver_0.new(l_NotificationService_0);
            end, {}), 
            rnBypassActionSignal = l_useMemo_0(function()
                return l_Signal_0.new();
            end, {}), 
            activeConversationId = tostring(v19)
        })
    });
end;
