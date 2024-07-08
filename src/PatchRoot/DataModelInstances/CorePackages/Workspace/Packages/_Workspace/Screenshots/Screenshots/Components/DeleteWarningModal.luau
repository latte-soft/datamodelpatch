local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Localization);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.RobloxAppHooks);
local v6 = require(l_Parent_1.UIBlox);
local v7 = require(l_Parent_0.Actions.DeleteWarningModalClosed);
local v8 = require(l_Parent_0.Utils.recordDeleteWarningModalOptOut);
local l_useCallback_0 = v3.useCallback;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useScreenSize_0 = v5.useScreenSize;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useState_0 = v3.useState;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v17 = require(l_Parent_0.Analytics.EventNames);
local v18 = require(l_Parent_0.Analytics.useAnalytics);
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v6.App.InputButton.Checkbox;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
return function(v22)
    local v23 = l_useScreenSize_0();
    local v24 = l_useStyle_0();
    local v25 = v18();
    local v26 = l_useDispatch_0();
    local v27 = l_useLocalization_0({
        alertBody = "Feature.Captures.Label.DeleteCaptureInfo", 
        alertBodyPlural = "Feature.Captures.Label.DeleteCapturesWarning", 
        alertTitle = "Feature.Captures.Title.DeleteCaptureWarning", 
        alertTitlePlural = "Feature.Captures.Title.DeleteMultipleCapturesWarning", 
        cancelCTA = "Feature.Captures.Action.DeleteCaptureWarningCancel", 
        deleteCTA = "Feature.Captures.Action.DeleteCaptureWarningConfirm", 
        optOutText = "Feature.Captures.Label.DeleteCaptureWarningOptOut"
    });
    local l_Theme_0 = v24.Theme;
    local v30 = l_useSelector_0(function(v29)
        return v29.Screenshots.Carousel.IsDeleteWarningModalOpen;
    end);
    local v32 = l_useSelector_0(function(v31)
        return v31.Screenshots.CaptureManager.SelectedCaptures;
    end);
    local v33, v34 = l_useState_0(false);
    l_useEffect_0(function()
        if v30 then
            v34(false);
        end;
    end, {
        v30, 
        v34
    });
    return v3.createElement("Frame", {
        Active = true, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        Visible = v30, 
        ZIndex = v22.zIndex
    }, {
        Alert = v3.createElement(l_InteractiveAlert_0, {
            bodyText = if #v32 > 1 then v27.alertBodyPlural else v27.alertBody, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = l_useCallback_0(function()
                                v26(v7());
                                v25.fireEvent(v17.CapturesDeleteWarningModalCancelPressed);
                            end, {}), 
                            text = v27.cancelCTA
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_useCallback_0(function()
                                v22.deleteItem();
                                if v33 then
                                    v8(v25);
                                end;
                                v25.fireEvent(v17.CapturesDeleteWarningModalDeletePressed);
                                v26(v7());
                            end, {
                                v25, 
                                v33, 
                                v22.deleteItem
                            }), 
                            text = v27.deleteCTA
                        }
                    }
                }
            }, 
            isMiddleContentFocusable = false, 
            middleContent = function()
                return v3.createElement(l_Checkbox_0, {
                    text = v27.optOutText, 
                    isSelected = v33, 
                    isDisabled = false, 
                    onActivated = function()
                        v34(not v33);
                    end
                });
            end, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v23, 
            title = if #v32 > 1 then v27.alertTitlePlural else v27.alertTitle
        })
    });
end;
