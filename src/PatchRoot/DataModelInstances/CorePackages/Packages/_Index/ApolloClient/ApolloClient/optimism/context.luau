local l_Parent_0 = script.Parent.Parent;
local v1 = {};
local _ = require(script.Parent.anyEntryTypes);
v1.parentEntrySlot = require(l_Parent_0.wry.context).Slot.new();
local v3 = require(l_Parent_0.wry.context);
v1.bindContext = v3.bind;
v1.noContext = v3.noContext;
v1.setTimeout = v3.setTimeout;
return v1;
