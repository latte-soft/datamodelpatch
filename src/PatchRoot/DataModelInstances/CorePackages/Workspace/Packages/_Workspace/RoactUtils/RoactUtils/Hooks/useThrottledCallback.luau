local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Promise);
return function(v3, v4)
    local v5 = v1.useRef(v3);
    local v6 = v1.useRef(v4);
    v5.current = v3;
    v6.current = v4;
    local v7 = v1.useRef(nil);
    local v8 = v1.useRef(0);
    local v11 = v1.useCallback(function()
        if not v7.current then
            local v9 = (v8.current + (v6.current or 0)) - tick();
            local function v10()
                v5.current();
                v8.current = tick();
                v7.current = nil;
            end;
            if v9 > 0 then
                v7.current = v2.delay(v9):andThen(v10);
                return ;
            else
                v5.current();
                v8.current = tick();
                v7.current = nil;
                return ;
            end;
        else
            return ;
        end;
    end);
    v1.useEffect(function()
        return function()
            local l_current_0 = v7.current;
            if l_current_0 then
                l_current_0:cancel();
                v5.current();
            end;
        end;
    end, {});
    return v11;
end;
