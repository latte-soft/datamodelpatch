local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useState_0 = v4.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v10 = require(script.Parent.PendingStateIndicator);
local v11 = require(script.Parent.PhoneVerificationUpsellContainer);
local v12 = require(script.Parent.IneligibleModalContainer);
local v14 = {
    topBarHeight = 0, 
    networkErrorText = "PLACEHOLDER There was a network error, please try again later", 
    pendingStateBodyText = "Upgraded conversation", 
    navigateToToast = function(_)
    end, 
    shouldShowPhoneVerificationUpsell = false, 
    shouldShowIneligibleModal = false
};
return l_memo_0(function(v15)
    local v16 = v3.Dictionary.join(v14, v15);
    local v17 = v16.style or l_useStyle_0();
    local v18, v19 = l_useState_0(0);
    return v4.createElement("Frame", {
        BackgroundColor3 = v17.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, -v16.topBarHeight), 
        Transparency = v17.Theme.BackgroundDefault.Transparency, 
        LayoutOrder = v16.layoutOrder
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PendingStateIndicator = v4.createElement(v10, {
            layoutOrder = 1, 
            size = UDim2.new(1, 0, 1, -v18), 
            bodyText = v16.pendingStateBodyText
        }), 
        PendingStateModal = v4.createElement(if not v16.shouldShowPhoneVerificationUpsell then if v16.shouldShowIneligibleModal then v12 else function()
        end else v11, {
            conversationId = v16.conversationId, 
            showNetworkErrorToast = l_useCallback_0(function()
                v16.navigateToToast({
                    toastProps = {
                        toastContent = {
                            toastTitle = v16.networkErrorText
                        }
                    }
                });
            end, l_dependencyArray_0(v16.navigateToToast, v16.networkErrorText)), 
            layoutOrder = 2, 
            onHeightChanged = l_useCallback_0(function(v20)
                v19(v20);
            end, l_dependencyArray_0(v19))
        })
    });
end);
