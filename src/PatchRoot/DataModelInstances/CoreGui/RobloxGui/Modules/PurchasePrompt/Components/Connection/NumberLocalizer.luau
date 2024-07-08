local l_Parent_0 = script.Parent.Parent.Parent;
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v2 = require(l_Parent_0.Localization.LocalizationService);
local v3 = require(script.Parent.LocalizationContextConsumer);
return function(v4)
    local l_number_0 = v4.number;
    local l_render_0 = v4.render;
    assert(typeof(l_number_0) == "number", "prop 'number' must be provided");
    assert(typeof(l_render_0) == "function", "Render prop must be a function");
    return l_Roact_0.createElement(v3, {
        render = function(v7)
            return l_render_0(v2.formatNumber(v7, l_number_0));
        end
    });
end;
