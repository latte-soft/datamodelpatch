local v0 = require(game:GetService("CorePackages").PolicyProvider);
local v1 = v0.withGetPolicyImplementation((v0.GetPolicyImplementations.MemStorageService("app-policy")));
v1.Mapper = function(_)
    return {};
end;
return v1;
