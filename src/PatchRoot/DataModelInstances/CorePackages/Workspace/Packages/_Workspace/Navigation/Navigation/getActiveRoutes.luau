local l_script_FirstAncestor_0 = script:FindFirstAncestor("Navigation");
local _ = require(l_script_FirstAncestor_0.NavigationTypes);
local l_Array_0 = require(l_script_FirstAncestor_0.Parent.LuauPolyfill).Array;
local function _(v3)
    local v4 = false;
    if v3.index ~= nil then
        v4 = false;
        if v3.routes ~= nil then
            v4 = v3.isTransitioning ~= nil;
        end;
    end;
    return v4;
end;
local function v6(v7)
    local v8 = {};
    if v7 == nil then
        return v8;
    else
        if not (not v7.key and not v7.routeName) then
            table.insert(v8, v7);
        end;
        if v7.routes and v7.index ~= nil then
            local l_routes_0 = v7.routes;
            local l_index_0 = v7.index;
            local v11 = false;
            if v7.index ~= nil then
                v11 = false;
                if v7.routes ~= nil then
                    v11 = v7.isTransitioning ~= nil;
                end;
            end;
            if v11 then
                for v12 = 1, l_index_0 - 1 do
                    v8 = l_Array_0.concat(v8, v6(l_routes_0[v12]));
                end;
            end;
            v8 = l_Array_0.concat(v8, v6(l_routes_0[l_index_0]));
        end;
        return v8;
    end;
end;
return v6;
