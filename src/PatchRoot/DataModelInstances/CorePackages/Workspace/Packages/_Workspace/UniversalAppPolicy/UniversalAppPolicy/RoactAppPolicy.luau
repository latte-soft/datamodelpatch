local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PolicyProvider);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v3 = require(script.Parent.UniversalAppPolicy);
v1.Logger:setParent(l_Logger_0);
return v3;
