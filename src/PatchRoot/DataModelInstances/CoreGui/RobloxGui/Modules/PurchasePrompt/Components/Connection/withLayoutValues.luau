local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v1 = require(script.Parent.LayoutValuesContext);
return function(v2)
    assert(type(v2) == "function", "Expect withLayoutValues callback to be a function.");
    return l_Roact_0.createElement(v1.Consumer, {
        render = v2
    });
end;
