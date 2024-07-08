local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local l_isObjectType_0 = require(l_Parent_0.GraphQL).isObjectType;
v4.getImplementingTypes = function(v6, v7)
    local v8 = v7:getTypeMap();
    local v9 = {};
    for _, v11 in v8, nil, nil do
        local v12 = v8:get((table.unpack(v11)));
        if not (not l_Boolean_0.toJSBoolean(l_isObjectType_0(v12)) or not l_Boolean_0.toJSBoolean(l_Array_0.find(v12:getInterfaces(), function(v13)
            return v13.name == v6;
        end))) then
            table.insert(v9, v12.name);
        end;
    end;
    return v9;
end;
return v4;
