local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.IsExperienceMenuABTestEnabled);
local v2 = require(script.Parent.Parent.ExperienceMenuABTestManager);
local v3 = require(script.Parent.Parent.Flags.GetFFlagFixChromeAllowlistWait);
local l_GetFStringInGameMenuChromeForcedUserIds_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringInGameMenuChromeForcedUserIds;
local l_GetFIntInGameMenuChromeAllowlistTimeout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntInGameMenuChromeAllowlistTimeout;
game:DefineFastFlag("EnableInGameMenuChrome", false);
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local v8 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TenFootInterface):IsEnabled();
return function()
    if not l_VRService_0.VREnabled then
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local v10 = tick() + l_GetFIntInGameMenuChromeAllowlistTimeout_0();
        if not v3() then
            while not l_LocalPlayer_0 do
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            end;
        else
            while not l_LocalPlayer_0 and tick() < v10 do
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            end;
        end;
        for v11 in l_GetFStringInGameMenuChromeForcedUserIds_0():gmatch("%d+") do
            if l_LocalPlayer_0 and tonumber(v11) == l_LocalPlayer_0.UserId then
                return true;
            end;
        end;
        if not v1() or not v2.default:isChromeEnabled() then
            if not v8 then
                return game:GetFastFlag("EnableInGameMenuChrome");
            else
                return false;
            end;
        else
            return true;
        end;
    else
        return false;
    end;
end;
