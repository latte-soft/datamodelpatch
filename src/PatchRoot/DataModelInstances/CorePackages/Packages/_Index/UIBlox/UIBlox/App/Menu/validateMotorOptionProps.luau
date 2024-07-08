local v0 = require(script.Parent.Parent.Parent.Parent.t);
return v0.strictInterface({
    targetValue = v0.number, 
    springParams = v0.optional(v0.strictInterface({
        frequency = v0.number, 
        dampingRatio = v0.number
    }))
});
