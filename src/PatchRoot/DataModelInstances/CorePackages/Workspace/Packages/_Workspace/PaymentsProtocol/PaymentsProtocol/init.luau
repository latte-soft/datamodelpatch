local v0 = require(script.PaymentsProtocol);
local v1 = require(script.PaymentsProtocolConstants);
local v2 = require(script.Enums.ProductType);
local _ = require(script.PaymentsProtocolTypes);
return {
    Enum = {
        ProductType = v2
    }, 
    PaymentsProtocol = v0, 
    PaymentsProtocolConstants = v1, 
    Flags = {}
};
