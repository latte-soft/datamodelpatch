local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Components.GenericTextButton);
local v5 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v6 = v1.PureComponent:extend("SystemPrimaryButton");
v6.render = function(v7)
    return v1.createElement(v5.Consumer, {
        render = function(v8)
            return v1.createElement(v4, (v2.Dictionary.join(v7.props, {
                themeSettings = v8.SystemPrimaryButton
            })));
        end
    });
end;
return v6;
