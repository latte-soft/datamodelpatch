local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local _ = require(l_Parent_0.language.ast);
local l_isNode_0 = require(script.Parent.ast).isNode;
local v7 = {
    Name = {}, 
    Document = {
        "definitions"
    }, 
    OperationDefinition = {
        "name", 
        "variableDefinitions", 
        "directives", 
        "selectionSet"
    }, 
    VariableDefinition = {
        "variable", 
        "type", 
        "defaultValue", 
        "directives"
    }, 
    Variable = {
        "name"
    }, 
    SelectionSet = {
        "selections"
    }, 
    Field = {
        "alias", 
        "name", 
        "arguments", 
        "directives", 
        "selectionSet"
    }, 
    Argument = {
        "name", 
        "value"
    }, 
    FragmentSpread = {
        "name", 
        "directives"
    }, 
    InlineFragment = {
        "typeCondition", 
        "directives", 
        "selectionSet"
    }, 
    FragmentDefinition = {
        "name", 
        "variableDefinitions", 
        "typeCondition", 
        "directives", 
        "selectionSet"
    }, 
    IntValue = {}, 
    FloatValue = {}, 
    StringValue = {}, 
    BooleanValue = {}, 
    NullValue = {}, 
    EnumValue = {}, 
    ListValue = {
        "values"
    }, 
    ObjectValue = {
        "fields"
    }, 
    ObjectField = {
        "name", 
        "value"
    }, 
    Directive = {
        "name", 
        "arguments"
    }, 
    NamedType = {
        "name"
    }, 
    ListType = {
        "type"
    }, 
    NonNullType = {
        "type"
    }, 
    SchemaDefinition = {
        "description", 
        "directives", 
        "operationTypes"
    }, 
    OperationTypeDefinition = {
        "type"
    }, 
    ScalarTypeDefinition = {
        "description", 
        "name", 
        "directives"
    }, 
    ObjectTypeDefinition = {
        "description", 
        "name", 
        "interfaces", 
        "directives", 
        "fields"
    }, 
    FieldDefinition = {
        "description", 
        "name", 
        "arguments", 
        "type", 
        "directives"
    }, 
    InputValueDefinition = {
        "description", 
        "name", 
        "type", 
        "defaultValue", 
        "directives"
    }, 
    InterfaceTypeDefinition = {
        "description", 
        "name", 
        "interfaces", 
        "directives", 
        "fields"
    }, 
    UnionTypeDefinition = {
        "description", 
        "name", 
        "directives", 
        "types"
    }, 
    EnumTypeDefinition = {
        "description", 
        "name", 
        "directives", 
        "values"
    }, 
    EnumValueDefinition = {
        "description", 
        "name", 
        "directives"
    }, 
    InputObjectTypeDefinition = {
        "description", 
        "name", 
        "directives", 
        "fields"
    }, 
    DirectiveDefinition = {
        "description", 
        "name", 
        "arguments", 
        "locations"
    }, 
    SchemaExtension = {
        "directives", 
        "operationTypes"
    }, 
    ScalarTypeExtension = {
        "name", 
        "directives"
    }, 
    ObjectTypeExtension = {
        "name", 
        "interfaces", 
        "directives", 
        "fields"
    }, 
    InterfaceTypeExtension = {
        "name", 
        "interfaces", 
        "directives", 
        "fields"
    }, 
    UnionTypeExtension = {
        "name", 
        "directives", 
        "types"
    }, 
    EnumTypeExtension = {
        "name", 
        "directives", 
        "values"
    }, 
    InputObjectTypeExtension = {
        "name", 
        "directives", 
        "fields"
    }
};
local v8 = l_Object_0.freeze({});
local v9 = require(l_Parent_0.luaUtils.null);
local v10 = nil;
local v11 = nil;
local function v35(v12, v13, v14)
    local v15 = v14 or v7;
    local v16 = nil;
    local v17 = l_Array_0.isArray(v12);
    local v18 = {
        v12
    };
    local v19 = 0;
    local v20 = {};
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = {};
    local v25 = {};
    local l_v12_0 = v12;
    while true do
        v19 = v19 + 1;
        local v27 = v19 == #v18 + 1;
        local v28 = v27 and #v20 ~= 0;
        local v29;
        if not v27 then
            v22 = if not v23 then nil else if v17 then v19 else v18[v19];
            v21 = if not v23 then l_v12_0 else v23[v22];
            if v21 ~= nil and v21 ~= v9 then
                if v23 then
                    table.insert(v24, v22);
                end;
            else
                goto label0;
            end;
        else
            v22 = if #v25 == 0 then nil else v24[#v24];
            v21 = v23;
            v23 = table.remove(v25);
            if v28 then
                if not v17 then
                    v29 = {};
                    for v30 in pairs(v21) do
                        v29[v30] = v21[v30];
                    end;
                    v21 = v29;
                else
                    v21 = l_Array_0.slice(v21);
                end;
                v29 = 0;
                for v31 = 1, #v20 do
                    local v32 = v20[v31][1];
                    local v33 = v20[v31][2];
                    if v17 then
                        v32 = v32 - v29;
                    end;
                    if v17 and v33 == nil then
                        l_Array_0.splice(v21, v32, 1);
                        v29 = v29 + 1;
                    else
                        v21[v32] = v33;
                    end;
                end;
            end;
            v19 = v16.index;
            v18 = v16.keys;
            v20 = v16.edits;
            v17 = v16.inArray;
            v16 = v16.prev;
        end;
        v29 = nil;
        if not l_Array_0.isArray(v21) then
            if not l_isNode_0(v21) then
                error("Invalid AST Node: " .. l_inspect_0(v21) .. ".");
            end;
            local v34 = v11(v13, v21.kind, v27);
            if v34 then
                v29 = v34(v13, v21, v22, v23, v24, v25);
                if v29 ~= v8 then
                    if v29 == false then
                        if not v27 then
                            table.remove(v24);
                            goto label0 --[[  true, true  ]];
                        end;
                    elseif not (v29 == nil) or v29 == v9 then
                        if v29 == v9 then
                            v29 = nil;
                        end;
                        table.insert(v20, {
                            v22, 
                            v29
                        });
                        if not v27 then
                            if not l_isNode_0(v29) then
                                table.remove(v24);
                                goto label0 --[[  true, true  ]];
                            else
                                v21 = v29;
                            end;
                        end;
                    end;
                else
                    break;
                end;
            end;
        end;
        if not (not (v29 == nil) or not v28) then
            table.insert(v20, {
                v22, 
                v21
            });
        end;
        if not v27 then
            v16 = {
                inArray = v17, 
                index = v19, 
                keys = v18, 
                edits = v20, 
                prev = v16
            };
            v17 = l_Array_0.isArray(v21);
            v18 = if not v17 then v15[v21.kind] or {} else v21;
            v19 = 0;
            v20 = {};
            if v23 then
                table.insert(v25, v23);
            end;
            v23 = v21;
        else
            table.remove(v24);
        end;
        ::label0::;
        if not (v16 ~= nil) then
            break;
        end;
    end;
    if #v20 ~= 0 then
        l_v12_0 = v20[#v20][2];
    end;
    return l_v12_0;
end;
v10 = function(v36)
    local v37 = {};
    return {
        enter = function(_, v39, ...)
            for v40 = 1, #v36 do
                if v37[v40] == nil then
                    local v41 = v11(v36[v40], v39.kind, false);
                    if v41 then
                        local v42 = v41(v36[v40], v39, ...);
                        if v42 == false then
                            v37[v40] = v39;
                        elseif v42 == v8 then
                            v37[v40] = v8;
                        elseif v42 ~= nil then
                            return v42;
                        end;
                    end;
                end;
            end;
        end, 
        leave = function(_, ...)
            local v44 = ...;
            for v45 = 1, #v36 do
                if v37[v45] == nil then
                    local v46 = v11(v36[v45], v44.kind, true);
                    if v46 then
                        local v47 = v46(v36[v45], ...);
                        if v47 == v8 then
                            v37[v45] = v8;
                        elseif v47 ~= nil and v47 ~= false then
                            return v47;
                        end;
                    end;
                elseif v37[v45] == v44 then
                    v37[v45] = nil;
                end;
            end;
        end
    };
end;
v11 = function(v48, v49, v50)
    local v51 = v48[v49];
    if not v51 then
        local v52 = nil;
        v52 = if not v50 then v48.enter else v48.leave;
        if v52 then
            if type(v52) == "function" then
                return v52;
            else
                local v53 = v52[v49];
                if type(v53) == "function" then
                    return v53;
                end;
            end;
        end;
    elseif not v50 and type(v51) == "function" then
        return v51;
    else
        local v54 = nil;
        if typeof(v51) ~= "function" then
            v54 = if not v50 then v51.enter else v51.leave;
        end;
        if type(v54) == "function" then
            return v54;
        end;
    end;
end;
return {
    BREAK = v8, 
    REMOVE = v9, 
    visit = v35, 
    visitInParallel = v10, 
    getVisitFn = v11, 
    QueryDocumentKeys = v7
};
