local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Map_0 = v0.Map;
local v3 = {};
local v4 = {
    __index = v3
};
v3.new = function()
    return (setmetatable({
        listenersMap = l_Map_0.new()
    }, v4));
end;
v3.addListener = function(v5, v6, v7)
    local v8 = v5.listenersMap:get(v6);
    if v8 == nil then
        v5.listenersMap:set(v6, {
            v7
        });
        return ;
    else
        if l_Array_0.indexOf(v8, v7) < 1 then
            table.insert(v8, v7);
        end;
        return ;
    end;
end;
v3.emit = function(v9, v10, ...)
    local v11 = v9.listenersMap:get(v10);
    if v11 ~= nil then
        if #v11 == 1 then
            v11[1](...);
            return ;
        else
            local v12 = false;
            local v13 = nil;
            for _, v15 in (table.clone(v11)), nil, nil do
                local l_status_0, l_result_0 = pcall(function(...)
                    v15(...);
                    return nil;
                end, ...);
                if not l_status_0 then
                    v12 = true;
                    v13 = l_result_0;
                end;
            end;
            if v12 then
                error((tostring(v13)));
            end;
        end;
    end;
end;
v3.removeAllListeners = function(v18)
    v18.listenersMap:clear();
end;
v3.removeListener = function(v19, v20, v21)
    local v22 = v19.listenersMap:get(v20);
    if v22 ~= nil then
        local v23 = l_Array_0.indexOf(v22, v21);
        if v23 >= 1 then
            l_Array_0.splice(v22, v23, 1);
        end;
    end;
end;
return v3;
