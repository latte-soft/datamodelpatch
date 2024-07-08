local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gameDetailReferral);
return function(v5, v6)
    v4(l_EventIngest_0.new(l_EventIngestService_0), v6, {
        universeId = v5, 
        pg = "deepLink"
    });
end;
