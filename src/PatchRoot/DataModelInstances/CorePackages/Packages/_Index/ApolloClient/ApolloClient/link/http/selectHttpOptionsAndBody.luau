local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local l_print_0 = require(l_Parent_0.GraphQL).print;
local _ = require(script.Parent.Parent.core.types);
local v8 = nil;
v5.fallbackHttpConfig = {
    http = {
        includeQuery = true, 
        includeExtensions = false
    }, 
    headers = {
        accept = "*/*", 
        ["content-type"] = "application/json"
    }, 
    options = {
        method = "POST"
    }
};
v5.selectHttpOptionsAndBody = function(v9, v10, ...)
    local v11 = {
        ...
    };
    local v12 = l_Object_0.assign({}, v10.options, {
        headers = v10.headers, 
        credentials = v10.credentials
    });
    local v13 = nil;
    v13 = if v10.http ~= nil then v10.http else {};
    l_Array_0.forEach(v11, function(v14)
        v12 = l_Object_0.assign({}, v12, v14.options, {
            headers = l_Object_0.assign({}, v12.headers, v8(v14.headers))
        });
        if l_Boolean_0.toJSBoolean(v14.credentials) then
            v12.credentials = v14.credentials;
        end;
        v13 = l_Object_0.assign({}, v13, v14.http);
    end);
    local l_operationName_0 = v9.operationName;
    local l_extensions_0 = v9.extensions;
    local l_variables_0 = v9.variables;
    local l_query_0 = v9.query;
    local v19 = {
        operationName = l_operationName_0, 
        variables = l_variables_0
    };
    if v13.includeExtensions then
        v19.extensions = l_extensions_0;
    end;
    if v13.includeQuery then
        v19.query = l_print_0(l_query_0);
    end;
    return {
        options = v12, 
        body = v19
    };
end;
v8 = function(v20)
    if v20 ~= nil then
        local v21 = {};
        l_Array_0.forEach(l_Object_0.keys(v20), function(v22)
            v21[string.lower(v22)] = v20[v22];
        end);
        return v21;
    else
        return v20;
    end;
end;
return v5;
