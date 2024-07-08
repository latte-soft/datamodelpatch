local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_RobloxGui_0.Modules.Common.GetDefaultQualityLevel);
local v5 = require(l_Parent_0.Utility.SendAnalytics);
local v6 = require(l_Parent_0.Resources.Constants);
return function()
    v5(v6.AnalyticsInGameMenuName, v6.AnalyticsLeaveGameName, {
        confirmed = v6.AnalyticsConfirmedName
    });
    l_GuiService_0.SelectedCoreObject = nil;
    l_RunService_0.RenderStepped:Wait();
    l_RunService_0.RenderStepped:Wait();
    game:Shutdown();
    settings().Rendering.QualityLevel = v4();
end;
