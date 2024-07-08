local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(game:GetService("CorePackages").Roact);
local v3 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local v4 = require(l_Modules_0.LuaApp.Themes.getThemeModuleForString);
local v5 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v6 = v2.Component:extend("ThemeProvider");
v6.init = function(v7, v8)
    v7.state = {
        theme = v4(v8.themeName)
    };
end;
v6.didMount = function(v9)
    v9.connection = l_AppStorageService_0.ItemWasSet:Connect(function(v10, v11)
        if v10 == v3.AuthenticatedTheme then
            v9:setState({
                theme = v4(v11)
            });
        end;
    end);
end;
v6.willUnmount = function(v12)
    if v12.connection then
        v12.connection:Disconnect();
    end;
end;
v6.render = function(v13)
    return v2.createElement(v5.Provider, {
        value = v13.state.theme
    }, v13.props[v2.Children]);
end;
return v6;
