local l_ShareGameAnalytics_0 = require(script:FindFirstAncestor("ShareTargetGame").dependencies).SocialLibraries.Analytics.ShareGameAnalytics;
return function(v1, v2)
    return (l_ShareGameAnalytics_0.new(v1, v2, l_ShareGameAnalytics_0.ButtonName.LuaGameDetails));
end;
