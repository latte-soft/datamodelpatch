local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetCurrentPage);
local v2 = require(l_Parent_0.Components.Pages);
return function(v3)
    v3:dispatch(v1(v2.pagesByKey[v3:getState().menuPage].parentPage));
end;
