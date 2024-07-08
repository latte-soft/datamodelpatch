local v0 = newproxy(false);
return function(v1)
    return {
        setInterval = function(v2, v3, ...)
            local v4 = {
                ...
            };
            local v5 = {
                [v0] = 1
            };
            if v3 == nil then
                v3 = 0;
            end;
            local v6 = v3 / 1000;
            local v7 = nil;
            v7 = function()
                v1(v6, function()
                    if v5[v0] == 1 then
                        v2(unpack(v4));
                        v7();
                    end;
                end);
            end;
            v7();
            return v5;
        end, 
        clearInterval = function(v8)
            if v8 == nil then
                return ;
            else
                if v8[v0] == 1 then
                    v8[v0] = 3;
                end;
                return ;
            end;
        end
    };
end;
