local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local v2 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData);
local v3 = require(l_Modules_0.LuaApp.Promise);
return function(v4, v5, v6, v7, v8)
    assert(type(v5) == "table");
    assert(#v5 >= 1);
    return function(v9)
        local v10 = {};
        for _, v12 in ipairs(v5) do
            table.insert(v10, v9:dispatch(v1(v4, v12, nil, v8)));
        end;
        return v3.all(v10):andThen(function()
            local v13 = {};
            for _, v15 in ipairs(v5) do
                table.insert(v13, v9:dispatch(v2(v4, v15, v6, v7, nil)));
            end;
            return v3.all(v13);
        end);
    end;
end;
