local v0 = require(script:FindFirstAncestor("Squads").dependencies);
local l_CloseCentralOverlay_0 = v0.CentralOverlay.Thunks.CloseCentralOverlay;
local l_React_0 = v0.React;
local l_RobloxAppHooks_0 = v0.RobloxAppHooks;
local l_UIBlox_0 = v0.UIBlox;
local l_useDispatch_0 = v0.Hooks.useDispatch;
local l_useLocalization_0 = v0.Hooks.useLocalization;
local l_useScreenSize_0 = l_RobloxAppHooks_0.useScreenSize;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
return function(v10)
    local v11 = l_useLocalization_0({
        cancelButtonText = "CommonUI.Controls.Action.Cancel", 
        leaveButtonText = "Feature.Squads.Action.Leave"
    });
    local v12 = l_useDispatch_0();
    return l_React_0.createElement(l_InteractiveAlert_0, {
        screenSize = l_useScreenSize_0(), 
        title = "Leave party?", 
        bodyText = not v10.isJoiningSquad and "You are currently in a live party. Would you like to leave it?" or "You are currently in a live party. Do you want to join another party?", 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = l_React_0.useCallback(function()
                            v12(l_CloseCentralOverlay_0());
                        end, {
                            v12
                        }), 
                        text = v11.cancelButtonText
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_React_0.useCallback(function()
                            v12(l_CloseCentralOverlay_0());
                            v10.onLeave();
                        end, {
                            v10.onLeave
                        }), 
                        text = v11.leaveButtonText
                    }
                }
            }
        }
    });
end;
