local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = require(l_Parent_0.RegExp);
local function v8(v3, v4)
    local v5 = v4:exec(v3);
    local v6 = {};
    while v5 do
        local v7 = v5[1];
        table.insert(v6, v7);
        v5 = v4:exec((v5.input:sub(v5.index + v7:len())));
    end;
    return v6;
end;
local function _(v9)
    return v9;
end;
local v11 = v2("(%[a-fA-F0-9]{2})+", "i");
local function v18(v12)
    local v13 = v11:exec(v12);
    local l_v12_0 = v12;
    if v13 then
        local v15 = {};
        for v16 in v13[1]:gmatch("%%(%x%x)") do
            local v17 = tonumber(v16, 16);
            if v17 >= 128 then
                error("malformed URI sequence");
            end;
            table.insert(v15, v17);
        end;
        l_v12_0 = utf8.char(unpack(v15));
    end;
    return l_v12_0;
end;
local v19 = v2("%[a-fA-F0-9]{2}", "i");
local v20 = v2("(" .. "%[a-fA-F0-9]{2}" .. ")+", "i");
local function v21(v22, v23)
    local l_status_0, l_result_0 = pcall(v18, table.concat(v22, ""));
    if not l_status_0 then
        if #v22 == 1 then
            return v22;
        else
            v23 = v23 or 1;
            return l_Array_0.concat(v21((l_Array_0.slice(v22, 1, v23 + 1))), v21((l_Array_0.slice(v22, v23 + 1))));
        end;
    else
        return l_result_0;
    end;
end;
local function v31(v26)
    local l_status_1, l_result_1 = pcall(v18, v26);
    if not l_status_1 then
        local v29 = v8(v26, v19);
        local v30 = 2;
        while v29[v30] do
            v26 = table.concat(v21(v29, v30), "");
            v29 = v8(v26, v19);
            v30 = v30 + 1;
        end;
        return v26;
    else
        return l_result_1;
    end;
end;
local function _(v32)
    return (v32:gsub("%%", "%%%%"));
end;
local function v46(v34)
    local v35 = utf8.char(65533);
    local v36 = {
        ["%FE%FF"] = v35 .. v35, 
        ["%FF%FE"] = v35 .. v35
    };
    local v37 = {
        "%FE%FF", 
        "%FF%FE"
    };
    local v38 = v20:exec(v34);
    while v38 do
        local v39 = v38[1];
        local v42, v43 = xpcall(v18, function(_)
            local v41 = v31(v39);
            if v41 ~= v39 then
                if v36[v39] == nil then
                    table.insert(v37, v39);
                end;
                v36[v39] = v41;
            end;
        end, v39);
        if v42 then
            if v36[v39] == nil then
                table.insert(v37, v39);
            end;
            v36[v39] = v43;
        end;
        v38 = v20:exec((v38.input:sub(v38.index + v39:len())));
    end;
    v36["%C2"] = v35;
    table.insert(v37, "%C2");
    for _, v45 in v37, nil, nil do
        v34 = string.gsub(v34, v45:gsub("%%", "%%%%"), (v36[v45]:gsub("%%", "%%%%")));
    end;
    return v34;
end;
return function(v47)
    if type(v47) ~= "string" then
        error("Expected `encodedURI` to be of type `string`, got `" .. typeof(v47) .. "`");
    end;
    return (v46((v47:gsub("%+", " "))));
end;
