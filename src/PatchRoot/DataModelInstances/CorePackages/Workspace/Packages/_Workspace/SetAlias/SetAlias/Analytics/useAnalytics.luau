local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.SetAliasAnalyticsContext);
local l_React_0 = require(l_Parent_0.dependencies).React;
return function()
    return l_React_0.useContext(v1);
end;
