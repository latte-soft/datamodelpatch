local v0 = require(script.createGroupMotor);
local v1 = require(script.createSingleMotor);
local v2 = require(script.spring);
local v3 = require(script.instant);
local _ = require(script.types);
return {
    createGroupMotor = v0, 
    createSingleMotor = v1, 
    spring = v2, 
    instant = v3, 
    __devHeartbeat = require(script.Heartbeat)
};
