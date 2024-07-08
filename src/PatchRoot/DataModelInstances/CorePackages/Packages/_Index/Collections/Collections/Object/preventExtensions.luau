local _ = require(script.Parent.Parent.Parent.ES7Types);
return function(v1)
    local v2 = tostring(v1);
    return (setmetatable(v1, {
        __newindex = function(_, v4, _)
            error(("%q (%s) is not a valid member of %s"):format(tostring(v4), typeof(v4), v2), 2);
        end, 
        __metatable = false
    }));
end;
