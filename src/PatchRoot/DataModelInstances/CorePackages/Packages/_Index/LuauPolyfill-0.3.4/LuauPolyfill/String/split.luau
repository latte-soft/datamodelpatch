local v0 = require(script.Parent.findOr);
local v1 = require(script.Parent.slice);
return function(v2, v3)
    if v3 == nil then
        return {
            v2
        };
    else
        local v4 = nil;
        if typeof(v3) == "string" then
            if v3 == "" then
                return {
                    v2
                };
            else
                v4 = {
                    v3
                };
            end;
        else
            v4 = v3;
        end;
        local v5 = 1;
        local v6 = {};
        local v7 = nil;
        local v8, v9 = utf8.len(v2);
        assert(v8 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v2, (tostring(v9))));
        while true do
            local v10 = v0(v2, v4, v5);
            if v10 ~= nil then
                table.insert(v6, v1(v2, v5, v10.index));
                v5 = v10.index + utf8.len(v10.match);
            else
                table.insert(v6, v1(v2, v5, nil));
            end;
            if v10 ~= nil then
                v7 = v10;
            end;
            if not (v10 ~= nil and v8 >= v5) then
                break;
            end;
        end;
        if v7 ~= nil then
            local v11, v12 = utf8.len(v7.match);
            assert(v11 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v7.match, (tostring(v12))));
            if v7.index + v11 == v8 + 1 then
                table.insert(v6, "");
            end;
        end;
        return v6;
    end;
end;
