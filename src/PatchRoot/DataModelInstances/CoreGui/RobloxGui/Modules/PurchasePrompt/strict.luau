local function v2(v0, v1)
    error(("%q (%s) is not a valid member of %s"):format(tostring(v1), typeof(v1), (tostring(v0))), 2);
end;
return function(v3, v4)
    return (setmetatable(v3, {
        __index = v2, 
        __newindex = v2, 
        __tostring = function()
            return v4;
        end
    }));
end;
