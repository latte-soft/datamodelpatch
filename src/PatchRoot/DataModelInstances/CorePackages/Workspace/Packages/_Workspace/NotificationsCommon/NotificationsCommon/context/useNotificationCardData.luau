local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.React);
local v2 = require(l_Parent_0.NotificationCardContext);
return function()
    return (v1.useContext(v2));
end;
