local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.SearchGetOmniSearch);
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.Enum.OmniSearchVerticalType);
local v8 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v9 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v10 = require(l_Modules_0.LuaApp.Thunks.Search.HandleGameSearchResults);
local v11 = require(l_Modules_0.LuaApp.Thunks.Search.HandleUserSearchResults);
return function(v12, v13)
    return function(v14)
        local v15 = {
            searchQuery = v13.searchKeyword, 
            sessionId = v13.searchUuid, 
            verticalType = "auto"
        };
        v14:dispatch(v8(v13.searchUuid, v9.Fetching));
        return v3(v12, v15):andThen(function(v16)
            local v17 = if v16.responseBody.vertical == v7.User then v6.SearchTypes.Players else v6.SearchTypes.Games;
            v14:dispatch(v5(v13.searchUuid, v17));
            if v17 == v6.SearchTypes.Players then
                v14:dispatch(v8(v13.searchUuid, v9.NotStarted));
                return v14:dispatch(v11(v12, v13, v16));
            else
                return v14:dispatch(v10(v12, v13, v16));
            end;
        end, function(v18)
            v14:dispatch(v8(v13.searchUuid, v9.Failed));
            return v4.reject(v18);
        end);
    end;
end;
