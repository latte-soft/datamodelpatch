local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local v3 = require(l_Parent_0.GraphQL);
local l_getNamedType_0 = v3.getNamedType;
local l_isObjectType_0 = v3.isObjectType;
local _ = require(script.Parent.Interfaces);
local l_String_0 = v1.String;
v2.forEachField = function(v8, v9)
    local v10 = v8:getTypeMap();
    for _, v12 in v10, nil, nil do
        local v13 = v12[1];
        local v14 = v10:get(v13);
        if not (l_String_0.startsWith(l_getNamedType_0(v14).name, "__") or not l_isObjectType_0(v14)) then
            local v15 = v14:getFields();
            for _, v17 in v15, nil, nil do
                local v18 = v17[1];
                v9(v15:get(v18), v13, v18);
            end;
        end;
    end;
end;
return v2;
