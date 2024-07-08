local l_Roact_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact;
local v1 = require(script.Parent.new);
return function(v2)
    return v1(l_Roact_0.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder
    }), v2);
end;
