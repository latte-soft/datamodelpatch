local v0 = require(script.Parent.findOr);
local v1 = require(script.Parent.slice);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
local l_MAX_SAFE_INTEGER_0 = require(l_Parent_0.Number).MAX_SAFE_INTEGER;
return function(v5, v6, v7)
    if v6 == nil then
        return {
            v5
        };
    elseif v7 == 0 then
        return {};
    else
        local v8 = if not (v7 ~= nil) or v7 < 0 then l_MAX_SAFE_INTEGER_0 else v7;
        local v9 = nil;
        if typeof(v6) == "string" then
            if v6 == "" then
                local v10 = {};
                for v11 in v5:gmatch(".") do
                    table.insert(v10, v11);
                end;
                return v10;
            else
                v9 = {
                    v6
                };
            end;
        else
            v9 = v6;
        end;
        local v12 = 1;
        local v13 = {};
        local v14 = nil;
        local v15, v16 = utf8.len(v5);
        assert(v15 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v5, (tostring(v16))));
        while true do
            local v17 = v0(v5, v9, v12);
            if v17 ~= nil then
                table.insert(v13, v1(v5, v12, v17.index));
                v12 = v17.index + utf8.len(v17.match);
            else
                table.insert(v13, v1(v5, v12, nil));
            end;
            if v17 ~= nil then
                v14 = v17;
            end;
            if not ((v17 ~= nil and v15 >= v12) and v8 > #v13) then
                break;
            end;
        end;
        if v14 ~= nil then
            local v18, v19 = utf8.len(v14.match);
            assert(v18 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v14.match, (tostring(v19))));
            if v14.index + v18 == v15 + 1 then
                table.insert(v13, "");
            end;
        end;
        return v13;
    end;
end;
