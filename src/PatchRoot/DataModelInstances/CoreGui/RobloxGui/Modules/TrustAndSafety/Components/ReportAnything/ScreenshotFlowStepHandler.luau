local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(game:GetService("CorePackages").Packages.React);
local v2 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialog);
local v5 = require(l_Parent_0.Components.ReportAnything.ScreenshotReviewDialog);
local v6 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
return function(v7)
    local v8, v9 = v1.useState(v7.initialPageNumber == nil and 1 or v7.initialPageNumber);
    local v10, v11 = v1.useState(1.7777777777777777);
    local v12, v13 = v1.useState(800);
    local v14, v15 = v1.useState(800);
    local v16, v17 = v1.useState(true);
    local v18 = v1.useCallback(function()
        v9(2);
    end, {
        v9
    });
    local v19 = v1.useCallback(function()
        v9(1);
    end, {
        v9
    });
    v1.useEffect(function()
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_0 ~= nil then
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            v11(l_ViewportSize_0.X / l_ViewportSize_0.Y);
            v13(l_ViewportSize_0.Y);
            v15(l_ViewportSize_0.X);
            local l_v17_0 = v17;
            local v23 = false;
            if l_ViewportSize_0.X < l_ViewportSize_0.Y then
                v23 = l_ViewportSize_0.X < 800;
            end;
            l_v17_0(v23);
            if v7.reportAnythingAnalytics and l_ViewportSize_0.X < l_ViewportSize_0.Y then
                v7.reportAnythingAnalytics.setIsPortraitMode();
            end;
        end;
    end, {});
    local _ = nil;
    if v8 == 1 then
        return (v1.createElement(v5, {
            imageAspectRatio = v10, 
            isSmallPortraitMode = v16, 
            viewportHeight = v12, 
            viewportWidth = v14, 
            onNextPage = v18, 
            onBack = v7.dismissAction, 
            onSkip = v7.skipAnnotationAction, 
            onRestart = v7.restartAction, 
            screenshot = v7.screenshot, 
            reportAnythingAnalytics = v7.reportAnythingAnalytics
        }, {}));
    else
        local v25 = v7.entryPoint == "player" and "Select Person in Scene" or "Select Problem in Scene";
        if v6() then
            v25 = v7.entryPoint == "player" and v2:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") or v2:FormatByKey("Feature.ReportAbuse.Label.SelectProblem");
        end;
        return (v1.createElement(v4, {
            titleText = v25, 
            backAction = v19, 
            dismissAction = v7.dismissAction, 
            reportAction = v7.reportAction, 
            initialAnnotationPoints = v7.initialAnnotationPoints, 
            isSmallPortraitMode = v16, 
            screenshot = v7.screenshot, 
            imageAspectRatio = v10, 
            reportAnythingAnalytics = v7.reportAnythingAnalytics
        }));
    end;
end;
