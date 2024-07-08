local l_Parent_0 = script.Parent.Parent;
local l_enumerate_0 = require(game:GetService("CorePackages").PurchasePromptDeps).enumerate;
local v2 = require(l_Parent_0.Utils.addRawValueMethodToEnum);
local v3 = {
    None = "None", 
    Product = "Product", 
    RobuxUpsell = "RobuxUpsell", 
    RobuxUpsellV2 = "RobuxUpsellV2", 
    LargeRobuxUpsell = "LargeRobuxUpsell", 
    PremiumUpsell = "PremiumUpsell"
};
local v4 = l_enumerate_0(script.Name, v3);
v2(v4, v3);
return v4;
