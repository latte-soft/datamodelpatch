return function(v0, v1)
    v1 = v1 or tostring(v0);
    return (setmetatable(v0, {
        __index = function(_, v3)
            error(("%q (%s) is not a valid member of %s"):format(tostring(v3), typeof(v3), v1), 2);
        end, 
        __newindex = function(_, v5, _)
            error(("%q (%s) is not a valid member of %s"):format(tostring(v5), typeof(v5), v1), 2);
        end
    }));
end;
