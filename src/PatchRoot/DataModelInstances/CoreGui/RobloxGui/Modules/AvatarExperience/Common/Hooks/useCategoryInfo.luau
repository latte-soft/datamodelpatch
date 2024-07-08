local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
return function()
    local v6 = v5();
    return l_useSelector_0((v2.useCallback(function(v7)
        return v4.getCategoryInfoFromState(v7, v6);
    end, {
        v6
    })));
end;
