local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local v2 = require(l_Parent_0.luaUtils.null);
local l_language_0 = l_Parent_0.language;
local l_type_0 = l_Parent_0.type;
local v5 = require(l_language_0.visitor);
local v6 = require(l_language_0.ast);
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_isNode_0 = v6.isNode;
local l_getVisitFn_0 = v5.getVisitFn;
local _ = require(l_type_0.schema);
local _ = require(l_type_0.directives);
local v12 = require(l_type_0.definition);
local l_isObjectType_0 = v12.isObjectType;
local l_isInterfaceType_0 = v12.isInterfaceType;
local l_isEnumType_0 = v12.isEnumType;
local l_isInputObjectType_0 = v12.isInputObjectType;
local l_isListType_0 = v12.isListType;
local l_isCompositeType_0 = v12.isCompositeType;
local l_isInputType_0 = v12.isInputType;
local l_isOutputType_0 = v12.isOutputType;
local l_getNullableType_0 = v12.getNullableType;
local l_getNamedType_0 = v12.getNamedType;
local v23 = require(l_type_0.introspection);
local l_SchemaMetaFieldDef_0 = v23.SchemaMetaFieldDef;
local l_TypeMetaFieldDef_0 = v23.TypeMetaFieldDef;
local l_TypeNameMetaFieldDef_0 = v23.TypeNameMetaFieldDef;
local l_typeFromAST_0 = require(l_Parent_0.utilities.typeFromAST).typeFromAST;
local function _(v28)
    if v28 == v2 then
        return nil;
    else
        return v28;
    end;
end;
local v30 = {};
local v31 = {
    __index = v30
};
local v32 = nil;
v30.new = function(v33, v34, v35)
    local v36 = setmetatable({}, v31);
    v36._schema = v33;
    v36._typeStack = {};
    v36._parentTypeStack = {};
    v36._inputTypeStack = {};
    v36._fieldDefStack = {};
    v36._defaultValueStack = {};
    v36._directive = nil;
    v36._argument = nil;
    v36._enumValue = nil;
    v36._getFieldDef = v34 or v32;
    if v35 then
        if l_isInputType_0(v35) then
            table.insert(v36._inputTypeStack, v35);
        end;
        if l_isCompositeType_0(v35) then
            table.insert(v36._parentTypeStack, v35);
        end;
        if l_isOutputType_0(v35) then
            table.insert(v36._typeStack, v35);
        end;
    end;
    return v36;
