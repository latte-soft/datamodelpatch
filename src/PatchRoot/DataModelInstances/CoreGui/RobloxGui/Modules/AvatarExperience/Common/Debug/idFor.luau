local v0 = 1;
local v1 = setmetatable({}, {
    __mode = "k"
});
return function(v2)
    if v2 == nil then
        return 0;
    else
        local v3 = v1[v2];
        if not v3 then
            v3 = v0;
            v0 = v0 + 1;
            v1[v2] = v3;
        end;
        return v3;
    end;
end;
