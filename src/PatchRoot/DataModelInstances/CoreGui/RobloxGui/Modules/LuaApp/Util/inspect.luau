local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.isArray);
local v2 = require(script.Parent.objectKeys);
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local function _(v8, v9)
    for v10 = 1, #v8 do
        if v8[v10] == v9 then
            return v10;
        end;
    end;
    return nil;
end;
local function v13(v12)
    return v3(v12, {});
end;
v3 = function(v14, v15)
    local v16 = typeof(v14);
    if v16 == "string" then
        return l_HttpService_0:JSONEncode(v14);
    elseif v16 == "number" then
        if v14 ~= v14 then
            return "NaN";
        elseif v14 == math.huge then
            return "Infinity";
        elseif v14 == -math.huge then
            return "-Infinity";
        else
            return (tostring(v14));
        end;
    elseif v16 == "function" then
        return "[function]";
    elseif v16 == "table" then
        return v4(v14, v15);
    else
        return (tostring(v14));
    end;
end;
v4 = function(v17, v18)
    local v19;
    for v20 = 1, #v18 do
        if v18[v20] == v17 then
            v19 = v20;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v19 = nil;
    ::label0::;
    if v19 ~= nil then
        return "[Circular]";
    else
        v19 = {
            unpack(v18)
        };
        table.insert(v19, v17);
        if typeof(v17.toJSON) == "function" then
            local v21 = v17:toJSON(v17);
            if v21 ~= v17 then
                if typeof(v21) == "string" then
                    return v21;
                else
                    return v3(v21, v19);
                end;
            end;
        elseif v1(v17) then
            return v5(v17, v19);
        end;
        return v6(v17, v19);
    end;
end;
v6 = function(v22, v23)
    local v24 = v2(v22);
    if #v24 == 0 then
        return "{}";
    elseif #v23 > 3 then
        return "[" .. v7(v22) .. "]";
    else
        local v25 = {};
        for v26 = 1, #v24 do
            local v27 = v24[v26];
            v25[v26] = v27 .. ": " .. v3(v22[v27], v23);
        end;
        return "{ " .. table.concat(v25, ", ") .. " }";
    end;
end;
v5 = function(v28, v29)
    local v30 = #v28;
    if v30 == 0 then
        return "[]";
    elseif #v29 > 3 then
        return "[Array]";
    else
        local v31 = math.min(3, v30);
        local v32 = v30 - v31;
        local v33 = {};
        for v34 = 1, v31 do
            v33[v34] = v3(v28[v34], v29);
        end;
        if v32 == 1 then
            table.insert(v33, "... 1 more item");
        elseif v32 > 1 then
            table.insert(v33, ("... %s more items"):format(v32));
        end;
        return "[" .. table.concat(v33, ", ") .. "]";
    end;
end;
v7 = function(_)
    return "Object";
end;
return {
    inspect = v13
};
