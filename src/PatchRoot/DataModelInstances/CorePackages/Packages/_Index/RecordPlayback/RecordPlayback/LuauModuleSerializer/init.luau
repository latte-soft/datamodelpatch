local v0 = require(script.LuauSerializer);
local v1 = {};
local v2 = {
    __index = v1
};
v1.new = function()
    return (setmetatable({
        _inner = v0.new()
    }, v2));
end;
v1.serialize = function(v3, v4)
    return "return " .. v3._inner:serialize(v4) .. "\n";
end;
return v1;
