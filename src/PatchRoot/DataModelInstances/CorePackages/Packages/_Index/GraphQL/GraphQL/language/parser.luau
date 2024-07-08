local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.Parent.LuauPolyfill);
local _ = require(l_Parent_1.error);
local v4 = require(l_Parent_0.tokenKind);
local l_Location_0 = require(l_Parent_0.ast).Location;
local l_Source_0 = require(l_Parent_0.source).Source;
local v7 = require(l_Parent_0.lexer);
local l_Lexer_0 = v7.Lexer;
local l_isPunctuatorTokenKind_0 = v7.isPunctuatorTokenKind;
local l_TokenKind_0 = v4.TokenKind;
local l_DirectiveLocation_0 = require(l_Parent_0.directiveLocation).DirectiveLocation;
local l_Kind_0 = require(l_Parent_0.kinds).Kind;
local l_syntaxError_0 = require(script.Parent.Parent.error.syntaxError).syntaxError;
local v14 = nil;
local v15 = nil;
local v16 = {};
v16.__index = v16;
local function v19(v17, v18)
    return v16.new(v17, v18):parseDocument();
end;
local function v24(v20, v21)
    local v22 = v16.new(v20, v21);
    v22:expectToken(l_TokenKind_0.SOF);
    local v23 = v22:parseValueLiteral(false);
    v22:expectToken(l_TokenKind_0.EOF);
    return v23;
end;
local function v29(v25, v26)
    local v27 = v16.new(v25, v26);
    v27:expectToken(l_TokenKind_0.SOF);
    local v28 = v27:parseTypeReference();
    v27:expectToken(l_TokenKind_0.EOF);
    return v28;
end;
v16.new = function(v30, v31)
    local _ = nil;
    return (setmetatable({
        _lexer = l_Lexer_0.new(if typeof(v30) == "string" then l_Source_0.new(v30) else v30), 
        _options = v31
    }, v16));
end;
v16.parseName = function(v33)
    local v34 = v33:expectToken(l_TokenKind_0.NAME);
    return {
        kind = l_Kind_0.NAME, 
        value = v34.value, 
        loc = v33:loc(v34)
    };
end;
v16.parseDocument = function(v35)
    return {
        kind = l_Kind_0.DOCUMENT, 
        definitions = v35:many(l_TokenKind_0.SOF, v35.parseDefinition, l_TokenKind_0.EOF), 
        loc = v35:loc(v35._lexer.token)
    };
end;
v16.parseDefinition = function(v36)
    if not v36:peek(l_TokenKind_0.NAME) then
        if not v36:peek(l_TokenKind_0.BRACE_L) then
            if v36:peekDescription() then
                return v36:parseTypeSystemDefinition();
            end;
        else
            return v36:parseOperationDefinition();
        end;
    else
        local l_value_0 = v36._lexer.token.value;
        if not (l_value_0 ~= "query" and l_value_0 ~= "mutation") or l_value_0 == "subscription" then
            return v36:parseOperationDefinition();
        elseif l_value_0 == "fragment" then
            return v36:parseFragmentDefinition();
        elseif not ((((((l_value_0 ~= "schema" and l_value_0 ~= "scalar") and l_value_0 ~= "type") and l_value_0 ~= "interface") and l_value_0 ~= "union") and l_value_0 ~= "enum") and l_value_0 ~= "input") or l_value_0 == "directive" then
            return v36:parseTypeSystemDefinition();
        elseif l_value_0 == "extend" then
            return v36:parseTypeSystemExtension();
        end;
    end;
    error(v36:unexpected());
end;
v16.parseOperationDefinition = function(v38)
    local l_token_0 = v38._lexer.token;
    if not v38:peek(l_TokenKind_0.BRACE_L) then
        local v40 = v38:parseOperationType();
        local v41 = nil;
        if v38:peek(l_TokenKind_0.NAME) then
            v41 = v38:parseName();
        end;
        return {
            kind = l_Kind_0.OPERATION_DEFINITION, 
            operation = v40, 
            name = v41, 
            variableDefinitions = v38:parseVariableDefinitions(), 
            directives = v38:parseDirectives(false), 
            selectionSet = v38:parseSelectionSet(), 
            loc = v38:loc(l_token_0)
        };
    else
        return {
            kind = l_Kind_0.OPERATION_DEFINITION, 
            operation = "query", 
            name = nil, 
            variableDefinitions = {}, 
            directives = {}, 
            selectionSet = v38:parseSelectionSet(), 
            loc = v38:loc(l_token_0)
        };
    end;
