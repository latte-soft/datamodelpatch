local _ = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_1 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_1:WaitForChild("RobloxGui").Modules;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_SocialContextToastContainer_0 = require(l_CorePackages_0.Workspace.Packages.SocialContextToasts).SocialContextToastContainer;
local l_GetFFlagSocialContextToastEventStream_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSocialContextToastEventStream;
local v8 = require(l_CorePackages_0.Workspace.Packages.HttpRequest);
l_SocialContextToastContainer_0({
    networking = v8.config({
        requestFunction = function(v9, v10, v11)
            return v8.requestFunctions.HttpRbxApi(v9, v10, v11);
        end
    }), 
    playersService = l_Players_0, 
    apolloClient = require(l_CoreGui_1.RobloxGui.Modules.ApolloClient), 
    analytics = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics.new(), 
    ixpService = require(l_Modules_0.Common.IXPServiceWrapper), 
    eventIngest = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0)
}, if not l_GetFFlagSocialContextToastEventStream_0() then game.GameId else tostring(game.GameId), if not l_GetFFlagSocialContextToastEventStream_0() then game.PlaceId else tostring(game.PlaceId));
