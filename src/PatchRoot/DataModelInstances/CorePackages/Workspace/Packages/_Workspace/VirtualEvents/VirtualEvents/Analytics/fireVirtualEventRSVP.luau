local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.enums);
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(script.Parent.sendEventDeferred);
return function(v4)
    v3(v1.AnalyticsEvent.VirtualEventRSVP, v4);
end;
