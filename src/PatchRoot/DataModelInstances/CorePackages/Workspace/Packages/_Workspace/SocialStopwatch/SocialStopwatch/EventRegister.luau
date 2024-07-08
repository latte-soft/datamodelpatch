local v0 = require(script.Parent.Events);
local v1 = require(script.Parent.EventModes);
return {
    [v0.TestEvent] = {
        mode = v1.Default
    }, 
    [v0.TestStrictEvent] = {
        mode = v1.Strict
    }
};
