local l_default_0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TrustAndSafety.TrustAndSafetyIXPManager).default;
return {
    getReportAnythingAvatarEnabled = function()
        return l_default_0:getReportAnythingAvatarEnabled();
    end, 
    getReportAnythingExperienceEnabled = function()
        return l_default_0:getReportAnythingExperienceEnabled();
    end
};
