local v0 = require(script.GetImageData);
local v1 = require(script.GetImageSetData);
local v2 = require(script.GetImageSetPathPattern);
local _ = require(script.types);
return {
    GetImageData = v0, 
    GetImageSetData = v1, 
    GetImageSetPathPattern = v2
};