end;
v16.parseOperationType = function(v42)
    local v43 = v42:expectToken(l_TokenKind_0.NAME);
    if v43.value == "query" then
        return "query";
    elseif v43.value == "mutation" then
        return "mutation";
    elseif v43.value == "subscription" then
        return "subscription";
    else
        error(v42:unexpected(v43));
        return ;
    end;
end;
v16.parseVariableDefinitions = function(v44)
    return v44:optionalMany(l_TokenKind_0.PAREN_L, v44.parseVariableDefinition, l_TokenKind_0.PAREN_R);
end;
v16.parseVariableDefinition = function(v45)
    local l_token_1 = v45._lexer.token;
    local v47 = v45:parseVariable();
    v45:expectToken(l_TokenKind_0.COLON);
    return {
        kind = l_Kind_0.VARIABLE_DEFINITION, 
        variable = v47, 
        type = v45:parseTypeReference(), 
        defaultValue = if not v45:expectOptionalToken(l_TokenKind_0.EQUALS) then nil else v45:parseValueLiteral(true), 
        directives = v45:parseDirectives(true), 
        loc = v45:loc(l_token_1)
    };
end;
v16.parseVariable = function(v48)
    local l_token_2 = v48._lexer.token;
    v48:expectToken(l_TokenKind_0.DOLLAR);
    return {
        kind = l_Kind_0.VARIABLE, 
        name = v48:parseName(), 
        loc = v48:loc(l_token_2)
    };
end;
v16.parseSelectionSet = function(v50)
    return {
        kind = l_Kind_0.SELECTION_SET, 
        selections = v50:many(l_TokenKind_0.BRACE_L, v50.parseSelection, l_TokenKind_0.BRACE_R), 
        loc = v50:loc(v50._lexer.token)
    };
end;
v16.parseSelection = function(v51)
    if not v51:peek(l_TokenKind_0.SPREAD) then
        return v51:parseField();
    else
        return v51:parseFragment();
    end;
end;
v16.parseField = function(v52)
    local l_token_3 = v52._lexer.token;
    local v54 = v52:parseName();
    local v55 = nil;
    local v56 = nil;
    if not v52:expectOptionalToken(l_TokenKind_0.COLON) then
        v56 = v54;
    else
        v55 = v54;
        v56 = v52:parseName();
    end;
    return {
        kind = l_Kind_0.FIELD, 
        alias = v55, 
        name = v56, 
        arguments = v52:parseArguments(false), 
        directives = v52:parseDirectives(false), 
        selectionSet = not not v52:peek(l_TokenKind_0.BRACE_L) and v52:parseSelectionSet() or nil, 
        loc = v52:loc(l_token_3)
    };
end;
v16.parseArguments = function(v57, v58)
    local _ = nil;
    return v57:optionalMany(l_TokenKind_0.PAREN_L, if not v58 then v57.parseArgument else v57.parseConstArgument, l_TokenKind_0.PAREN_R);
end;
v16.parseArgument = function(v60)
    local l_token_4 = v60._lexer.token;
    local v62 = v60:parseName();
    v60:expectToken(l_TokenKind_0.COLON);
    return {
        kind = l_Kind_0.ARGUMENT, 
        name = v62, 
        value = v60:parseValueLiteral(false), 
        loc = v60:loc(l_token_4)
    };
end;
v16.parseConstArgument = function(v63)
    local l_token_5 = v63._lexer.token;
    local v65 = v63:parseName();
    v63:expectToken(l_TokenKind_0.COLON);
    return {
        kind = l_Kind_0.ARGUMENT, 
        name = v65, 
        value = v63:parseValueLiteral(true), 
        loc = v63:loc(l_token_5)
    };
