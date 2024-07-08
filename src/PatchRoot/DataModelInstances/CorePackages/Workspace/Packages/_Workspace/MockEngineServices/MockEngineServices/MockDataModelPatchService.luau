local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    local v2 = {
        mockPatches = v1 or {}
    };
    setmetatable(v2, v0);
    return v2;
end;
v0.RegisterPatch = function(_, _, _, _, _)
end;
v0.GetPatch = function(v8, v9)
    return v8.mockPatches[v9];
end;
v0.UpdatePatch = function(_, _, _, _)
end;
return v0;
