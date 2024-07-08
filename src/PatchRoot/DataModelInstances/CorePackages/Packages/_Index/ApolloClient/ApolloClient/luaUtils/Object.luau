local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
return (v0.Object.assign({}, v0.Object, {
    getPrototypeOf = function(v1)
        local v2 = getmetatable(v1);
        return v2 ~= false and v2 or nil;
    end, 
    create = function(v3, v4)
        if v4 == nil then
            v4 = {};
        end;
        return (setmetatable(v4, v3));
    end
}));
