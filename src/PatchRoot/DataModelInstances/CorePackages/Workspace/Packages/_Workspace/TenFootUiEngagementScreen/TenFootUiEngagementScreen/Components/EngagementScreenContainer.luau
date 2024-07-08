local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiEngagementScreen");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.EngagementScreen);
local v4 = require(l_script_FirstAncestor_0.Components.useEngagementScreenProps);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
return function()
    return v2.createElement(v3, v4({
        useSingleSignOn = l_getAppFeaturePolicies_0().getUseSingleSignOn(), 
        allowPlatformAccountSwitching = l_getAppFeaturePolicies_0().getAllowPlatformAccountSwitching()
    }));
end;
