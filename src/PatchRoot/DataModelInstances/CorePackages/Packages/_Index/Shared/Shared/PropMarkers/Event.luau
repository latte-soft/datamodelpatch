local v0 = require(script.Parent.Parent["Type.roblox"]);
local v1 = {};
local v3 = {
    __tostring = function(v2)
        return string.format("RoactHostEvent(%s)", v2.name);
    end
};
setmetatable(v1, {
    __index = function(_, v5)
        local v6 = {
            [v0] = v0.HostEvent, 
            name = v5
        };
        setmetatable(v6, v3);
        v1[v5] = v6;
        return v6;
    end
});
return v1;
