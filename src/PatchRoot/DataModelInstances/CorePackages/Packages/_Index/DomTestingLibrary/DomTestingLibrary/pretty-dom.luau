local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v6 = require(script.Parent.jsHelpers.typeError);
local v7 = {};
local v8 = require(l_Parent_0.PrettyFormat);
local l_default_0 = require(script.Parent.DOMElementFilter).default;
local v10 = require(script.Parent["get-user-code-frame"]);
local l_getDocument_0 = require(script.Parent.helpers).getDocument;
local v12 = require(script.Parent["config-default-ignore"]);
local function _()
    return true;
end;
local function v15(v14)
    return not l_Array_0.includes(v12.getIgnore(), v14.ClassName);
end;
local function v23(v16, v17, v18)
    local v19 = if v18 == nil then {} else v18;
    if not v16 then
        v16 = l_getDocument_0();
    end;
    if typeof(v17) ~= "number" then
        local l_DEBUG_PRINT_LIMIT_0 = _G.DEBUG_PRINT_LIMIT;
        v17 = not not l_Boolean_0.toJSBoolean(l_DEBUG_PRINT_LIMIT_0) and l_DEBUG_PRINT_LIMIT_0 or 7000;
    end;
    if v17 == 0 then
        return "";
    else
        local v21 = typeof(v16);
        if v21 ~= "Instance" then
            error(v6.new(("Expected an Instance but got %s"):format(v21)));
        end;
        local v22 = v8.format(v16, l_Object_0.assign({}, {
            plugins = {
                l_default_0(if v19.filterNode == nil then v15 else v19.filterNode)
            }, 
            printFunctionName = false, 
            highlight = true
        }, (l_Object_0.assign({}, v19, {
            filterNode = l_Object_0.None
        }))));
        if v17 ~= nil and v17 < #v22 then
            return (("%s..."):format((string.sub(v22, 1, v17))));
        else
            return v22;
        end;
    end;
end;
local function v25(...)
    local v24 = v10.getUserCodeFrame();
    if not l_Boolean_0.toJSBoolean(v24) then
        l_console_0.log((v23(...)));
        return ;
    else
        l_console_0.log(("%s\n\n%s"):format(v23(...), v24));
        return ;
    end;
end;
v7.prettyDOM = v23;
v7.logDOM = v25;
v7.prettyFormat = v8;
return v7;
