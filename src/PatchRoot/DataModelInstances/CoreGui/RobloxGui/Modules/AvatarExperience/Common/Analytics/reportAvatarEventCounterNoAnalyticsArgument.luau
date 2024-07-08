local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v1 = require(script.Parent.getAvatarEventCounterNameWithPlatform);
return function(v2)
    if v2 then
        l_RbxAnalyticsService_0:ReportCounter(v1(v2), 1);
        return ;
    else
        l_RbxAnalyticsService_0:ReportCounter("AvatarExperienceCounterMiss", 1);
        return ;
    end;
end;
