local l_Parent_0 = script.Parent.Parent;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local v2 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Map_0 = v2.Map;
local l_Set_0 = v2.Set;
local v7 = require(l_luaUtils_0.isNillish);
local l_isNillish_0 = v7.isNillish;
local l_isNotNillish_0 = v7.isNotNillish;
local _ = require(l_luaUtils_0.null);
local l_jsutils_0 = l_Parent_0.jsutils;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_toObjMap_0 = require(l_jsutils_0.toObjMap).toObjMap;
local l_devAssert_0 = require(l_jsutils_0.devAssert).devAssert;
local v15 = require(l_jsutils_0.instanceOf);
local l_isObjectLike_0 = require(l_jsutils_0.isObjectLike).isObjectLike;
local l___Schema_0 = require(script.Parent.introspection).__Schema;
local _ = require(l_Parent_0.language.ast);
local _ = require(l_Parent_0.error.GraphQLError);
local v20 = require(script.Parent.directives);
local l_isDirective_0 = v20.isDirective;
local l_specifiedDirectives_0 = v20.specifiedDirectives;
local _ = require(l_jsutils_0.ObjMap);
local v24 = require(script.Parent.definition);
local l_isObjectType_0 = v24.isObjectType;
local l_isInterfaceType_0 = v24.isInterfaceType;
local l_isUnionType_0 = v24.isUnionType;
local l_isInputObjectType_0 = v24.isInputObjectType;
local l_getNamedType_0 = v24.getNamedType;
local v30 = nil;
local v31 = nil;
local function v33(v32)
    return v15(v32, v30);
end;
local function v35(v34)
    if not v15(v34, v30) then
        error(l_Error_0.new(("Expected %s to be a GraphQL schema."):format(l_inspect_0(v34))));
    end;
    return v34;
end;
v30 = {};
v30.__index = v30;
v30.new = function(v36)
    local v37 = setmetatable({}, v30);
    v37.__validationErrors = nil;
    if v36.assumeValid == true then
        v37.__validationErrors = {};
    end;
    l_devAssert_0(l_isObjectLike_0(v36), "Must provide configuration object.");
    l_devAssert_0(not v36.types or l_Array_0.isArray(v36.types), ("\"types\" must be Array if provided but got: %s."):format(l_inspect_0(v36.types)));
    l_devAssert_0(not v36.directives or l_Array_0.isArray(v36.directives), "\"directives\" must be Array if provided but got: " .. ("%s."):format(l_inspect_0(v36.directives)));
    v37.description = v36.description;
    v37.extensions = if not v36.extensions then nil else l_toObjMap_0(v36.extensions);
    v37.astNode = v36.astNode;
    v37.extensionASTNodes = v36.extensionASTNodes;
    v37._queryType = v36.query;
    v37._mutationType = v36.mutation;
    v37._subscriptionType = v36.subscription;
    v37._directives = v36.directives or l_specifiedDirectives_0;
    local v38 = l_Set_0.new();
    local l_ipairs_0 = ipairs;
    local v40 = v36.types or {};
    for _, v42 in l_ipairs_0(v40) do
        v38:add(v42);
    end;
    if v36.types ~= nil then
        for _, v44 in ipairs(v36.types) do
            v38:delete(v44);
            v31(v44, v38);
        end;
    end;
    if l_isNotNillish_0(v37._queryType) then
        v31(v37._queryType, v38);
    end;
    if l_isNotNillish_0(v37._mutationType) then
        v31(v37._mutationType, v38);
    end;
    if l_isNotNillish_0(v37._subscriptionType) then
        v31(v37._subscriptionType, v38);
    end;
    for _, v46 in ipairs(v37._directives) do
        if l_isDirective_0(v46) then
            for _, v48 in ipairs(v46.args) do
                v31(v48.type, v38);
            end;
        end;
    end;
    v31(l___Schema_0, v38);
    v37._typeMap = l_Map_0.new();
    v37._subTypeMap = l_Map_0.new();
    v37._implementationsMap = l_Map_0.new();
    for _, v50 in v38, nil, nil do
        if not l_isNillish_0(v50) then
            local v51 = nil;
            v51 = if typeof(v50) == "table" then v50.name else tostring(v50);
            l_devAssert_0(v51 and v51 ~= "", "One of the provided types for building the Schema is missing a name.");
            if v37._typeMap:has(v51) then
                error(l_Error_0.new(("Schema must contain uniquely named types but contains multiple types named \"%s\"."):format(v51)));
            end;
            v37._typeMap:set(v51, v50);
            if not l_isInterfaceType_0(v50) then
                if l_isObjectType_0(v50) then
                    for _, v53 in ipairs(v50:getInterfaces()) do
                        if l_isInterfaceType_0(v53) then
                            local v54 = v37._implementationsMap:get(v53.name);
                            if v54 == nil then
                                v54 = {
                                    objects = {}, 
                                    interfaces = {}
                                };
                                v37._implementationsMap:set(v53.name, v54);
                            end;
                            table.insert(v54.objects, v50);
                        end;
                    end;
                end;
            else
                for _, v56 in ipairs(v50:getInterfaces()) do
                    if l_isInterfaceType_0(v56) then
                        local v57 = v37._implementationsMap:get(v56.name);
                        if v57 == nil then
                            v57 = {
                                objects = {}, 
                                interfaces = {}
                            };
                            v37._implementationsMap:set(v56.name, v57);
                        end;
                        table.insert(v57.interfaces, v50);
                    end;
                end;
            end;
        end;
    end;
    return v37;
