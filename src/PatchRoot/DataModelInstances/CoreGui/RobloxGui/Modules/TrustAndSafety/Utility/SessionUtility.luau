local l_SessionService_0 = game:GetService("SessionService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Resources.Constants);
local v3 = require(l_Parent_0.Flags.GetFFlagEnableARFlowSession);
local v4 = require(l_Parent_0.Utility.SendAnalytics);
return {
    startAbuseReportSession = function(v5)
        if v3() then
            if not l_SessionService_0:SessionExists(v2.Session.StructuralIdentifier.AbuseReport) then
                l_SessionService_0:SetSession(v2.Session.StructuralIdentifier.Level1, v2.Session.StructuralIdentifier.AbuseReport, v2.Session.StructuralIdentifier.AbuseReport);
            end;
            l_SessionService_0:SetMetadata(v2.Session.StructuralIdentifier.AbuseReport, v2.Session.Metadata.EntryPoint, v5);
            l_SessionService_0:SetMetadata(v2.Session.StructuralIdentifier.AbuseReport, v2.Session.Metadata.DeleteOnGameLeave, "True");
            v4(v2.Analytics.ReportFlowOpened, v2.Analytics.ReportFlowOpened, {
                source = v5
            });
        end;
    end, 
    endAbuseReportSession = function()
        if not (not v3() or not l_SessionService_0:SessionExists(v2.Session.StructuralIdentifier.AbuseReport)) then
            l_SessionService_0:RemoveSession(v2.Session.StructuralIdentifier.AbuseReport);
        end;
    end
};
