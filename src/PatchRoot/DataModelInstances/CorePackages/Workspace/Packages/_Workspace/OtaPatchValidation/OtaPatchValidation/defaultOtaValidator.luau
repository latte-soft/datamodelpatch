local v0 = require(script.Parent.validatePackageDependencies);
local v1 = require(script.Parent.validateInterface);
return function(v2, v3, v4, v5)
    local v6, v7 = v0(v2, v3);
    if v6 then
        local v8, v9 = v1(v4, v5, true);
        if v8 then
            return true, "";
        else
            return false, v9;
        end;
    else
        return false, v7;
    end;
end;
