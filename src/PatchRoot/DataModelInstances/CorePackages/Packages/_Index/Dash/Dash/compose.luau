local v0 = require(script.Parent.identity);
return function(...)
    local v1 = select("#", ...);
    if v1 == 0 then
        return v0;
    else
        local v2 = {
            ...
        };
        return function(...)
            local v3 = {
                v2[1](...)
            };
            for v4 = 2, v1 do
                v3 = {
                    v2[v4](unpack(v3))
                };
            end;
            return unpack(v3);
        end;
    end;
end;
