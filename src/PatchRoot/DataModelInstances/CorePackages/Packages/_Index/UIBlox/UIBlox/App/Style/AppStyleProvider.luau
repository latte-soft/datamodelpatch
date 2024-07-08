local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.Roact);
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v6 = require(l_Parent_0.Themes.getThemeFromName);
local v7 = require(l_Parent_0.Fonts.getFontFromName);
local v8 = require(l_Parent_0.Constants);
local _ = require(script.Parent.StyleTypes);
local v10 = require(script.Parent.Tokens);
local v11 = require(l_Parent_1.Core.Style.StyleContext);
local v12 = require(l_Parent_1.UIBloxConfig);
local l_getTokens_0 = v10.getTokens;
local l_validateTokens_0 = v10.validateTokens;
local v15 = {
    themeName = v8.DefaultThemeName, 
    fontName = v8.DefaultFontName, 
    deviceType = v8.DefaultDeviceType, 
    settings = v8.DefaultSettings
};
return function(v16)
    local v17 = l_Object_0.assign({}, v15, v16.style);
    local v18, v19 = v3.useState(v17.themeName);
    local l_enableFontNameMapping_0 = v12.enableFontNameMapping;
    local v21 = l_getTokens_0(v17.deviceType, v18, v12.useTokensWithScale, l_enableFontNameMapping_0);
    assert(l_validateTokens_0(v21), "Invalid tokens");
    local v22 = {
        Font = v7(v17.fontName, l_enableFontNameMapping_0, v21), 
        Theme = v6(v18), 
        Tokens = v21, 
        Settings = if not v17.settings then v8.DefaultSettings else {
            PreferredTransparency = v17.settings.preferredTransparency, 
            ReducedMotion = v17.settings.reducedMotion
        }
    };
    local v23 = v3.useRef(false);
    v3.useEffect(function()
        v23.current = true;
        v19(v17.themeName);
        return function()
            v23.current = false;
        end;
    end, {
        v23, 
        v17.themeName, 
        v19
    });
    return v3.createElement(v11.Provider, {
        value = {
            style = v22, 
            updateTheme = v3.useCallback(function(_, v25)
                if v23.current then
                    v19(v25);
                end;
            end, {
                v23, 
                v19
            })
        }
    }, v4.oneChild(v16.children));
end;
