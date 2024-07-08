local v0 = require(script.RoduxNetworking);
local v1 = require(script.NetworkStatus);
return {
    config = function(v2)
        local v3 = v0.new(v2);
        local v4 = v1(v2);
        return {
            GET = function(...)
                return v3:GET(...);
            end, 
            POST = function(...)
                return v3:POST(...);
            end, 
            PATCH = function(...)
                return v3:PATCH(...);
            end, 
            getNetworkImpl = function()
                return v3:getNetworkImpl();
            end, 
            setNetworkImpl = function(...)
                v3:setNetworkImpl(...);
            end, 
            installReducer = v4.installReducer, 
            Enum = {
                NetworkStatus = v4.Enum.Status
            }
        };
    end, 
    mock = require(script.mockRoduxNetworking)
};
