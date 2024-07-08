local v0 = require(script.Parent.Symbol);
local v1 = {};
return {
    getOrInit = function(v2)
        if v1[v2] == nil then
            v1[v2] = v0.new(v2);
        end;
        return v1[v2];
    end, 
    __clear = function()
        v1 = {};
    end
};
