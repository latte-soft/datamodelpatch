local v0 = require(script.Parent.Parent.Parent.React);
local v1 = require(script.Parent.NavigationContext);
return function()
    return v0.useContext(v1);
end;