end;
v16.parseFragment = function(v66)
    local l_token_6 = v66._lexer.token;
    v66:expectToken(l_TokenKind_0.SPREAD);
    local v68 = v66:expectOptionalKeyword("on");
    if v68 or not v66:peek(l_TokenKind_0.NAME) then
        return {
            kind = l_Kind_0.INLINE_FRAGMENT, 
            typeCondition = if not v68 then nil else v66:parseNamedType(), 
            directives = v66:parseDirectives(false), 
            selectionSet = v66:parseSelectionSet(), 
            loc = v66:loc(l_token_6)
        };
    else
        return {
            kind = l_Kind_0.FRAGMENT_SPREAD, 
            name = v66:parseFragmentName(), 
            directives = v66:parseDirectives(false), 
            loc = v66:loc(l_token_6)
        };
    end;
end;
v16.parseFragmentDefinition = function(v69)
    local l_token_7 = v69._lexer.token;
    v69:expectKeyword("fragment");
    if (v69._options and v69._options.experimentalFragmentVariables) == true then
        local v71 = v69:parseFragmentName();
        local v72 = v69:parseVariableDefinitions();
        v69:expectKeyword("on");
        return {
            kind = l_Kind_0.FRAGMENT_DEFINITION, 
            name = v71, 
            variableDefinitions = v72, 
            typeCondition = v69:parseNamedType(), 
            directives = v69:parseDirectives(false), 
            selectionSet = v69:parseSelectionSet(), 
            loc = v69:loc(l_token_7)
        };
    else
        local v73 = v69:parseFragmentName();
        v69:expectKeyword("on");
        return {
            kind = l_Kind_0.FRAGMENT_DEFINITION, 
            name = v73, 
            typeCondition = v69:parseNamedType(), 
            directives = v69:parseDirectives(false), 
            selectionSet = v69:parseSelectionSet(), 
            loc = v69:loc(l_token_7)
        };
    end;
end;
v16.parseFragmentName = function(v74)
    if v74._lexer.token.value == "on" then
        error(v74:unexpected());
    end;
    return v74:parseName();
end;
v16.parseValueLiteral = function(v75, v76)
    local l_token_8 = v75._lexer.token;
    local l_kind_0 = l_token_8.kind;
    if l_kind_0 == l_TokenKind_0.BRACKET_L then
        return v75:parseList(v76);
    elseif l_kind_0 == l_TokenKind_0.BRACE_L then
        return v75:parseObject(v76);
    elseif l_kind_0 == l_TokenKind_0.INT then
        v75._lexer:advance();
        return {
            kind = l_Kind_0.INT, 
            value = l_token_8.value, 
            loc = v75:loc(l_token_8)
        };
    elseif l_kind_0 == l_TokenKind_0.FLOAT then
        v75._lexer:advance();
        return {
            kind = l_Kind_0.FLOAT, 
            value = l_token_8.value, 
            loc = v75:loc(l_token_8)
        };
    elseif not (l_kind_0 ~= l_TokenKind_0.STRING) or l_kind_0 == l_TokenKind_0.BLOCK_STRING then
        return v75:parseStringLiteral();
    elseif l_kind_0 == l_TokenKind_0.NAME then
        v75._lexer:advance();
        local l_value_1 = l_token_8.value;
        if l_value_1 == "true" then
            return {
                kind = l_Kind_0.BOOLEAN, 
                value = true, 
                loc = v75:loc(l_token_8)
            };
        elseif l_value_1 == "false" then
            return {
                kind = l_Kind_0.BOOLEAN, 
                value = false, 
                loc = v75:loc(l_token_8)
            };
        elseif l_value_1 == "null" then
            return {
                kind = l_Kind_0.NULL, 
                loc = v75:loc(l_token_8)
            };
        else
            return {
                kind = l_Kind_0.ENUM, 
                value = l_value_1, 
                loc = v75:loc(l_token_8)
            };
        end;
    elseif not (l_kind_0 == l_TokenKind_0.DOLLAR) or v76 then
        error(v75:unexpected());
        return ;
    else
        return v75:parseVariable();
    end;
end;
v16.parseStringLiteral = function(v80)
    local l_token_9 = v80._lexer.token;
    v80._lexer:advance();
    return {
        kind = l_Kind_0.STRING, 
        value = l_token_9.value, 
        block = l_token_9.kind == l_TokenKind_0.BLOCK_STRING, 
        loc = v80:loc(l_token_9)
    };
