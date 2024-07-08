local v0 = require(script.Parent.Parent.Dev.React);
local v1 = require(script.Parent.foldProviders);
return function(v2, v3)
    v3 = v3 or {};
    assert(v3, "Config must not be nil");
    return v1(v0.createElement(v2, v3.props), v3.providers or {});
end;
