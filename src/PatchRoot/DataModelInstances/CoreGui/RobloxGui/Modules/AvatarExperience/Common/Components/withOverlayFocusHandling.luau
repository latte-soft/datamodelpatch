local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.OverlayFocusHandler);
return function(v4)
    return function(v5)
        return v2.createElement(v3, {
            overlayComponent = v4, 
            arguments = v5
        });
    end;
end;
