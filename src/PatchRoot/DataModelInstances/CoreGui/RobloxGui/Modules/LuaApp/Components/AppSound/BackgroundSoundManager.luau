local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ExperienceEventReceiver);
local _ = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v6 = v2.new();
local v7 = game:DefineFastInt("AppMusicVolumePercentage", 25);
local l_GetFFlagSoundManagerVolumeFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSoundManagerVolumeFix;
local v9 = v7 / 100;
return function()
    v1.useEffect(function()
        l_SoundManager_0:PlaySound(l_Sounds_0.VRAppLobbySound.Name, {
            Volume = v9, 
            Looped = true, 
            FadeInTime = if not l_GetFFlagSoundManagerVolumeFix_0() then nil else 3
        }, nil, nil, not l_GetFFlagSoundManagerVolumeFix_0() and 3 or nil);
        local v10 = v6:onLaunched(function()
            l_SoundManager_0:StopSound(l_Sounds_0.VRAppLobbySound.Name, not l_GetFFlagSoundManagerVolumeFix_0() and 3 or nil);
        end);
        local v11 = v6:onLeft(function()
            l_SoundManager_0:PlaySound(l_Sounds_0.VRAppLobbySound.Name, {
                Volume = v9, 
                Looped = true, 
                FadeInTime = if not l_GetFFlagSoundManagerVolumeFix_0() then nil else 3
            }, nil, nil, not l_GetFFlagSoundManagerVolumeFix_0() and 3 or nil);
        end);
        return function()
            v10:disconnect();
            v11:disconnect();
        end;
    end, {});
end;
