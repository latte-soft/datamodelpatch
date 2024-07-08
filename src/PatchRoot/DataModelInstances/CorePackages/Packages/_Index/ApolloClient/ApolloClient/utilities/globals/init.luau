local v0 = {
    DEV = require(script.DEV).default
};
local l_removeTemporaryGlobals_0 = require(script.graphql).removeTemporaryGlobals;
v0.removeTemporaryGlobals = l_removeTemporaryGlobals_0;
v0.NULL = require(script.null).NULL;
l_removeTemporaryGlobals_0();
return v0;
