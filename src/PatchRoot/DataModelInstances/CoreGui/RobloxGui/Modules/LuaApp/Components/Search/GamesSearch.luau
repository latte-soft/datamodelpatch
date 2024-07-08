local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").RoactRodux);
local v2 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v3 = require(l_Modules_0.LuaApp.Actions.RemoveSearchInGames);
local v4 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v5 = require(l_Modules_0.LuaApp.Thunks.Search.ApiFetchGameSearchResults);
local v6 = require(l_Modules_0.LuaApp.Components.Search.GamesSearchPage);
local function _(v7, v8)
    local v9 = v7.RequestsStatus.SearchesInGamesStatus[v8.searchUuid];
    if v9 == nil then
        v9 = v2.NotStarted;
    end;
    return v9;
end;
return (v1.connect(function(v11, v12)
    local v13 = {
        searchInGames = v11.Search.SearchesInGames[v12.searchUuid]
    };
    local v14 = v11.RequestsStatus.SearchesInGamesStatus[v12.searchUuid];
    if v14 == nil then
        v14 = v2.NotStarted;
    end;
    v13.searchInGamesStatus = v14;
    v13.screenSize = v11.ScreenSize;
    return v13;
end, function(v15)
    return {
        dispatchSearch = function(v16, v17, v18)
            return v15(v5(v16, {
                searchKeyword = v17, 
                searchUuid = v18, 
                isAppend = false
            }));
        end, 
        dispatchRemoveSearch = function(v19)
            v15(v3(v19));
            v15(v4(v19, v2.Removed));
        end
    };
end)(v6));
