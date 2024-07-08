local v0 = require(script:FindFirstAncestor("ExpChat").Parent.Rodux);
local v1 = require(script.Parent.RaiseActionAsEventMiddleware);
local v2 = require(script.Parent.installReducer);
return function(v3)
    return v0.Store.new(v2, v3, {
        v0.thunkMiddleware, 
        v1
    });
end;
