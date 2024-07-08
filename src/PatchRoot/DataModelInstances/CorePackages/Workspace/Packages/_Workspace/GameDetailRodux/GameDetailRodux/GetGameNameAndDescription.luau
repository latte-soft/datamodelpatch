local l_Parent_0 = script:FindFirstAncestor("GameDetailRodux").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = {};
return function(v4, v5)
    if not v3[v5] then
        v3[v5] = v4(string.format("%sv1/games?universeIds=%s", l_Url_0.GAME_URL, (tostring(v5))), "GET"):andThen(function(v6)
            if not (v6.responseBody and v6.responseBody.data) then
                v1.reject("Unexpected response when fetching game name");
            end;
            local v7 = v6.responseBody.data[1];
            if not (v7 and v7.name) then
                v1.reject("Unexpected response when fetching game name, no game info");
            end;
            return v1.resolve({
                Name = v7.name, 
                Description = v7.description or "", 
                Created = v7.created
            });
        end, function(v8)
            return v1.reject(v8);
        end);
        return v3[v5];
    else
        return v3[v5];
    end;
end;
