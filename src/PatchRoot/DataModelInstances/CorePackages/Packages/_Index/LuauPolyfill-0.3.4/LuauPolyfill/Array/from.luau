local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.instanceof);
local v4 = nil;
local v5 = nil;
return function(v6, v7, v8)
    if not v4 then
        v4 = require(l_Parent_1).Set;
    end;
    if not v5 then
        v5 = require(l_Parent_1).Map;
    end;
    if v6 == nil then
        error("cannot create array from a nil value");
    end;
    local v9 = typeof(v6);
    local v10 = {};
    if not (v9 == "table") or not v1(v6) then
        if not v3(v6, v4) then
            if not v3(v6, v5) then
                if v9 == "string" then
                    if not v7 then
                        for v11 = 1, v6:len() do
                            v10[v11] = v6:sub(v11, v11);
                        end;
                    else
                        for v12 = 1, v6:len() do
                            if v8 ~= nil then
                                v10[v12] = v7(v8, v6:sub(v12, v12), v12);
                            else
                                v10[v12] = v7(v6:sub(v12, v12), v12);
                            end;
                        end;
                        return v10;
                    end;
                end;
                return v10;
            elseif not v7 then
                for v13, v14 in v6:ipairs() do
                    v10[v13] = v14;
                end;
                return v10;
            else
                for v15, v16 in v6:ipairs() do
                    if v8 ~= nil then
                        v10[v15] = v7(v8, v16, v15);
                    else
                        v10[v15] = v7(v16, v15);
                    end;
                end;
                return v10;
            end;
        elseif not v7 then
            for v17, v18 in v6:ipairs() do
                v10[v17] = v18;
            end;
            return v10;
        else
            for v19, v20 in v6:ipairs() do
                if v8 ~= nil then
                    v10[v19] = v7(v8, v20, v19);
                else
                    v10[v19] = v7(v20, v19);
                end;
            end;
            return v10;
        end;
    elseif not v7 then
        for v21 = 1, #v6 do
            v10[v21] = v6[v21];
        end;
        return v10;
    else
        for v22 = 1, #v6 do
            if v8 ~= nil then
                v10[v22] = v7(v8, v6[v22], v22);
            else
                v10[v22] = v7(v6[v22], v22);
            end;
        end;
        return v10;
    end;
end;
