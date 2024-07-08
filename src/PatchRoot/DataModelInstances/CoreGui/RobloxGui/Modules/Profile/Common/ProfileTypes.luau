return {
    validateProfileType = function(v0)
        local v1 = true;
        if v0 ~= "Default" then
            v1 = true;
            if v0 ~= "OffNetworkFriendRequest" then
                v1 = true;
                if v0 ~= "ProfileShare" then
                    v1 = true;
                    if v0 ~= "FromContacts" then
                        v1 = v0 == "FromDeepLink";
                    end;
                end;
            end;
        end;
        return v1;
    end, 
    Default = "Default", 
    OffNetworkFriendRequest = "OffNetworkFriendRequest", 
    ProfileShare = "ProfileShare", 
    FromContacts = "FromContacts", 
    FromDeepLink = "FromDeepLink"
};
