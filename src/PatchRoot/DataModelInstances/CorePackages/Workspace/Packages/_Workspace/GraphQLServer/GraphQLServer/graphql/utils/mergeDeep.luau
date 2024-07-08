local v0 = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill);
local l_Object_0 = v0.Object;
local l_Array_0 = v0.Array;
local function _(v3)
    local v4 = false;
    if typeof(v3) == "table" then
        v4 = not (l_Array_0.isArray(v3) and #v3 > 0);
    end;
    return v4;
end;
local function v6(v7, v8)
    local v9 = v7[1] or {};
    local v10 = {};
    for _, v12 in v7, nil, nil do
        local v13 = false;
        if typeof(v9) == "table" then
            v13 = not (l_Array_0.isArray(v9) and #v9 > 0);
        end;
        if v13 then
            v13 = false;
            if typeof(v12) == "table" then
                v13 = not (l_Array_0.isArray(v12) and #v12 > 0);
            end;
            if v13 then
                for v14, v15 in v12, nil, nil do
                    if type(v15) == "table" then
                        if v10[v14] == nil then
                            l_Object_0.assign(v10, {
                                [v14] = v15
                            });
                        else
                            v10[v14] = v6({
                                v10[v14], 
                                v15
                            }, v8);
                        end;
                    else
                        l_Object_0.assign(v10, {
                            [v14] = v15
                        });
                    end;
                end;
            end;
        end;
    end;
    return v10;
end;
return v6;
