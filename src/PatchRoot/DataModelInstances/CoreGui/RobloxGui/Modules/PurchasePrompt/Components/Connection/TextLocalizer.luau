local l_Parent_0 = script.Parent.Parent.Parent;
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v2 = require(l_Parent_0.Localization.LocalizationService);
local v3 = require(script.Parent.LocalizationContextConsumer);
return function(v4)
    local l_locKey_0 = v4.locKey;
    local l_params_0 = v4.params;
    local l_render_0 = v4.render;
    assert(typeof(l_locKey_0) == "string", "String prop 'locKey' must be provided");
    assert(typeof(l_render_0) == "function", "Render prop must be a function");
    return l_Roact_0.createElement(v3, {
        render = function(v8)
            return l_render_0(v2.getString(v8, l_locKey_0, l_params_0));
        end
    });
end;