end;
v16.parseList = function(v82, v83)
    return {
        kind = l_Kind_0.LIST, 
        values = v82:any(l_TokenKind_0.BRACKET_L, function()
            return v82:parseValueLiteral(v83);
        end, l_TokenKind_0.BRACKET_R), 
        loc = v82:loc(v82._lexer.token)
    };
end;
v16.parseObject = function(v84, v85)
    return {
        kind = l_Kind_0.OBJECT, 
        fields = v84:any(l_TokenKind_0.BRACE_L, function()
            return v84:parseObjectField(v85);
        end, l_TokenKind_0.BRACE_R), 
        loc = v84:loc(v84._lexer.token)
    };
end;
v16.parseObjectField = function(v86, v87)
    local l_token_10 = v86._lexer.token;
    local v89 = v86:parseName();
    v86:expectToken(l_TokenKind_0.COLON);
    return {
        kind = l_Kind_0.OBJECT_FIELD, 
        name = v89, 
        value = v86:parseValueLiteral(v87), 
        loc = v86:loc(l_token_10)
    };
end;
v16.parseDirectives = function(v90, v91)
    local v92 = {};
    while v90:peek(l_TokenKind_0.AT) do
        table.insert(v92, v90:parseDirective(v91));
    end;
    return v92;
end;
v16.parseDirective = function(v93, v94)
    local l_token_11 = v93._lexer.token;
    v93:expectToken(l_TokenKind_0.AT);
    return {
        kind = l_Kind_0.DIRECTIVE, 
        name = v93:parseName(), 
        arguments = v93:parseArguments(v94), 
        loc = v93:loc(l_token_11)
    };
end;
v16.parseTypeReference = function(v96)
    local l_token_12 = v96._lexer.token;
    local v98 = nil;
    if not v96:expectOptionalToken(l_TokenKind_0.BRACKET_L) then
        v98 = v96:parseNamedType();
    else
        local v99 = v96:parseTypeReference();
        v96:expectToken(l_TokenKind_0.BRACKET_R);
        v98 = {
            kind = l_Kind_0.LIST_TYPE, 
            type = v99, 
            loc = v96:loc(l_token_12)
        };
    end;
    if not v96:expectOptionalToken(l_TokenKind_0.BANG) then
        return v98;
    else
        return {
            kind = l_Kind_0.NON_NULL_TYPE, 
            type = v98, 
            loc = v96:loc(l_token_12)
        };
    end;
end;
v16.parseNamedType = function(v100)
    return {
        kind = l_Kind_0.NAMED_TYPE, 
        name = v100:parseName(), 
        loc = v100:loc(v100._lexer.token)
    };
end;
v16.parseTypeSystemDefinition = function(v101)
    local v102 = if not v101:peekDescription() then v101._lexer.token else v101._lexer:lookahead();
    if v102.kind == l_TokenKind_0.NAME then
        local l_value_2 = v102.value;
        if l_value_2 == "schema" then
            return v101:parseSchemaDefinition();
        elseif l_value_2 == "scalar" then
            return v101:parseScalarTypeDefinition();
        elseif l_value_2 == "type" then
            return v101:parseObjectTypeDefinition();
        elseif l_value_2 == "interface" then
            return v101:parseInterfaceTypeDefinition();
        elseif l_value_2 == "union" then
            return v101:parseUnionTypeDefinition();
        elseif l_value_2 == "enum" then
            return v101:parseEnumTypeDefinition();
        elseif l_value_2 == "input" then
            return v101:parseInputObjectTypeDefinition();
        elseif l_value_2 == "directive" then
            return v101:parseDirectiveDefinition();
        end;
    end;
    error(v101:unexpected(v102));
end;
v16.peekDescription = function(v104)
    return v104:peek(l_TokenKind_0.STRING) or v104:peek(l_TokenKind_0.BLOCK_STRING);
end;
v16.parseDescription = function(v105)
    if not v105:peekDescription() then
        return ;
    else
        return v105:parseStringLiteral();
    end;
end;
v16.parseSchemaDefinition = function(v106)
    local l_token_13 = v106._lexer.token;
    local v108 = v106:parseDescription();
    v106:expectKeyword("schema");
    return {
        kind = l_Kind_0.SCHEMA_DEFINITION, 
        description = v108, 
        directives = v106:parseDirectives(true), 
        operationTypes = v106:many(l_TokenKind_0.BRACE_L, v106.parseOperationTypeDefinition, l_TokenKind_0.BRACE_R), 
        loc = v106:loc(l_token_13)
    };
