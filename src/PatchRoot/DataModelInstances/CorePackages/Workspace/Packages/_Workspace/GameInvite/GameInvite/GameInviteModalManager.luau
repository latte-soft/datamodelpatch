local l_Players_0 = game:GetService("Players");
local l_SocialService_0 = game:GetService("SocialService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_utils_0 = l_script_FirstAncestor_0.utils;
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v7 = require(l_Parent_0.Cryo);
local v8 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v9 = require(l_utils_0.getCustomizedInvitePromptParams);
local v10 = require(l_utils_0.getCanSendAndCanCustomizeInvites);
local l_isTriggerDDI_0 = require(l_utils_0.gameInviteModalHelper).isTriggerDDI;
game:DefineFastFlag("GameInviteModalAnalyticsEmptyEventContextFix", false);
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUniversalAppGameInviteUnification;
local v13 = {};
v13.__index = v13;
v13.new = function()
    return (setmetatable({}, v13));
end;
v13.ToggleGameInviteModalEvent = Instance.new("BindableEvent");
v13.isModalOpen = false;
v13.openTrigger = nil;
v13.customParams = nil;
v13.placeId = nil;
v13.openModal = function(v14, v15, v16)
    if v14.isModalOpen then
        if l_isTriggerDDI_0(v15.trigger) then
            v14:invokeGameInvitePromptClosed();
        end;
        return ;
    else
        v14.isModalOpen = true;
        v14.openTrigger = v15.trigger;
        if l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
            v14.placeId = v15.rootPlaceId or tostring(game.PlaceId);
        end;
        local v17 = false;
        local v18 = false;
        local v19 = false;
        if not l_isTriggerDDI_0(v15.trigger) then
            v14.ToggleGameInviteModalEvent:Fire(true, false, v15);
            if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
                v8:sendGameInviteModalEvent(v14.openTrigger, {
                    action_type = v8.ActionType.ModalOpen, 
                    is_launch_data_provided = v17, 
                    is_prompt_customized = v18, 
                    is_invite_message_id_provided = v19, 
                    place_id = v15.rootPlaceId
                });
            end;
        else
            v14.ToggleGameInviteModalEvent:Fire(true, true, v15);
            local v20 = v9(v16, v15.trigger, v10);
            v14.customParams = v20;
            if not v20 then
                v14:closeModal();
            else
                local v21 = false;
                if v20.launchData ~= nil then
                    v21 = v20.launchData ~= "";
                end;
                v17 = v21;
                v21 = false;
                if v20.promptMessage ~= nil then
                    v21 = v20.promptMessage ~= "";
                end;
                v18 = v21;
                v21 = false;
                if v20.inviteMessageId ~= nil then
                    v21 = v20.inviteMessageId ~= "";
                end;
                v19 = v21;
                v14.ToggleGameInviteModalEvent:Fire(true, false, v7.Dictionary.join(v15, v20));
                if game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
                    v8:sendGameInviteModalEvent(v14.openTrigger, {
                        action_type = v8.ActionType.ModalOpen, 
                        is_launch_data_provided = v17, 
                        is_prompt_customized = v18, 
                        is_invite_message_id_provided = v19, 
                        place_id = v15.rootPlaceId
                    });
                end;
            end;
        end;
        if not game:GetFastFlag("GameInviteModalAnalyticsEmptyEventContextFix") then
            v8:sendGameInviteModalEvent(v14.openTrigger, {
                action_type = v8.ActionType.ModalOpen, 
                is_launch_data_provided = v17, 
                is_prompt_customized = v18, 
                is_invite_message_id_provided = v19, 
                place_id = v15.rootPlaceId
            });
        end;
        l_ContextActionService_0:BindCoreAction("hideGameInviteModal", function(_, v23)
            if v23 == Enum.UserInputState.Begin then
                v14:closeModal();
            end;
        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace);
        return ;
    end;
end;
v13.closeModal = function(v24, v25)
    if v24.isModalOpen then
        local v26 = false;
        local v27 = false;
        local v28 = false;
        if l_isTriggerDDI_0(v24.openTrigger) then
            if v24.customParams then
                local v29 = false;
                if v24.customParams.launchData ~= nil then
                    v29 = v24.customParams.launchData ~= "";
                end;
                v26 = v29;
                v29 = false;
                if v24.customParams.promptMessage ~= nil then
                    v29 = v24.customParams.promptMessage ~= "";
                end;
                v27 = v29;
                v29 = false;
                if v24.customParams.inviteMessageId ~= nil then
                    v29 = v24.customParams.inviteMessageId ~= "";
                end;
                v28 = v29;
            end;
            v24:invokeGameInvitePromptClosed();
        end;
        v8:sendGameInviteModalEvent(v24.openTrigger, {
            action_type = v8.ActionType.ModalClose, 
            is_launch_data_provided = v26, 
            is_prompt_customized = v27, 
            is_invite_message_id_provided = v28, 
            max_recipient_row_number = v25, 
            place_id = v24.placeId
        });
        l_ContextActionService_0:UnbindCoreAction("hideGameInviteModal");
        v24.isModalOpen = false;
        v24.openTrigger = nil;
        v24.placeId = nil;
    end;
    v24.ToggleGameInviteModalEvent:Fire(false);
end;
v13.isGameModalOpen = function(v30)
    return v30.isModalOpen;
end;
v13.invokeGameInvitePromptClosed = function(_)
    if not (not l_SocialService_0 or not l_Players_0.LocalPlayer) then
        l_SocialService_0:InvokeGameInvitePromptClosed(l_Players_0.LocalPlayer, {});
    end;
end;
return v13.new();
