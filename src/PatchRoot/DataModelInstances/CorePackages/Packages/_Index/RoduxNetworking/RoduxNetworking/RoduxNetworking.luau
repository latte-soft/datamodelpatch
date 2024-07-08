local v0 = require(script.Parent.GET);
local v1 = require(script.Parent.POST);
local v2 = require(script.Parent.PATCH);
local v3 = {};
v3.__index = v3;
v3.new = function(v4)
    assert(v4, "Expected options to be passed into RoduxNetworking");
    assert(v4.keyPath, "Expected options.keyPath to be passed into RoduxNetworking");
    assert(v4.networkImpl, "Expected options.networkImpl to be passed into RoduxNetworking");
    return (setmetatable({
        options = v4
    }, v3));
end;
v3.GET = function(v5, v6, v7)
    assert(v6, "RoduxNetworking:GET expects moduleScript argument");
    assert(v6, "RoduxNetworking:GET expects constructBuilderFunction argument");
    return v0(v5.options)(v6, v7);
end;
v3.POST = function(v8, ...)
    return v1(v8.options)(...);
end;
v3.PATCH = function(v9, ...)
    return v2(v9.options)(...);
end;
v3.getNetworkImpl = function(v10)
    return v10.options.networkImpl;
end;
v3.setNetworkImpl = function(v11, v12)
    v11.options.networkImpl = v12;
end;
return v3;
