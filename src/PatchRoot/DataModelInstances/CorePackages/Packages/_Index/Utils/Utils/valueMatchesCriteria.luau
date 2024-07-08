local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_instanceof_0 = v1.instanceof;
local v6 = require(l_Parent_0.LuauRegExp);
local v7 = {};
local function v8(v9, v10)
    if v9 == nil then
        return v9 == v10;
    elseif not l_Array_0.isArray(v9) then
        if typeof(v9) == "table" then
            local v11 = false;
            if typeof(v10) == "table" then
                v11 = l_Boolean_0.toJSBoolean(v10) and l_Array_0.every(l_Object_0.keys(v10), function(v12)
                    return v8(v9[v12], v10[v12]);
                end);
            end;
            return v11;
        elseif not l_instanceof_0(v10, v6) then
            return v9 == v10;
        else
            return v10:test(v9);
        end;
    else
        return l_Array_0.isArray(v10) and l_Array_0.every(v9, function(v13, v14)
            return v8(v13, v10[v14]);
        end);
    end;
end;
v7.valueMatchesCriteria = v8;
return v7;
