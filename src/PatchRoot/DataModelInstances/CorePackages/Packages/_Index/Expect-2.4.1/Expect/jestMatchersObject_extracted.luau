local l_Parent_0 = script.Parent;
local l_Symbol_0 = require(l_Parent_0.Parent.LuauPolyfill).Symbol;
local _ = require(l_Parent_0.types);
local v3 = l_Symbol_0.for_("$$jest-matchers-object");
return {
    JEST_MATCHERS_OBJECT = v3, 
    getState = function()
        return _G[v3].state;
    end
};
