local l_Object_0 = require(script.Parent.LuauPolyfill).Object;
local v1 = {};
l_Object_0.assign(v1, (require(script["merge-resolvers"])));
l_Object_0.assign(v1, (require(script["typedefs-mergers"])));
l_Object_0.assign(v1, (require(script.extensions)));
return v1;
