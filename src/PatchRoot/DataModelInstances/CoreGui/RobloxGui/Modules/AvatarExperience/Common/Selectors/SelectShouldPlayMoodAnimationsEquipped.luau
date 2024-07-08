local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = l_memoize_0(function(v8)
    local v9 = v8 and v8[v4.AssetTypeIdStrings.DynamicHead];
    if v9 and not v2.isEmpty(v9) then
        local v10 = v8 and v8[v4.AssetTypeIdStrings.MoodAnimation];
        if not (v10 and next(v10)) then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end);
return function(v12)
    return v11(v12.AvatarExperience.AvatarEditor.Character.EquippedAssets);
end;
