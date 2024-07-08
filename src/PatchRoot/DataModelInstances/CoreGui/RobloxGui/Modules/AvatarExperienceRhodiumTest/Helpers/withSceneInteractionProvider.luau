local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Common.Context.SceneInteractionProvider);
return function(v6)
    return v3.forwardRef(function(v7, v8)
        return v3.createElement(v5, nil, {
            Component = v3.createElement(v6, v4.Dictionary.join(v7, {
                [v3.Ref] = v8
            }))
        });
    end);
end;
