local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local v3 = require(script.Parent.IGMRespawnControllerBar);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Localization.withLocalization);
local v6 = require(l_Parent_0.Actions.SetRespawning);
local v7 = require(l_Parent_0.Thunks.RespawnPlayer);
local v8 = require(script.Parent.ConfirmationDialog);
local v9 = require(l_Parent_0.Utility.SendAnalytics);
local v10 = require(l_Parent_0.Resources.Constants);
return l_RoactRodux_0.UNSTABLE_connect2(function(v11, _)
    return {
        isRespawning = v11.respawn.dialogOpen, 
        inputType = v11.displayOptions.inputType
    };
end, function(v13)
    return {
        onCancel = function()
            v13(v6(false));
            v9(v10.AnalyticsInGameMenuName, v10.AnalyticsRespawnCharacterName, {
                confirmed = v10.AnalyticsCancelledName
            });
        end, 
        onConfirm = function()
            v13(v7);
        end
    };
end)(function(v14)
    local function _()
        return l_Roact_0.createElement(v3, {
            inputType = v14.inputType
        });
    end;
    return v5({
        titleText = "CoreScripts.InGameMenu.RespawnCharacterDialogTitle", 
        bodyText = "CoreScripts.InGameMenu.RespawnCharacterDialogBody", 
        confirmText = "CoreScripts.InGameMenu.RespawnCharacterDialogConfirm", 
        cancelText = "CoreScripts.InGameMenu.Cancel"
    })(function(v16)
        return l_Roact_0.createFragment({
            RespawnDialogControllerBar = not not v14.isRespawning and l_Roact_0.createElement(v3, {
                inputType = v14.inputType
            }) or nil, 
            ConfirmationDialog = l_Roact_0.createElement(v8, {
                visible = v14.isRespawning, 
                titleText = v16.titleText, 
                bodyText = v16.bodyText, 
                confirmText = v16.confirmText, 
                cancelText = v16.cancelText, 
                bindReturnToConfirm = true, 
                onCancel = v14.onCancel, 
                onConfirm = v14.onConfirm, 
                inputType = v14.inputType
            })
        });
    end);
end);
