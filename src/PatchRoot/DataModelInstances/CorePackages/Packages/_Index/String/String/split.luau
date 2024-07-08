local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.findOr);
local v2 = require(l_Parent_0.slice);
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.ES7Types);
local l_MAX_SAFE_INTEGER_0 = require(l_Parent_1.Number).MAX_SAFE_INTEGER;
return function(v6, v7, v8)
    if v7 == nil then
        return {
            v6
        };
    elseif v8 == 0 then
        return {};
    else
        local v9 = if not (v8 ~= nil) or v8 < 0 then l_MAX_SAFE_INTEGER_0 else v8;
        local v10 = nil;
        if typeof(v7) == "string" then
            if v7 == "" then
                local v11 = {};
                for v12 in v6:gmatch(".") do
                    table.insert(v11, v12);
                end;
                return v11;
            else
                v10 = {
                    v7
                };
            end;
        else
            v10 = v7;
        end;
        local v13 = 1;
        local v14 = {};
        local v15 = nil;
        local v16, v17 = utf8.len(v6);
        assert(v16 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v6, (tostring(v17))));
        while true do
            local v18 = v1(v6, v10, v13);
            if v18 ~= nil then
                table.insert(v14, v2(v6, v13, v18.index));
                v13 = v18.index + utf8.len(v18.match);
            else
                table.insert(v14, v2(v6, v13, nil));
            end;
            if v18 ~= nil then
                v15 = v18;
            end;
            if not ((v18 ~= nil and v16 >= v13) and v9 > #v14) then
                break;
            end;
        end;
        if v15 ~= nil then
            local v19, v20 = utf8.len(v15.match);
            assert(v19 ~= nil, ("string `%s` has an invalid byte at position %s"):format(v15.match, (tostring(v20))));
            if v15.index + v19 == v16 + 1 then
                table.insert(v14, "");
            end;
        end;
        return v14;
    end;
end;
