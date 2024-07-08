local v0 = require(script.Parent.RoduxNetworking);
return function(v1)
    local v2 = v0.getNetworkImpl();
    v0.setNetworkImpl(v1);
    return function()
        v0.setNetworkImpl(v2);
    end;
end;
