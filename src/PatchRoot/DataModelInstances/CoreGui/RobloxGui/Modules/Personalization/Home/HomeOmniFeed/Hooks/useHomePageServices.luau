local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppPrefetch_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPrefetch;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
return function()
    return {
        appAnalytics = v9(v6), 
        networking = v9(v7), 
        eventIngest = v9(v8), 
        loggingProtocol = v9(l_AppLogging_0), 
        prefetchProtocol = v9(l_AppPrefetch_0), 
        sessionService = v9(l_AppSessionService_0), 
        appStartupSequence = v9(l_AppStartupSequenceTag_0)
    };
end;
