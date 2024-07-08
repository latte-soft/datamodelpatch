local v0 = require(script.Parent.UniversalAppGetPolicy);
local v1 = require(script.Parent.AppFeaturePolicies);
return function()
    return v1(v0.read() or {});
end;
