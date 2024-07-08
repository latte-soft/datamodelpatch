local l_Number_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Number;
return function(v1)
    local v2 = l_Number_0.isNaN(v1);
    if not v2 then
        return {
            pass = false, 
            message = ("expected: NaN (number), got: \"%s\" (%s) instead"):format(tostring(v1), (typeof(v1)))
        };
    else
        return {
            pass = v2
        };
    end;
end;
