local _ = require(script.ReactInternalTypes);
local _ = require(script.ReactRootTags);
return function(v2)
    local v3 = require(script.ReactFiberHostConfig);
    for v4, v5 in v2, nil, nil do
        v3[v4] = v5;
    end;
    return require(script.ReactFiberReconciler);
end;
