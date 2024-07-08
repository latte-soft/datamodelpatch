local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Context.AdaptiveScrollingContext);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
return function(v6)
    return function(v7)
        return v3.createElement(v4.Consumer, {
            render = function(v8)
                return v3.createElement(v6, v2.join(v7, {
                    adaptiveScrolling = v8
                }));
            end
        });
    end;
end;
