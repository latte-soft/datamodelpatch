local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = require(l_Parent_0.luaUtils.encodeURIComponent);
local v6 = {};
local l_serializeFetchParameter_0 = require(script.Parent.serializeFetchParameter).serializeFetchParameter;
local _ = require(script.Parent.selectHttpOptionsAndBody);
v6.rewriteURIForGET = function(v9, v10)
    local v11 = {};
    local function _(v12, v13)
        table.insert(v11, ("%s=%s"):format(v12, v5(v13)));
    end;
    if l_Array_0.indexOf(l_Object_0.keys(v10), "query") ~= -1 then
        table.insert(v11, ("%s=%s"):format("query", v5(v10.query)));
    end;
    if l_Boolean_0.toJSBoolean(v10.operationName) then
        table.insert(v11, ("%s=%s"):format("operationName", v5(v10.operationName)));
    end;
    if l_Boolean_0.toJSBoolean(v10.variables) then
        local v15 = nil;
        local l_status_0, l_result_0 = pcall(function()
            v15 = l_serializeFetchParameter_0(v10.variables, "Variables map", true);
        end);
        if l_status_0 then
            table.insert(v11, ("%s=%s"):format("variables", v5(v15)));
            --[[ close >= 4 ]]
        else
            return {
                parseError = l_result_0
            };
        end;
    end;
    if l_Boolean_0.toJSBoolean(v10.extensions) then
        local v18 = nil;
        local l_status_1, l_result_1 = pcall(function()
            v18 = l_serializeFetchParameter_0(v10.extensions, "Extensions map");
        end);
        if l_status_1 then
            table.insert(v11, ("%s=%s"):format("extensions", v5(v18)));
            --[[ close >= 4 ]]
        else
            return {
                parseError = l_result_1
            };
        end;
    end;
    local v21 = "";
    local l_v9_0 = v9;
    local v23 = string.find(v9, "#");
    if v23 ~= nil then
        v21 = string.sub(v9, v23);
        l_v9_0 = string.sub(v9, 1, v23 - 1);
    end;
    return {
        newURI = l_v9_0 .. (string.find(l_v9_0, "?") == nil and "?" or "&") .. l_Array_0.join(v11, "&") .. v21
    };
end;
return v6;
