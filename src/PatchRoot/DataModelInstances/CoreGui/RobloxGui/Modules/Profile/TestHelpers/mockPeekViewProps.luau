local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local l_Dash_0 = v1.Dash;
local v4 = {
    onPeekViewGoBack = function()
    end
};
return function(v5)
    return l_Dash_0.join(v4, v5);
end;
