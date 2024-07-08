local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.t);
local _ = require(script.Parent.PrefetchProtocolTypes);
local v4 = {
    POP_GUID_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId("Prefetch", "popPendingPrefetchGuid"), 
        validateParams = v2.table
    }
};
v4.__index = v4;
v4.new = function(v5)
    local v6 = {
        messageBus = v5 or l_MessageBus_0
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.popPendingPrefetchGuid = function(v7)
    return v7.messageBus.call(v7.POP_GUID_DESCRIPTOR, {});
end;
v4.default = v4.new();
return v4;
