local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v6 = require(l_CorePackages_0.Packages.t);
local l_AppOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppOmniRecommendationsRequest;
local v8 = require(l_Modules_0.LuaApp.Thunks.Games.FetchDataOnGameExit);
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppFullRefreshOmniRecOnGameExit);
local v11 = v2.PureComponent:extend("OnGameLeaveReceiver");
v11.init = function(v12)
    v12.returnedFromGame = function()
        v12.props.fetchDataOnGameExit(v12.props.networking, if not v10() then nil else if not v10() then nil else v12.props.omniRecommendationsRequest);
    end;
    v12.subscriber = l_MessageBus_0.Subscriber.new();
    v12.subscriber:subscribe({
        mid = l_MessageBus_0.getMessageId("Game", "onGameLeave"), 
        validateParams = v6.table
    }, function(_)
        v12.returnedFromGame();
    end);
end;
v11.render = function(_)
end;
return v3.connect(nil, function(v15)
    return {
        fetchDataOnGameExit = function(v16, v17)
            v15(v8(v16, if not v10() then nil else v17));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v9, 
    omniRecommendationsRequest = if not v10() then nil else l_AppOmniRecommendationsRequest_0
})(v11)));
