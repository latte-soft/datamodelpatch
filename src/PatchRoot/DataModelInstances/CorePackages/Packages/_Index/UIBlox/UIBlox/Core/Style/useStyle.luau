local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_0.StyleContext);
local v3 = require(l_Parent_1.React);
return function()
    return v3.useContext(v2).style;
end;
