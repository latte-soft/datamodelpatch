local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_isNotNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNotNillish;
local l_inspect_0 = require(script.Parent.Parent.jsutils.inspect).inspect;
local l_GraphQLError_0 = require(script.Parent.Parent.error.GraphQLError).GraphQLError;
local l_locatedError_0 = require(script.Parent.Parent.error).locatedError;
local _ = require(l_Parent_0.language.ast);
local l_isValidNameError_0 = require(l_Parent_0.utilities.assertValidName).isValidNameError;
local v11 = require(script.Parent.Parent.utilities.typeComparators);
local l_isEqualType_0 = v11.isEqualType;
local l_isTypeSubTypeOf_0 = v11.isTypeSubTypeOf;
local l_assertSchema_0 = require(script.Parent.schema).assertSchema;
local v15 = require(script.Parent.definition);
local l_isIntrospectionType_0 = require(script.Parent.introspection).isIntrospectionType;
local v17 = require(script.Parent.directives);
local l_isDirective_0 = v17.isDirective;
local l_GraphQLDeprecatedDirective_0 = v17.GraphQLDeprecatedDirective;
local l_isObjectType_0 = v15.isObjectType;
local l_isInterfaceType_0 = v15.isInterfaceType;
local l_isUnionType_0 = v15.isUnionType;
local l_isEnumType_0 = v15.isEnumType;
local l_isInputObjectType_0 = v15.isInputObjectType;
local l_isNamedType_0 = v15.isNamedType;
local l_isNonNullType_0 = v15.isNonNullType;
local l_isInputType_0 = v15.isInputType;
local l_isOutputType_0 = v15.isOutputType;
local l_isRequiredArgument_0 = v15.isRequiredArgument;
local l_isRequiredInputField_0 = v15.isRequiredInputField;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
local v46 = nil;
local function v50(v47)
    l_assertSchema_0(v47);
    if v47.__validationErrors ~= nil then
        return v47.__validationErrors;
    else
        local v48 = v31.new(v47);
        v32(v48);
        v33(v48);
        v44(v48);
        local v49 = v48:getErrors();
        v47.__validationErrors = v49;
        return v49;
    end;
end;
local function v54(v51)
    local v52 = v50(v51);
    if #v52 ~= 0 then
        error(l_Error_0.new(l_Array_0.join(l_Array_0.map(v52, function(v53)
            return v53.message;
        end), "\n\n")));
    end;
end;
v31 = {};
v31.__index = v31;
v31.new = function(v55)
    local v56 = setmetatable({}, v31);
    v56._errors = {};
    v56.schema = v55;
    return v56;
end;
v31.reportError = function(v57, v58, v59)
    v57:addError(l_GraphQLError_0.new(v58, if not l_Array_0.isArray(v59) then v59 else l_Array_0.filter(v59, l_Boolean_0.toJSBoolean)));
end;
v31.addError = function(v60, v61)
    table.insert(v60._errors, v61);
end;
v31.getErrors = function(v62)
    return v62._errors;
end;
v32 = function(v63)
    local l_schema_0 = v63.schema;
    local v65 = l_schema_0:getQueryType();
    if l_isNotNillish_0(v65) then
        if not l_isObjectType_0(v65) then
            v63:reportError(("Query root type must be Object type, it cannot be %s."):format(l_inspect_0(v65)), v34(l_schema_0, "query") or v65.astNode);
        end;
    else
        v63:reportError("Query root type must be provided.", l_schema_0.astNode);
    end;
    local v66 = l_schema_0:getMutationType();
    if not (not l_isNotNillish_0(v66) or l_isObjectType_0(v66)) then
        v63:reportError("Mutation root type must be Object type if provided, it cannot be " .. ("%s."):format(l_inspect_0(v66)), v34(l_schema_0, "mutation") or v66.astNode);
    end;
    local v67 = l_schema_0:getSubscriptionType();
    if not (not l_isNotNillish_0(v67) or l_isObjectType_0(v67)) then
        v63:reportError("Subscription root type must be Object type if provided, it cannot be " .. ("%s."):format(l_inspect_0(v67)), v34(l_schema_0, "subscription") or v67.astNode);
    end;
end;
v34 = function(v68, v69)
    for _, v72 in ipairs((v35(v68, function(v70)
        return v70.operationTypes;
    end))) do
        if v72.operation == v69 then
            return v72.type;
        end;
    end;
    return nil;
