local l_Parent_0 = script.Parent;
local l_afterEach_0 = require(l_Parent_0.JestGlobals).afterEach;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v3 = require(script.jsHelpers.isCallable);
local v4 = {};
local l_cleanup_0 = require(script.pure).cleanup;
if not (_G.RTL_SKIP_AUTO_CLEANUP or not v3(l_afterEach_0)) then
    l_afterEach_0(function()
        l_cleanup_0();
    end);
end;
l_Object_0.assign(v4, require(script.pure));
local _ = require(script.types);
return v4;
