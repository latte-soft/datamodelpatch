return function(v0, v1)
    local v2 = false;
    local v3 = v1 or 1;
    return function(...)
        if not v2 then
            v2 = true;
            v0(...);
            task.delay(v3, function()
                v2 = false;
            end);
            return ;
        else
            return ;
        end;
    end;
end;
