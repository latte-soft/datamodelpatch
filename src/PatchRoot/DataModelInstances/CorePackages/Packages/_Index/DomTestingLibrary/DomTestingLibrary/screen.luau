local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v5 = require(script.Parent.jsHelpers.document);
local v6 = require(script.Parent.jsHelpers.typeError);
local v7 = {};
local _ = require(l_Parent_0.PrettyFormat);
local l_getQueriesForElement_0 = require(script.Parent["get-queries-for-element"]).getQueriesForElement;
local l_getDocument_0 = require(script.Parent.helpers).getDocument;
local l_logDOM_0 = require(script.Parent["pretty-dom"]).logDOM;
local v12 = require(script.Parent.queries);
local v18 = {
    debug = function(v13, v14, v15)
        if not l_Array_0.isArray(v13) then
            return (l_logDOM_0(v13, v14, v15));
        else
            return (l_Array_0.forEach(v13, function(v16)
                return l_logDOM_0(v16, v14, v15);
            end));
        end;
    end, 
    logTestingPlaygroundURL = function(v17)
        if v17 == nil then
            v17 = l_getDocument_0();
        end;
        if (not v17 or l_Array_0.isArray(v17)) or typeof(v17) ~= "Instance" then
            l_console_0.log("The element you're providing isn't a valid Instance.");
            return ;
        elseif #v17:GetChildren() == 0 then
            l_console_0.log("The provided element doesn't have any children.");
            return ;
        else
            return ;
        end;
    end
};
v7.screen = if typeof(v5) ~= "nil" then l_getQueriesForElement_0(v5, v12, v18) else l_Array_0.reduce(l_Object_0.keys(v12), function(v19, v20)
    v19[v20] = function()
        error(v6.new("For queries bound to document.body a global document has to be available... Learn more: https://testing-library.com/s/screen-global-error"));
    end;
    return v19;
end, v18);
return v7;
