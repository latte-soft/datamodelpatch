local v0 = newproxy(false);
return function(v1)
    return {
        setTimeout = function(v2, v3, ...)
            local v4 = {
                ...
            };
            local v5 = {
                [v0] = 1
            };
            if v3 == nil then
                v3 = 0;
            end;
            v1(v3 / 1000, function()
                if v5[v0] == 1 then
                    v2(unpack(v4));
                    v5[v0] = 2;
                end;
            end);
            return v5;
        end, 
        clearTimeout = function(v6)
            if v6[v0] == 1 then
                v6[v0] = 3;
            end;
        end
    };
end;
