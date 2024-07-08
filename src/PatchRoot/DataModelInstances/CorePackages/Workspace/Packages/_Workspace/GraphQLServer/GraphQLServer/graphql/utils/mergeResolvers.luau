local v0 = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local v3 = require(script.Parent.mergeDeep);
local function v4(v5, v6)
    if not v5 or l_Array_0.isArray(v5) and #v5 == 0 then
        return {};
    elseif l_Array_0.isArray(v5) then
        if #v5 == 1 then
            return v5[1] or {};
        else
            local v7 = {};
            for _, v9 in v5, nil, nil do
                if l_Array_0.isArray(v9) then
                    v9 = v4(v9);
                end;
                if not (not (type(v9) == "table") or not v9) then
                    table.insert(v7, v9);
                end;
            end;
            local v10 = v3(v7, true);
            if not (not v6 or not v6.exclusions) then
                for _, v12 in v6.exclusions, nil, nil do
                    local v13, v14 = table.unpack(v12:split("."), 1, 2);
                    if not v14 or v14 == "*" then
                        v10[tostring(v13)] = nil;
                    elseif l_Boolean_0.toJSBoolean(v10[tostring(v13)]) then
                        v10[tostring(v13)][tostring(v14)] = nil;
                    end;
                end;
            end;
            return v10;
        end;
    else
        return v5;
    end;
end;
return v4;
