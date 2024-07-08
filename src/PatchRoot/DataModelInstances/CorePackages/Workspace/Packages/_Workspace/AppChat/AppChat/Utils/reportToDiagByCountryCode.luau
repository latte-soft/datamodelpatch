local l_ReportToDiagByCountryCode_0 = require(script:FindFirstAncestor("AppChat").Parent.Analytics).ReportToDiagByCountryCode;
local v1 = tonumber(settings():GetFVariable("PercentReportingByCountryCode")) or 0;
return function(v2, v3, v4)
    l_ReportToDiagByCountryCode_0(v2, v3, v4 * 1000, v1);
end;
