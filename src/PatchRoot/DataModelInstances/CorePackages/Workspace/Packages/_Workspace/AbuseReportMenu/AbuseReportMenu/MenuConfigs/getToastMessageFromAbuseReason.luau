local v0 = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants);
local l_ReportSuccessToast_0 = v0.ReportSuccessToast;
local l_PlayerAbuseTypes_0 = v0.PlayerAbuseTypes;
return function(v3, v4)
    local l_ChatGeneric_0 = l_ReportSuccessToast_0.ChatGeneric;
    if v3 == l_PlayerAbuseTypes_0.Cheating then
        l_ChatGeneric_0 = l_ReportSuccessToast_0.Cheating;
    elseif v3 == l_PlayerAbuseTypes_0.Username then
        l_ChatGeneric_0 = l_ReportSuccessToast_0.BadUserName;
    elseif not (v3 ~= l_PlayerAbuseTypes_0.Links) or v3 == v0.InappropriateContentAbuseReason then
        l_ChatGeneric_0 = l_ReportSuccessToast_0.Place;
    end;
    if v4 then
        l_ChatGeneric_0 = l_ReportSuccessToast_0.ReportAnythingGeneric;
    end;
    return l_ChatGeneric_0;
end;