end;
v33 = function(v73)
    for _, v75 in ipairs(v73.schema:getDirectives()) do
        if l_isDirective_0(v75) then
            v41(v73, v75);
            for _, v77 in ipairs(v75.args) do
                v41(v73, v77);
                if not l_isInputType_0(v77.type) then
                    v73:reportError(("The type of @%s(%s:) must be Input Type "):format(v75.name, v77.name) .. ("but got: %s."):format(l_inspect_0(v77.type)), v77.astNode);
                end;
                if not (not l_isRequiredArgument_0(v77) or not l_isNotNillish_0(v77.deprecationReason)) then
                    v73:reportError(("Required argument @%s(%s:) cannot be deprecated."):format(v75.name, v77.name), {
                        v38(v77.astNode), 
                        if v77.astNode ~= nil then v77.astNode.type else nil
                    });
                end;
            end;
        else
            v73:reportError(("Expected directive but got: %s."):format(l_inspect_0(v75)), if not v75 then nil else v75.astNode);
        end;
    end;
end;
v41 = function(v78, v79)
    local v80 = nil;
    local v81 = nil;
    if typeof(v79) == "table" then
        v80 = v79.name;
        v81 = v79.astNode;
    else
        v80 = tostring(v79);
    end;
    local v82 = l_isValidNameError_0(v80);
    if v82 then
        v78:addError(l_locatedError_0(v82, v81));
    end;
end;
v44 = function(v83)
    local v84 = createInputObjectCircularRefsValidator(v83);
    for _, v86 in ipairs(v83.schema:getTypeMap():values()) do
        local v87 = nil;
        if typeof(v86) == "table" then
            v87 = v86.astNode;
        end;
        if l_isNamedType_0(v86) then
            if not l_isIntrospectionType_0(v86) then
                v41(v83, v86);
            end;
            if not l_isObjectType_0(v86) then
                if not l_isInterfaceType_0(v86) then
                    if not l_isUnionType_0(v86) then
                        if not l_isEnumType_0(v86) then
                            if l_isInputObjectType_0(v86) then
                                validateInputFields(v83, v86);
                                v84(v86);
                            end;
                        else
                            v40(v83, v86);
                        end;
                    else
                        validateUnionMembers(v83, v86);
                    end;
                else
                    v42(v83, v86);
                    v46(v83, v86);
                end;
            else
                v42(v83, v86);
                v46(v83, v86);
            end;
        else
            v83:reportError(("Expected GraphQL named type but got: %s."):format(l_inspect_0(v86)), v87);
        end;
    end;
end;
v42 = function(v88, v89)
    local v90 = v89:getFields():values();
    if #v90 == 0 then
        v88:reportError(("Type %s must define one or more fields."):format(v89.name), v36(v89));
    end;
    for _, v92 in ipairs(v90) do
        v41(v88, v92);
        if not l_isOutputType_0(v92.type) then
            v88:reportError(("The type of %s.%s must be Output Type "):format(v89.name, v92.name) .. ("but got: %s."):format(l_inspect_0(v92.type)), if v92.astNode ~= nil then v92.astNode.type else nil);
        end;
        for _, v94 in ipairs(v92.args) do
            local l_name_0 = v94.name;
            v41(v88, v94);
            if not l_isInputType_0(v94.type) then
                v88:reportError(("The type of %s.%s(%s:) must be Input "):format(v89.name, v92.name, l_name_0) .. ("Type but got: %s."):format(l_inspect_0(v94.type)), if v94.astNode ~= nil then v94.astNode.type else nil);
            end;
            if not (not l_isRequiredArgument_0(v94) or not l_isNotNillish_0(v94.deprecationReason)) then
                v88:reportError(("Required argument %s.%s(%s:) cannot be deprecated."):format(v89.name, v92.name, l_name_0), {
                    v38(v94.astNode), 
                    if v94.astNode ~= nil then v94.astNode.type else nil
                });
            end;
        end;
    end;
