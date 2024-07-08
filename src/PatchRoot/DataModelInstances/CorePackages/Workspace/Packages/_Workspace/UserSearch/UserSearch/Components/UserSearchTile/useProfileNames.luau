local v0 = require(script:FindFirstAncestor("UserSearch").Parent.UserProfiles);
return function(v1)
    local v2 = v0.Hooks.useUserProfilesFetch({
        userIds = {
            v1.userId
        }, 
        query = v0.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v3 = if not v2.data then nil else v0.Selectors.getUsernameFromId(v2.data, v1.userId);
    return {
        username = if not v3 then nil else v0.Formatters.formatUsername(v3), 
        combinedName = if not v2.data then nil else v0.Selectors.getCombinedNameFromId(v2.data, v1.userId)
    };
end;
