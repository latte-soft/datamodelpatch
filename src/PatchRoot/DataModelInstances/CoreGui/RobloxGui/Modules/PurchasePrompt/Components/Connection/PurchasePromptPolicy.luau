local l_PolicyProvider_0 = require(game:GetService("CorePackages").PurchasePromptDeps).PolicyProvider;
local v1 = l_PolicyProvider_0.withGetPolicyImplementation((l_PolicyProvider_0.GetPolicyImplementations.MemStorageService("app-policy")));
v1.Mapper = function(_)
    return {};
end;
return v1;
