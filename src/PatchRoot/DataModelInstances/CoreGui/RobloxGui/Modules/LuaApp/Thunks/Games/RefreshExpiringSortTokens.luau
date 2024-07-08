local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v3 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
local function _(v4, v5, v6)
    local v7 = false;
    if v4 ~= v2.Fetching then
        v7 = v5 - 600 <= v6;
    end;
    return v7;
end;
return function(v9, v10, v11)
    return function(v12)
        local v13 = {};
        local v14 = tick();
        local v15 = v12:getState();
        for _, v17 in ipairs(v10) do
            local v18 = v15.RequestsStatus.GameSortTokenFetchingStatus[v17];
            local v19 = not not v15.NextTokenRefreshTime and v15.NextTokenRefreshTime[v17] or 0;
            local v20 = false;
            if v18 ~= v2.Fetching then
                v20 = v19 - 600 <= v14;
            end;
            if v20 then
                table.insert(v13, v12:dispatch(v3(v9, v17, nil, v11)));
            end;
        end;
        return v1.all(v13);
    end;
end;
