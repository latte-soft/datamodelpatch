local _ = require(script.Parent.Parent.Parent.React);
return function(v1)
    local l_getForwardedRef_0 = v1.getForwardedRef;
    local l_setLocalRef_0 = v1.setLocalRef;
    return function(v4)
        local v5 = l_getForwardedRef_0();
        l_setLocalRef_0(v4);
        if typeof(v5) == "function" then
            v5(v4);
            return ;
        else
            if typeof(v5) == "table" then
                v5.current = v4;
            end;
            return ;
        end;
    end;
end;
