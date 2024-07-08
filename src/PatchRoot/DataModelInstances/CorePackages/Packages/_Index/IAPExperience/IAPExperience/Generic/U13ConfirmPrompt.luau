local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v7 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v8 = require(l_Parent_0.U13ConfirmType);
local v9 = v3.Component:extend(script.Name);
v9.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v9.getMessage = function(_, v11, v12)
    if v12 == v8.U13PaymentModal then
        return v11.u13PaymentModal;
    elseif v12 == v8.U13MonthlyThreshold1Modal then
        return v11.u13MonthlyThreshold1Modal;
    elseif v12 == v8.U13MonthlyThreshold2Modal then
        return v11.u13MonthlyThreshold2Modal;
    elseif v12 == v8.ParentalConsentWarningPaymentModal13To17 then
        return v11.parentalConsentWarningPaymentModal13To17;
    else
        return ;
    end;
end;
v9.render = function(v13)
    return v3.createElement(v7, {
        keys = {
            title = {
                key = ("IAPExperience.U13Confirm.%s"):format("Title.Warning")
            }, 
            u13PaymentModal = {
                key = ("IAPExperience.U13Confirm.%s"):format("Text.U13PaymentModal")
            }, 
            u13MonthlyThreshold1Modal = {
                key = ("IAPExperience.U13Confirm.%s"):format("Text.U13MonthlyThreshold1Modal")
            }, 
            u13MonthlyThreshold2Modal = {
                key = ("IAPExperience.U13Confirm.%s"):format("Text.U13MonthlyThreshold2Modal")
            }, 
            parentalConsentWarningPaymentModal13To17 = {
                key = ("IAPExperience.U13Confirm.%s"):format("Text.ParentalConsentWarningPaymentModal13To17")
            }, 
            confirm = {
                key = ("IAPExperience.U13Confirm.%s"):format("Action.Confirm")
            }, 
            cancel = {
                key = ("IAPExperience.U13Confirm.%s"):format("Action.Cancel")
            }
        }, 
        render = function(v14)
            return v13:renderAlert(v14);
        end
    });
end;
v9.renderAlert = function(v15, v16)
    local l_props_0 = v15.props;
    return v3.createElement(l_InteractiveAlert_0, {
        anchorPoint = l_props_0.anchorPoint, 
        position = l_props_0.position, 
        screenSize = l_props_0.screenSize, 
        title = v16.title, 
        bodyText = v15:getMessage(v16, l_props_0.modalType), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = l_props_0.cancelActivated, 
                        text = v16.cancel, 
                        inputIcon = l_props_0.cancelControllerIcon
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_props_0.doneActivated, 
                        text = v16.confirm, 
                        inputIcon = l_props_0.doneControllerIcon
                    }
                }
            }
        }
    });
end;
return v9;
