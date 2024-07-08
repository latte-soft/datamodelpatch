local v0 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local v3 = nil;
local function v5(v4)
    v3 = v4;
end;
local function v6(v7, v8, v9, v10)
    local v11 = if v9 ~= nil then v9 else -1;
    local v12 = if typeof(v11) == "number" then v10 else v11;
    local v13 = if typeof(v11) == "number" then v11 else -1;
    if v13 == 0 then
        return true;
    elseif v7 == v8 then
        return false;
    elseif typeof(v7) == "function" and typeof(v8) == "function" then
        local v14 = v12 ~= nil and v12.unsafelyIgnoreFunctions ~= nil;
        local v15 = if v12 ~= nil and v14 then v12.unsafelyIgnoreFunctions else nil;
        if v15 == nil then
            if not ((not (v3 ~= nil) or not l_Boolean_0.toJSBoolean(v3.onDifferentFunctionsIgnored)) or l_Boolean_0.toJSBoolean(v12) and v14) then
                v3.onDifferentFunctionsIgnored(debug.info(v7, "n"), debug.info(v8, "n"));
            end;
            v15 = true;
        end;
        return not v15;
    elseif not (typeof(v7) == "table") or v7 == nil then
        return v7 ~= v8;
    elseif not (typeof(v8) == "table") or v8 == nil then
        return true;
    elseif l_Array_0.isArray(v7) ~= l_Array_0.isArray(v8) then
        return true;
    else
        if not l_Array_0.isArray(v7) then
            for v16 in pairs(v7) do
                if v6(v7[v16], v8[v16], v13 - 1, v12) then
                    return true;
                end;
            end;
            for v17 in pairs(v8) do
                if v7[v17] == nil and v8[v17] ~= nil then
                    return true;
                end;
            end;
        elseif #v8 ~= #v7 then
            return true;
        else
            for v18 = 1, #v7 do
                if v6(v7[v18], v8[v18], v13 - 1, v12) then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
return (setmetatable({
    unstable_setLogListeners = v5
}, {
    __call = function(_, v20, v21, v22, v23)
        return (v6(v20, v21, v22, v23));
    end
}));
