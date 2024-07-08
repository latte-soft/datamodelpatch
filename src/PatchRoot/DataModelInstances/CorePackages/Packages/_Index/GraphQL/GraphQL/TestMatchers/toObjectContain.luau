local l_inspect_0 = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect;
local v1 = require(script.Parent.Parent.luaUtils.deepContains);
return function(v2, v3)
    local v4 = v1(v2, v3);
    local v5 = "";
    if not v4 then
        v5 = "received tbl: " .. l_inspect_0(v3) .. " expected item to be in table: " .. l_inspect_0(v2);
    end;
    return {
        pass = v4, 
        message = v5
    };
end;
