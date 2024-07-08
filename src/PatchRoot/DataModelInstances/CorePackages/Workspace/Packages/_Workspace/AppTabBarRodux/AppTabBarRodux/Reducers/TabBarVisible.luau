local v0 = require(script:FindFirstAncestor("AppTabBarRodux").Actions.SetTabBarVisible);
return function(v1, v2)
    if v1 == nil then
        v1 = false;
    end;
    if v2.type == v0.name then
        v1 = v2.isVisible;
    end;
    return v1;
end;