end;
v16.parseOperationTypeDefinition = function(v109)
    local l_token_14 = v109._lexer.token;
    local v111 = v109:parseOperationType();
    v109:expectToken(l_TokenKind_0.COLON);
    return {
        kind = l_Kind_0.OPERATION_TYPE_DEFINITION, 
        operation = v111, 
        type = v109:parseNamedType(), 
        loc = v109:loc(l_token_14)
    };
end;
v16.parseScalarTypeDefinition = function(v112)
    local l_token_15 = v112._lexer.token;
    local v114 = v112:parseDescription();
    v112:expectKeyword("scalar");
    return {
        kind = l_Kind_0.SCALAR_TYPE_DEFINITION, 
        description = v114, 
        name = v112:parseName(), 
        directives = v112:parseDirectives(true), 
        loc = v112:loc(l_token_15)
    };
end;
v16.parseObjectTypeDefinition = function(v115)
    local l_token_16 = v115._lexer.token;
    local v117 = v115:parseDescription();
    v115:expectKeyword("type");
    return {
        kind = l_Kind_0.OBJECT_TYPE_DEFINITION, 
        description = v117, 
        name = v115:parseName(), 
        interfaces = v115:parseImplementsInterfaces(), 
        directives = v115:parseDirectives(true), 
        fields = v115:parseFieldsDefinition(), 
        loc = v115:loc(l_token_16)
    };
end;
v16.parseImplementsInterfaces = function(v118)
    if not v118:expectOptionalKeyword("implements") then
        return {};
    else
        return v118:delimitedMany(l_TokenKind_0.AMP, v118.parseNamedType);
    end;
end;
v16.parseFieldsDefinition = function(v119)
    return v119:optionalMany(l_TokenKind_0.BRACE_L, v119.parseFieldDefinition, l_TokenKind_0.BRACE_R);
end;
v16.parseFieldDefinition = function(v120)
    local l_token_17 = v120._lexer.token;
    local v122 = v120:parseDescription();
    local v123 = v120:parseName();
    local v124 = v120:parseArgumentDefs();
    v120:expectToken(l_TokenKind_0.COLON);
    return {
        kind = l_Kind_0.FIELD_DEFINITION, 
        description = v122, 
        name = v123, 
        arguments = v124, 
        type = v120:parseTypeReference(), 
        directives = v120:parseDirectives(true), 
        loc = v120:loc(l_token_17)
    };
end;
v16.parseArgumentDefs = function(v125)
    return v125:optionalMany(l_TokenKind_0.PAREN_L, v125.parseInputValueDef, l_TokenKind_0.PAREN_R);
end;
v16.parseInputValueDef = function(v126)
    local l_token_18 = v126._lexer.token;
    local v128 = v126:parseDescription();
    local v129 = v126:parseName();
    v126:expectToken(l_TokenKind_0.COLON);
    local v130 = v126:parseTypeReference();
    local v131 = nil;
    if v126:expectOptionalToken(l_TokenKind_0.EQUALS) then
        v131 = v126:parseValueLiteral(true);
    end;
    return {
        kind = l_Kind_0.INPUT_VALUE_DEFINITION, 
        description = v128, 
        name = v129, 
        type = v130, 
        defaultValue = v131, 
        directives = v126:parseDirectives(true), 
        loc = v126:loc(l_token_18)
    };
end;
v16.parseInterfaceTypeDefinition = function(v132)
    local l_token_19 = v132._lexer.token;
    local v134 = v132:parseDescription();
    v132:expectKeyword("interface");
    return {
        kind = l_Kind_0.INTERFACE_TYPE_DEFINITION, 
        description = v134, 
        name = v132:parseName(), 
        interfaces = v132:parseImplementsInterfaces(), 
        directives = v132:parseDirectives(true), 
        fields = v132:parseFieldsDefinition(), 
        loc = v132:loc(l_token_19)
    };
