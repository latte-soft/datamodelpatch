local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local v6 = require(l_Modules_0.AvatarExperience.Common.Managers.PageObjectManager);
return function(v7, v8)
    return v3.forwardRef(function(v9, v10)
        return v3.createElement(v5.Provider, {
            pageObjectManager = v8 or v6.new()
        }, {
            Component = v3.createElement(v7, v4.Dictionary.join(v9, {
                [v3.Ref] = v10
            }))
        });
    end);
end;
