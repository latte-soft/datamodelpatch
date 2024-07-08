local v0 = require(script.Parent.Parent.React);
local function _(v1, v2)
    if type(v1) == "function" then
        v1(v2);
        return ;
    else
        if type(v1) == "table" then
            v1.current = v2;
        end;
        return ;
    end;
end;
return function(v4, v5)
    return (v0.useCallback(function(v6)
        local l_v4_0 = v4;
        if type(l_v4_0) == "function" then
            l_v4_0(v6);
        elseif type(l_v4_0) == "table" then
            l_v4_0.current = v6;
        end;
        l_v4_0 = v5;
        if type(l_v4_0) == "function" then
            l_v4_0(v6);
            return ;
        else
            if type(l_v4_0) == "table" then
                l_v4_0.current = v6;
            end;
            return ;
        end;
    end, {
        v4, 
        v5
    }));
end;
