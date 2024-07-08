local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local _ = require(l_Parent_0.JestEnvironment);
local _ = require(l_Parent_0.Expect);
local _ = require(l_Parent_0.JestTypes);
local _ = require(l_Parent_0.Expect);
error(l_Error_0.new("Do not import `JestGlobals` outside of the Jest test environment"));
return {};
