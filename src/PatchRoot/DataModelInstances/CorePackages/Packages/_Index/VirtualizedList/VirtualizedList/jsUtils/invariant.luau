local l_Error_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Error;
return function(v1, v2, ...)
    if not v1 then
        error(l_Error_0(string.format(v2, ...)));
    end;
end;
