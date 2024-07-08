local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.TestHelpers.mockedUsersInfo);
local v5 = require(l_script_FirstAncestor_0.Components.UserSearchTile);
local function _(v6)
    local l_user_0 = v6.user;
    return function(v8)
        return v2.createElement("Frame", {
            Size = UDim2.new(0, 200, 0, 350), 
            BackgroundTransparency = 1
        }, {
            UserSearchTile = v2.createElement(v5, v3.join({
                index = 1, 
                size = UDim2.new(0, 200, 0, 250), 
                user = {
                    id = l_user_0.id, 
                    name = l_user_0.name or "Name:" .. l_user_0.id, 
                    displayName = l_user_0.displayName or "DisplayName:" .. l_user_0.id, 
                    previousUsernames = l_user_0.previousUsernames or {}
                }, 
                profileInsight = l_user_0.profileInsight, 
                searchParameters = v6.searchParameters or {
                    searchKeyword = ""
                }, 
                luaAppNetworkingRequests = {
                    requestFriendship = function()
                    end, 
                    acceptFriendRequest = function()
                    end
                }, 
                luaAppNavigation = {
                    navigateToUserInfo = function()
                    end
                }, 
                fireAnalyticsEvent = v3.noop
            }, v8))
        });
    end;
end;
local l_users_0 = v4.users;
local v11 = {};
local v12 = {
    user = l_users_0.yourself
};
local l_user_1 = v12.user;
local l_l_user_1_0 = l_user_1 --[[ copy: 11 -> 12 ]];
local l_v12_0 = v12 --[[ copy: 10 -> 13 ]];
v11.yourself = function(v16)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_0.id, 
                name = l_l_user_1_0.name or "Name:" .. l_l_user_1_0.id, 
                displayName = l_l_user_1_0.displayName or "DisplayName:" .. l_l_user_1_0.id, 
                previousUsernames = l_l_user_1_0.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_0.profileInsight, 
            searchParameters = l_v12_0.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v16))
    });
end;
v12 = {
    user = l_users_0.following
};
l_user_1 = v12.user;
local l_l_user_1_1 = l_user_1 --[[ copy: 11 -> 14 ]];
local l_v12_1 = v12 --[[ copy: 10 -> 15 ]];
v11.following = function(v19)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_1.id, 
                name = l_l_user_1_1.name or "Name:" .. l_l_user_1_1.id, 
                displayName = l_l_user_1_1.displayName or "DisplayName:" .. l_l_user_1_1.id, 
                previousUsernames = l_l_user_1_1.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_1.profileInsight, 
            searchParameters = l_v12_1.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v19))
    });
end;
v12 = {
    user = l_users_0.friend
};
l_user_1 = v12.user;
local l_l_user_1_2 = l_user_1 --[[ copy: 11 -> 16 ]];
local l_v12_2 = v12 --[[ copy: 10 -> 17 ]];
v11.friend = function(v22)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_2.id, 
                name = l_l_user_1_2.name or "Name:" .. l_l_user_1_2.id, 
                displayName = l_l_user_1_2.displayName or "DisplayName:" .. l_l_user_1_2.id, 
                previousUsernames = l_l_user_1_2.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_2.profileInsight, 
            searchParameters = l_v12_2.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v22))
    });
end;
v12 = {
    user = l_users_0.incomingFriendship
};
l_user_1 = v12.user;
local l_l_user_1_3 = l_user_1 --[[ copy: 11 -> 18 ]];
local l_v12_3 = v12 --[[ copy: 10 -> 19 ]];
v11.incomingFriendship = function(v25)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_3.id, 
                name = l_l_user_1_3.name or "Name:" .. l_l_user_1_3.id, 
                displayName = l_l_user_1_3.displayName or "DisplayName:" .. l_l_user_1_3.id, 
                previousUsernames = l_l_user_1_3.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_3.profileInsight, 
            searchParameters = l_v12_3.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v25))
    });
