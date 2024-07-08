local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
local _ = require(script.Parent.ObjMap);
return {
    keyMap = function(v2, v3)
        local v4 = {};
        for _, v6 in ipairs(v2) do
            v4[v3(v6)] = v6;
        end;
        return v4;
    end
};
