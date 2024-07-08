return function(v0, v1)
    local v2 = false;
    return function(...)
        if not v2 then
            v2 = true;
            task.delay(v0, function()
                v2 = false;
            end);
            return v1(...);
        else
            return ;
        end;
    end;
end;