end;
v12 = {
    user = l_users_0.outgoingFriendship
};
l_user_1 = v12.user;
local l_l_user_1_4 = l_user_1 --[[ copy: 11 -> 20 ]];
local l_v12_4 = v12 --[[ copy: 10 -> 21 ]];
v11.outgoingFriendship = function(v28)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_4.id, 
                name = l_l_user_1_4.name or "Name:" .. l_l_user_1_4.id, 
                displayName = l_l_user_1_4.displayName or "DisplayName:" .. l_l_user_1_4.id, 
                previousUsernames = l_l_user_1_4.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_4.profileInsight, 
            searchParameters = l_v12_4.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v28))
    });
end;
v12 = {
    user = l_users_0.previousUserName, 
    searchParameters = {
        searchKeyword = "searchKeyword"
    }
};
l_user_1 = v12.user;
local l_l_user_1_5 = l_user_1 --[[ copy: 11 -> 22 ]];
local l_v12_5 = v12 --[[ copy: 10 -> 23 ]];
v11.previousUserName = function(v31)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_5.id, 
                name = l_l_user_1_5.name or "Name:" .. l_l_user_1_5.id, 
                displayName = l_l_user_1_5.displayName or "DisplayName:" .. l_l_user_1_5.id, 
                previousUsernames = l_l_user_1_5.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_5.profileInsight, 
            searchParameters = l_v12_5.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v31))
    });
end;
v12 = {
    user = l_users_0.random
};
l_user_1 = v12.user;
local l_l_user_1_6 = l_user_1 --[[ copy: 11 -> 24 ]];
local l_v12_6 = v12 --[[ copy: 10 -> 25 ]];
v11.random = function(v34)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_6.id, 
                name = l_l_user_1_6.name or "Name:" .. l_l_user_1_6.id, 
                displayName = l_l_user_1_6.displayName or "DisplayName:" .. l_l_user_1_6.id, 
                previousUsernames = l_l_user_1_6.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_6.profileInsight, 
            searchParameters = l_v12_6.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v34))
    });
end;
v12 = {
    user = l_users_0.notFriend
};
l_user_1 = v12.user;
local l_l_user_1_7 = l_user_1 --[[ copy: 11 -> 26 ]];
local l_v12_7 = v12 --[[ copy: 10 -> 27 ]];
v11.notFriend = function(v37)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_7.id, 
                name = l_l_user_1_7.name or "Name:" .. l_l_user_1_7.id, 
                displayName = l_l_user_1_7.displayName or "DisplayName:" .. l_l_user_1_7.id, 
                previousUsernames = l_l_user_1_7.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_7.profileInsight, 
            searchParameters = l_v12_7.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v37))
    });
end;
v12 = {
    user = l_users_0.mutualFriends
};
l_user_1 = v12.user;
local l_l_user_1_8 = l_user_1 --[[ copy: 11 -> 28 ]];
local l_v12_8 = v12 --[[ copy: 10 -> 29 ]];
v11.mutualFriends = function(v40)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_l_user_1_8.id, 
                name = l_l_user_1_8.name or "Name:" .. l_l_user_1_8.id, 
                displayName = l_l_user_1_8.displayName or "DisplayName:" .. l_l_user_1_8.id, 
                previousUsernames = l_l_user_1_8.previousUsernames or {}
            }, 
            profileInsight = l_l_user_1_8.profileInsight, 
            searchParameters = l_v12_8.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v40))
    });
end;
v12 = {
    user = l_users_0.frequents
};
l_user_1 = v12.user;
v11.frequents = function(v41)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 200, 0, 350), 
        BackgroundTransparency = 1
    }, {
        UserSearchTile = v2.createElement(v5, v3.join({
            index = 1, 
            size = UDim2.new(0, 200, 0, 250), 
            user = {
                id = l_user_1.id, 
                name = l_user_1.name or "Name:" .. l_user_1.id, 
                displayName = l_user_1.displayName or "DisplayName:" .. l_user_1.id, 
                previousUsernames = l_user_1.previousUsernames or {}
            }, 
            profileInsight = l_user_1.profileInsight, 
            searchParameters = v12.searchParameters or {
                searchKeyword = ""
            }, 
            luaAppNetworkingRequests = {
                requestFriendship = function()
                end, 
                acceptFriendRequest = function()
                end
            }, 
            luaAppNavigation = {
                navigateToUserInfo = function()
                end
            }, 
            fireAnalyticsEvent = v3.noop
        }, v41))
    });
end;
return v11;
