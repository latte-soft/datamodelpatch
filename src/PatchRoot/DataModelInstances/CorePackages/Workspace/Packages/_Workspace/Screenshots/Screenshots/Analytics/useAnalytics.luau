local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.Context.ShotsContext);
return function()
    return {
        fireEvent = v1.useContext(v2).fireAnalyticsEvent
    };
end;
