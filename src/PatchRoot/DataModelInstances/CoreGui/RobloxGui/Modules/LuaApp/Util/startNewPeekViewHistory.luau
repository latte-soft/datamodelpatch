local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v1 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v2 = require(l_script_FirstAncestor_0.LuaApp.AppPageProperties);
local function _()
    return {
        {
            name = v1.Home
        }
    };
end;
return function(v4, v5)
    local l_history_0 = v4:getState().Navigation.history;
    local v7 = l_history_0[#l_history_0] or {
        {
            name = v1.Home
        }
    };
    local v8 = {};
    for v9 = 1, #v7 do
        local l_name_0 = v7[v9].name;
        if not (v2[l_name_0] and v2[l_name_0].isPeekView) then
            v8[#v8 + 1] = v7[v9];
        end;
    end;
    v8[#v8 + 1] = v5;
    if #v8 == 0 then
        v8 = {
            {
                name = v1.Home
            }
        };
    end;
    local v11 = {};
    for v12 = 1, #v8 do
        local v13 = {};
        for v14 = 1, v12 do
            v13[#v13 + 1] = v8[v14];
        end;
        v11[#v11 + 1] = v13;
    end;
    return {
        newRoute = v8, 
        newHistory = v11
    };
end;
