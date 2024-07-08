local v0 = require(game:GetService("CorePackages").Cryo);
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({}, v1));
end;
v1.getSystemInfo = function(_, v3)
    return v0.List.foldLeft(v3, function(v4, v5)
        v4[v5] = v5;
        return v4;
    end, {});
end;
return v1;
