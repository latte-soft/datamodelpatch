local v0 = "id-" .. tostring(math.random(100000, 1000000));
local v1 = 0;
return {
    _TESTING_ONLY_normalize_keys = function()
        v0 = "id-";
        v1 = 0;
    end, 
    generateKey = function()
        local v2 = v0 .. tostring(v1);
        v1 = v1 + 1;
        return v2;
    end
};
