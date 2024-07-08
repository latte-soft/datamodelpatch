local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.tutils);
local v3 = require(l_Modules_0.Personalization.Games.DataStore.TopicContentsModel);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.LuaApp.Actions.Games.AddGames);
local v6 = require(l_Modules_0.Personalization.Games.DataStore.AddTopicContents);
local v7 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.DiscoveryGame);
local v8 = require(l_Modules_0.Personalization.Games.DataStore.TopicContentsEntryModel);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
return function(v10, v11, v12, v13)
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local l_Games_0 = v11:getState().Games;
    local l_games_0 = v12.games;
    if #l_games_0 == 0 then
        warn("Found no games in this sort:", v12.sortDisplayName);
    end;
    for _, v20 in pairs(l_games_0) do
        local v21 = v8.fromExploreApiData(v20);
        local v22 = v7.fromJsonData(v20);
        v21:match(function(v23)
            return v22:match(function(v24)
                table.insert(v14, (v4.Dictionary.join(v24, v23)));
                local l_universeId_0 = v24.universeId;
                if not v2.shallowEqual(v24, l_Games_0[l_universeId_0]) then
                    v15[l_universeId_0] = v24;
                    table.insert(v16, l_universeId_0);
                end;
            end);
        end):matchError(function(v26)
            warn(v26);
        end);
    end;
    if next(v15) then
        v11:dispatch(v5(v15));
    end;
    local v27 = {
        entries = v14
    };
    local v28 = false;
    if v12.nextPageToken ~= nil then
        v28 = v12.nextPageToken ~= "";
    end;
    v27.hasMoreRows = v28;
    v27.nextPageToken = v12.nextPageToken;
    v27.nextPageExclusiveStartId = 0;
    v27.rowsRequested = 0;
    if not v13 then
        v27.updatedTimestamp = tick();
    end;
    v11:dispatch(v6(v12.sortId, v3.fromData(v27), v13));
    if #v16 > 0 then
        v11:dispatch(l_ApiFetchGameIcons_0(v10, v16));
    end;
end;
