local l_Parent_0 = script.Parent.Parent.Parent;
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v2 = require(l_Parent_0.Services.LayoutValues);
local v3 = require(script.Parent.LayoutValuesContext);
return function(v4)
    return l_Roact_0.createElement(v3.Provider, {
        value = v2.new(v4.isTenFootInterface).layout
    }, l_Roact_0.oneChild(v4[l_Roact_0.Children]));
end;
