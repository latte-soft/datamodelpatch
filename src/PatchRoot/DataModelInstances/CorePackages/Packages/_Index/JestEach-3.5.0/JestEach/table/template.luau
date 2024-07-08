local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = {};
local v5 = nil;
local v6 = nil;
local _ = require(l_Parent_0.JestTypes);
local _ = require(script.Parent.interpolation);
local l_interpolateVariables_0 = require(script.Parent.interpolation).interpolateVariables;
v4.default = function(v10, v11, v12)
    return l_Array_0.map(v6(v5(v12, v11), v11), function(v13, v14)
        return {
            arguments = {
                l_Object_0.assign({}, v13)
            }, 
            title = l_interpolateVariables_0(v10, v13, v14)
        };
    end);
end;
v5 = function(v15, _)
    return v15;
end;
v6 = function(v17, v18)
    return l_Array_0.map(v17, function(v19)
        return l_Array_0.reduce(v19, function(v20, v21, v22)
            return l_Object_0.assign(v20, {
                [v18[v22]] = v21
            });
        end, {});
    end);
end;
return v4;
