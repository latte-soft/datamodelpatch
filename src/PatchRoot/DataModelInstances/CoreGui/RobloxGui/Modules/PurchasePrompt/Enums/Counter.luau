local l_Parent_0 = script.Parent.Parent;
local l_enumerate_0 = require(game:GetService("CorePackages").PurchasePromptDeps).enumerate;
local v2 = require(l_Parent_0.Utils.addRawValueMethodToEnum);
local v3 = {
    UpsellModalShown = "UpsellModalShown", 
    UpsellModalShownAgain = "UpsellModalShownAgain", 
    UpsellGenericModalShown = "UpsellGenericModalShown", 
    UpsellGenericModalShownAgain = "UpsellGenericModalShownAgain", 
    Cancelled = "Cancelled", 
    UpsellFailedNotEnoughRobux = "UpsellFailedNotEnoughRobux", 
    UpsellFailedNativePurchase = "UpsellFailedNativePurchase", 
    Failed = "Failed", 
    Success = "Success"
};
local v4 = l_enumerate_0(script.Name, v3);
v2(v4, v3);
return v4;
