local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Map_0 = v1.Map;
local _ = require(l_Parent_0.jsutils.ObjMap);
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_visit_0 = require(l_language_0.visitor).visit;
local _ = require(l_language_0.ast);
local _ = require(l_Parent_0.error.GraphQLError);
local v10 = require(l_Parent_0.utilities.TypeInfo);
local l_TypeInfo_0 = v10.TypeInfo;
local l_visitWithTypeInfo_0 = v10.visitWithTypeInfo;
local _ = require(l_Parent_0.type.schema);
local _ = require(l_Parent_0.type.directives);
local _ = require(l_Parent_0.type.definition);
local v16 = {};
local v17 = {
    __index = v16
};
v16.new = function(v18, v19)
    return (setmetatable({
        _ast = v18, 
        _fragments = nil, 
        _fragmentSpreads = {}, 
        _recursivelyReferencedFragments = {}, 
        _onError = v19
    }, v17));
end;
v16.reportError = function(v20, v21)
    v20._onError(v21);
end;
v16.getDocument = function(v22)
    return v22._ast;
end;
v16.getFragment = function(v23, v24)
    local v25 = nil;
    if not v23._fragments then
        v25 = {};
        for _, v27 in ipairs(v23:getDocument().definitions) do
            if v27.kind == l_Kind_0.FRAGMENT_DEFINITION then
                v25[v27.name.value] = v27;
            end;
        end;
        v23._fragments = v25;
    else
        v25 = v23._fragments;
    end;
    return v25[v24];
end;
v16.getFragmentSpreads = function(v28, v29)
    local v30 = v28._fragmentSpreads[v29] or {};
    if not v28._fragmentSpreads[v29] then
        local v31 = {
            v29
        };
        while #v31 ~= 0 do
            for _, v33 in ipairs(table.remove(v31).selections) do
                if v33.kind == l_Kind_0.FRAGMENT_SPREAD then
                    table.insert(v30, v33);
                elseif v33.selectionSet then
                    table.insert(v31, v33.selectionSet);
                end;
            end;
        end;
        v28._fragmentSpreads[v29] = v30;
    end;
    return v30;
end;
v16.getRecursivelyReferencedFragments = function(v34, v35)
    local v36 = v34._recursivelyReferencedFragments[v35] or {};
    if not v34._recursivelyReferencedFragments[v35] then
        local v37 = {};
        local v38 = {
            v35.selectionSet
        };
        while #v38 ~= 0 do
            for _, v40 in ipairs(v34:getFragmentSpreads((table.remove(v38)))) do
                local l_value_0 = v40.name.value;
                if v37[l_value_0] ~= true then
                    v37[l_value_0] = true;
                    local v42 = v34:getFragment(l_value_0);
                    if v42 then
                        table.insert(v36, v42);
                        table.insert(v38, v42.selectionSet);
                    end;
                end;
            end;
        end;
        v34._recursivelyReferencedFragments[v35] = v36;
    end;
    return v36;
end;
local v43 = setmetatable({}, {
    __index = v16
});
local v44 = {
    __index = v43
};
v43.new = function(v45, v46, v47)
    local v48 = v16.new(v45, v47);
    v48._schema = v46;
    return (setmetatable(v48, v44));
end;
v43.getSchema = function(v49)
    return v49._schema;
end;
local v50 = setmetatable({}, {
    __index = v16
});
local v51 = {
    __index = v50
};
v50.new = function(v52, v53, v54, v55)
    local v56 = v16.new(v53, v55);
    v56._schema = v52;
    v56._typeInfo = v54;
    v56._variableUsages = l_Map_0.new();
    v56._recursiveVariableUsages = l_Map_0.new();
    return (setmetatable(v56, v51));
end;
v50.getSchema = function(v57)
    return v57._schema;
end;
v50.getVariableUsages = function(v58, v59)
    local v60 = v58._variableUsages[v59];
    if not v60 then
        local v61 = {};
        local v62 = l_TypeInfo_0.new(v58._schema);
        l_visit_0(v59, l_visitWithTypeInfo_0(v62, {
            VariableDefinition = function()
                return false;
            end, 
            Variable = function(_, v64)
                table.insert(v61, {
                    node = v64, 
                    type = v62:getInputType(), 
                    defaultValue = v62:getDefaultValue()
                });
            end
        }));
        v60 = v61;
        v58._variableUsages[v59] = v60;
    end;
    return v60;
end;
v50.getRecursiveVariableUsages = function(v65, v66)
    local v67 = v65._recursiveVariableUsages[v66];
    if not v67 then
        v67 = v65:getVariableUsages(v66);
        for _, v69 in ipairs(v65:getRecursivelyReferencedFragments(v66)) do
            v67 = l_Array_0.concat(v67, v65:getVariableUsages(v69));
        end;
        v65._recursiveVariableUsages[v66] = v67;
    end;
    return v67;
end;
v50.getType = function(v70)
    return v70._typeInfo:getType();
end;
v50.getParentType = function(v71)
    return v71._typeInfo:getParentType();
end;
v50.getInputType = function(v72)
    return v72._typeInfo:getInputType();
end;
v50.getParentInputType = function(v73)
    return v73._typeInfo:getParentInputType();
end;
v50.getFieldDef = function(v74)
    return v74._typeInfo:getFieldDef();
end;
v50.getDirective = function(v75)
    return v75._typeInfo:getDirective();
end;
v50.getArgument = function(v76)
    return v76._typeInfo:getArgument();
end;
v50.getEnumValue = function(v77)
    return v77._typeInfo:getEnumValue();
end;
return {
    ASTValidationContext = v16, 
    SDLValidationContext = v43, 
    ValidationContext = v50
};
