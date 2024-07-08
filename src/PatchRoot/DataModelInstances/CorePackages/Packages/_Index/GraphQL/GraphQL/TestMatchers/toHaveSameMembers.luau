local l_inspect_0 = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect;
local v1 = require(script.Parent.Parent.luaUtils.arrayContains);
return function(v2, v3, v4)
    if #v2 == #v3 then
        for _, v6 in ipairs(v3) do
            if not v1(v2, v6, v4) then
                return {
                    pass = false, 
                    message = ("Expected item %s to be in Array %s"):format(l_inspect_0(v6), l_inspect_0(v2))
                };
            end;
        end;
        return {
            pass = true, 
            message = ""
        };
    else
        return {
            pass = false, 
            message = ("Received array length %s / expected length %s"):format(tostring(#v2), (tostring(#v3)))
        };
    end;
end;