end;
v16.parseUnionTypeDefinition = function(v135)
    local l_token_20 = v135._lexer.token;
    local v137 = v135:parseDescription();
    v135:expectKeyword("union");
    return {
        kind = l_Kind_0.UNION_TYPE_DEFINITION, 
        description = v137, 
        name = v135:parseName(), 
        directives = v135:parseDirectives(true), 
        types = v135:parseUnionMemberTypes(), 
        loc = v135:loc(l_token_20)
    };
end;
v16.parseUnionMemberTypes = function(v138)
    local v139 = {};
    if v138:expectOptionalToken(l_TokenKind_0.EQUALS) then
        v138:expectOptionalToken(l_TokenKind_0.PIPE);
        while true do
            table.insert(v139, v138:parseNamedType());
            if not v138:expectOptionalToken(l_TokenKind_0.PIPE) then
                break;
            end;
        end;
    end;
    return v139;
end;
v16.parseEnumTypeDefinition = function(v140)
    local l_token_21 = v140._lexer.token;
    local v142 = v140:parseDescription();
    v140:expectKeyword("enum");
    return {
        kind = l_Kind_0.ENUM_TYPE_DEFINITION, 
        description = v142, 
        name = v140:parseName(), 
        directives = v140:parseDirectives(true), 
        values = v140:parseEnumValuesDefinition(), 
        loc = v140:loc(l_token_21)
    };
end;
v16.parseEnumValuesDefinition = function(v143)
    return v143:optionalMany(l_TokenKind_0.BRACE_L, v143.parseEnumValueDefinition, l_TokenKind_0.BRACE_R);
end;
v16.parseEnumValueDefinition = function(v144)
    return {
        kind = l_Kind_0.ENUM_VALUE_DEFINITION, 
        description = v144:parseDescription(), 
        name = v144:parseName(), 
        directives = v144:parseDirectives(true), 
        loc = v144:loc(v144._lexer.token)
    };
end;
v16.parseInputObjectTypeDefinition = function(v145)
    local l_token_22 = v145._lexer.token;
    local v147 = v145:parseDescription();
    v145:expectKeyword("input");
    return {
        kind = l_Kind_0.INPUT_OBJECT_TYPE_DEFINITION, 
        description = v147, 
        name = v145:parseName(), 
        directives = v145:parseDirectives(true), 
        fields = v145:parseInputFieldsDefinition(), 
        loc = v145:loc(l_token_22)
    };
end;
v16.parseInputFieldsDefinition = function(v148)
    return v148:optionalMany(l_TokenKind_0.BRACE_L, v148.parseInputValueDef, l_TokenKind_0.BRACE_R);
end;
v16.parseTypeSystemExtension = function(v149)
    local v150 = v149._lexer:lookahead();
    if v150.kind == l_TokenKind_0.NAME then
        local l_value_3 = v150.value;
        if l_value_3 == "schema" then
            return v149:parseSchemaExtension();
        elseif l_value_3 == "scalar" then
            return v149:parseScalarTypeExtension();
        elseif l_value_3 == "type" then
            return v149:parseObjectTypeExtension();
        elseif l_value_3 == "interface" then
            return v149:parseInterfaceTypeExtension();
        elseif l_value_3 == "union" then
            return v149:parseUnionTypeExtension();
        elseif l_value_3 == "enum" then
            return v149:parseEnumTypeExtension();
        elseif l_value_3 == "input" then
            return v149:parseInputObjectTypeExtension();
        end;
    end;
    error(v149:unexpected(v150));
end;
v16.parseSchemaExtension = function(v152)
    local l_token_23 = v152._lexer.token;
    v152:expectKeyword("extend");
    v152:expectKeyword("schema");
    local v154 = v152:parseDirectives(true);
    local v155 = v152:optionalMany(l_TokenKind_0.BRACE_L, v152.parseOperationTypeDefinition, l_TokenKind_0.BRACE_R);
    if #v154 == 0 and #v155 == 0 then
        error(v152:unexpected());
    end;
    return {
        kind = l_Kind_0.SCHEMA_EXTENSION, 
        directives = v154, 
        operationTypes = v155, 
        loc = v152:loc(l_token_23)
    };
