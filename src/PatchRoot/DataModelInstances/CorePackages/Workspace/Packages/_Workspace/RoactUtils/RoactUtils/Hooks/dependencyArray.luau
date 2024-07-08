local v0 = require(script:FindFirstAncestor("RoactUtils").Parent.AppCommonLib).Symbol.named("NilDependency");
return function(...)
    local v1 = {};
    for v2 = 1, select("#", ...) do
        local v3 = select(v2, ...);
        if v3 == nil then
            v3 = v0;
        end;
        v1[v2] = v3;
    end;
    return v1;
end;
