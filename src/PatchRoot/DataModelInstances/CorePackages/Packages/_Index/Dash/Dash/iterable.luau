local _ = require(script.Parent.Types);
return function(v1)
    local v2 = 1;
    local v3 = true;
    local v4 = nil;
    local _ = nil;
    return function()
        if v3 then
            local v6 = v1[v2];
            if v6 == nil then
                v3 = false;
            else
                local l_v2_0 = v2;
                v2 = v2 + 1;
                return l_v2_0, v6;
            end;
        end;
        while true do
            v4 = next(v1, v4);
            if not ((typeof(v4) == "number" and v4 > 0) and v4 < v2) or v4 % 1 ~= 0 then
                break;
            end;
        end;
        if v4 == nil then
            return nil;
        else
            return v4, v1[v4];
        end;
    end;
end;
