local v0 = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants);
getAvailableMethodsOfAbuse = function(v1, v2)
    local v3 = {
        {
            label = v0.AbuseMethods.TextChat, 
            subLabel = v0.AbuseMethodSublabel.TextChat
        }
    };
    if not v2 then
        v3[#v3 + 1] = {
            label = v0.AbuseMethods.Other, 
            subLabel = v0.AbuseMethodSublabel.Other
        };
    else
        v3[#v3 + 1] = {
            label = v0.AbuseMethods.Avatar, 
            subLabel = v0.AbuseMethodSublabel.Avatar
        };
    end;
    if v1 then
        table.insert(v3, 1, {
            label = v0.AbuseMethods.VoiceChat, 
            subLabel = v0.AbuseMethodSublabel.VoiceChat
        });
    end;
    return v3;
end;
return getAvailableMethodsOfAbuse;
