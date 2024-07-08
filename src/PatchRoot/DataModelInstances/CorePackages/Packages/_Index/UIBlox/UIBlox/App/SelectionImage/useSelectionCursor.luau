local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_0.SelectionImageContext);
local v3 = require(l_Parent_1.React);
return function(v4)
    return v3.useContext(v2)(v4);
end;
