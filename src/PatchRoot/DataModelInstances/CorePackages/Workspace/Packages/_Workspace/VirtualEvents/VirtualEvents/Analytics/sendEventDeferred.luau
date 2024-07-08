local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_HttpService_0 = game:GetService("HttpService");
local l_getPlatformTarget_0 = require(l_script_FirstAncestor_0.Parent.Analytics).getPlatformTarget;
local v4 = require(l_script_FirstAncestor_0.logger);
return function(v5, v6)
    v4:debug(string.format("Fired %q with payload %s", v5, l_HttpService_0:JSONEncode(v6)));
    l_EventIngestService_0:SendEventDeferred(l_getPlatformTarget_0(), "virtualEvents", v5, v6);
end;
