local v0 = {};
local v1 = {};
local function _(v2)
    if type(v2) == "string" then
        return string.format("%s", v2);
    else
        return string.format("[%s]", (tostring(v2)));
    end;
end;
local function v6(v4)
    local v5 = type(v4);
    if v5 == "string" then
        return string.format("%q", v4);
    elseif not (v5 ~= "function") or v5 == "table" then
        return string.format("<%s>", (tostring(v4)));
    else
        return string.format("%s", (tostring(v4)));
    end;
end;
local function v11(v7, v8, v9, v10)
    print(string.format("%s%s = %s,%s", v9, if type(v7) == "string" then string.format("%s", v7) else string.format("[%s]", (tostring(v7))), v6(v8), not v10 and "" or string.format(" -- %s", v10)));
end;
v0.ShallowEqual = function(v12, v13, v14)
    if v12 and v13 then
        if v12 == v13 then
            return true;
        else
            if not v14 then
                v14 = v1;
            end;
            for v15, v16 in v12, nil, nil do
                if not (not (v13[v15] ~= v16) or v14[v15]) then
                    return false;
                end;
            end;
            for v17, v18 in v13, nil, nil do
                if not (not (v12[v17] ~= v18) or v14[v17]) then
                    return false;
                end;
            end;
            return true;
        end;
    else
        return false;
    end;
end;
local function v21(v19, v20)
    if v20 ~= 0 then
        return v19;
    else
        return v19:gsub("{1}", "first"):gsub("{2}", "second");
    end;
end;
v0.DeepEqual = function(v22, v23, v24)
    v24 = v24 or 0;
    if v22 == v23 then
        return true;
    elseif typeof(v22) ~= typeof(v23) then
        return false, v21(("{1} is of type %s, but {2} is of type %s"):format(typeof(v22), (typeof(v23))), v24);
    elseif typeof(v22) == "table" then
        local v25 = {};
        for v26, v27 in v22, nil, nil do
            v25[v26] = true;
            local v28, v29 = v0.DeepEqual(v27, v23[v26], v24 + 1);
            if not v28 then
                return false, v21(v29:gsub("{1}", ("{1}[%s]"):format((tostring(v26)))):gsub("{2}", ("{2}[%s]"):format((tostring(v26)))), v24);
            end;
        end;
        for v30, v31 in v23, nil, nil do
            if not v25[v30] then
                local v32, v33 = v0.DeepEqual(v22[v30], v31, v24 + 1);
                if not v32 then
                    return false, v21(v33:gsub("{1}", ("{1}[%s]"):format((tostring(v30)))):gsub("{2}", ("{2}[%s]"):format((tostring(v30)))), v24);
                end;
            end;
        end;
        return true;
    else
        return false, v21("{1} ~= {2}", v24);
    end;
end;
v0.EqualKey = function(v34, v35, v36)
    if not ((not (not ((not v34 or not v35) or not v36) and v36 ~= "") or not v34[v36]) or not v35[v36]) and v34[v36] == v35[v36] then
        return true;
    else
        return false;
    end;
end;
v0.TableDifference = function(v37, v38)
    local v39 = {};
    for v40, v41 in v37, nil, nil do
        if v38[v40] ~= v37[v40] then
            v39[v40] = v41;
        end;
    end;
    return v39;
end;
local function _(v42)
    local v43 = {};
    for v44 = 1, #v42 do
        v43[v42[v44]] = true;
    end;
    return v43;
end;
local _ = function(v46)
    local v47 = {};
    for v48, _ in v46, nil, nil do
        table.insert(v47, v48);
    end;
    return v47;
end;
v0.ListDifference = function(v51, v52)
    local l_TableDifference_0 = v0.TableDifference;
    local v54 = {};
    for v55 = 1, #v51 do
        v54[v51[v55]] = true;
    end;
    local l_v54_0 = v54;
    local v57 = {};
    for v58 = 1, #v52 do
        v57[v52[v58]] = true;
    end;
    l_TableDifference_0 = l_TableDifference_0(l_v54_0, v57);
    l_v54_0 = {};
    for v59, _ in l_TableDifference_0, nil, nil do
        table.insert(l_v54_0, v59);
    end;
    return l_v54_0;
end;
v0.CheckListConsistency = function(v61)
    local v62 = false;
    local v63 = false;
    local v64 = true;
    local v65 = 1;
    for v66, _ in v61, nil, nil do
        if type(v66) == "string" then
            v63 = true;
        elseif type(v66) == "number" then
            if v65 ~= v66 then
                v64 = false;
            end;
            v62 = true;
        else
            return false;
        end;
        if not v63 or not v62 then
            v65 = v65 + 1;
        else
            return false;
        end;
    end;
    if not v62 then
        return true;
    else
        return v64;
    end;
end;
v0.RecursiveToString = function(v68, v69)
    v69 = v69 or "";
    if type(v68) == "table" then
        local v70 = "";
        if not v0.CheckListConsistency(v68) then
            v70 = v70 .. "-- WARNING: this table fails the list consistency test\n";
        end;
        v70 = v70 .. "{\n";
        for v71, v72 in v68, nil, nil do
            if type(v71) == "string" then
                v70 = v70 .. "  " .. v69 .. tostring(v71) .. " = " .. v0.RecursiveToString(v72, "  " .. v69) .. ";\n";
            end;
            if type(v71) == "number" then
                v70 = v70 .. "  " .. v69 .. v0.RecursiveToString(v72, "  " .. v69) .. ",\n";
            end;
        end;
        return v70 .. v69 .. "}";
    else
        return (tostring(v68));
    end;
end;
v0.Print = function(v73, v74)
    v74 = v74 or "  ";
    if type(v73) ~= "table" then
        error("TableUtilities.Print must be passed a table", 2);
    end;
    local v75 = {};
    local function v76(v77, v78, v79)
        v75[v77] = true;
        local v80 = string.rep(v74, v79);
        local v81 = string.rep(v74, v79 + 1);
        if not v78 then
            print(string.format("%s%s {", v80, v6(v77)));
        else
            print(string.format("%s%s = %s {", v80, if type(v78) == "string" then string.format("%s", v78) else string.format("[%s]", (tostring(v78))), v6(v77)));
        end;
        for v82, v83 in v77, nil, nil do
            if type(v83) == "table" then
                if not v75[v83] then
                    v76(v83, v82, v79 + 1);
                else
                    v11(v82, v83, v81, "Possible cycle");
                end;
            else
                v11(v82, v83, v81);
            end;
        end;
        print(string.format("%s}%s", v80, v79 > 0 and "," or ""));
    end;
    v76(v73, nil, 0);
end;
v0.FieldCount = function(v84)
    local v85 = 0;
    for _ in v84, nil, nil do
        v85 = v85 + 1;
    end;
    return v85;
end;
return v0;
