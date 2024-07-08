local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local v5 = require(l_Parent_0.GraphQL);
local l_Kind_0 = v5.Kind;
local l_parse_0 = v5.parse;
local l_Source_0 = v5.Source;
local l_visit_0 = v5.visit;
local l_isTypeSystemDefinitionNode_0 = v5.isTypeSystemDefinitionNode;
local l_print_0 = v5.print;
local v12 = require(script.Parent.comments);
local l_dedentBlockStringValue_0 = v12.dedentBlockStringValue;
local l_getLeadingCommentBlock_0 = v12.getLeadingCommentBlock;
local _ = require(script.Parent.Interfaces);
local l_String_0 = v1.String;
local v17 = nil;
local v18 = nil;
local function _(v19)
    return l_String_0.trim((string.gsub(v19, "(#[^*]*)", "")));
end;
v4.parseGraphQLSDL = function(v21, v22, v23)
    local v24 = if v23 ~= nil then v23 else {};
    local v25 = nil;
    local l_status_0, l_result_0 = pcall(function()
        if not l_Boolean_0.toJSBoolean(v24.commentDescriptions) or not l_String_0.includes(v22, "#") then
            v25 = l_parse_0(l_Source_0.new(v22, v21), v24);
        else
            v25 = v17(v22, v24);
            if l_Boolean_0.toJSBoolean(v24.noLocation) then
                v25 = l_parse_0(l_print_0(v25), v24);
                return ;
            end;
        end;
    end);
    if not l_status_0 then
        if l_String_0.includes(l_result_0.message, "EOF") and l_String_0.trim((string.gsub(v22, "(#[^*]*)", ""))) == "" then
            v25 = {
                kind = l_Kind_0.DOCUMENT, 
                definitions = {}
            };
        else
            error(l_result_0);
        end;
    end;
    return {
        location = v21, 
        document = v25
    };
end;
v17 = function(v28, v29)
    return (l_visit_0(l_parse_0(v28, l_Object_0.assign({}, if v29 ~= nil then v29 else {}, {
        noLocation = false
    })), {
        leave = function(_, v31)
            if l_Boolean_0.toJSBoolean(v18(v31)) then
                local v32 = l_getLeadingCommentBlock_0(v31);
                if v32 ~= nil then
                    local v33 = l_dedentBlockStringValue_0("\n" .. tostring(v32));
                    local v34 = l_String_0.includes(v33, "\n");
                    if l_Boolean_0.toJSBoolean(v31.description) then
                        return l_Object_0.assign({}, v31, {
                            description = l_Object_0.assign({}, v31.description, {
                                value = v31.description.value .. "\n" .. v33, 
                                block = true
                            })
                        });
                    else
                        return l_Object_0.assign({}, v31, {
                            description = {
                                kind = l_Kind_0.STRING, 
                                value = v33, 
                                block = v34
                            }
                        });
                    end;
                end;
            end;
        end
    }));
end;
v4.transformCommentsToDescriptions = v17;
v18 = function(v35)
    local v36 = l_isTypeSystemDefinitionNode_0(v35);
    if not v36 then
        v36 = true;
        if v35.kind ~= l_Kind_0.FIELD_DEFINITION then
            v36 = true;
            if v35.kind ~= l_Kind_0.INPUT_VALUE_DEFINITION then
                v36 = v35.kind == l_Kind_0.ENUM_VALUE_DEFINITION;
            end;
        end;
    end;
    return v36;
end;
v4.isDescribable = v18;
return v4;
