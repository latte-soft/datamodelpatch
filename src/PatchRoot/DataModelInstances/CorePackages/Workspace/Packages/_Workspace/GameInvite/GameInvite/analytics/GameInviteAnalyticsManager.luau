local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local v2 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalytics);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
return (v2.new():withEventStream(require(l_Parent_0.Analytics).AnalyticsReporters.EventStream.new(l_RbxAnalyticsService_0)):withDiag(require(l_Parent_0.Analytics).AnalyticsReporters.Diag.new(l_RbxAnalyticsService_0)));
