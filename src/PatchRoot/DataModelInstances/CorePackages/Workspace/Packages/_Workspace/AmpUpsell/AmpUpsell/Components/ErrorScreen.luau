local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v6 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v9 = require(l_script_FirstAncestor_0.Analytics.sendButtonClickEvent);
local function v11(v10)
    return v10.ScreenSize;
end;
return function(v12)
    local l_onRetry_0 = v12.onRetry;
    local l_onCancel_0 = v12.onCancel;
    local l_featureName_0 = v12.featureName;
    local v16 = l_useLocalization_0({
        title = "Amp.ErrorScreen.Title", 
        bodyText = "Amp.ErrorScreen.BodyText", 
        buttonRetry = "Amp.ErrorScreen.Retry", 
        buttonCancel = "Amp.ErrorScreen.Cancel"
    });
    local v17 = if not v12.analyticsService then v5.EventStream else v12.analyticsService;
    return v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = l_useSelector_0(v11), 
        title = v16.title, 
        bodyText = v16.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = false, 
                        onActivated = function()
                            v9(v17, "AmpErrorScreen", l_featureName_0, "Cancel");
                            l_onCancel_0();
                        end, 
                        text = v16.buttonCancel
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = false, 
                        onActivated = function()
                            v9(v17, "AmpErrorScreen", l_featureName_0, "Retry");
                            l_onRetry_0();
                        end, 
                        text = v16.buttonRetry
                    }
                }
            }
        }
    });
end;
