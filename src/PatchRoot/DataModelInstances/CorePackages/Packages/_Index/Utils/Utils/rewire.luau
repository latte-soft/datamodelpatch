local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v6 = {};
local v7 = require(l_Parent_0.GraphQL);
local l_GraphQLDirective_0 = v7.GraphQLDirective;
local l_GraphQLEnumType_0 = v7.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v7.GraphQLInputObjectType;
local l_GraphQLInterfaceType_0 = v7.GraphQLInterfaceType;
local l_GraphQLList_0 = v7.GraphQLList;
local l_GraphQLObjectType_0 = v7.GraphQLObjectType;
local l_GraphQLNonNull_0 = v7.GraphQLNonNull;
local l_GraphQLScalarType_0 = v7.GraphQLScalarType;
local l_GraphQLUnionType_0 = v7.GraphQLUnionType;
local l_isInterfaceType_0 = v7.isInterfaceType;
local l_isEnumType_0 = v7.isEnumType;
local l_isInputObjectType_0 = v7.isInputObjectType;
local l_isListType_0 = v7.isListType;
local l_isNamedType_0 = v7.isNamedType;
local l_isNonNullType_0 = v7.isNonNullType;
local l_isObjectType_0 = v7.isObjectType;
local l_isScalarType_0 = v7.isScalarType;
local l_isUnionType_0 = v7.isUnionType;
local l_isSpecifiedScalarType_0 = v7.isSpecifiedScalarType;
local l_isSpecifiedDirective_0 = v7.isSpecifiedDirective;
local v28 = require(script.Parent.stub);
local l_getBuiltInForStub_0 = v28.getBuiltInForStub;
local l_isNamedStub_0 = v28.isNamedStub;
local l_Map_0 = v1.Map;
local l_String_0 = v1.String;
v6.rewireTypes = function(v33, v34)
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local v41 = nil;
    local v42 = nil;
    local v43 = nil;
    v37 = function(v44)
        if not l_isSpecifiedDirective_0(v44) then
            local v45 = v44:toConfig();
            v45.args = v38(v45.args);
            return l_GraphQLDirective_0.new(v45);
        else
            return v44;
        end;
    end;
    v38 = function(v46)
        local v47 = l_Map_0.new();
        for _, v49 in v46, nil, nil do
            local v50 = v49[1];
            local v51 = v46:get(v50);
            local v52 = v43(v51.type);
            if v52 ~= nil then
                v51.type = v52;
                v47:set(v50, v51);
            end;
        end;
        return v47;
    end;
    v39 = function(v53)
        if not l_isObjectType_0(v53) then
            if not l_isInterfaceType_0(v53) then
                if not l_isUnionType_0(v53) then
                    if not l_isInputObjectType_0(v53) then
                        if not l_isEnumType_0(v53) then
                            if not l_isScalarType_0(v53) then
                                error(l_Error_0.new(("Unexpected schema type: %s"):format((tostring(v53)))));
                                return ;
                            elseif not l_isSpecifiedScalarType_0(v53) then
                                local v54 = v53:toConfig();
                                local l_serialize_0 = v54.serialize;
                                local l_parseValue_0 = v54.parseValue;
                                local l_parseLiteral_0 = v54.parseLiteral;
                                if l_serialize_0 then
                                    v54.serialize = function(...)
                                        return l_serialize_0(v54, ...);
                                    end;
                                end;
                                if l_parseValue_0 then
                                    v54.parseValue = function(...)
                                        return l_parseValue_0(v54, ...);
                                    end;
                                end;
                                if l_parseLiteral_0 then
                                    v54.parseLiteral = function(...)
                                        return l_parseLiteral_0(v54, ...);
                                    end;
                                end;
                                return l_GraphQLScalarType_0.new(v54);
                            else
                                return v53;
                            end;
                        else
                            return l_GraphQLEnumType_0.new((v53:toConfig()));
                        end;
                    else
                        local v58 = v53:toConfig();
                        return l_GraphQLInputObjectType_0.new((l_Object_0.assign({}, v58, {
                            fields = function()
                                return v41(v58.fields);
                            end
                        })));
                    end;
                else
                    local v59 = v53:toConfig();
                    return l_GraphQLUnionType_0.new((l_Object_0.assign({}, v59, {
                        types = function()
                            return v42(v59.types);
                        end
                    })));
                end;
            else
                local v60 = v53:toConfig();
                local v61 = l_Object_0.assign({}, v60, {
                    fields = function()
                        return v40(v60.fields);
                    end
                });
                if l_Array_0.indexOf(l_Object_0.keys(v61), "interfaces") ~= -1 then
                    v61.interfaces = function(_)
                        return v42(v60.interfaces);
                    end;
                end;
                return l_GraphQLInterfaceType_0.new(v61);
            end;
        else
            local v63 = v53:toConfig();
            return l_GraphQLObjectType_0.new((l_Object_0.assign({}, v63, {
                fields = function()
                    return v40(v63.fields);
                end, 
                interfaces = function()
                    return v42(v63.interfaces);
                end
            })));
        end;
    end;
    v40 = function(v64)
        local v65 = l_Map_0.new();
        for _, v67 in v64, nil, nil do
            local v68 = v67[1];
            local v69 = v64:get(v68);
            local v70 = v43(v69.type);
            if not (not (v70 ~= nil) or not v69.args) then
                v69.type = v70;
                v69.args = v38(v69.args);
                v65:set(v68, v69);
            end;
        end;
        return v65;
    end;
    v41 = function(v71)
        local v72 = l_Map_0.new();
        for _, v74 in v71, nil, nil do
            local v75 = v74[1];
            local v76 = v71:get(v75);
            local v77 = v43(v76.type);
            if v77 ~= nil then
                v76.type = v77;
                v72:set(v75, v76);
            end;
        end;
        return v72;
    end;
    v42 = function(v78)
        local v79 = {};
        for _, v81 in v78, nil, nil do
            local v82 = v43(v81);
            if v82 ~= nil and v82 ~= l_Object_0.None then
                table.insert(v79, v82);
            end;
        end;
        return v79;
    end;
    v43 = function(v83)
        if not l_isListType_0(v83) then
            if not l_isNonNullType_0(v83) then
                if not l_isNamedType_0(v83) then
                    return nil;
                else
                    local v84 = v35:get(v83.name);
                    if v84 == nil then
                        v84 = if not l_isNamedStub_0(v83) then v39(v83) else l_getBuiltInForStub_0(v83);
                        v35:set(v83.name, v84);
                        v36:set(v84.name, (v35:get(v83.name)));
                    end;
                    if v84 ~= nil and v84 ~= l_Object_0.None then
                        return (v36:get(v84.name));
                    else
                        return nil;
                    end;
                end;
            else
                local v85 = v43(v83.ofType);
                if v85 ~= nil and v85 ~= l_Object_0.None then
                    return (l_GraphQLNonNull_0.new(v85));
                else
                    return nil;
                end;
            end;
        else
            local v86 = v43(v83.ofType);
            if v86 ~= nil and v86 ~= l_Object_0.None then
                return (l_GraphQLList_0.new(v86));
            else
                return nil;
            end;
        end;
    end;
    v35 = l_Map_0.new();
    for _, v88 in v33, nil, nil do
        local v89 = v88[1];
        v35:set(v89, (v33:get(v89)));
    end;
    v36 = l_Map_0.new();
    for _, v91 in v35, nil, nil do
        local v92 = v91[1];
        local v93 = v35:get(v92);
        if not (not (v93 ~= nil and v93 ~= l_Object_0.None) or l_String_0.startsWith(v92, "__")) then
            local l_name_0 = v93.name;
            if not l_String_0.startsWith(l_name_0, "__") then
                if v36:get(l_name_0) ~= nil then
                    l_console_0.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format((tostring(l_name_0))));
                else
                    v36:set(l_name_0, v93);
                end;
            end;
        end;
    end;
    for _, v96 in v36, nil, nil do
        local v97 = v96[1];
        v36:set(v97, v39(v36:get(v97)));
    end;
    return {
        typeMap = v36, 
        directives = l_Array_0.map(v34, function(v98)
            return v37(v98);
        end)
    };
end;
return v6;
