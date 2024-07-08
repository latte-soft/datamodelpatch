local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Parent.React);
local v3 = require(l_Parent_0.NotificationCardContext);
local _ = require(l_Parent_1.type);
return function(v5)
    local v6 = v2.useContext(v3);
    if not v5 then
        return v6.state;
    else
        return (not not v6.state and v6.state.visualItems) and v6.state.visualItems[v5] or {};
    end;
end;
