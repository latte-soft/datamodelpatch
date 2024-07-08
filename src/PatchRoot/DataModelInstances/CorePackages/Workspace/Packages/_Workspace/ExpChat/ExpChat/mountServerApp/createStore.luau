local v0 = require(script:FindFirstAncestor("ExpChat").Parent.Rodux);
local v1 = require(script.Parent.installReducer);
return function()
    return v0.Store.new(v1, nil, {
        v0.thunkMiddleware
    });
end;
