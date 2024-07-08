local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v4 = {};
local l_buildClientSchema_0 = require(l_Parent_0.GraphQL).buildClientSchema;
local _ = require(script.Parent.loaders);
local _ = require(script.Parent.types);
local l_String_0 = v1.String;
local v9 = require(script.Parent.json);
local function _(v10)
    v10 = tostring(v10);
    if l_String_0.charCodeAt(v10, 1) == 65279 then
        v10 = l_String_0.slice(v10, 2);
    end;
    return v10;
end;
local function _(v12)
    local l_parse_0 = v9.parse;
    local v14 = tostring(v12);
    if l_String_0.charCodeAt(v14, 1) == 65279 then
        v14 = l_String_0.slice(v14, 2);
    end;
    return l_parse_0(v14);
end;
v4.parseGraphQLJSON = function(v16, v17, v18)
    local l_parse_1 = v9.parse;
    local v20 = tostring(v17);
    if l_String_0.charCodeAt(v20, 1) == 65279 then
        v20 = l_String_0.slice(v20, 2);
    end;
    l_parse_1 = l_parse_1(v20);
    if l_Boolean_0.toJSBoolean(l_parse_1.data) then
        l_parse_1 = l_parse_1.data;
    end;
    if l_parse_1.kind == "Document" then
        return {
            location = v16, 
            document = l_parse_1
        };
    elseif not l_Boolean_0.toJSBoolean(l_parse_1.__schema) then
        if typeof(l_parse_1) == "string" then
            return {
                location = v16, 
                rawSDL = l_parse_1
            };
        else
            error(l_Error_0.new("Not valid JSON content"));
            return ;
        end;
    else
        return {
            location = v16, 
            schema = l_buildClientSchema_0(l_parse_1, v18)
        };
    end;
end;
return v4;
