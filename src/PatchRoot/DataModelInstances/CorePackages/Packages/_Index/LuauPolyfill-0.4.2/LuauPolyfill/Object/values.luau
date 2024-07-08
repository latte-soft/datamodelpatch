local _ = require(script.Parent.Parent.types);
return function(v1)
    if v1 == nil then
        error("cannot extract values from a nil value");
    end;
    local v2 = typeof(v1);
    local v3 = nil;
    if v2 == "table" then
        v3 = {};
        for _, v5 in pairs(v1) do
            table.insert(v3, v5);
        end;
        return v3;
    else
        if v2 == "string" then
            local v6 = v1:len();
            v3 = table.create(v6);
            for v7 = 1, v6 do
                v3[v7] = v1:sub(v7, v7);
            end;
        end;
        return v3;
    end;
end;
