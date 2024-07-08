local v0 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
local v1 = require(script.Parent.dependencyArray);
return function(v2, v3)
    local l_current_0 = v2.current;
    local v5, v6 = v0.useState(function()
        if not l_current_0 then
            return nil;
        else
            return l_current_0[v3];
        end;
    end);
    local v8 = v0.useCallback(function()
        local l_current_1 = v2.current;
        if l_current_1 then
            v6(l_current_1[v3]);
        end;
    end, v1(v2, v3));
    v0.useEffect(function()
        local v9 = nil;
        local l_current_2 = v2.current;
        if l_current_2 then
            v9 = l_current_2:GetPropertyChangedSignal(v3):Connect(v8);
            v8();
        end;
        return function()
            if v9 then
                v9:Disconnect();
            end;
        end;
    end, v1(l_current_0, v3, v8));
    return v5;
end;
