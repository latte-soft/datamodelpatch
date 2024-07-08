local l_Parent_0 = script.Parent.Parent;
local v1 = require(game:GetService("CorePackages").PurchasePromptDeps);
local l_Rodux_0 = v1.Rodux;
local l_Cryo_0 = v1.Cryo;
return (l_Rodux_0.createReducer({}, {
    [require(l_Parent_0.Actions.SetABVariation).name] = function(v4, v5)
        assert(type(v5.key) == "string", "Expected 'key' to be a string");
        assert(type(v5.variation) == "string", "Expected 'variation' to be a string");
        return l_Cryo_0.Dictionary.join(v4, {
            [v5.key] = v5.variation
        });
    end
}));