end;
v46 = function(v96, v97)
    local v98 = {};
    for _, v100 in ipairs(v97:getInterfaces()) do
        if l_isInterfaceType_0(v100) then
            if v97 == v100 then
                v96:reportError(("Type %s cannot implement itself because it would create a circular reference."):format(v97.name), v37(v97, v100));
            else
                local v101 = if typeof(nil) == "table" then tostring(v100.name) else tostring(v100);
                if not v98[v101] then
                    v98[v101] = true;
                    v43(v96, v97, v100);
                    v45(v96, v97, v100);
                else
                    v96:reportError(("Type %s can only implement %s once."):format(v97.name, v100.name), v37(v97, v100));
                end;
            end;
        else
            v96:reportError(("Type %s must only implement Interface types, "):format(l_inspect_0(v97)) .. ("it cannot implement %s."):format(l_inspect_0(v100)), v37(v97, v100));
        end;
    end;
end;
v45 = function(v102, v103, v104)
    local v105 = v103:getFields();
    for _, v107 in ipairs(v104:getFields():values()) do
        local l_name_1 = v107.name;
        local v109 = v105:get(l_name_1);
        if v109 then
            if not l_isTypeSubTypeOf_0(v102.schema, v109.type, v107.type) then
                v102:reportError(("Interface field %s.%s expects type "):format(v104.name, l_name_1) .. ("%s but %s.%s "):format(l_inspect_0(v107.type), v103.name, l_name_1) .. ("is type %s."):format(l_inspect_0(v109.type)), {
                    if v107.astNode ~= nil then v107.astNode.type else nil, 
                    if v109.astNode ~= nil then v109.astNode.type else nil
                });
            end;
            for _, v111 in ipairs(v107.args) do
                local l_name_2 = v111.name;
                local v114 = l_Array_0.find(v109.args, function(v113)
                    return v113.name == l_name_2;
                end);
                if v114 then
                    if not l_isEqualType_0(v111.type, v114.type) then
                        v102:reportError(("Interface field argument %s.%s(%s:) "):format(v104.name, l_name_1, l_name_2) .. ("expects type %s but "):format(l_inspect_0(v111.type)) .. ("%s.%s(%s:) is type "):format(v103.name, l_name_1, l_name_2) .. ("%s."):format(l_inspect_0(v114.type)), {
                            if v111.astNode ~= nil then v111.astNode.type else nil, 
                            if v114.astNode ~= nil then v114.astNode.type else nil
                        });
                    end;
                else
                    v102:reportError(("Interface field argument %s.%s(%s:) expected but %s.%s does not provide it."):format(v104.name, l_name_1, l_name_2, v103.name, l_name_1), {
                        v111.astNode, 
                        v109.astNode
                    });
                end;
            end;
            for _, v116 in ipairs(v109.args) do
                local l_name_3 = v116.name;
                if not (l_Array_0.find(v107.args, function(v118)
                    return v118.name == l_name_3;
                end) or not l_isRequiredArgument_0(v116)) then
                    v102:reportError(("Object field %s.%s includes required argument %s that is missing from the Interface field %s.%s."):format(v103.name, l_name_1, l_name_3, v104.name, l_name_1), {
                        v116.astNode, 
                        v107.astNode
                    });
                end;
            end;
        else
            v102:reportError(("Interface field %s.%s expected but %s does not provide it."):format(v104.name, l_name_1, v103.name), l_Array_0.concat({
                v107.astNode
            }, v36(v103)));
        end;
    end;
end;
v43 = function(v119, v120, v121)
    local v122 = v120:getInterfaces();
    for _, v124 in ipairs(v121:getInterfaces()) do
        if l_Array_0.indexOf(v122, v124) == -1 then
            v119:reportError(if v124 == v120 then ("Type %s cannot implement %s because it would create a circular reference."):format(v120.name, v121.name) else ("Type %s must implement %s because it is implemented by %s."):format(v120.name, v124.name, v121.name), l_Array_0.concat(v37(v121, v124), v37(v120, v121)));
        end;
    end;
end;
validateUnionMembers = function(v125, v126)
    local v127 = v126:getTypes();
    if #v127 == 0 then
        v125:reportError(("Union type %s must define one or more member types."):format(v126.name), v36(v126));
    end;
    local v128 = {};
    for _, v130 in ipairs(v127) do
        if not v128[tostring(v130.name)] then
            v128[tostring(v130.name)] = true;
            if not l_isObjectType_0(v130) then
                v125:reportError(("Union type %s can only include Object types, "):format(v126.name) .. ("it cannot include %s."):format(l_inspect_0(v130)), v39(v126, (tostring(v130))));
            end;
        else
            v125:reportError(("Union type %s can only include type %s once."):format(v126.name, v130.name), v39(v126, v130.name));
        end;
    end;
