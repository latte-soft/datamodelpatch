local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(script.AnalyticsContext);
local l_Context_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Context;
return {
    Class = require(script.SocialTabAnalytics), 
    Context = v1, 
    connect = l_Context_0.getConnect(v1), 
    with = l_Context_0.getWith(v1)
};
