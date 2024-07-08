local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Context.WidgetInfoContext);
return function(v5)
    return function(v6)
        return v3.createElement(v4.Consumer, {
            render = function(v7)
                return v3.createElement(v5, v2.join(v6, {
                    widgetInfo = v7
                }));
            end
        });
    end;
end;
