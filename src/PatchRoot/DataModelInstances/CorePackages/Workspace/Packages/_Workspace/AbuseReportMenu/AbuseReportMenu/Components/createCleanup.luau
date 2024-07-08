local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Components.Constants);
local l_ReportTypes_0 = v3.ReportTypes;
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v7 = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local v9 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v10 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v11 = require(l_script_FirstAncestor_0.Analytics.collectAnalyticsParameters);
local v12 = v10.new(l_EventIngest_0.new(l_EventIngestService_0), v9.Diag, v10.MenuContexts.NewMenu);
return function(v13, v14, v15, v16)
    return function(v17, v18)
        if v13.menuEverShown then
            local _ = nil;
            v12:reportInGameAbuseReportInteraction(if v16 == l_ReportTypes_0.Person then v11.forPersonReport(v13, v17, v7.getAccumulatedParameters()) else v11.forExperienceReport(v13, v17, v7.getAccumulatedParameters()));
            v18({
                type = v3.ReportAnythingActions.ClearAnnotationFlowProperties
            });
            v14({
                type = v3.AnalyticsActions.Reset
            });
            v7.clear();
            v15(nil);
            v12:endAbuseReportSession();
            return ;
        else
            return ;
        end;
    end;
end;
