local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(script.Parent.IsExperienceMenuABTestEnabled);
local v4 = require(script.Parent.ExperienceMenuABTestManager);
game:DefineFastInt("NewInGameMenuPercentRollout3", 0);
game:DefineFastString("NewInGameMenuForcedUserIds", "");
game:DefineFastFlag("NewInGameMenuDisabledInVR", false);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = game:DefineFastFlag("DisableNewIGMinDUA", false);
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
return function()
    if not l_VRService_0.VREnabled then
        if v6 or not l_isSubjectToDesktopPolicies_0() then
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            while not l_LocalPlayer_0 do
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            end;
            for v9 in game:GetFastString("NewInGameMenuForcedUserIds"):gmatch("%d+") do
                if tonumber(v9) == l_LocalPlayer_0.UserId then
                    return true;
                end;
            end;
            if not v3() or not v4.default:isV3MenuEnabled() then
                if not (l_LocalPlayer_0.UserId % 100 < game:GetFastInt("NewInGameMenuPercentRollout3")) then
                    return false;
                else
                    return true;
                end;
            else
                return true;
            end;
        else
            return true;
        end;
    else
        return true;
    end;
end;
