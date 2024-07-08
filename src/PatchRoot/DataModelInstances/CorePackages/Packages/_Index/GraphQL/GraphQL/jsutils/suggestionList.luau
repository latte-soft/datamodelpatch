local l_Object_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Object;
local l_naturalCompare_0 = require(script.Parent.naturalCompare).naturalCompare;
local v2 = {};
local function v15(v3, v4)
    local v5 = {};
    local v6 = v2.new(v3);
    local v7 = math.floor(v3:len() * 0.4) + 1;
    for v8 = 1, #v4 do
        local v9 = v4[v8];
        local v10 = v6:measure(v9, v7);
        if v10 ~= nil then
            v5[v9] = v10;
        end;
    end;
    local v11 = l_Object_0.keys(v5);
    table.sort(v11, function(v12, v13)
        local v14 = v5[v12] - v5[v13];
        if v14 ~= 0 then
            return v14 < 0;
        else
            return l_naturalCompare_0(v12, v13) < 0;
        end;
    end);
    return v11;
end;
local v16 = nil;
v2.__index = v2;
v2.new = function(v17)
    local v18 = setmetatable({}, v2);
    v18._input = v17;
    v18._inputLowerCase = v17:lower();
    v18._inputArray = v16(v18._inputLowerCase);
    local v19 = v17:len();
    v18._rows = {
        table.create(v19 + 1, 0), 
        table.create(v19 + 1, 0), 
        table.create(v19 + 1, 0)
    };
    return v18;
end;
v2.measure = function(v20, v21, v22)
    if v20._input == v21 then
        return 0;
    else
        local v23 = v21:lower();
        if v20._inputLowerCase == v23 then
            return 1;
        else
            local v24 = v16(v23);
            local l__inputArray_0 = v20._inputArray;
            if #v24 < #l__inputArray_0 then
                local l_v24_0 = v24;
                v24 = l__inputArray_0;
                l__inputArray_0 = l_v24_0;
            end;
            local v27 = #v24;
            local v28 = #l__inputArray_0;
            if v22 < v27 - v28 then
                return nil;
            else
                local l__rows_0 = v20._rows;
                for v30 = 0, v28 do
                    l__rows_0[1][v30 + 1] = v30;
                end;
                for v31 = 1, v27 do
                    local v32 = l__rows_0[(v31 - 1) % 3 + 1];
                    local v33 = l__rows_0[v31 % 3 + 1];
                    v33[1] = v31;
                    local l_v31_0 = v31;
                    for v35 = 1, v28 do
                        local v36 = math.min(v32[v35 + 1] + 1, v33[v35] + 1, v32[v35] + (v24[v31] == l__inputArray_0[v35] and 0 or 1));
                        if ((v31 > 1 and v35 > 1) and v24[v31] == l__inputArray_0[v35 - 1]) and v24[v31 - 1] == l__inputArray_0[v35] then
                            v36 = math.min(v36, l__rows_0[(v31 - 2) % 3 + 1][v35 - 1] + 1);
                        end;
                        if v36 < l_v31_0 then
                            l_v31_0 = v36;
                        end;
                        v33[v35 + 1] = v36;
                    end;
                    if v22 < l_v31_0 then
                        return nil;
                    end;
                end;
                local v37 = l__rows_0[v27 % 3 + 1][v28 + 1];
                if v37 <= v22 then
                    return v37;
                else
                    return nil;
                end;
            end;
        end;
    end;
end;
v16 = function(v38)
    local v39 = v38:len();
    local v40 = {};
    for v41 = 1, v39 do
        v40[v41] = v38:byte(v41);
    end;
    return v40;
end;
return {
    suggestionList = v15
};
