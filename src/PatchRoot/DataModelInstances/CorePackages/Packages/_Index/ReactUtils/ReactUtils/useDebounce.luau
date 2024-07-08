local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
return function(v1, v2)
    local v3, v4 = v0.useState(v1);
    v0.useLayoutEffect(function()
        local function v5()
            v4(v1);
        end;
        if not (v2 ~= nil) or v2 == 0 then
            v4(v1);
            return ;
        else
            local v6 = task.delay(v2, v5);
            return function()
                task.cancel(v6);
            end;
        end;
    end, {
        v1, 
        v2
    });
    return v3;
end;
