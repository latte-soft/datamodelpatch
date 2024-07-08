local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = {};
local _ = require(l_Parent_0.JestTypes);
local l_isJSONString_0 = require(script.Parent.utils).isJSONString;
local l_JSON_0 = require(l_Parent_0.RobloxShared).nodeUtils.JSON;
local v8 = {
    "_", 
    "$0", 
    "h", 
    "help", 
    "config"
};
v4.default = function(v9, v10)
    return l_Object_0.assign({}, v9, if not l_isJSONString_0(v10.config) then nil else l_JSON_0.parse(v10.config), (l_Array_0.reduce(l_Array_0.filter(l_Object_0.keys(v10), function(v11)
        local v12 = false;
        if v10[v11] ~= nil then
            v12 = l_Array_0.indexOf(v8, v11) == -1;
        end;
        return v12;
    end), function(v13, v14)
        if v14 == "json" then
            v13.useStderr = v10[v14];
            return v13;
        elseif v14 == "config" then
            return v13;
        else
            if v14 == "globals" then
                local v15 = v10[v14];
                if l_isJSONString_0(v15) then
                    v13[v14] = l_JSON_0.parse(v15);
                    return v13;
                end;
            else
                v13[v14] = v10[v14];
            end;
            return v13;
        end;
    end, {})));
end;
return v4;
