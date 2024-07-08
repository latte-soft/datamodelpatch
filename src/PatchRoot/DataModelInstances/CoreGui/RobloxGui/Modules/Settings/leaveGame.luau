local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local v7 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v9 = require(l_RobloxGui_0.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local l_GetFFlagChromeSurveySupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeSurveySupport;
local v11 = require(l_RobloxGui_0.Modules.Common.GetDefaultQualityLevel);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v13 = require(l_RobloxGui_0.Modules.Chrome.Service.LocalStore);
return function(v14)
    if v9() then
        v7.leavingGame();
    end;
    l_GuiService_0.SelectedCoreObject = nil;
    l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsInGameMenuName, l_Constants_0.AnalyticsLeaveGameName, {
        confirmed = l_Constants_0.AnalyticsConfirmedName, 
        universeid = tostring(game.GameId), 
        source = l_Constants_0.AnalyticsLeaveGameSource
    });
    if v14 then
        local v15 = nil;
        if l_GetFFlagChromeSurveySupport_0() then
            v15 = {
                chromeSeenCount = tostring(v13.getChromeSeenCount())
            };
        end;
        l_MessageBus_0.publish(l_Constants_0.OnSurveyEventDescriptor, {
            eventType = l_Constants_0.SurveyEventType, 
            userId = tostring(l_Players_0.LocalPlayer.UserId), 
            customProps = v15
        });
    end;
    l_RunService_0.RenderStepped:wait();
    l_RunService_0.RenderStepped:wait();
    game:Shutdown();
    settings().Rendering.QualityLevel = v11();
end;
