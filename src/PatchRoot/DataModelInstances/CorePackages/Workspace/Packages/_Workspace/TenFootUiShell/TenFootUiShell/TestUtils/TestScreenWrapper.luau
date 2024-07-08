local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.TenFootUiCommon);
return function(v3)
    return v1.createElement("CanvasGroup", {
        GroupTransparency = 0
    }, v3.children);
end;
