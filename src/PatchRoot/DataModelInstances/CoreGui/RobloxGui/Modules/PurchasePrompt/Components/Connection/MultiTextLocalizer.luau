local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(game:GetService("CorePackages").PurchasePromptDeps);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = require(l_Parent_0.Localization.LocalizationService);
local v5 = require(script.Parent.LocalizationContextConsumer);
local v6 = l_t_0.strictInterface({
    locKeys = l_t_0.table, 
    render = l_t_0.callback
});
local v7 = l_t_0.strictInterface({
    key = l_t_0.string, 
    params = l_t_0.optional(l_t_0.table)
});
return function(v8)
    assert(v6(v8));
    for _, v10 in pairs(v8.locKeys) do
        assert(v7(v10));
    end;
    local l_render_0 = v8.render;
    return l_Roact_0.createElement(v5, {
        render = function(v12)
            local v13 = {};
            for v14, v15 in pairs(v8.locKeys) do
                v13[v14] = v4.getString(v12, v15.key, v15.params);
            end;
            return l_render_0(v13);
        end
    });
end;
