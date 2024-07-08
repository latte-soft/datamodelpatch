local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Localization.withLocalization);
local v9 = require(l_Parent_0.Actions.CancelLeavingGame);
local v10 = require(l_Parent_0.GlobalConfig);
local v11 = require(script.Parent.ConfirmationDialog);
local v12 = require(l_Parent_0.Resources.Constants);
local v13 = require(l_Parent_0.Utility.SendAnalytics);
local v14 = require(l_RobloxGui_0.Modules.Common.GetDefaultQualityLevel);
local v15 = l_t_0.strictInterface({
    isLeavingGame = l_t_0.boolean, 
    onCancel = l_t_0.callback, 
    sendAnalytics = l_t_0.callback
});
return l_RoactRodux_0.UNSTABLE_connect2(function(v16, _)
    return {
        isLeavingGame = v16.leavingGame
    };
end, function(v18)
    return {
        onCancel = function()
            v18(v9());
            v13(v12.AnalyticsInGameMenuName, v12.AnalyticsLeaveGameName, {
                confirmed = v12.AnalyticsCancelledName
            });
        end
    };
end)(function(v19)
    if v10.propValidation then
        assert(v15(v19));
    end;
    return v8({
        bodyText = "CoreScripts.InGameMenu.ConfirmLeaveGame", 
        confirmText = "CoreScripts.InGameMenu.Leave", 
        titleText = "CoreScripts.InGameMenu.LeaveGameQuestion", 
        cancelText = "CoreScripts.InGameMenu.Cancel"
    })(function(v20)
        return l_Roact_0.createElement(v11, {
            bodyText = v20.bodyText, 
            confirmText = v20.confirmText, 
            titleText = v20.titleText, 
            cancelText = v20.cancelText, 
            bindReturnToConfirm = true, 
            onCancel = v19.onCancel, 
            onConfirm = function()
                v13(v12.AnalyticsInGameMenuName, v12.AnalyticsLeaveGameName, {
                    confirmed = v12.AnalyticsConfirmedName
                });
                l_RunService_0.Heartbeat:Wait();
                game:Shutdown();
                settings().Rendering.QualityLevel = v14();
            end, 
            blurBackground = true, 
            visible = v19.isLeavingGame
        });
    end);
end);
