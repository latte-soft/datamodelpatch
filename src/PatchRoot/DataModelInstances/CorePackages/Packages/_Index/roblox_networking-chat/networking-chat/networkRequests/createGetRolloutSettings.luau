local v0 = require(script.Parent.Parent.CHAT_URL);
return function(v1)
    return v1.roduxNetworking.GET({
        Name = "GetRolloutSettings"
    }, function(v2, v3)
        return v2(v0):path("v2"):path("get-rollout-settings"):expandedQueryArgsWithIds("featureNames", v3);
    end);
end;
