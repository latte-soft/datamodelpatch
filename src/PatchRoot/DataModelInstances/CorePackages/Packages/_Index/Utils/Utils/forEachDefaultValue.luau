local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local v3 = {};
local v4 = require(l_Parent_0.GraphQL);
local l_getNamedType_0 = v4.getNamedType;
local l_isObjectType_0 = v4.isObjectType;
local l_isInputObjectType_0 = v4.isInputObjectType;
local _ = require(script.Parent.Interfaces);
local l_String_0 = v1.String;
v3.forEachDefaultValue = function(v10, v11)
    local v12 = v10:getTypeMap();
    for _, v14 in v12, nil, nil do
        local v15 = v12:get(v14[1]);
        if not l_String_0.startsWith(l_getNamedType_0(v15).name, "__") then
            if not l_Boolean_0.toJSBoolean(l_isObjectType_0(v15)) then
                if l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v15)) then
                    local v16 = v15:getFields();
                    for _, v18 in v16, nil, nil do
                        local v19 = v16:get(v18[1]);
                        v19.defaultValue = v11(v19.type, v19.defaultValue);
                    end;
                end;
            else
                local v20 = v15:getFields();
                for _, v22 in v20, nil, nil do
                    for _, v24 in v20:get(v22[1]).args, nil, nil do
                        v24.defaultValue = v11(v24.type, v24.defaultValue);
                    end;
                end;
            end;
        end;
    end;
end;
return v3;