end;
v16.parseScalarTypeExtension = function(v156)
    local l_token_24 = v156._lexer.token;
    v156:expectKeyword("extend");
    v156:expectKeyword("scalar");
    local v158 = v156:parseName();
    local v159 = v156:parseDirectives(true);
    if #v159 == 0 then
        error(v156:unexpected());
    end;
    return {
        kind = l_Kind_0.SCALAR_TYPE_EXTENSION, 
        name = v158, 
        directives = v159, 
        loc = v156:loc(l_token_24)
    };
end;
v16.parseObjectTypeExtension = function(v160)
    local l_token_25 = v160._lexer.token;
    v160:expectKeyword("extend");
    v160:expectKeyword("type");
    local v162 = v160:parseName();
    local v163 = v160:parseImplementsInterfaces();
    local v164 = v160:parseDirectives(true);
    local v165 = v160:parseFieldsDefinition();
    if (#v163 == 0 and #v164 == 0) and #v165 == 0 then
        error(v160:unexpected());
    end;
    return {
        kind = l_Kind_0.OBJECT_TYPE_EXTENSION, 
        name = v162, 
        interfaces = v163, 
        directives = v164, 
        fields = v165, 
        loc = v160:loc(l_token_25)
    };
end;
v16.parseInterfaceTypeExtension = function(v166)
    local l_token_26 = v166._lexer.token;
    v166:expectKeyword("extend");
    v166:expectKeyword("interface");
    local v168 = v166:parseName();
    local v169 = v166:parseImplementsInterfaces();
    local v170 = v166:parseDirectives(true);
    local v171 = v166:parseFieldsDefinition();
    if (#v169 == 0 and #v170 == 0) and #v171 == 0 then
        error(v166:unexpected());
    end;
    return {
        kind = l_Kind_0.INTERFACE_TYPE_EXTENSION, 
        name = v168, 
        interfaces = v169, 
        directives = v170, 
        fields = v171, 
        loc = v166:loc(l_token_26)
    };
end;
v16.parseUnionTypeExtension = function(v172)
    local l_token_27 = v172._lexer.token;
    v172:expectKeyword("extend");
    v172:expectKeyword("union");
    local v174 = v172:parseName();
    local v175 = v172:parseDirectives(true);
    local v176 = v172:parseUnionMemberTypes();
    if #v175 == 0 and #v176 == 0 then
        error(v172:unexpected());
    end;
    return {
        kind = l_Kind_0.UNION_TYPE_EXTENSION, 
        name = v174, 
        directives = v175, 
        types = v176, 
        loc = v172:loc(l_token_27)
    };
end;
v16.parseEnumTypeExtension = function(v177)
    local l_token_28 = v177._lexer.token;
    v177:expectKeyword("extend");
    v177:expectKeyword("enum");
    local v179 = v177:parseName();
    local v180 = v177:parseDirectives(true);
    local v181 = v177:parseEnumValuesDefinition();
    if #v180 == 0 and #v181 == 0 then
        error(v177:unexpected());
    end;
    return {
        kind = l_Kind_0.ENUM_TYPE_EXTENSION, 
        name = v179, 
        directives = v180, 
        values = v181, 
        loc = v177:loc(l_token_28)
    };
end;
v16.parseInputObjectTypeExtension = function(v182)
    local l_token_29 = v182._lexer.token;
    v182:expectKeyword("extend");
    v182:expectKeyword("input");
    local v184 = v182:parseName();
    local v185 = v182:parseDirectives(true);
    local v186 = v182:parseInputFieldsDefinition();
    if #v185 == 0 and #v186 == 0 then
        error(v182:unexpected());
    end;
    return {
        kind = l_Kind_0.INPUT_OBJECT_TYPE_EXTENSION, 
        name = v184, 
        directives = v185, 
        fields = v186, 
        loc = v182:loc(l_token_29)
    };
end;
v16.parseDirectiveDefinition = function(v187)
    local l_token_30 = v187._lexer.token;
    local v189 = v187:parseDescription();
    v187:expectKeyword("directive");
    v187:expectToken(l_TokenKind_0.AT);
    local v190 = v187:parseName();
    local v191 = v187:parseArgumentDefs();
    local v192 = v187:expectOptionalKeyword("repeatable");
    v187:expectKeyword("on");
    return {
        kind = l_Kind_0.DIRECTIVE_DEFINITION, 
        description = v189, 
        name = v190, 
        arguments = v191, 
        repeatable = v192, 
        locations = v187:parseDirectiveLocations(), 
        loc = v187:loc(l_token_30)
    };
end;
v16.parseDirectiveLocations = function(v193)
    v193:expectOptionalToken(l_TokenKind_0.PIPE);
    local v194 = {};
    while true do
        table.insert(v194, v193:parseDirectiveLocation());
        if not v193:expectOptionalToken(l_TokenKind_0.PIPE) then
            break;
        end;
    end;
    return v194;
end;
v16.parseDirectiveLocation = function(v195)
    local l_token_31 = v195._lexer.token;
    local v197 = v195:parseName();
    if l_DirectiveLocation_0[v197.value] ~= nil then
        return v197;
    else
        error(v195:unexpected(l_token_31));
        return ;
    end;
end;
v16.loc = function(v198, v199)
    if (v198._options and v198._options.noLocation) ~= true then
        return l_Location_0.new(v199, v198._lexer.lastToken, v198._lexer.source);
    else
        return nil;
    end;
end;
v16.peek = function(v200, v201)
    return v200._lexer.token.kind == v201;
end;
v16.expectToken = function(v202, v203)
    local l_token_32 = v202._lexer.token;
    if l_token_32.kind == v203 then
        v202._lexer:advance();
        return l_token_32;
    else
        error(l_syntaxError_0(v202._lexer.source, l_token_32.start, "Expected " .. v15(v203) .. ", found " .. v14(l_token_32) .. "."));
        return ;
    end;
end;
v16.expectOptionalToken = function(v205, v206)
    local l_token_33 = v205._lexer.token;
    if l_token_33.kind == v206 then
        v205._lexer:advance();
        return l_token_33;
    else
        return nil;
    end;
end;
v16.expectKeyword = function(v208, v209)
    local l_token_34 = v208._lexer.token;
    if l_token_34.kind == l_TokenKind_0.NAME and l_token_34.value == v209 then
        v208._lexer:advance();
        return ;
    else
        error(l_syntaxError_0(v208._lexer.source, l_token_34.start, "Expected \"" .. v209 .. "\", found " .. v14(l_token_34) .. "."));
        return ;
    end;
end;
v16.expectOptionalKeyword = function(v211, v212)
    local l_token_35 = v211._lexer.token;
    if l_token_35.kind == l_TokenKind_0.NAME and l_token_35.value == v212 then
        v211._lexer:advance();
        return true;
    else
        return false;
    end;
end;
v16.unexpected = function(v214, v215)
    local v216 = v215 ~= nil and v215 or v214._lexer.token;
    return l_syntaxError_0(v214._lexer.source, v216.start, "Unexpected " .. v14(v216) .. ".");
end;
v16.any = function(v217, v218, v219, v220)
    v217:expectToken(v218);
    local v221 = {};
    while not v217:expectOptionalToken(v220) do
        table.insert(v221, v219(v217));
    end;
    return v221;
end;
v16.optionalMany = function(v222, v223, v224, v225)
    if not v222:expectOptionalToken(v223) then
        return {};
    else
        local v226 = {};
        while true do
            table.insert(v226, v224(v222));
            if v222:expectOptionalToken(v225) then
                break;
            end;
        end;
        return v226;
    end;
end;
v16.many = function(v227, v228, v229, v230)
    v227:expectToken(v228);
    local v231 = {};
    while true do
        table.insert(v231, v229(v227));
        if v227:expectOptionalToken(v230) then
            break;
        end;
    end;
    return v231;
end;
v16.delimitedMany = function(v232, v233, v234)
    v232:expectOptionalToken(v233);
    local v235 = {};
    while true do
        table.insert(v235, v234(v232));
        if not v232:expectOptionalToken(v233) then
            break;
        end;
    end;
    return v235;
end;
v14 = function(v236)
    local l_value_4 = v236.value;
    return v15(v236.kind) .. (l_value_4 ~= nil and " \"" .. l_value_4 .. "\"" or "");
end;
v15 = function(v238)
    return not not l_isPunctuatorTokenKind_0(v238) and "\"" .. v238 .. "\"" or v238;
end;
return {
    Parser = v16, 
    parse = v19, 
    parseValue = v24, 
    parseType = v29
};
