local v0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local v1 = {};
local l_Slot_0 = require(script.Parent.slot).Slot;
v1.Slot = l_Slot_0;
local l_bind_0 = l_Slot_0.bind;
local l_noContext_0 = l_Slot_0.noContext;
v1.bind = l_bind_0;
v1.noContext = l_noContext_0;
local l_setTimeout_0 = v0.setTimeout;
v1.setTimeout = function(v6, v7)
    return l_setTimeout_0(l_bind_0(v6), v7);
end;
return v1;
