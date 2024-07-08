local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_getPlatformTarget_0 = require(script.Parent.Parent.Parent.Analytics).getPlatformTarget;
return function(v2, v3, v4)
    l_EventIngestService_0:SendEventDeferred(l_getPlatformTarget_0(), v2, v3, v4 or {});
end;
