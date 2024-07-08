local v0 = require(script:FindFirstAncestor("FriendsLanding").Parent.RoactNavigation);
local function _(v1)
    local v2 = v1._dangerouslyGetParent();
    return ((not not v2 and v1.state) and v1.state.key) and v2.getChildNavigation(v1.state.key) or v1;
end;
return function(v4)
    local v5 = v4._dangerouslyGetParent();
    return v0.getActiveChildNavigationOptions(((not not v5 and v4.state) and v4.state.key) and v5.getChildNavigation(v4.state.key) or v4);
end;
