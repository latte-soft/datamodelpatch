local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Enums.PurchaseError);
local v3 = require(l_Parent_0.Promise);
return function(v4, v5, v6)
    return v4.getPlayerOwns(l_Players_0.LocalPlayer, v5, v6):catch(function(_)
        return v3.reject(v2.UnknownFailure);
    end);
end;
