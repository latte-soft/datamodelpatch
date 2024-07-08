local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v5 = {};
local _ = require(script.Parent["merge-typedefs_types"]);
local _ = require(l_Parent_0.GraphQL);
local v8 = require(script.Parent.utils);
local l_extractType_0 = v8.extractType;
local l_isWrappingTypeNode_0 = v8.isWrappingTypeNode;
local l_isListTypeNode_0 = v8.isListTypeNode;
local l_isNonNullTypeNode_0 = v8.isNonNullTypeNode;
local l_printTypeNode_0 = v8.printTypeNode;
local l_mergeDirectives_0 = require(script.Parent.directives).mergeDirectives;
local l_compareNodes_0 = require(l_Parent_0.Utils).compareNodes;
local l_mergeArguments_0 = require(script.Parent.arguments).mergeArguments;
local v17 = nil;
local v18 = nil;
local function v26(v19, v20, v21)
    local v23 = l_Array_0.find(v19, function(v22)
        return v22.name.value == v20.name.value;
    end);
    if not (not v23 or v21 and l_Boolean_0.toJSBoolean(v21.ignoreFieldConflicts)) then
        local v24 = l_extractType_0(v23.type);
        local v25 = l_extractType_0(v20.type);
        if v24.name.value ~= v25.name.value then
            error(l_Error_0.new(("Field \"%s\" already defined with a different type. Declared as \"%s\", but you tried to override with \"%s\""):format(tostring(v20.name.value), tostring(v24.name.value), (tostring(v25.name.value)))));
        end;
    end;
    return not not l_Boolean_0.toJSBoolean(v23);
end;
v5.mergeFields = function(v27, v28, v29, v30)
    local v31 = {};
    if v29 ~= nil then
        v31 = l_Array_0.concat(v31, v29);
    end;
    if v28 ~= nil then
        for _, v33 in v28, nil, nil do
            if not l_Boolean_0.toJSBoolean((v26(v31, v33, v30))) then
                table.insert(v31, v33);
            else
                local v35 = l_Array_0.find(v31, function(v34)
                    return v34.name.value == v33.name.value;
                end);
                if not (v30 and l_Boolean_0.toJSBoolean(v30.ignoreFieldConflicts)) then
                    if not v30 or not l_Boolean_0.toJSBoolean(v30.throwOnConflict) then
                        v17(v27, v35, v33, true);
                    else
                        v17(v27, v35, v33, false);
                    end;
                    local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
                    local v37 = l_isNonNullTypeNode_0(v33.type);
                    if l_toJSBoolean_0(if not l_Boolean_0.toJSBoolean(v37) then v37 else not l_Boolean_0.toJSBoolean(l_isNonNullTypeNode_0(v35.type))) then
                        v35.type = v33.type;
                    end;
                end;
                v35.arguments = l_mergeArguments_0(if not l_Boolean_0.toJSBoolean(v33.arguments) then {} else v33.arguments, if not l_Boolean_0.toJSBoolean(v35.arguments) then {} else v35.arguments, v30);
                v35.directives = l_mergeDirectives_0(v33.directives, v35.directives, v30);
                v35.description = if not l_Boolean_0.toJSBoolean(v33.description) then v35.description else v33.description;
            end;
        end;
    end;
    if not (not v30 or not l_Boolean_0.toJSBoolean(v30.sort)) then
        l_Array_0.sort(v31, l_compareNodes_0);
    end;
    if not v30 or not v30.exclusions then
        return v31;
    else
        local l_exclusions_0 = v30.exclusions;
        return l_Array_0.filter(v31, function(v39)
            return not l_Boolean_0.toJSBoolean(l_Array_0.includes(l_exclusions_0, ("%s.%s"):format(tostring(v27.name.value), (tostring(v39.name.value)))));
        end);
    end;
end;
v17 = function(v40, v41, v42, v43)
    local v44 = if v43 ~= nil then v43 else false;
    local v45 = l_printTypeNode_0(v41.type);
    local v46 = l_printTypeNode_0(v42.type);
    if not (not (v45 ~= v46) or l_Boolean_0.toJSBoolean(v18(v41.type, v42.type, v44))) then
        error(l_Error_0.new(("Field '%s.%s' changed type from '%s' to '%s'"):format(tostring(v40.name.value), tostring(v41.name.value), tostring(v45), (tostring(v46)))));
    end;
end;
v18 = function(v47, v48, v49)
    local v50 = if v49 ~= nil then v49 else false;
    if l_Boolean_0.toJSBoolean(l_isWrappingTypeNode_0(v47)) or l_Boolean_0.toJSBoolean(l_isWrappingTypeNode_0(v48)) then
        if not l_Boolean_0.toJSBoolean(l_isNonNullTypeNode_0(v48)) then
            if not l_Boolean_0.toJSBoolean(l_isNonNullTypeNode_0(v47)) then
                if not l_Boolean_0.toJSBoolean(l_isListTypeNode_0(v47)) then
                    return false;
                else
                    return not not l_isListTypeNode_0(v48) and v18(v47.type, v48.type) or l_isNonNullTypeNode_0(v48) and v18(v47, v48.type);
                end;
            else
                return v18(v48, v47, v50);
            end;
        else
            return v18(if not l_Boolean_0.toJSBoolean(l_isNonNullTypeNode_0(v47)) then v47 else v47.type, v48.type);
        end;
    elseif ((typeof(v47) == "table" and #v47 == 0) and typeof(v48) == "table") and #v48 == 0 then
        return true;
    else
        return tostring(v47) == tostring(v48);
    end;
end;
return v5;
