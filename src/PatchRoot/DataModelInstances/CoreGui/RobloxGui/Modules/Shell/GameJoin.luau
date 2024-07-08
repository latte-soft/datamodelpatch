local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:FindFirstChild("RobloxGui");
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local v4 = nil;
pcall(function()
    v4 = game:GetService("PlatformService");
end);
local l_HttpService_0 = game:GetService("HttpService");
local l_FirstChild_0 = settings():FindFirstChild("Game Options");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v13 = require(l_Shell_0.Flags.GetFFlagXboxExperienceJoinAttemptId);
local v14 = require(l_Shell_0.Flags.GetFFlagXboxAnalyticsTrackTTI);
local l_game_EngineFeature_0 = game:GetEngineFeature("MigrateOverscanToGameBasicSettings");
local v16 = {
    JoinType = {
        Normal = 0, 
        GameInstance = 1, 
        Follow = 2, 
        PMPCreator = 3
    }
};
v16.StartGame = function(_, v18, v19, v20, v21)
    local v22 = false;
    pcall(function()
        if not l_game_EngineFeature_0 then
            if not (l_FirstChild_0.OverscanPX >= 0) or l_FirstChild_0.OverscanPY < 0 then
                v22 = true;
            end;
        elseif not (l_UserGameSettings_0.Overscan.x >= 0) or l_UserGameSettings_0.Overscan.y < 0 then
            v22 = true;
            return ;
        end;
    end);
    if game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
        v22 = false;
    end;
    local function v23()
        if not UserSettings().GameSettings:InStudioMode() then
            if v14() then
                l_default_0:logEvent("experience_launch_begin");
            end;
            if not pcall(function()
                if v18 == v16.JoinType.Normal and v20 == l_AppState_0.store:getState().RobloxUser.rbxuid then
                    v18 = v16.JoinType.PMPCreator;
                end;
                if not v13() then
                    return v4:BeginStartGame(v18, v19);
                else
                    return v4:BeginStartGame(v18, v19, l_HttpService_0:GenerateGUID(false), v21);
                end;
            end) then
                l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.GameJoin.Default), false);
            end;
            return ;
        else
            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Test.CannotJoinGame), false);
            return ;
        end;
    end;
    if not v22 and not UserSettings().GameSettings:InStudioMode() then
        v23();
    else
        l_ScreenManager_0:OpenScreen((require(l_Shell_0.Components.RoactScreenManagerWrapper).new(require(l_Shell_0.Components.Overscan.Overscan), l_RobloxGui_0, {}, v23)));
    end;
end;
return v16;
