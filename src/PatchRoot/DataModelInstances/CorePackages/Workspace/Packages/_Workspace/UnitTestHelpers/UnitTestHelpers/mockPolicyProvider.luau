local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
return function(v2, v3)
    return v1.createElement(require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy.Provider, {
        policy = {
            require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies, 
            require(l_Parent_0.SocialPolicies).ChatPolicies, 
            require(l_Parent_0.AvatarPolicies).AvatarPolicies, 
            require(l_Parent_0.SocialPolicies).SharePolicies, 
            require(l_Parent_0.SocialPolicies).ShareTargetGamePolicies
        }, 
        policyData = v3 or {}
    }, {
        Element = v2
    });
end;
