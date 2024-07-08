local l_inspect_0 = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect;
return function(...)
    local v1 = {};
    for v2 = 1, select("#", ...) do
        v1[v2] = l_inspect_0((select(v2, ...)));
    end;
    print(table.unpack(v1));
end;
