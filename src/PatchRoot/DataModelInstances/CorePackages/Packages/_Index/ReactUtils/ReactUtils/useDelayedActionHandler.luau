local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
return function(v1, v2, v3)
    local v4 = v0.useRef(nil);
    local v5 = v0.useRef(0);
    local function v8()
        local v6 = os.clock();
        if (v2 ~= nil and v5.current ~= nil) and v6 - v5.current < v2 then
            return ;
        else
            v5.current = v6;
            local l_current_0 = v4.current;
            if l_current_0 ~= nil then
                task.cancel(l_current_0);
            end;
            v4.current = task.delay(v1, function()
                v3();
            end);
            return ;
        end;
    end;
    v0.useEffect(function()
        return function()
            local l_current_1 = v4.current;
            if l_current_1 ~= nil then
                task.cancel(l_current_1);
            end;
        end;
    end, {
        v4
    });
    return v8;
end;
