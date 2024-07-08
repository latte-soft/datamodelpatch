local l_script_0 = script;
local v1 = require(l_script_0.alignedAnsiStyleSerializer);
local v2 = require(l_script_0.config);
return {
    alignedAnsiStyleSerializer = v1, 
    makeGlobalConfig = v2.makeGlobalConfig, 
    makeProjectConfig = v2.makeProjectConfig
};
