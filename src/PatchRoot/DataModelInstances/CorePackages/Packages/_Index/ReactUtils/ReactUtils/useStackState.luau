local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_LUAU_ANALYZE_ERROR_0 = l_script_FirstAncestor_0.LUAU_ANALYZE_ERROR;
return function(v3)
    local v4 = v1.useRef(v3 or {});
    assert(v4.current ~= nil, l_LUAU_ANALYZE_ERROR_0);
    local v5, v6 = v1.useState(#v4.current);
    return {
        push = v1.useCallback(function(v7)
            table.insert(v4.current, v7);
            v6(#v4.current);
        end, {}), 
        pop = v1.useCallback(function()
            local v8 = table.remove(v4.current);
            v6(#v4.current);
            return v8;
        end, {}), 
        getTop = v1.useCallback(function()
            return v4.current[#v4.current];
        end, {}), 
        clear = v1.useCallback(function()
            table.clear(v4.current);
            v6(0);
        end, {}), 
        size = v5
    };
end;
