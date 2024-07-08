local l_Parent_0 = script:FindFirstAncestor("QueryRefetch").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v4 = require(l_Parent_0.UserProfiles);
local l_getFFlagUpdateFriendCarousel10ft_0 = require(l_Parent_0.SharedFlags).getFFlagUpdateFriendCarousel10ft;
local function v7(v6)
    return {
        authenticationStatus = v6.AuthenticationStatus.status
    };
end;
return function(v8)
    local v9 = l_useSelector_0(v7).authenticationStatus == l_LoginStatus_0.LOGGED_IN;
    local v10, v11 = v1.useState({});
    local v12 = v4.Hooks.useUserProfilesFetch({
        userIds = v10, 
        query = v4.Queries.userProfilesDisplayUserPlatformNamesByUserIds
    });
    local v13 = nil;
    if l_getFFlagUpdateFriendCarousel10ft_0() then
        v13 = v4.Hooks.useUserProfilesFetch({
            userIds = v10, 
            query = v4.Queries.userProfilesCombinedAndPlatformByUserIds
        });
    end;
    v1.useEffect(function()
        local v14 = nil;
        if not (not v9 or not v8) then
            v14 = v8:observeEvent("UserProfileNotifications", function(v15)
                if v15.Type == "PlatformName" then
                    v11({
                        (tostring(v15.VieweeUserId))
                    });
                end;
            end);
        end;
        return function()
            if not (not v14 or not v14.disconnect) then
                v14:disconnect();
            end;
        end;
    end, {
        v9, 
        v8
    });
    v1.useEffect(function()
        v12.refetch({
            userIds = v10
        });
        if v13 then
            v13.refetch({
                userIds = v10
            });
        end;
    end, {
        v10, 
        v12.refetch, 
        if not v13 then nil else v13.refetch
    });
end;
