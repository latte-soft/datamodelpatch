local v0 = require(script.Parent.Parent.luaUtils.deepEqual);
local v1 = require(script.Parent.Parent.luaUtils.deepContains);
return function(v2, v3, v4)
    if #v2 == #v3 then
        for v5 = 1, #v2 do
            local v6 = nil;
            local v7 = nil;
            if not v4 then
                local v8, v9 = v0(v2[v5], v3[v5]);
                v6 = v8;
                v7 = v9;
                if v6 then
                    continue;
                end;
            else
                local v10, v11 = v1(v2[v5], v3[v5]);
                v6 = v10;
                v7 = v11;
                if v6 then
                    continue;
                end;
            end;
            return {
                pass = false, 
                message = v7:gsub("{1}", ("{1}[%s]"):format((tostring(v5)))):gsub("{2}", ("{2}[%s]"):format((tostring(v5))))
            };
        end;
        return {
            pass = true, 
            message = ""
        };
    else
        return {
            pass = false, 
            message = ("Expected array length %s / got length %s"):format(tostring(#v2), (tostring(#v3)))
        };
    end;
end;
