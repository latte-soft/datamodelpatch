local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesInSort);
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.PromiseUtilities);
local v4 = require(l_Modules_0.LuaApp.Constants);
return function(v5, v6, v7, v8, v9)
    if not v6 then
        v6 = v4.GameSortGroups.Games;
    end;
    assert(v6, "not nil");
    return function(v10)
        local v11 = {};
        local v12 = v10:getState();
        if v7 then
            if not v12.GameSorts[v7] then
                v2.reject();
            else
                table.insert(v11, (v10:dispatch(v1(v5, v12.GameSorts[v7], nil, v8))));
            end;
        else
            local v13 = #v12.GameSortGroups[v6].sorts;
            if v9 ~= nil then
                v13 = math.min(v9, v13);
            end;
            for v14 = 1, v13 do
                table.insert(v11, (v10:dispatch(v1(v5, v12.GameSorts[v12.GameSortGroups[v6].sorts[v14]], nil, v8))));
            end;
        end;
        return v3.Batch(v11);
    end;
end;
