local v0 = require(script.Parent.Parent.Parent.Promise);
return {
    isPromise = function(v1)
        return v0.is(v1);
    end
};
