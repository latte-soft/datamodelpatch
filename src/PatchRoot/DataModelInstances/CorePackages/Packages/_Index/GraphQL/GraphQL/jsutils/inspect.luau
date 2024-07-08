local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Parent.Parent.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local v6 = require(l_Parent_1.luaUtils.null);
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local function v13(v12)
    return v7(v12, {});
end;
v7 = function(v14, v15)
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
        if v14 == v6 then
            return "null";
        else
            return v8(v14, v15);
        end;
    else
        return (tostring(v14));
    end;
end;
v8 = function(v17, v18)
    if table.find(v18, v17) ~= nil then
        return "[Circular]";
    else
        local v19 = {
            unpack(v18)
        };
        table.insert(v19, v17);
        if typeof(v17.toJSON) == "function" then
            local v20 = v17:toJSON(v17);
            if v20 ~= v17 then
                if typeof(v20) == "string" then
                    return v20;
                else
                    return v7(v20, v19);
                end;
            end;
        elseif l_Array_0.isArray(v17) then
            return v9(v17, v19);
        end;
        return v10(v17, v19);
    end;
end;
v10 = function(v21, v22)
    local v23 = l_Object_0.keys(v21);
    if #v23 == 0 then
        return "{}";
    elseif #v22 > 2 then
        return "[" .. v11(v21) .. "]";
    else
        local v24 = {};
        for v25 = 1, #v23 do
            local v26 = v23[v25];
            v24[v25] = v26 .. ": " .. v7(v21[v26], v22);
        end;
        return "{ " .. table.concat(v24, ", ") .. " }";
    end;
end;
v9 = function(v27, v28)
    local v29 = #v27;
    if v29 == 0 then
        return "[]";
    elseif #v28 > 2 then
        return "[Array]";
    else
        local v30 = math.min(10, v29);
        local v31 = v29 - v30;
        local v32 = {};
        for v33 = 1, v30 do
            v32[v33] = v7(v27[v33], v28);
        end;
        if v31 == 1 then
            table.insert(v32, "... 1 more item");
        elseif v31 > 1 then
            table.insert(v32, ("... %d more items"):format(v31));
        end;
        return "[" .. table.concat(v32, ", ") .. "]";
    end;
end;
v11 = function(_)
    return "Object";
end;
return {
    inspect = v13
};
