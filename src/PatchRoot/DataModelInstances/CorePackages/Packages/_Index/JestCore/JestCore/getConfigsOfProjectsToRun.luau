local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local _ = require(l_Parent_0.JestTypes);
local l_default_0 = require(script.Parent.getProjectDisplayName).default;
local v7 = nil;
v4.default = function(v8, v9)
    local v10 = v7(v9);
    return l_Array_0.filter(v8, function(v11)
        return v10((l_default_0(v11)));
    end);
end;
v7 = function(v12)
    local v13 = if not l_Array_0.isArray(v12.selectProjects) then {} else v12.selectProjects;
    local v14 = if not l_Array_0.isArray(v12.ignoreProjects) then {} else v12.ignoreProjects;
    local function v15()
        return true;
    end;
    local v17 = #v13 > 0 and function(v16)
        if not l_Boolean_0.toJSBoolean(v16) then
            return v16;
        else
            return (l_Array_0.includes(v13, v16));
        end;
    end or v15;
    local v19 = #v14 > 0 and function(v18)
        return not l_Boolean_0.toJSBoolean(if not l_Boolean_0.toJSBoolean(v18) then v18 else l_Array_0.includes(v14, v18));
    end or v15;
    return function(v20)
        return l_Boolean_0.toJSBoolean(v17(v20)) and l_Boolean_0.toJSBoolean(v19(v20));
    end;
end;
return v4;
