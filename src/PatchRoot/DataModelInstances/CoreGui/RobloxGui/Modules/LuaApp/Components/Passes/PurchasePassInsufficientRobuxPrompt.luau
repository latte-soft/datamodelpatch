local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v6 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v4.Style.withStyle;
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = v2.PureComponent:extend("PurchasePassInsufficientRobux");
v12.validateProps = v11.strictInterface({
    containerWidth = v11.number, 
    defaultChildRef = v11.optional(v11.any), 
    focusController = v11.optional(v11.any), 
    openPurchaseRobuxPage = v11.callback, 
    closePrompt = v11.callback
});
v12.init = function(v13)
    v13.openPurchaseRobuxPage = function()
        v13.props.closePrompt();
        v13.props.openPurchaseRobuxPage();
    end;
end;
v12.render = function(v14)
    local l_containerWidth_0 = v14.props.containerWidth;
    local l_closePrompt_0 = v14.props.closePrompt;
    return l_withStyle_0(function(v17)
        return v9({
            titleText = "Feature.Catalog.Heading.InsufficientFunds", 
            messageText = "Feature.Catalog.Label.InsufficientFunds", 
            confirmButtonText = "Feature.GameDetails.Action.BuyRobux"
        })(function(v18)
            return v2.createElement(v5, {
                containerWidth = l_containerWidth_0, 
                titleText = v18.titleText, 
                titleFont = v17.Font.Header1.Font, 
                messageText = v18.messageText, 
                messageFont = v17.Font.Body.Font, 
                buttonFont = v17.Font.Header2.Font, 
                confirmButtonText = v18.confirmButtonText, 
                onConfirm = v14.openPurchaseRobuxPage, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_0
            });
        end);
    end);
end;
return (v3.connect(nil, function(v19)
    return {
        closePrompt = function()
            v19(v6());
        end, 
        openPurchaseRobuxPage = function()
            return v19(v8({
                name = v7.PurchaseRobux
            }));
        end
    };
end)(v12));
