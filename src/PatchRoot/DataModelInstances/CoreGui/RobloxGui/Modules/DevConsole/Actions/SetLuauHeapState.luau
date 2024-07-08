local v0 = require(script.Parent.Parent.Action);
local _ = require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes);
return v0(script.Name, function(v2, v3)
    return {
        isClientState = v2, 
        sessionState = v3
    };
end);
