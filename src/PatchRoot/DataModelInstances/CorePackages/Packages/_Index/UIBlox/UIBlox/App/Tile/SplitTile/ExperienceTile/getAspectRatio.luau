local v0 = require(script.Parent.Enum.AspectRatioMode);
local v1 = {
    [v0.Wide] = 0.5625, 
    [v0.Square] = 1
};
return function(v2)
    local v3 = v1[v2];
    if not v3 then
        error("Unkown aspect ratio " .. tostring(v2));
    end;
    return v3;
end;
