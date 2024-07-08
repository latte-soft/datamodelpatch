local l_Parent_0 = script.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.Parent.LuauPolyfill).util.inspect;
local v2 = require(l_Parent_0.luaUtils.arrayContains);
return function(v3, v4, v5)
    local v6 = v2(v3, v4, v5);
    local v7 = "";
    if not v6 then
        v7 = "received tbl: " .. l_inspect_0(v4) .. " expected item to be in table: " .. l_inspect_0(v3);
    end;
    return {
        pass = v6, 
        message = v7
    };
end;
