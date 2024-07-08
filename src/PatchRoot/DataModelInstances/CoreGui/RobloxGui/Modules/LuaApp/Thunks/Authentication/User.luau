local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Enum.LocalStorageKey);
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7, v8, v9, v10, v11)
    local v12 = {
        userId = v6, 
        username = v7, 
        displayName = v11 or nil, 
        membershipType = v8, 
        isUnder13 = v9, 
        countryCode = v10
    };
    setmetatable(v12, v5);
    return v12;
end;
v5.fromRequest = function(v13)
    return v5.new(v13.responseBody.UserId, v13.responseBody.Username, tonumber(v13.responseBody.MembershipType), v13.responseBody.AgeBracket == 1, v13.responseBody.CountryCode, v13.responseBody.DisplayName or nil);
end;
v5.fromUserInfoRequest = function(v14)
    return v5.new(v14.responseBody.id, v14.responseBody.name, not v14.responseBody.isPremium and 0 or 4, v14.responseBody.ageBracket == 1, v14.responseBody.countryCode, v14.responseBody.displayName or nil);
end;
v5.fromLocalStorage = function()
    return v5.new(tonumber(l_AppStorageService_0:GetItem(v4.UserId)) or -1, l_AppStorageService_0:GetItem(v4.Username), tonumber(l_AppStorageService_0:GetItem(v4.Membership)) or 0, l_AppStorageService_0:GetItem(v4.IsUnder13) == "true", l_AppStorageService_0:GetItem(v4.CountryCode) or nil, l_AppStorageService_0:GetItem(v4.DisplayName) or nil);
end;
v5.clearLocalStorage = function()
    l_AppStorageService_0:SetItem(v4.UserId, "-1");
    l_AppStorageService_0:SetItem(v4.Username, "");
    l_AppStorageService_0:SetItem(v4.Membership, "");
    l_AppStorageService_0:SetItem(v4.IsUnder13, "");
    l_AppStorageService_0:SetItem(v4.DisplayName, "");
    l_AppStorageService_0:SetItem(v4.CountryCode, "");
    l_AppStorageService_0:Flush();
end;
v5.setToLocalPlayer = function(v15)
    l_Players_0:SetLocalPlayerInfo(v15.userId, v15.username, v15.displayName or "", v15.membershipType, v15.isUnder13);
end;
v5.setToLocalStorage = function(v16)
    l_AppStorageService_0:SetItem(v4.UserId, (tostring(v16.userId)));
    l_AppStorageService_0:SetItem(v4.Username, v16.username);
    l_AppStorageService_0:SetItem(v4.Membership, (tostring(v16.membershipType)));
    l_AppStorageService_0:SetItem(v4.IsUnder13, (tostring(v16.isUnder13)));
    l_AppStorageService_0:SetItem(v4.DisplayName, (tostring(v16.displayName)));
    l_AppStorageService_0:SetItem(v4.CountryCode, (tostring(v16.countryCode)));
    l_AppStorageService_0:Flush();
end;
v5.isSame = function(v17, v18)
    return v17.userId == v18.userId;
end;
v5.isEqual = function(v19, v20)
    local v21 = false;
    if v19.userId == v20.userId then
        v21 = false;
        if v19.username == v20.username then
            v21 = false;
            if v19.membershipType == v20.membershipType then
                v21 = false;
                if v19.isUnder13 == v20.isUnder13 then
                    v21 = false;
                    if v19.displayName == v20.displayName then
                        v21 = v19.countryCode == v20.countryCode;
                    end;
                end;
            end;
        end;
    end;
    return v21;
end;
v5.toString = function(v22)
    return string.format("userId:%s, username:%s, membershipType:%s, isUnder13:%s, countryCode:%s", tostring(v22.userId), v22.username, tostring(v22.membershipType), tostring(v22.isUnder13), (tostring(v22.countryCode)));
end;
v5.toJsonData = function(v23)
    return l_HttpService_0:JSONEncode({
        userId = v23.userId, 
        username = v23.username, 
        displayName = v23.displayName or nil, 
        membershipType = v23.membershipType, 
        isUnder13 = v23.isUnder13, 
        countryCode = v23.countryCode
    });
end;
return v5;
