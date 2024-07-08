return function(v0, v1)
    local v2 = 0;
    return function(...)
        local v3 = {
            ...
        };
        local v4 = time();
        v2 = v4;
        task.delay(v1, function()
            if v2 == v4 then
                v0(unpack(v3));
            end;
        end);
    end;
end;
