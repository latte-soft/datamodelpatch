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
        local v12 = table.clone(v9);
        v12[v10] = v11;
        return v12;
    end, 
    Append = function(v13, ...)
        local v14 = {};
        local v15 = #v13;
        for v16 = 1, v15 do
            v14[v16] = v13[v16];
        end;
        for v17 = 1, select("#", ...) do
            v14[v15 + v17] = select(v17, ...);
        end;
        return v14;
    end, 
    RemoveFromDictionary = function(v18, ...)
        local v19 = {};
        for v20, v21 in pairs(v18) do
            local v22 = false;
            for v23 = 1, select("#", ...) do
                if v20 == select(v23, ...) then
                    v22 = true;
                    break;
                end;
            end;
            if not v22 then
                v19[v20] = v21;
            end;
        end;
        return v19;
    end, 
    RemoveFromList = function(v24, v25)
        local v26 = {};
        for v27 = 1, #v24 do
            if v27 ~= v25 then
                table.insert(v26, v24[v27]);
            end;
        end;
        return v26;
    end, 
    RemoveRangeFromList = function(v28, v29, v30)
        local v31 = {};
        for v32 = 1, #v28 do
            if not (v32 >= v29) or v29 + v30 <= v32 then
                table.insert(v31, v28[v32]);
            end;
        end;
        return v31;
    end, 
    RemoveValueFromList = function(v33, v34)
        local v35 = {};
        for v36 = 1, #v33 do
            if v33[v36] ~= v34 then
                table.insert(v35, v33[v36]);
            end;
        end;
        return v35;
    end
};
