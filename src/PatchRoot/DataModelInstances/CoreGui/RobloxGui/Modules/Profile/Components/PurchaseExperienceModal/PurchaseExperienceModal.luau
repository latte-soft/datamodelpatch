local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Promise_0 = v1.Promise;
local l_memoize_0 = v1.memoize;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v9 = require(l_Parent_0.Common.TextKeys);
local _ = require(script.Parent.purchaseExperienceMapStateToProps);
local v11 = l_Roact_0.Component:extend("PurchaseExperienceModal");
v11.init = function(v12)
    v12.purchaseGame = l_memoize_0(function(v13, v14)
        local l_props_0 = v12.props;
        local function _()
            l_props_0.showToast(v13, v14, true);
        end;
        return function()
            return l_props_0.purchaseGame():andThen(function(v17)
                local l_responseBody_0 = v17.responseBody;
                return type(l_responseBody_0) == "table" and l_responseBody_0 or l_Promise_0.reject();
            end):andThen(function(v19)
                l_props_0.closeModal();
                if not v19.purchased then
                    l_props_0.showPurchaseErrorToast(v19);
                    return ;
                else
                    l_props_0.showToast(v13, v14, true);
                    return ;
                end;
            end):catch(function(v20)
                l_props_0.closeModal();
                l_props_0.showNetworkingErrorToast(v20);
            end);
        end;
    end);
end;
v11.render = function(v21)
    local l_props_1 = v21.props;
    local l_gameDetails_0 = l_props_1.gameDetails;
    return l_withLocalization_0({
        titleText = v9.PurchaseExperienceModalTitle, 
        bodyText = {
            v9.PurchaseExperienceModalBody; 
            gameName = l_gameDetails_0.name, 
            X = l_gameDetails_0.price
        }, 
        confirmButtonText = v9.Unlock, 
        cancelButtonText = v9.Cancel, 
        successToastTitle = v9.SuccessPurchaseToastTitle, 
        successToastMessage = {
            v9.SuccessPurchaseToastMessage; 
            gameName = l_gameDetails_0.name, 
            price = l_gameDetails_0.price
        }
    })(function(v24)
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_1.screenSize, 
            title = v24.titleText, 
            bodyText = v24.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = nil, 
                        props = {
                            text = v24.cancelButtonText, 
                            onActivated = l_props_1.closeModal
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v24.confirmButtonText, 
                            onActivated = v21.purchaseGame(v24.successToastTitle, v24.successToastMessage)
                        }
                    }
                }
            }
        });
    end);
end;
return v11;
