local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UserProfiles);
local v4 = require(l_Parent_0.Dash);
local v5 = require(script.Parent.FriendTile);
local v6 = require(l_script_FirstAncestor_0.Flags.getFriendsLandingUserProfileApiEnabled);
return function(v7)
    local v8 = nil;
    if v6() then
        v8 = v3.Hooks.useUserProfilesFetch({
            userIds = {
                v7.user.id
            }, 
            query = v3.Queries.userProfilesCombinedNameAndUsernameByUserIds
        });
    end;
    return v2.createElement(v5, v4.join(v7, {
        userProfile = if not not v6() and v8.data then v8.data.userProfiles[1] else nil
    }));
end;
