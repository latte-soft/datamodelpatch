local v0 = {};
local v1 = nil;
local v2 = nil;
local v3 = nil;
v0.push = function(v4, v5)
    local v6 = #v4 + 1;
    v4[v6] = v5;
    v2(v4, v5, v6);
end;
v0.peek = function(v7)
    return v7[1];
end;
v0.pop = function(v8)
    local v9 = v8[1];
    if v9 ~= nil then
        local v10 = v8[#v8];
        v8[#v8] = nil;
        if v10 ~= v9 then
            v8[1] = v10;
            v3(v8, v10, 1);
        end;
        return v9;
    else
        return nil;
    end;
end;
v2 = function(v11, v12, v13)
    while true do
        local v14 = math.floor(v13 / 2);
        local v15 = v11[v14];
        if v15 ~= nil and v1(v15, v12) > 0 then
            v11[v14] = v12;
            v11[v13] = v15;
            v13 = v14;
        else
            break;
        end;
    end;
end;
v3 = function(v16, v17, v18)
    local v19 = #v16;
    while true do
        if v18 < v19 then
            local v20 = v18 * 2;
            local v21 = v16[v20];
            local v22 = v20 + 1;
            local v23 = v16[v22];
            if v21 ~= nil and v1(v21, v17) < 0 then
                if v23 ~= nil and v1(v23, v21) < 0 then
                    v16[v18] = v23;
                    v16[v22] = v17;
                    v18 = v22;
                else
                    v16[v18] = v21;
                    v16[v20] = v17;
                    v18 = v20;
                end;
            elseif v23 ~= nil and v1(v23, v17) < 0 then
                v16[v18] = v23;
                v16[v22] = v17;
                v18 = v22;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v1 = function(v24, v25)
    local v26 = v24.sortIndex - v25.sortIndex;
    if v26 == 0 then
        return v24.id - v25.id;
    else
        return v26;
    end;
end;
return v0;
