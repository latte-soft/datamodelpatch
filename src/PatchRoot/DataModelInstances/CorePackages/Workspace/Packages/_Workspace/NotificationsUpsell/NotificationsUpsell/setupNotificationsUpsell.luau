local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.NotificationModalsManager);
local v2 = require(script.Parent.Components.NotificationsUpsellModal);
local l_GetGameNameAndDescription_0 = require(l_Parent_0.GameDetailRodux).GetGameNameAndDescription;
local l_sendEventDeferred_0 = require(l_Parent_0.NotificationsCommon).sendEventDeferred;
local v5 = require(script.Parent.Analytics.ModalEventConstants);
local v6 = require(l_Parent_0.HttpRequest);
local v7 = v6.config({
    requestFunction = v6.requestFunctions.HttpRbxApi
});
local function v16(v8)
    local function v9()
        game:GetService("ExperienceNotificationService"):InvokeOptInPromptClosed();
        l_sendEventDeferred_0(v5.ModalContext, v5.OptInEventName, {
            [v5.ActionType] = v5.Closed, 
            [v5.UniverseId] = v8
        });
    end;
    local function v10()
        v1.CloseModal("UENUpsell");
    end;
    local v11 = false;
    local v12 = nil;
    if v8 ~= "0" and v8 ~= "" then
        local v14, v15 = l_GetGameNameAndDescription_0(v7, v8):andThen(function(v13)
            return v13 and v13.Name;
        end, function()
            return nil;
        end):await();
        v11 = v14;
        v12 = v15;
    end;
    l_sendEventDeferred_0(v5.ModalContext, v5.OptInEventName, {
        [v5.ActionType] = v5.Opened, 
        [v5.UniverseId] = v8
    });
    v1.OpenModal("UENUpsell", v2, {
        CloseCallback = v9, 
        Props = {
            CloseModal = v10, 
            ExperienceId = v8, 
            ExperienceName = if not v11 then nil else v12
        }
    });
end;
return function()
    game:GetService("ExperienceNotificationService").PromptOptInRequested:Connect(function()
        v16((tostring(game.GameId)));
    end);
end;
