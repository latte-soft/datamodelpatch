local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Promise);
local v2 = require(l_Parent_0.PaymentsProtocolConstants);
local _ = require(l_Parent_0.PaymentsProtocolTypes);
local _ = require(l_Parent_0.Enums.IAPEventType);
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v6 = {};
v6.__index = v6;
v6.new = function()
    return (setmetatable({}, v6));
end;
v6.isAvailable = function(_)
    return (v1.new(function(v8, _)
        l_MessageBusService_0:MakeRequest(v2.NAME, v2.METHOD_IS_AVAILABLE, {}, function(v10)
            v8(v10.available);
        end, {});
    end));
end;
v6.listNativeProducts = function(_)
    return (v1.new(function(v12, _)
        l_MessageBusService_0:MakeRequest(v2.NAME, v2.METHOD_LIST_NATIVE_PRODUCTS, {}, function(v14)
            v12(v14);
        end, {});
    end));
end;
v6.processPendingPurchase = function(_)
    l_MessageBusService_0:Publish(v2.MESSAGE_PROCESS_PENDING_PURCHASE, {});
end;
v6.sendIAPEvent = function(_, v17)
    l_MessageBusService_0:Publish(v2.MESSAGE_SEND_IAP_EVENT, {
        eventType = v17
    });
end;
v6.default = v6.new();
return v6;
