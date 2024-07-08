local v0 = require(script:FindFirstAncestor("QueryRefetch").Hooks.usePlatformNameQueryRefetch);
return function(v1)
    v0(v1.robloxEventReceiver);
    return nil;
end;
