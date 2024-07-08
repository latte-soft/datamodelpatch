local l_getPlatformTarget_0 = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Analytics).getPlatformTarget;
return function(v1)
    return function(_, v3, v4, v5)
        v1:sendEventDeferred(l_getPlatformTarget_0(), v3, v4, v5);
    end;
end;
