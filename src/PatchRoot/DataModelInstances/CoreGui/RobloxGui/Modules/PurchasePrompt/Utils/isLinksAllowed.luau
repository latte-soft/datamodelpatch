local l_Parent_0 = script.Parent.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Parent_0.Enums.UpsellFlow);
local v3 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
return function()
    return v3((l_UserInputService_0:GetPlatform())) == v2.Web;
end;
