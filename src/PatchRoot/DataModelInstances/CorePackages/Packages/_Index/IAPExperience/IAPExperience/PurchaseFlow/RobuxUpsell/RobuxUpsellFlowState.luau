local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Utility.addRawValueMethodToEnum);
local v3 = require(l_Parent_1.enumerate);
local v4 = {
    None = "None", 
    Loading = "Loading", 
    PurchaseModal = "PurchaseModal", 
    GenericPurchaseModal = "GenericPurchaseModal", 
    LargeRobuxPurchaseModal = "LargeRobuxPurchaseModal", 
    PurchaseWarning = "PurchaseWarning", 
    TwoStepRequired = "TwoStepRequired", 
    RobuxPurchasePending = "RobuxPurchasePending", 
    RobuxGrantPending = "RobuxGrantPending", 
    ItemPurchasePending = "ItemPurchasePending", 
    Success = "Success", 
    LeaveRobloxWarning = "LeaveRobloxWarning", 
    Error = "Error"
};
local v5 = v3(script.Name, v4);
v2(v5, v4);
return v5;
