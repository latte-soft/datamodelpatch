local v0 = require(script.Parent.Parent.Parent.Logger);
local v1 = {};
v1.new = function(v2)
    local v3 = {
        maxLevel = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.log = function(_, v5, v6)
    if v6.level == v0.Levels.Error then
        error(v5, 5);
        return ;
    elseif v6.level == v0.Levels.Warning then
        warn(v5);
        return ;
    else
        print(v5);
        return ;
    end;
end;
return v1;
