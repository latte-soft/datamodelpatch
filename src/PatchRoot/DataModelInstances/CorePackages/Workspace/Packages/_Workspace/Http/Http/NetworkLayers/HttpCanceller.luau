local v0 = {};
local v1 = 0;
v0.currentSession = function()
    return v1;
end;
v0.cancel = function()
    v1 = v1 + 1;
end;
return v0;
