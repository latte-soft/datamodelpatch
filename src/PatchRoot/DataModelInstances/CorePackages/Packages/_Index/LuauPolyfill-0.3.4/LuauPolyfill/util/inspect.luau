local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Array);
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local function v11(v7, v8)
    local v9 = v8 or {
        depth = 2
    };
    local v10 = v9.depth or 2;
    v9.depth = if v10 >= 0 then v10 else 2;
    return v2(v7, {}, v9);
end;
local function _(v12, v13)
    local v14 = false;
    if type(v12) == "number" then
        v14 = false;
        if v12 <= v13 then
            v14 = false;
            if v12 >= 1 then
                v14 = math.floor(v12) == v12;
            end;
        end;
    end;
    return v14;
end;
local function _(v16)
    local v17 = 1;
    local v18 = rawget(v16, v17);
    while v18 ~= nil do
        v17 = v17 + 1;
        v18 = rawget(v16, v17);
    end;
    return v17 - 1;
end;
local function v24(v20, v21)
    local v22 = type(v20);
    local v23 = type(v21);
    if v22 == v23 and (not (v22 ~= "number") or v22 == "string") then
        return v20 < v21;
    else
        return v22 < v23;
    end;
end;
local function _(v25)
    return next, v25, nil;
end;
local function v36(v27)
    local v28 = {};
    local v29 = 0;
    local v30 = 1;
    local v31 = rawget(v27, v30);
    while v31 ~= nil do
        v30 = v30 + 1;
        v31 = rawget(v27, v30);
    end;
    local v32 = v30 - 1;
    for v33, _ in next, v27, nil do
        local v35 = false;
        if type(v33) == "number" then
            v35 = false;
            if v33 <= v32 then
                v35 = false;
                if v33 >= 1 then
                    v35 = math.floor(v33) == v33;
                end;
            end;
        end;
        if not v35 then
            v29 = v29 + 1;
            v28[v29] = v33;
        end;
    end;
    table.sort(v28, v24);
    return v28, v29, v32;
end;
v2 = function(v37, v38, v39)
    local v40 = typeof(v37);
    if v40 == "string" then
        return l_HttpService_0:JSONEncode(v37);
    elseif v40 == "number" then
        if v37 ~= v37 then
            return "NaN";
        elseif v37 == math.huge then
            return "Infinity";
        elseif v37 == -math.huge then
            return "-Infinity";
        else
            return (tostring(v37));
        end;
    elseif v40 == "function" then
        local v41 = "[function";
        local v42 = debug.info(v37, "n");
        if v42 ~= nil and v42 ~= "" then
            v41 = v41 .. " " .. v42;
        end;
        return v41 .. "]";
    elseif v40 == "table" then
        return v3(v37, v38, v39);
    else
        return (tostring(v37));
    end;
end;
v3 = function(v43, v44, v45)
    if table.find(v44, v43) ~= nil then
        return "[Circular]";
    else
        local v46 = {
            unpack(v44)
        };
        table.insert(v46, v43);
        if typeof(v43.toJSON) == "function" then
            local v47 = v43:toJSON(v43);
            if v47 ~= v43 then
                if typeof(v47) == "string" then
                    return v47;
                else
                    return v2(v47, v46, v45);
                end;
            end;
        elseif v1.isArray(v43) then
            return v4(v43, v46, v45);
        end;
        return v5(v43, v46, v45);
    end;
end;
v5 = function(v48, v49, v50)
    local v51 = "";
    local v52 = getmetatable(v48);
    if not v52 or not rawget(v52, "__tostring") then
        local v53, v54, v55 = v36(v48);
        if v55 == 0 and v54 == 0 then
            return v51 .. "{}";
        elseif v50.depth < #v49 then
            return v51 .. "[" .. v6(v48) .. "]";
        else
            local v56 = {};
            for v57 = 1, v55 do
                table.insert(v56, (v2(v48[v57], v49, v50)));
            end;
            for v58 = 1, v54 do
                local v59 = v53[v58];
                table.insert(v56, v59 .. ": " .. v2(v48[v59], v49, v50));
            end;
            return v51 .. "{ " .. table.concat(v56, ", ") .. " }";
        end;
    else
        return (tostring(v48));
    end;
end;
v4 = function(v60, v61, v62)
    local v63 = #v60;
    if v63 == 0 then
        return "[]";
    elseif v62.depth < #v61 then
        return "[Array]";
    else
        local v64 = math.min(10, v63);
        local v65 = v63 - v64;
        local v66 = {};
        for v67 = 1, v64 do
            v66[v67] = v2(v60[v67], v61, v62);
        end;
        if v65 == 1 then
            table.insert(v66, "... 1 more item");
        elseif v65 > 1 then
            table.insert(v66, ("... %s more items"):format((tostring(v65))));
        end;
        return "[" .. table.concat(v66, ", ") .. "]";
    end;
end;
v6 = function(_)
    return "Object";
end;
return v11;
