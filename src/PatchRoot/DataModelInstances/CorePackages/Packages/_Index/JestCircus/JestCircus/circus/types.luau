local l_Parent_0 = script.Parent.Parent.Parent;
local l_Symbol_0 = require(l_Parent_0.LuauPolyfill).Symbol;
local v2 = {};
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.Expect);
v2.STATE_SYM = l_Symbol_0("JEST_STATE_SYMBOL");
v2.RETRY_TIMES = l_Symbol_0.for_("RETRY_TIMES");
v2.TEST_TIMEOUT_SYMBOL = l_Symbol_0.for_("TEST_TIMEOUT_SYMBOL");
return v2;
