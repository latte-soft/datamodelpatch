return {
    JoinDictionaries = function(...)
        local v0 = {};
        for v1 = 1, select("#", ...) do
            for v2, v3 in pairs((select(v1, ...))) do
                v0[v2] = v3;
            end;
        end;
        return v0;
    end, 
    JoinLists = function(...)
        local v4 = {};
        for v5 = 1, select("#", ...) do
            local v6 = select(v5, ...);
            local v7 = #v4;
            for v8 = 1, #v6 do
                v4[v7 + v8] = v6[v8];
            end;
        end;
        return v4;
    end, 
    Set = function(v9, v10, v11)
        local v12 = {};
        for v13, v14 in pairs(v9) do
            v12[v13] = v14;
        end;
        v12[v10] = v11;
        return v12;
    end, 
    Append = function(v15, ...)
        local v16 = {};
        local v17 = #v15;
        for v18 = 1, v17 do
            v16[v18] = v15[v18];
        end;
        for v19 = 1, select("#", ...) do
            v16[v17 + v19] = select(v19, ...);
        end;
        return v16;
    end, 
    RemoveFromDictionary = function(v20, ...)
        local v21 = {};
        for v22, v23 in pairs(v20) do
            local v24 = false;
            for v25 = 1, select("#", ...) do
                if v22 == select(v25, ...) then
                    v24 = true;
                    break;
                end;
            end;
            if not v24 then
                v21[v22] = v23;
            end;
        end;
        return v21;
    end, 
    RemoveFromList = function(v26, v27)
        local v28 = {};
        for v29 = 1, #v26 do
            if v29 ~= v27 then
                table.insert(v28, v26[v29]);
            end;
        end;
        return v28;
    end, 
    RemoveRangeFromList = function(v30, v31, v32)
        local v33 = {};
        for v34 = 1, #v30 do
            if not (v34 >= v31) or v31 + v32 <= v34 then
                table.insert(v33, v30[v34]);
            end;
        end;
        return v33;
    end, 
    RemoveValueFromList = function(v35, v36)
        local v37 = {};
        for v38 = 1, #v35 do
            if v35[v38] ~= v36 then
                table.insert(v37, v35[v38]);
            end;
        end;
        return v37;
    end
};
