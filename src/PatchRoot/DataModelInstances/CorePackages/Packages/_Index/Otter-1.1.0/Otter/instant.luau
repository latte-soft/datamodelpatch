local _ = require(script.Parent.types);
return function(v1)
    return {
        step = function()
            return {
                value = v1, 
                complete = true
            };
        end
    };
end;
