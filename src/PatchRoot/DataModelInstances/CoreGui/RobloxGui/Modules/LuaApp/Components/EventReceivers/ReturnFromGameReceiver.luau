local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameIsFavorite);
local v9 = require(l_Modules_0.LuaApp.Thunks.ApiFetchGameFollowingStatus);
local v10 = require(l_Modules_0.LuaApp.Flags.FFlagUseImprovedGameProtocolMessages);
local v11 = v2.PureComponent:extend("ReturnFromGameReceiver");
v11.init = function(v12)
    v12.launchedUniverseId = nil;
    v12.reloadFavoriteAndFollowing = function()
        return v12.props.fetchFavoriteAndFollowingData(v12.props.networking, v12.launchedUniverseId);
    end;
    v12.returnedFromGame = function()
        if v12.props.onGameReturned then
            v12.props.onGameReturned(v12.launchedUniverseId);
        end;
        v12:reloadFavoriteAndFollowing();
    end;
    v12.subscriber = l_MessageBus_0.Subscriber.new();
    v12.subscriber:subscribe({
        mid = l_MessageBus_0.getMessageId("Game", "onGameLeave"), 
        validateParams = v6.table
    }, function(v13)
        if v10 then
            v12.launchedUniverseId = nil;
            if v12.props.games then
                for v14, v15 in pairs(v12.props.games) do
                    if v15.placeId == tostring(v13.placeId) then
                        v12.launchedUniverseId = tostring(v14);
                    end;
                end;
            end;
        end;
        if v12.launchedUniverseId then
            v12:returnedFromGame();
            v12.launchedUniverseId = nil;
        end;
    end);
    if not v10 then
        v12.subscriber:subscribe({
            mid = l_MessageBus_0.getMessageId("Game", "launch"), 
            validateParams = v6.table
        }, function(v16)
            if v16.placeId then
                v12.launchedUniverseId = nil;
                if v12.props.games then
                    for v17, v18 in pairs(v12.props.games) do
                        if v18.placeId == tostring(v16.placeId) then
                            v12.launchedUniverseId = tostring(v17);
                            return ;
                        end;
                    end;
                end;
                if v12.props.gameDetails then
                    for v19, v20 in pairs(v12.props.gameDetails) do
                        if v20.rootPlaceId == tostring(v16.placeId) then
                            v12.launchedUniverseId = tostring(v19);
                            return ;
                        end;
                    end;
                end;
            end;
        end);
    end;
end;
v11.render = function(_)
end;
return v3.connect(function(v22)
    return {
        games = v22.Games, 
        gameDetails = v22.GameDetails
    };
end, function(v23)
    return {
        fetchFavoriteAndFollowingData = function(v24, v25)
            v23(v8(v24, v25));
            v23(v9(v24, v25));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v7
})(v11)));
