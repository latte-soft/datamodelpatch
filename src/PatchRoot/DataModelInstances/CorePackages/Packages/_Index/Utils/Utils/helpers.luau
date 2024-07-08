local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v6 = {};
local l_parse_0 = require(l_Parent_0.GraphQL).parse;
local v8 = require(l_Parent_0.LuauRegExp);
v6.asArray = function(v9)
    if not l_Boolean_0.toJSBoolean(l_Array_0.isArray(v9)) then
        if not l_Boolean_0.toJSBoolean(v9) then
            return {};
        else
            return {
                v9
            };
        end;
    else
        return v9;
    end;
end;
local v10 = v8("\\.[a-zA-Z0-9]+$");
v6.isDocumentString = function(v11)
    if typeof(v11) ~= "string" then
        return false;
    elseif not l_Boolean_0.toJSBoolean(v10:test(v11)) then
        local l_status_0, l_result_0 = pcall(function()
            l_parse_0(v11);
            return true;
        end);
        if l_status_0 then
            return l_result_0;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local v14 = v8("[\226\128\152\226\128\156%<=>`]");
v6.isValidPath = function(v15)
    local v16 = false;
    if typeof(v15) == "string" then
        v16 = not l_Boolean_0.toJSBoolean(v14:test(v15));
    end;
    return v16;
end;
v6.compareStrings = function(v17, v18)
    if tostring(v17) < tostring(v18) then
        return -1;
    elseif tostring(v18) < tostring(v17) then
        return 1;
    else
        return 0;
    end;
end;
local function v21(v19)
    local v20 = nil;
    if l_Array_0.indexOf(l_Object_0.keys(v19), "alias") ~= -1 then
        v20 = if typeof(v19.alias) == "table" then v19.alias.value else nil;
    end;
    if v20 == nil and l_Array_0.indexOf(l_Object_0.keys(v19), "name") ~= -1 then
        v20 = if typeof(v19.name) == "table" then v19.name.value else nil;
    end;
    if v20 == nil then
        v20 = v19.kind;
    end;
    return v20;
end;
v6.nodeToString = v21;
v6.compareNodes = function(v22, v23, v24)
    local v25 = v21(v22);
    local v26 = v21(v23);
    if typeof(v24) == "function" then
        return v24(v25, v26);
    elseif tostring(v25) < tostring(v26) then
        return -1;
    elseif tostring(v26) < tostring(v25) then
        return 1;
    else
        return 0;
    end;
end;
v6.isSome = function(v27)
    local v28 = false;
    if v27 ~= nil then
        v28 = v27 ~= l_Object_0.None;
    end;
    return v28;
end;
v6.assertSome = function(v29, v30)
    local v31 = if v30 ~= nil then v30 else "Value should be something";
    if v29 == nil then
        error(l_Error_0.new(v31));
    end;
    return true;
end;
return v6;
