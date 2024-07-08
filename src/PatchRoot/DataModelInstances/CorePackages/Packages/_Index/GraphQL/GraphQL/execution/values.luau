local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local v2 = require(l_Parent_0.luaUtils.null);
local l_isNillish_0 = require(l_Parent_0.luaUtils.isNillish).isNillish;
local _ = require(l_Parent_0.jsutils.ObjMap);
local l_keyMap_0 = require(l_Parent_0.jsutils.keyMap).keyMap;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_printPathArray_0 = require(l_Parent_0.jsutils.printPathArray).printPathArray;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local _ = require(l_language_0.ast);
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_print_0 = require(l_language_0.printer).print;
local l_type_0 = l_Parent_0.type;
local _ = require(l_type_0.schema);
local _ = require(l_type_0.definition);
local _ = require(l_type_0.directives);
local v17 = require(l_Parent_0.type.definition);
local l_isInputType_0 = v17.isInputType;
local l_isNonNullType_0 = v17.isNonNullType;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
local l_valueFromAST_0 = require(l_Parent_0.utilities.valueFromAST).valueFromAST;
local l_coerceInputValue_0 = require(l_Parent_0.utilities.coerceInputValue).coerceInputValue;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
v23 = function(v28, v29, v30, v31)
    local v32 = {};
    local v33 = nil;
    if v31 ~= nil then
        v33 = v31.maxErrors;
    end;
    local l_status_0, l_result_0 = pcall(v24, v28, v29, v30, function(v34)
        if v33 ~= nil and v33 <= #v32 then
            error(l_GraphQLError_0.new("Too many errors processing variables, error limit reached. Execution aborted."));
        end;
        table.insert(v32, v34);
    end);
    if not l_status_0 then
        table.insert(v32, l_result_0);
    end;
    if #v32 == 0 then
        return {
            coerced = l_result_0
        };
    else
        return {
            errors = v32
        };
    end;
end;
v24 = function(v37, v38, v39, v40)
    local v41 = {};
    for _, v43 in ipairs(v38) do
        local l_value_0 = v43.variable.name.value;
        local v45 = l_typeFromAST_0(v37, v43.type);
        if l_isInputType_0(v45) then
            if v27(v39, l_value_0) then
                local v46 = v39[l_value_0];
                if not (v46 == v2) or not l_isNonNullType_0(v45) then
                    v41[l_value_0] = l_coerceInputValue_0(v46, v45, function(v47, v48, v49)
                        local v50 = ("Variable \"$%s\" got invalid value "):format(l_value_0) .. l_inspect_0(v48);
                        if #v47 > 0 then
                            v50 = v50 .. (" at \"%s%s\""):format(l_value_0, l_printPathArray_0(v47));
                        end;
                        v40(l_GraphQLError_0.new(v50 .. "; " .. v49.message, v43, nil, nil, nil, v49.originalError));
                    end);
                else
                    v40(l_GraphQLError_0.new(("Variable \"$%s\" of non-null type \"%s\" must not be null."):format(l_value_0, (l_inspect_0(v45))), v43));
                end;
            elseif not v43.defaultValue then
                if l_isNonNullType_0(v45) then
                    v40(l_GraphQLError_0.new(("Variable \"$%s\" of required type \"%s\" was not provided."):format(l_value_0, (l_inspect_0(v45))), v43));
                end;
            else
                v41[l_value_0] = l_valueFromAST_0(v43.defaultValue, v45);
            end;
        else
            v40(l_GraphQLError_0.new(("Variable \"$%s\" expected value of type \"%s\" which cannot be used as an input type."):format(l_value_0, (l_print_0(v43.type))), v43.type));
        end;
    end;
    return v41;
end;
v25 = function(v51, v52, v53)
    local v54 = {};
    local v56 = l_keyMap_0(if not v52.arguments then {} else v52.arguments, function(v55)
        return v55.name.value;
    end);
    for _, v58 in ipairs(v51.args) do
        local l_name_0 = v58.name;
        local l_type_1 = v58.type;
        local v61 = v56[l_name_0];
        if v61 then
            local l_value_1 = v61.value;
            local v63 = l_value_1.kind == l_Kind_0.NULL;
            if l_value_1.kind == l_Kind_0.VARIABLE then
                local l_value_2 = l_value_1.name.value;
                if v53 ~= nil and v27(v53, l_value_2) then
                    v63 = l_isNillish_0(v53[l_value_2]);
                elseif v58.defaultValue ~= nil then
                    v54[l_name_0] = v58.defaultValue;
                    continue;
                elseif l_isNonNullType_0(l_type_1) then
                    error(l_GraphQLError_0.new(("Argument \"%s\" of required type \"%s\" "):format(l_name_0, l_inspect_0(l_type_1)) .. ("was provided the variable \"$%s\" which was not provided a runtime value."):format(l_value_2), l_value_1));
                    continue;
                else
                    continue;
                end;
            end;
            if not (not v63 or not l_isNonNullType_0(l_type_1)) then
                error(l_GraphQLError_0.new(("Argument \"%s\" of non-null type \"%s\" "):format(l_name_0, l_inspect_0(l_type_1)) .. "must not be null.", l_value_1));
            end;
            local v65 = l_valueFromAST_0(l_value_1, l_type_1, v53);
            if v65 == nil then
                error(l_GraphQLError_0.new(("Argument \"%s\" has invalid value %s."):format(l_name_0, l_print_0(l_value_1)), l_value_1));
            end;
            v54[l_name_0] = v65;
        elseif v58.defaultValue ~= nil then
            v54[l_name_0] = v58.defaultValue;
        elseif l_isNonNullType_0(l_type_1) then
            error(l_GraphQLError_0.new(("Argument \"%s\" of required type \"%s\" "):format(l_name_0, l_inspect_0(l_type_1)) .. "was not provided.", v52));
        end;
    end;
    return v54;
end;
v26 = function(v66, v67, v68)
    local v70 = if not v67.directives then nil else l_Array_0.find(v67.directives, function(v69)
        return v69.name.value == v66.name;
    end);
    if not v70 then
        return nil;
    else
        return v25(v66, v70, v68);
    end;
end;
v27 = function(v71, v72)
    return v71[v72] ~= nil;
end;
return {
    getVariableValues = v23, 
    getArgumentValues = v25, 
    getDirectiveValues = v26
};