end;
v40 = function(v131, v132)
    local v133 = v132:getValues();
    if #v133 == 0 then
        v131:reportError(("Enum type %s must define one or more values."):format(v132.name), v36(v132));
    end;
    for _, v135 in ipairs(v133) do
        local l_name_4 = v135.name;
        v41(v131, v135);
        if not (l_name_4 ~= "true" and l_name_4 ~= "false") or l_name_4 == "null" then
            v131:reportError(("Enum type %s cannot include value: %s."):format(v132.name, l_name_4), v135.astNode);
        end;
    end;
end;
validateInputFields = function(v137, v138)
    local v139 = v138:getFields():values();
    if #v139 == 0 then
        v137:reportError(("Input Object type %s must define one or more fields."):format(v138.name), v36(v138));
    end;
    for _, v141 in ipairs(v139) do
        v41(v137, v141);
        if not l_isInputType_0(v141.type) then
            v137:reportError(("The type of %s.%s must be Input Type "):format(v138.name, v141.name) .. ("but got: %s."):format(l_inspect_0(v141.type)), if v141.astNode ~= nil then v141.astNode.type else nil);
        end;
        if not (not l_isRequiredInputField_0(v141) or not l_isNotNillish_0(v141.deprecationReason)) then
            v137:reportError(("Required input field %s.%s cannot be deprecated."):format(v138.name, v141.name), {
                v38(v141.astNode), 
                if v141.astNode ~= nil then v141.astNode.type else nil
            });
        end;
    end;
end;
createInputObjectCircularRefsValidator = function(v142)
    local v143 = {};
    local v144 = {};
    local v145 = {};
    local function v146(v147)
        if not v143[tostring(v147.name)] then
            v143[tostring(v147.name)] = true;
            v145[tostring(v147.name)] = #v144 + 1;
            for _, v149 in ipairs((v147:getFields():values())) do
                if not (not l_isNonNullType_0(v149.type) or not l_isInputObjectType_0(v149.type.ofType)) then
                    local l_ofType_0 = v149.type.ofType;
                    local v151 = v145[tostring(l_ofType_0.name)];
                    table.insert(v144, v149);
                    if v151 == nil then
                        v146(l_ofType_0);
                    else
                        local v152 = nil;
                        v152 = l_Array_0.slice(v144, v151);
                        v142:reportError(("Cannot reference Input Object \"%s\" within itself through a series of non-null fields: \"%s\"."):format(l_ofType_0.name, (l_Array_0.join(l_Array_0.map(v152, function(v153)
                            return v153.name;
                        end), "."))), l_Array_0.map(v152, function(v154)
                            return v154.astNode;
                        end));
                    end;
                    table.remove(v144);
                end;
            end;
            v145[tostring(v147.name)] = nil;
            return ;
        else
            return ;
        end;
    end;
    return v146;
end;
v36 = function(v155)
    local l_astNode_0 = v155.astNode;
    local l_extensionASTNodes_0 = v155.extensionASTNodes;
    if not l_astNode_0 then
        if not l_extensionASTNodes_0 then
            return {};
        else
            return l_extensionASTNodes_0;
        end;
    elseif not l_extensionASTNodes_0 then
        return {
            l_astNode_0
        };
    else
        return (l_Array_0.concat({
            l_astNode_0
        }, l_extensionASTNodes_0));
    end;
end;
v35 = function(v158, v159)
    local v160 = {};
    for _, v162 in ipairs(v36(v158)) do
        v160 = l_Array_0.concat(v160, v159(v162) or {});
    end;
    return v160;
end;
v37 = function(v163, v164)
    return l_Array_0.filter(v35(v163, function(v165)
        return v165.interfaces;
    end), function(v166)
        return v166.name.value == v164.name;
    end);
end;
v39 = function(v167, v168)
    return l_Array_0.filter(v35(v167, function(v169)
        return v169.types;
    end), function(v170)
        return v170.name.value == v168;
    end);
end;
v38 = function(v171)
    if v171 ~= nil and v171.directives ~= nil then
        return l_Array_0.find(v171.directives, function(v172)
            return v172.name.value == l_GraphQLDeprecatedDirective_0.name;
        end);
    else
        return ;
    end;
end;
return {
    validateSchema = v50, 
    assertValidSchema = v54
};
