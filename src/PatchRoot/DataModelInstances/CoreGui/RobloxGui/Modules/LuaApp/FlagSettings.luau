local l_UserInputService_0 = game:GetService("UserInputService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFFlagLoginCodeEnabled);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFStringDebugDefaultPageOverride);
local v8 = {
    IsLuaGamesPagePreloadingEnabled = function(_)
        return not settings():GetFFlag("LuaAppGamesPagePreloadingDisabled");
    end
};
game:DefineFastInt("LuaAppLoginRollout", 0);
game:DefineFastInt("LuaAppLoginRolloutIos", 0);
v8.LuaAppLoginRolloutEnabledForDevice = function()
    local l_game_FastInt_0 = game:GetFastInt("LuaAppLoginRollout");
    if l_UserInputService_0:GetPlatform() == Enum.Platform.IOS then
        l_game_FastInt_0 = game:GetFastInt("LuaAppLoginRolloutIos");
    end;
    return (tonumber(l_AppStorageService_0:GetItem(v4.BrowserTrackerId)) or 99) % 100 < l_game_FastInt_0;
end;
v8.LuaAppLoginUIEnabled = function()
    return v8.LuaAppLoginRolloutEnabledForDevice();
end;
game:DefineFastInt("CrossDeviceLoginRollout2", 0);
v8.CrossDeviceLoginRolloutEnabledForDevice = function()
    return v5() and (tonumber(l_AppStorageService_0:GetItem(v4.BrowserTrackerId)) or 99) % 100 < game:GetFastInt("CrossDeviceLoginRollout2");
end;
game:DefineFastFlag("LuaAppEnableSinglePageSignUp", false);
v8.SinglePageSignUpEnabled = function()
    return game:GetFastFlag("LuaAppEnableSinglePageSignUp") or v8.LuaAppLoginRolloutEnabledForDevice();
end;
v8.WeChatLoginEnabled = function()
    return tonumber(settings():GetFVariable("LuaAppLoginMethod")) == 2;
end;
v8.GetDefaultAppPage = function()
    local v10 = v6();
    if #v10 > 0 then
        return v10;
    else
        return v3.Startup;
    end;
end;
v8.LuaAppPresencePollingIntervalInSeconds = function()
    return (tonumber(settings():GetFVariable("LuaAppPresencePollingIntervalInSecondsV377")));
end;
v8.GetGamesTabName = function()
    return "CommonUI.Features.Label.Discover";
end;
v8.LuaAuthEnabledForLuobu = function()
    return game:GetEngineFeature("LuobuLuaAuthEnabled");
end;
return v8;
