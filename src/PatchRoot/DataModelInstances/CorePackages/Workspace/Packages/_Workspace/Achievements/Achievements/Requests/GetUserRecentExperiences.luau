local l_Parent_0 = script:FindFirstAncestor("Achievements").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v3, v4)
    if v4 == nil then
        v4 = 50;
    end;
    local v5, _ = v3(string.format("%sv1/games/sorts?model.gameSortsContext=GamesAllSorts", l_Url_0.GAME_URL), "GET");
    return v5:andThen(function(v7)
        if v7.responseBody == nil then
            return v1.reject("Response has no body.");
        else
            local l_sorts_0 = v7.responseBody.sorts;
            if l_sorts_0 == nil then
                return v1.reject("Response has no sorts.");
            else
                local v9 = nil;
                for _, v11 in pairs(l_sorts_0) do
                    if v11.name == "MyRecent" then
                        v9 = v11.token;
                    end;
                end;
                if v9 == nil then
                    return v1.reject("No 'MyRecent' sort token found in sorts.");
                else
                    local v12, _ = v3(string.format("%sv1/games/list?SortToken=%s&MaxRows=%s", l_Url_0.GAME_URL, v9, (tostring(v4))), "GET");
                    return v12;
                end;
            end;
        end;
    end);
end;
