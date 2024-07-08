local v0 = require(script.Parent.Parent.Parent.Parent.React);
local v1 = require(script.Parent.CursorContext);
return function(v2)
    return v0.useContext(v1).getCursorByType(v2);
end;
