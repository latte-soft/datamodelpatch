local v0 = require(script.Parent.NavigationSymbol);
local v1 = {
    None = v0("NONE"), 
    InitialRoute = v0("INITIAL_ROUTE"), 
    Order = v0("ORDER"), 
    History = v0("HISTORY")
};
setmetatable(v1, {
    __index = function(_, v3)
        error(("%q is not a valid member of BackBehavior"):format((tostring(v3))), 2);
    end
});
return v1;