end;
v30.getQueryType = function(v58)
    return v58._queryType;
end;
v30.getMutationType = function(v59)
    return v59._mutationType;
end;
v30.getSubscriptionType = function(v60)
    return v60._subscriptionType;
end;
v30.getTypeMap = function(v61)
    return v61._typeMap;
end;
v30.getType = function(v62, v63)
    return v62:getTypeMap()[v63];
end;
v30.getPossibleTypes = function(v64, v65)
    if not l_isUnionType_0(v65) then
        return v64:getImplementations(v65).objects;
    else
        return v65:getTypes();
    end;
end;
v30.getImplementations = function(v66, v67)
    return v66._implementationsMap:get(v67.name) or {
        objects = {}, 
        interfaces = {}
    };
end;
v30.isSubType = function(v68, v69, v70)
    local v71 = v68._subTypeMap[v69.name];
    if v71 == nil then
        v71 = {};
        if not l_isUnionType_0(v69) then
            local v72 = v68:getImplementations(v69);
            for _, v74 in ipairs(v72.objects) do
                v71[v74.name] = true;
            end;
            for _, v76 in ipairs(v72.interfaces) do
                v71[v76.name] = true;
            end;
        else
            for _, v78 in ipairs(v69:getTypes()) do
                v71[v78.name] = true;
            end;
        end;
        v68._subTypeMap:set(v69.name, v71);
    end;
    return v71[v70.name] ~= nil;
end;
v30.getDirectives = function(v79)
    return v79._directives;
end;
v30.getDirective = function(v80, v81)
    return l_Array_0.find(v80:getDirectives(), function(v82)
        return v82.name == v81;
    end);
end;
v30.toConfig = function(v83)
    return {
        description = v83.description, 
        query = v83:getQueryType(), 
        mutation = v83:getMutationType(), 
        subscription = v83:getSubscriptionType(), 
        types = v83:getTypeMap():values(), 
        directives = l_Array_0.slice(v83:getDirectives()), 
        extensions = v83.extensions, 
        astNode = v83.astNode, 
        extensionASTNodes = v83.extensionASTNodes or {}, 
        assumeValid = v83.__validationErrors ~= nil
    };
end;
v30.__tostring = function(_)
    return "GraphQLSchema";
end;
v31 = function(v85, v86)
    local v87 = l_getNamedType_0(v85);
    if not v86:has(v87) then
        v86:add(v87);
        if not l_isUnionType_0(v87) then
            if not l_isObjectType_0(v87) and not l_isInterfaceType_0(v87) then
                if l_isInputObjectType_0(v87) then
                    for _, v89 in ipairs(v87:getFields():values()) do
                        v31(v89.type, v86);
                    end;
                end;
            else
                for _, v91 in ipairs(v87:getInterfaces()) do
                    v31(v91, v86);
                end;
                for _, v93 in ipairs(v87:getFields():values()) do
                    v31(v93.type, v86);
                    for _, v95 in ipairs(v93.args) do
                        v31(v95.type, v86);
                    end;
                end;
                return v86;
            end;
        else
            for _, v97 in ipairs(v87:getTypes()) do
                v31(v97, v86);
            end;
            return v86;
        end;
    end;
    return v86;
end;
return {
    isSchema = v33, 
    assertSchema = v35, 
    GraphQLSchema = v30
};
