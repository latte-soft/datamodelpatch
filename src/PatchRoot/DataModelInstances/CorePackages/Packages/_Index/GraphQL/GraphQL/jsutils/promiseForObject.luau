local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local _ = require(script.Parent.ObjMap);
return {
    promiseForObject = function(v6)
        local v7 = l_Object_0.keys(v6);
        return v1.all((l_Array_0.map(v7, function(v8)
            local v9 = v6[v8];
            if not v1.is(v9) then
                return v1.resolve(v9);
            else
                return v9;
            end;
        end))):andThen(function(v10)
            return l_Array_0.reduce(v10, function(v11, v12, v13)
                v11[v7[v13]] = v12;
                return v11;
            end, {});
        end);
    end
};
