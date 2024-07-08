local l_Boolean_0 = require(script.Parent.Parent.LuauPolyfill).Boolean;
local function v3(v1)
    local l_v1_0 = v1;
    while not (l_Boolean_0.toJSBoolean(l_v1_0.trace) or not l_v1_0.parent) do
        l_v1_0 = l_v1_0.parent;
    end;
    return l_v1_0.trace or "";
end;
local function v7(v4)
    local l_v4_0 = v4;
    local l_error_0 = v4.error;
    while not (l_Boolean_0.toJSBoolean(l_v4_0.trace) or not l_v4_0.parent) do
        l_v4_0 = l_v4_0.parent;
        l_error_0 = l_v4_0.error or l_error_0;
    end;
    return l_v4_0.message or l_error_0;
end;
return function(v8)
    v8.message = v7(v8);
    v8.stack = v3(v8);
    return v8;
end;
