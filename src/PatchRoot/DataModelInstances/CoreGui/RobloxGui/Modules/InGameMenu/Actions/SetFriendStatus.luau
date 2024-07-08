return require(game:GetService("CorePackages").Rodux).makeActionCreator("SET_FRIEND_STATUS", function(v0, v1)
    return {
        userId = v0, 
        friendStatus = v1
    };
end);
