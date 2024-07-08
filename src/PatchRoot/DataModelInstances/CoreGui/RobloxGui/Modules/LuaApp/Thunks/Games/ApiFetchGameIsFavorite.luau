local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Logging);
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GameGetIsFavorite);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.SetGameFavorite);
return function(v5, v6)
    if type(v6) ~= "string" then
        error("ApiFetchGameIsFavorite thunk expects universeId to be a string");
    end;
    return function(v7)
        return v3(v5, v6):andThen(function(v8)
            local l_responseBody_0 = v8.responseBody;
            if l_responseBody_0 ~= nil and l_responseBody_0.isFavorited ~= nil then
                v7:dispatch(v4(v6, l_responseBody_0.isFavorited));
                return v8;
            else
                v1.warn("Response from GameGetIsFavorite is malformed");
                return v2.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end);
    end;
end;
