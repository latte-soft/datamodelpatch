local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local v3 = {};
local v4 = require(l_Parent_0.GraphQL);
local l_GraphQLScalarType_0 = v4.GraphQLScalarType;
local l_isScalarType_0 = v4.isScalarType;
local l_isEnumType_0 = v4.isEnumType;
local l_isInterfaceType_0 = v4.isInterfaceType;
local l_isUnionType_0 = v4.isUnionType;
local l_isObjectType_0 = v4.isObjectType;
local l_isSpecifiedScalarType_0 = v4.isSpecifiedScalarType;
local _ = require(script.Parent.Interfaces);
local l_String_0 = v1.String;
v3.getResolversFromSchema = function(v14, v15)
    local v16 = {};
    local v17 = v14:getTypeMap();
    for _, v19 in v17, nil, nil do
        local v20 = v19[1];
        if not l_String_0.startsWith(v20, "__") then
            local v21 = v17:get(v20);
            if not l_Boolean_0.toJSBoolean(l_isScalarType_0(v21)) then
                if not l_Boolean_0.toJSBoolean(l_isEnumType_0(v21)) then
                    if not l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v21)) then
                        if not l_Boolean_0.toJSBoolean(l_isUnionType_0(v21)) then
                            if l_Boolean_0.toJSBoolean(l_isObjectType_0(v21)) then
                                v16[tostring(v20)] = {};
                                if v21.isTypeOf ~= nil then
                                    v16[v20].__isTypeOf = v21.isTypeOf;
                                end;
                                local v22 = v21:getFields();
                                for _, v24 in v22, nil, nil do
                                    local v25 = v24[1];
                                    local v26 = v22:get(v25);
                                    if v26.subscribe ~= nil then
                                        v16[tostring(v20)][tostring(v25)] = not not l_Boolean_0.toJSBoolean(v16[tostring(v20)][tostring(v25)]) and v16[tostring(v20)][tostring(v25)] or {};
                                        v16[tostring(v20)][tostring(v25)].subscribe = v26.subscribe;
                                    end;
                                    if v26.resolve ~= nil and if typeof(v26.resolve) == "table" then v26.resolve.name else nil ~= "defaultFieldResolver" then
                                        local v27 = if typeof(v26.resolve) == "table" then v26.resolve.name else nil;
                                        if v27 == "defaultMergedResolver" then
                                            if not l_Boolean_0.toJSBoolean(v15) then
                                                continue;
                                            end;
                                        elseif not (v27 ~= "defaultFieldResolver") then
                                            continue;
                                        end;
                                        v16[tostring(v20)][tostring(v25)] = not not l_Boolean_0.toJSBoolean(v16[tostring(v20)][tostring(v25)]) and v16[tostring(v20)][tostring(v25)] or {};
                                        v16[tostring(v20)][tostring(v25)].resolve = v26.resolve;
                                    end;
                                end;
                            end;
                        elseif v21.resolveType ~= nil then
                            v16[v20] = {
                                __resolveType = v21.resolveType
                            };
                        end;
                    elseif v21.resolveType ~= nil then
                        v16[v20] = {
                            __resolveType = v21.resolveType
                        };
                    end;
                else
                    v16[tostring(v20)] = {};
                    for _, v29 in (v21:getValues()), nil, nil do
                        v16[tostring(v20)][tostring(v29.name)] = v29.value;
                    end;
                end;
            elseif not l_Boolean_0.toJSBoolean(l_isSpecifiedScalarType_0(v21)) then
                local v30 = v21:toConfig();
                v30.astNode = nil;
                local l_serialize_0 = v30.serialize;
                local l_parseValue_0 = v30.parseValue;
                local l_parseLiteral_0 = v30.parseLiteral;
                if l_serialize_0 then
                    v30.serialize = function(...)
                        return l_serialize_0(v30, ...);
                    end;
                end;
                if l_parseValue_0 then
                    v30.parseValue = function(...)
                        return l_parseValue_0(v30, ...);
                    end;
                end;
                if l_parseLiteral_0 then
                    v30.parseLiteral = function(...)
                        return l_parseLiteral_0(v30, ...);
                    end;
                end;
                v16[tostring(v20)] = l_GraphQLScalarType_0.new(v30);
            end;
        end;
    end;
    return v16;
end;
return v3;
