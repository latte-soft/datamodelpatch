local l_getDeepValue_0 = require(script.Parent.Parent.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue;
return function(v1, v2)
    local v3 = l_getDeepValue_0(v1, string.format("Profile.Users.byUserId.%s", v2.profileUserId or ""));
    return {
        screenSize = v1.ScreenSize, 
        userDialogName = ((not not v3.displayName and #v3.displayName > 0) and v3.displayName or v3.username) or ""
    };
end;
