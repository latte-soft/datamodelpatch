local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Array.isArray);
local _ = require(l_Parent_1.ES7Types);
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local function v14(v10, v11)
    local v12 = v11 or {
        depth = 2
    };
    local v13 = v12.depth or 2;
    v12.depth = if v13 >= 0 then v13 else 2;
    return v5(v10, {}, v12);
end;
local function _(v15, v16)
    local v17 = false;
    if type(v15) == "number" then
        v17 = false;
        if v15 <= v16 then
            v17 = false;
            if v15 >= 1 then
                v17 = math.floor(v15) == v15;
            end;
        end;
    end;
    return v17;
end;
local function _(v19)
    local v20 = 1;
    local v21 = rawget(v19, v20);
    while v21 ~= nil do
        v20 = v20 + 1;
        v21 = rawget(v19, v20);
    end;
    return v20 - 1;
end;
local function v27(v23, v24)
    local v25 = type(v23);
    local v26 = type(v24);
    if v25 == v26 and (not (v25 ~= "number") or v25 == "string") then
        return v23 < v24;
    else
        return v25 < v26;
    end;
end;
local function _(v28)
    return next, v28, nil;
end;
local function v39(v30)
    local v31 = {};
    local v32 = 0;
    local v33 = 1;
    local v34 = rawget(v30, v33);
    while v34 ~= nil do
        v33 = v33 + 1;
        v34 = rawget(v30, v33);
    end;
    local v35 = v33 - 1;
    for v36, _ in next, v30, nil do
        local v38 = false;
        if type(v36) == "number" then
            v38 = false;
            if v36 <= v35 then
                v38 = false;
                if v36 >= 1 then
                    v38 = math.floor(v36) == v36;
                end;
            end;
        end;
        if not v38 then
            v32 = v32 + 1;
            v31[v32] = v36;
        end;
    end;
    table.sort(v31, v27);
    return v31, v32, v35;
end;
v5 = function(v40, v41, v42)
    local v43 = typeof(v40);
    if v43 == "string" then
        return l_HttpService_0:JSONEncode(v40);
    elseif v43 == "number" then
        if v40 ~= v40 then
            return "NaN";
        elseif v40 == math.huge then
            return "Infinity";
        elseif v40 == -math.huge then
            return "-Infinity";
        else
            return (tostring(v40));
        end;
    elseif v43 == "function" then
        local v44 = "[function";
        local v45 = debug.info(v40, "n");
        if v45 ~= nil and v45 ~= "" then
            v44 = v44 .. " " .. v45;
        end;
        return v44 .. "]";
    elseif v43 == "table" then
        return v6(v40, v41, v42);
    else
        return (tostring(v40));
    end;
end;
v6 = function(v46, v47, v48)
    if table.find(v47, v46) ~= nil then
        return "[Circular]";
    else
        local v49 = {
            unpack(v47)
        };
        table.insert(v49, v46);
        if typeof(v46.toJSON) == "function" then
            local v50 = v46:toJSON(v46);
            if v50 ~= v46 then
                if typeof(v50) == "string" then
                    return v50;
                else
                    return v5(v50, v49, v48);
                end;
            end;
        elseif v3(v46) then
            return v7(v46, v49, v48);
        end;
        return v8(v46, v49, v48);
    end;
end;
v8 = function(v51, v52, v53)
    local v54 = "";
    local v55 = getmetatable(v51);
    if not v55 or not rawget(v55, "__tostring") then
        local v56, v57, v58 = v39(v51);
        if v58 == 0 and v57 == 0 then
            return v54 .. "{}";
        elseif v53.depth < #v52 then
            return v54 .. "[" .. v9(v51) .. "]";
        else
            local v59 = {};
            for v60 = 1, v58 do
                table.insert(v59, (v5(v51[v60], v52, v53)));
            end;
            for v61 = 1, v57 do
                local v62 = v56[v61];
                table.insert(v59, v62 .. ": " .. v5(v51[v62], v52, v53));
            end;
            return v54 .. "{ " .. table.concat(v59, ", ") .. " }";
        end;
    else
        return (tostring(v51));
    end;
end;
v7 = function(v63, v64, v65)
    local v66 = #v63;
    if v66 == 0 then
        return "[]";
    elseif v65.depth < #v64 then
        return "[Array]";
    else
        local v67 = math.min(10, v66);
        local v68 = v66 - v67;
        local v69 = {};
        for v70 = 1, v67 do
            v69[v70] = v5(v63[v70], v64, v65);
        end;
        if v68 == 1 then
            table.insert(v69, "... 1 more item");
        elseif v68 > 1 then
            table.insert(v69, ("... %s more items"):format((tostring(v68))));
        end;
        return "[" .. table.concat(v69, ", ") .. "]";
    end;
end;
v9 = function(_)
    return "Object";
end;
return v14;
