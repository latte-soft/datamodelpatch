return function(v0, v1)
    local v2 = nil;
    local v3 = v1 or 0.5;
    return function(...)
        local v4 = {
            ...
        };
        if v2 then
            task.cancel(v2);
        end;
        v2 = task.delay(v3, function()
            v0(unpack(v4));
            v2 = nil;
        end);
    end;
end;
