return function(v0)
    local v1 = tostring(v0);
    return (setmetatable(v0, {
        __newindex = function(_, v3, _)
            error(("%q (%s) is not a valid member of %s"):format(tostring(v3), typeof(v3), v1), 2);
        end, 
        __metatable = false
    }));
end;
