local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.getLocaleContext);
local v5 = require(l_Parent_0.LocaleRoactContext);
local v6 = v2.Component:extend("LocaleProvider");
v6.validateProps = v3.interface({
    locale = v3.string
});
v6.render = function(v7)
    return v2.createElement(v5.Provider, {
        value = v4(v7.props.locale)
    }, v7.props[v2.Children]);
end;
return v6;
