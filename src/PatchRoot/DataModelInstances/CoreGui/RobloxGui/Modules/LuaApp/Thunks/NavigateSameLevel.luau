local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.ResetNavigationHistory);
local function v8(v1, v2)
    local v3 = {};
    if #v1 > 1 then
        for v4 = 1, #v1 - 1 do
            v3[v4] = v1[v4];
        end;
    end;
    local v5 = v1[#v1];
    local v6 = {};
    if v5 and #v5 > 1 then
        for v7 = 1, #v5 - 1 do
            v6[v7] = v5[v7];
        end;
        v6[#v6 + 1] = {
            name = v2
        };
    else
        v6 = {
            {
                name = v2
            }
        };
    end;
    v3[#v3 + 1] = v6;
    return v6, v3;
end;
return function(v9, v10)
    return function(v11)
        local v12, v13 = v8(v9, v10);
        v11:dispatch(v0(v12, v13));
    end;
end;
