local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Locale.LocaleService);
local v5 = require(script.Parent.LocaleConsumer);
local v6 = v3.strictInterface({
    locKey = v3.string, 
    params = v3.optional(v3.table), 
    render = v3.callback
});
return function(v7)
    assert(v6(v7));
    local l_locKey_0 = v7.locKey;
    local l_params_0 = v7.params;
    local l_render_0 = v7.render;
    return v2.createElement(v5, {
        render = function(v11)
            return l_render_0(v4.getString(v11, l_locKey_0, l_params_0));
        end
    });
end;
