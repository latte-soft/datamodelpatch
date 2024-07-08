local _ = require(script.Parent.ObjMap);
return {
    toObjMap = function(v1)
        local v2 = {};
        for v3, v4 in pairs(v1) do
            v2[v3] = v4;
        end;
        return v2;
    end
};
