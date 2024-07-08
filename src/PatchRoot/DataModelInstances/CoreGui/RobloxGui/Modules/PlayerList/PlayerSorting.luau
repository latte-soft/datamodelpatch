local function v2(v0, v1)
    return v0 < v1;
end;
local function v4(v3)
    return v3;
end;
local function v9(v5, v6)
    local l_stat_0 = v5.stat;
    local l_stat_1 = v6.stat;
    if l_stat_0 == l_stat_1 then
        return v5.name < v6.name;
    elseif l_stat_0 == nil then
        return false;
    elseif l_stat_1 == nil then
        return true;
    else
        if type(l_stat_0) ~= type(l_stat_1) then
            l_stat_0 = tostring(l_stat_0);
            l_stat_1 = tostring(l_stat_1);
        end;
        if l_stat_0 == l_stat_1 then
            return v5.name < v6.name;
        else
            return l_stat_1 < l_stat_0;
        end;
    end;
end;
local function v24(v10, v11, v12, v13)
    v12 = v12 or v2;
    v13 = v13 or v4;
    local v14 = 1;
    local v15 = 1;
    local v16 = #v10;
    local v17 = #v11;
    if v16 == 0 then
        return v11;
    elseif v17 == 0 then
        return v10;
    else
        local v18 = table.create(v16 + v17, nil);
        local v19 = v10[v14];
        local v20 = v11[v15];
        local v21 = v13(v19);
        local v22 = v13(v20);
        local v23 = 0;
        while v21 ~= nil and v22 ~= nil do
            if not v12(v21, v22) then
                v23 = v23 + 1;
                v18[v23] = v20;
                v15 = v15 + 1;
                v20 = v11[v15];
                v22 = not not v20 and v13(v20) or nil;
            else
                v23 = v23 + 1;
                v18[v23] = v19;
                v14 = v14 + 1;
                v19 = v10[v14];
                v21 = not not v19 and v13(v19) or nil;
            end;
        end;
        if v21 ~= nil then
            table.move(v10, v14, v16, v23 + 1, v18);
            return v18;
        else
            if v22 ~= nil then
                table.move(v11, v15, v17, v23 + 1, v18);
            end;
            return v18;
        end;
    end;
end;
return {
    keyCmp = v9, 
    joinSorted = v24, 
    getDerivedStateFromProps = function(v25, v26)
        v26 = v26 or {};
        if v25.playerKeys.keys == v26.playerKeys then
            return v26;
        else
            local v27 = v26.sortedPlayers or {};
            local l_keys_0 = v25.playerKeys.keys;
            local v29 = table.create(#v27, nil);
            local v30 = table.create(5, nil);
            local v31 = 0;
            local v32 = 0;
            local v33 = v26.playerKeys or {};
            for _, v35 in pairs(v27) do
                local v36 = l_keys_0[v35];
                if v36 then
                    if v36 ~= v33[v35] then
                        v32 = v32 + 1;
                        v30[v32] = v35;
                    else
                        v31 = v31 + 1;
                        v29[v31] = v35;
                    end;
                end;
            end;
            for v37 in pairs(l_keys_0) do
                if not v33[v37] then
                    v32 = v32 + 1;
                    v30[v32] = v37;
                end;
            end;
            local function v39(v38)
                return l_keys_0[v38];
            end;
            table.sort(v30, function(v40, v41)
                local v42 = l_keys_0[v40];
                local v43 = l_keys_0[v41];
                local l_stat_2 = v42.stat;
                local l_stat_3 = v43.stat;
                if l_stat_2 == l_stat_3 then
                    return v42.name < v43.name;
                elseif l_stat_2 == nil then
                    return false;
                elseif l_stat_3 == nil then
                    return true;
                else
                    if type(l_stat_2) ~= type(l_stat_3) then
                        l_stat_2 = tostring(l_stat_2);
                        l_stat_3 = tostring(l_stat_3);
                    end;
                    if l_stat_2 == l_stat_3 then
                        return v42.name < v43.name;
                    else
                        return l_stat_3 < l_stat_2;
                    end;
                end;
            end);
            return {
                sortedPlayers = v24(v29, v30, v9, v39), 
                playerKeys = l_keys_0
            };
        end;
    end
};
