local _ = require(script.Parent.Parent.LuauPolyfill);
local v1 = {};
local v2 = {
    "red", 
    "green", 
    "yellow", 
    "blue", 
    "magenta", 
    "cyan", 
    "white"
};
v1.getDisplayNameColor = function(v3)
    if v3 == nil then
        return "white";
    else
        return v2[math.random(#v2)];
    end;
end;
return v1;
