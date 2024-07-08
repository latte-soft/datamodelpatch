local _ = require(script.Parent.types);
return {
    patch = function(_)
    end, 
    unpatch = function()
    end, 
    error = function(...)
        error(...);
    end, 
    warn = function(...)
        warn(...);
    end, 
    log = function(...)
        print(...);
    end, 
    registerRenderer = function(_)
    end
};
