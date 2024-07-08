local v0 = require(script.Parent["Symbol.roblox"]);
local v1 = newproxy(true);
local v2 = {};
local function _(v3)
    v2[v3] = v0.named("Roact" .. v3);
end;
v2.HostChangeEvent = v0.named("Roact" .. "HostChangeEvent");
v2.HostEvent = v0.named("Roact" .. "HostEvent");
v2.of = function(v5)
    if typeof(v5) ~= "table" then
        return nil;
    else
        return v5[v1];
    end;
end;
getmetatable(v1).__index = v2;
getmetatable(v1).__tostring = function()
    return "RoactType";
end;
return v1;
