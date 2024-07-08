local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Locale.LocaleService);
local v5 = require(script.Parent.LocaleConsumer);
local v6 = v3.strictInterface({
    keys = v3.table, 
    render = v3.callback
});
local v7 = v3.strictInterface({
    key = v3.string, 
    params = v3.optional(v3.table)
});
return function(v8)
    assert(v6(v8));
    for _, v10 in pairs(v8.keys) do
        assert(v7(v10));
    end;
    local l_render_0 = v8.render;
    return v2.createElement(v5, {
        render = function(v12)
            local v13 = {};
            for v14, v15 in pairs(v8.keys) do
                v13[v14] = v4.getString(v12, v15.key, v15.params);
            end;
            return l_render_0(v13);
        end
    });
end;
