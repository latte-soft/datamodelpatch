return function(v0)
    local v1 = true;
    if v0.social_onboarding_variant ~= "newUIAddFriendsEntry" then
        v1 = v0.social_onboarding_variant == "oldUIAddFriendsEntry";
    end;
    return v1;
end;