end;
v30.getType = function(v37)
    if #v37._typeStack > 0 then
        local v38 = v37._typeStack[#v37._typeStack];
        if v38 == v2 then
            return nil;
        else
            return v38;
        end;
    else
        return nil;
    end;
end;
v30.getParentType = function(v39)
    if #v39._parentTypeStack > 0 then
        local v40 = v39._parentTypeStack[#v39._parentTypeStack];
        if v40 == v2 then
            return nil;
        else
            return v40;
        end;
    else
        return nil;
    end;
end;
v30.getInputType = function(v41)
    if #v41._inputTypeStack > 0 then
        local v42 = v41._inputTypeStack[#v41._inputTypeStack];
        if v42 == v2 then
            return nil;
        else
            return v42;
        end;
    else
        return nil;
    end;
end;
v30.getParentInputType = function(v43)
    if #v43._inputTypeStack > 1 then
        local v44 = v43._inputTypeStack[#v43._inputTypeStack - 1];
        if v44 == v2 then
            return nil;
        else
            return v44;
        end;
    else
        return nil;
    end;
end;
v30.getFieldDef = function(v45)
    if #v45._fieldDefStack > 0 then
        local v46 = v45._fieldDefStack[#v45._fieldDefStack];
        if v46 == v2 then
            return nil;
        else
            return v46;
        end;
    else
        return nil;
    end;
end;
v30.getDefaultValue = function(v47)
    if #v47._defaultValueStack > 0 then
        local v48 = v47._defaultValueStack[#v47._defaultValueStack];
        if v48 == v2 then
            return nil;
        else
            return v48;
        end;
    else
        return nil;
    end;
end;
v30.getDirective = function(v49)
    return v49._directive;
end;
v30.getArgument = function(v50)
    return v50._argument;
end;
v30.getEnumValue = function(v51)
    return v51._enumValue;
end;
v30.enter = function(v52, v53)
    local l__schema_0 = v52._schema;
    local l_kind_0 = v53.kind;
    if l_kind_0 == l_Kind_0.SELECTION_SET then
        local v56 = l_getNamedType_0(v52:getType());
        table.insert(v52._parentTypeStack, if not l_isCompositeType_0(v56) then v2 else v56);
        return ;
    elseif l_kind_0 == l_Kind_0.FIELD then
        local v57 = v52:getParentType();
        local v58 = nil;
        local v59 = nil;
        if v57 then
            v58 = v52._getFieldDef(l__schema_0, v57, v53);
            if v58 then
                v59 = v58.type;
            end;
        end;
        table.insert(v52._fieldDefStack, if not v58 then v2 else v58);
        table.insert(v52._typeStack, if not l_isOutputType_0(v59) then v2 else v59);
        return ;
    elseif l_kind_0 == l_Kind_0.DIRECTIVE then
        v52._directive = l__schema_0:getDirective(v53.name.value);
        return ;
    elseif l_kind_0 == l_Kind_0.OPERATION_DEFINITION then
        local v60 = nil;
        local l_operation_0 = v53.operation;
        if l_operation_0 == "query" then
            v60 = l__schema_0:getQueryType();
        elseif l_operation_0 == "mutation" then
            v60 = l__schema_0:getMutationType();
        elseif l_operation_0 == "subscription" then
            v60 = l__schema_0:getSubscriptionType();
        end;
        table.insert(v52._typeStack, if not l_isObjectType_0(v60) then v2 else v60);
        return ;
    elseif not (l_kind_0 ~= l_Kind_0.INLINE_FRAGMENT) or l_kind_0 == l_Kind_0.FRAGMENT_DEFINITION then
        local l_typeCondition_0 = v53.typeCondition;
        local v63 = if not l_typeCondition_0 then l_getNamedType_0(v52:getType()) else l_typeFromAST_0(l__schema_0, l_typeCondition_0);
        table.insert(v52._typeStack, if not l_isOutputType_0(v63) then v2 else v63);
        return ;
    elseif l_kind_0 == l_Kind_0.VARIABLE_DEFINITION then
        local v64 = l_typeFromAST_0(l__schema_0, v53.type);
        table.insert(v52._inputTypeStack, if not l_isInputType_0(v64) then v2 else v64);
        return ;
    elseif l_kind_0 == l_Kind_0.ARGUMENT then
        local v65 = nil;
        local v66 = nil;
        local v67 = v52:getDirective() or v52:getFieldDef();
        if v67 then
            v65 = l_Array_0.find(v67.args, function(v68)
                return v68.name == v53.name.value;
            end);
            if v65 then
                v66 = v65.type;
            end;
        end;
        v52._argument = v65;
        table.insert(v52._defaultValueStack, if not v65 then v2 else v65.defaultValue);
        table.insert(v52._inputTypeStack, if not l_isInputType_0(v66) then v2 else v66);
        return ;
    elseif l_kind_0 == l_Kind_0.LIST then
        local v69 = l_getNullableType_0(v52:getInputType());
        local v70 = if not l_isListType_0(v69) then v69 else v69.ofType;
        table.insert(v52._defaultValueStack, v2);
        table.insert(v52._inputTypeStack, if not l_isInputType_0(v70) then v2 else v70);
        return ;
    elseif l_kind_0 == l_Kind_0.OBJECT_FIELD then
        local v71 = l_getNamedType_0(v52:getInputType());
        local v72 = nil;
        local v73 = nil;
        if l_isInputObjectType_0(v71) then
            v73 = v71:getFields():get(v53.name.value);
            if v73 then
                v72 = v73.type;
            end;
        end;
        table.insert(v52._defaultValueStack, if not v73 then v2 else v73.defaultValue);
        table.insert(v52._inputTypeStack, if not l_isInputType_0(v72) then v2 else v72);
        return ;
    elseif l_kind_0 == l_Kind_0.ENUM then
        local v74 = l_getNamedType_0(v52:getInputType());
        local v75 = nil;
        if l_isEnumType_0(v74) then
            v75 = v74:getValue(v53.value);
        end;
        v52._enumValue = v75;
        return ;
    else
        return ;
    end;
end;
v30.leave = function(v76, v77)
    local l_kind_1 = v77.kind;
    if l_kind_1 == l_Kind_0.SELECTION_SET then
        table.remove(v76._parentTypeStack);
        return ;
    elseif l_kind_1 == l_Kind_0.FIELD then
        table.remove(v76._fieldDefStack);
        table.remove(v76._typeStack);
        return ;
    elseif l_kind_1 == l_Kind_0.DIRECTIVE then
        v76._directive = nil;
        return ;
    elseif not (l_kind_1 ~= l_Kind_0.OPERATION_DEFINITION and l_kind_1 ~= l_Kind_0.INLINE_FRAGMENT) or l_kind_1 == l_Kind_0.FRAGMENT_DEFINITION then
        table.remove(v76._typeStack);
        return ;
    elseif l_kind_1 == l_Kind_0.VARIABLE_DEFINITION then
        table.remove(v76._inputTypeStack);
        return ;
    elseif l_kind_1 == l_Kind_0.ARGUMENT then
        v76._argument = nil;
        table.remove(v76._defaultValueStack);
        table.remove(v76._inputTypeStack);
        return ;
    elseif not (l_kind_1 ~= l_Kind_0.LIST) or l_kind_1 == l_Kind_0.OBJECT_FIELD then
        table.remove(v76._defaultValueStack);
        table.remove(v76._inputTypeStack);
        return ;
    else
        if l_kind_1 == l_Kind_0.ENUM then
            v76._enumValue = nil;
        end;
        return ;
    end;
end;
v32 = function(v79, v80, v81)
    local l_value_0 = v81.name.value;
    if l_value_0 == l_SchemaMetaFieldDef_0.name and v79:getQueryType() == v80 then
        return l_SchemaMetaFieldDef_0;
    elseif l_value_0 == l_TypeMetaFieldDef_0.name and v79:getQueryType() == v80 then
        return l_TypeMetaFieldDef_0;
    elseif not (l_value_0 == l_TypeNameMetaFieldDef_0.name) or not l_isCompositeType_0(v80) then
        if not l_isObjectType_0(v80) and not l_isInterfaceType_0(v80) then
            return nil;
        else
            return v80:getFields():get(l_value_0);
        end;
    else
        return l_TypeNameMetaFieldDef_0;
    end;
end;
return {
    TypeInfo = v30, 
    visitWithTypeInfo = function(v83, v84)
        return {
            enter = function(_, v86, ...)
                v83:enter(v86);
                local v87 = l_getVisitFn_0(v84, v86.kind, false);
                if not v87 then
                    return nil;
                else
                    local v88 = v87(v84, v86, ...);
                    if v88 ~= nil then
                        v83:leave(v86);
                        if l_isNode_0(v88) then
                            v83:enter(v88);
                        end;
                    end;
                    return v88;
                end;
            end, 
            leave = function(_, v90, ...)
                local v91 = l_getVisitFn_0(v84, v90.kind, true);
                local v92 = nil;
                if v91 then
                    v92 = v91(v84, v90, ...);
                end;
                v83:leave(v90);
                return v92;
            end
        };
    end
};
