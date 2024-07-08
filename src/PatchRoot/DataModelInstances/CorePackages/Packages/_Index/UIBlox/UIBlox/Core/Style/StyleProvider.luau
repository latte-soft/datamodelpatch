local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Style_0 = l_Parent_1.App.Style;
local v3 = require(l_Parent_1.Parent.Roact);
local v4 = require(l_Parent_1.Parent.t);
local v5 = require(l_Style_0.Validator.validateStyle);
local v6 = require(l_Parent_0.StyleContext);
local _ = require(l_Style_0.StyleTypes);
local v8 = require(l_Style_0.Themes);
local v9 = require(l_Style_0.Constants);
local v10 = require(l_Style_0.Fonts.Gotham);
local l_getTokens_0 = require(l_Style_0.Tokens).getTokens;
local l_Object_0 = require(l_Parent_1.Parent.LuauPolyfill).Object;
local v13 = v3.Component:extend("StyleProvider");
v13.validateProps = v4.strictInterface({
    style = v4.optional(v5), 
    [v3.Children] = v4.table
});
local v14 = {
    Theme = v8.DarkTheme, 
    Font = v10, 
    Settings = {
        PreferredTransparency = 1, 
        ReducedMotion = false
    }
};
v13.init = function(v15)
    v15:setState({
        style = v15.props.style
    });
end;
v13.render = function(v16)
    local v17 = l_Object_0.assign({}, v14, v16.state.style);
    if v17.Tokens == nil then
        v17.Tokens = l_getTokens_0(v9.DefaultDeviceType, if v17.Theme == v8.LightTheme then v9.ThemeName.Light else v9.ThemeName.Dark);
    end;
    return v3.createElement(v6.Provider, {
        value = {
            style = v17, 
            update = function(_, v19)
                if v16.mounted then
                    v16:setState({
                        style = v19
                    });
                end;
            end
        }
    }, v3.oneChild(v16.props[v3.Children]));
end;
v13.didMount = function(v20)
    v20.mounted = true;
end;
v13.willUnmount = function(v21)
    v21.mounted = false;
end;
return v13;
