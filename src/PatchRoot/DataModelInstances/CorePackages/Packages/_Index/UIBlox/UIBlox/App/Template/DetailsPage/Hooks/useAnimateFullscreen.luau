local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
return function(v3, v4, v5)
    local v6 = v4 ~= nil;
    local v7 = (not not v3 and v6) and 0 or 1;
    local v8, v9 = v1.useState(v7);
    local v10, v11 = v1.useState(false);
    local v12, v13 = v2.useAnimatedBinding(v7, (v1.useCallback(function()
        v11(false);
    end, {})));
    v1.useEffect(function()
        if v7 == v8 then
            return nil;
        else
            v9(v7);
            v11(true);
            v13(v2.spring(v7, v5));
            return nil;
        end;
    end, {
        v7, 
        v8, 
        v5
    });
    return (v10 or v3) and v6, v12;
end;
