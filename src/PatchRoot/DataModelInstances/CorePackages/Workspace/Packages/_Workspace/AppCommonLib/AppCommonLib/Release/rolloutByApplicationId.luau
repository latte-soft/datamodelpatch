local v0 = require(script.Parent.getNumericalApplicationId);
local function _(v1, v2)
    local v3 = v1();
    local v4 = v0(v2);
    if v4 == nil then
        return v3 >= 100;
    else
        return v4 % 100 + 1 <= v3;
    end;
end;
return function(v6, v7)
    local v8 = v6();
    local v9 = v0(v7);
    local v10 = if v9 == nil then v8 >= 100 else v9 % 100 + 1 <= v8;
    return function()
        return v10;
    end;
end;
