local l_Rodux_0 = require(script:FindFirstAncestor("ContactImporter").dependencies).Rodux;
return function(v1, v2)
    return l_Rodux_0.Store.new(v2 or function(v3)
        return v3;
    end, v1 or {}, {
        l_Rodux_0.thunkMiddleware
    });
end;
