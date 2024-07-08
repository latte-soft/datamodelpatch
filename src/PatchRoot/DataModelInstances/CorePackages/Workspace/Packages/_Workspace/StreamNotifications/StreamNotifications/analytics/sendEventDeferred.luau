local l_getPlatformTarget_0 = require(script:FindFirstAncestor("StreamNotifications").Parent.Analytics).getPlatformTarget;
return function(v1)
    return function(v2, v3, v4)
        v1:SendEventDeferred(l_getPlatformTarget_0(), v2, v3, v4);
    end;
end;
