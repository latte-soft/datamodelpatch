return require(game:GetService("CorePackages").Rodux).makeActionCreator("RECEIVED_USER_INVITE_STATUS", function(v0, v1)
    return {
        userId = tostring(v0), 
        inviteStatus = v1
    };
end);
