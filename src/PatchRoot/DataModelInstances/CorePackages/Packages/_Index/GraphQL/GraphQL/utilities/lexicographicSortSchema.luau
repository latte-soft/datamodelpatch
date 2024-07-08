local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_keyValMap_0 = require(l_Parent_0.jsutils.keyValMap).keyValMap;
local l_naturalCompare_0 = require(l_Parent_0.jsutils.naturalCompare).naturalCompare;
local l_GraphQLSchema_0 = require(l_Parent_0.type.schema).GraphQLSchema;
local l_GraphQLDirective_0 = require(l_Parent_0.type.directives).GraphQLDirective;
local v11 = require(l_Parent_0.type.definition);
local _ = require(l_Parent_0.language.ast);
local l_isIntrospectionType_0 = require(l_Parent_0.type.introspection).isIntrospectionType;
local l_GraphQLList_0 = v11.GraphQLList;
local l_GraphQLNonNull_0 = v11.GraphQLNonNull;
local l_GraphQLObjectType_0 = v11.GraphQLObjectType;
local l_GraphQLInterfaceType_0 = v11.GraphQLInterfaceType;
local l_GraphQLUnionType_0 = v11.GraphQLUnionType;
local l_GraphQLEnumType_0 = v11.GraphQLEnumType;
local l_GraphQLInputObjectType_0 = v11.GraphQLInputObjectType;
local l_isListType_0 = v11.isListType;
local l_isNonNullType_0 = v11.isNonNullType;
local l_isScalarType_0 = v11.isScalarType;
local l_isObjectType_0 = v11.isObjectType;
local l_isInterfaceType_0 = v11.isInterfaceType;
local l_isUnionType_0 = v11.isUnionType;
local l_isEnumType_0 = v11.isEnumType;
local l_isInputObjectType_0 = v11.isInputObjectType;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local function v65(v32)
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local _ = nil;
    local v42 = v32:toConfig();
    local function v43(v44)
        if not l_isListType_0(v44) then
            if not l_isNonNullType_0(v44) then
                return v34(v44);
            else
                return l_GraphQLNonNull_0.new(v43(v44.ofType));
            end;
        else
            return l_GraphQLList_0.new(v43(v44.ofType));
        end;
    end;
    v34 = function(v45)
        return v33[v45.name];
    end;
    v35 = function(v46)
        if not v46 then
            return nil;
        else
            return (v34(v46));
        end;
    end;
    v36 = function(v47)
        local v48 = v47:toConfig();
        return l_GraphQLDirective_0.new(l_Object_0.assign({}, v48, {
            locations = v31(v48.locations, function(v49)
                return v49;
            end), 
            args = v37(v48.args)
        }));
    end;
    v37 = function(v50)
        return v29(v50, function(v51)
            return l_Object_0.assign({}, v51, {
                type = v43(v51.type)
            });
        end);
    end;
    v38 = function(v52)
        return v29(v52, function(v53)
            return l_Object_0.assign({}, v53, {
                type = v43(v53.type), 
                args = if not v53.args then nil else v37(v53.args)
            });
        end);
    end;
    v39 = function(v54)
        return v29(v54, function(v55)
            return l_Object_0.assign({}, v55, {
                type = v43(v55.type)
            });
        end);
    end;
    v40 = function(v56)
        return l_Array_0.map(v30(v56), v34);
    end;
    v33 = l_keyValMap_0(v30(v42.types), function(v57)
        return v57.name;
    end, function(v58)
        if not l_isScalarType_0(v58) and not l_isIntrospectionType_0(v58) then
            if not l_isObjectType_0(v58) then
                if not l_isInterfaceType_0(v58) then
                    if not l_isUnionType_0(v58) then
                        if not l_isEnumType_0(v58) then
                            if not l_isInputObjectType_0(v58) then
                                l_invariant_0(false, "Unexpected type: " .. l_inspect_0(v58));
                                error("Unexpected type: " .. l_inspect_0(v58));
                                return ;
                            else
                                local v59 = v58:toConfig();
                                return l_GraphQLInputObjectType_0.new(l_Object_0.assign({}, v59, {
                                    fields = function()
                                        return v39(v59.fields);
                                    end
                                }));
                            end;
                        else
                            local v60 = v58:toConfig();
                            return l_GraphQLEnumType_0.new(l_Object_0.assign({}, v60, {
                                values = v29(v60.values, function(v61)
                                    return v61;
                                end)
                            }));
                        end;
                    else
                        local v62 = v58:toConfig();
                        return l_GraphQLUnionType_0.new(l_Object_0.assign({}, v62, {
                            types = function()
                                return v40(v62.types);
                            end
                        }));
                    end;
                else
                    local v63 = v58:toConfig();
                    return l_GraphQLInterfaceType_0.new(l_Object_0.assign({}, v63, {
                        interfaces = function()
                            return v40(v63.interfaces);
                        end, 
                        fields = function()
                            return v38(v63.fields);
                        end
                    }));
                end;
            else
                local v64 = v58:toConfig();
                return l_GraphQLObjectType_0.new(l_Object_0.assign({}, v64, {
                    interfaces = function()
                        return v40(v64.interfaces);
                    end, 
                    fields = function()
                        return v38(v64.fields);
                    end
                }));
            end;
        else
            return v58;
        end;
    end);
    return l_GraphQLSchema_0.new(l_Object_0.assign({}, v42, {
        types = v33:values(), 
        directives = l_Array_0.map(v30(v42.directives), v36), 
        query = v35(v42.query), 
        mutation = v35(v42.mutation), 
        subscription = v35(v42.subscription)
    }));
end;
v29 = function(v66, v67)
    local v68 = l_Map_0.new();
    for _, v71 in ipairs((v31(v66:keys(), function(v69)
        return v69;
    end))) do
        v68[v71] = v67(v66[v71]);
    end;
    return v68;
end;
v30 = function(v72)
    return v31(v72, function(v73)
        return v73.name;
    end);
end;
v31 = function(v74, v75)
    return l_Array_0.sort(l_Array_0.slice(v74), function(v76, v77)
        return l_naturalCompare_0(v75(v76), (v75(v77)));
    end);
end;
return {
    lexicographicSortSchema = v65
};
