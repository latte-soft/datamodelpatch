local v0 = require(script.Parent.objectIs);
return function(v1, v2)
    if not v0(v1, v2) then
        if not ((typeof(v1) == "table" and v1 ~= nil) and typeof(v2) == "table") or v2 == nil then
            return false;
        else
            for v3, v4 in v1, nil, nil do
                if not v0(v2[v3], v4) then
                    return false;
                end;
            end;
            for v5, v6 in v2, nil, nil do
                if not v0(v1[v5], v6) then
                    return false;
                end;
            end;
            return true;
        end;
    else
        return true;
    end;
end;
