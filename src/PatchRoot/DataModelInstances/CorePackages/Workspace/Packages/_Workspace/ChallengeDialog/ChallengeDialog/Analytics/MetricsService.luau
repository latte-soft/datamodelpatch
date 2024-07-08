local v0 = require(script:FindFirstAncestor("ChallengeDialog").Parent.Analytics).Analytics.new((game:GetService("RbxAnalyticsService")));
local v1 = game:DefineFastString("LoginInfoOverflowedCounter", "LoginInfoOverflowed");
return {
    loginInfoOverflowed = function()
        v0.Diag:reportCounter(v1, 1);
    end
};
