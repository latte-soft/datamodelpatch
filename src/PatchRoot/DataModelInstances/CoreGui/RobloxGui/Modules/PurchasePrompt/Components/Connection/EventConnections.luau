local l_Parent_0 = script.Parent.Parent.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v3 = require(l_Parent_0.Enums.UpsellFlow);
local v4 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v5 = require(script.Parent.MarketplaceServiceEventConnector);
local v6 = require(script.Parent.InputTypeManager);
local v7 = require(script.Parent.BrowserPurchaseFinishedConnector);
local v8 = require(script.Parent.NativePurchaseFinishedConnector);
return function()
    local v9 = nil;
    local v10 = v4(l_UserInputService_0:GetPlatform());
    if v10 == v3.Web then
        v9 = l_Roact_0.createElement(v7);
    elseif v10 == v3.Mobile then
        v9 = l_Roact_0.createElement(v8);
    end;
    return l_Roact_0.createElement("Folder", {}, {
        MarketPlaceServiceEventConnector = l_Roact_0.createElement(v5), 
        InputTypeManager = not not (l_UserInputService_0:GetPlatform() ~= Enum.Platform.XBoxOne) and l_Roact_0.createElement(v6) or nil, 
        UpsellFinishedConnector = v9
    });
end;
