local v0 = require(script.Parent.deepEqual);
local v1 = require(script.Parent.deepContains);
return function(v2, v3, v4)
    for _, v6 in ipairs(v2) do
        if not v4 then
            if v0(v6, v3) then
                return true;
            end;
        elseif v1(v6, v3) then
            return true;
        end;
    end;
    return false;
end;
