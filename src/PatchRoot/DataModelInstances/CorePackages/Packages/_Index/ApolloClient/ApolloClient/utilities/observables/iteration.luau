local l_Array_0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Array;
local v1 = {};
local _ = require(script.Parent.Observable);
v1.iterateObserversSafely = function(v3, v4, v5)
    local v6 = {};
    v3:forEach(function(v7)
        if v7[v4] ~= nil then
            table.insert(v6, v7);
        end;
    end);
    l_Array_0.forEach(v6, function(v8)
        v8[v4](v8, v5);
    end);
end;
return v1;
