local v0 = require(script:FindFirstAncestor("VirtualEvents").enums);
local v1 = require(script.Parent.sendEventDeferred);
return function(v2)
    v1(v0.AnalyticsEvent.VirtualEventLinkCopied, v2);
end;
