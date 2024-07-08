local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.Immutable);
local v3 = require(l_Modules_0.LuaApp.Components.GenericTextButton);
local v4 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v5 = v1.PureComponent:extend("SecondaryButton");
v5.render = function(v6)
    return v1.createElement(v4.Consumer, {
        render = function(v7)
            return v1.createElement(v3, (v2.Set(v6.props, "themeSettings", v7.SecondaryButton)));
        end
    });
end;
return v5;
