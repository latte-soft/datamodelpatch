local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.LocalStorageKey);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v9 = {
    setRobloxLocaleId = function(v3)
        l_AppStorageService_0:SetItem(v0.RobloxLocaleId, v3);
    end, 
    setGameLocaleId = function(v4)
        l_AppStorageService_0:SetItem(v0.GameLocaleId, v4);
    end, 
    getAuthenticatedTheme = function()
        return l_AppStorageService_0:GetItem(v0.AuthenticatedTheme);
    end, 
    setAuthenticatedTheme = function(v5)
        l_AppStorageService_0:SetItem(v0.AuthenticatedTheme, v5);
    end, 
    getAccountBlob = function()
        if not game:GetEngineFeature("AccountSwitchFeatureEnabled") then
            return "";
        else
            return l_AppStorageService_0:GetItem(v0.AccountBlob) or "";
        end;
    end, 
    setAccountBlob = function(v6)
        if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
            l_AppStorageService_0:SetItem(v0.AccountBlob, v6 or "");
        end;
    end, 
    getSignupActionRequired = function()
        return l_AppStorageService_0:GetItem(v0.SignupActionRequired);
    end, 
    setSignupActionRequired = function(v7)
        l_AppStorageService_0:SetItem(v0.SignupActionRequired, v7);
    end, 
    getAccountSwitcherMetadataMap = function()
        if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
            return "";
        else
            return l_AppStorageService_0:GetItem(v0.AccountSwitcherMetadataMap) or "";
        end;
    end, 
    setAccountSwitcherMetadataMap = function(v8)
        if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
            l_AppStorageService_0:SetItem(v0.AccountSwitcherMetadataMap, v8 or "");
        end;
    end
};
v9.getAccountSwitchTargetUsername = function()
    if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        return "";
    else
        local v10 = v9.getAccountSwitcherMetadataMap();
        if not (v10 ~= nil) or v10 == "" then
            return "";
        else
            local v11 = l_HttpService_0:JSONDecode(v10);
            if not (((v11 ~= nil and v11 ~= "") and next(v11) ~= nil) and next(v11) ~= "") or v11.AccountSwitchTargetUsername == nil then
                return "";
            else
                return v11.AccountSwitchTargetUsername;
            end;
        end;
    end;
end;
v9.setAccountSwitchTargetUsername = function(v12)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v13 = v9.getAccountSwitcherMetadataMap();
        local v14 = nil;
        if not (v13 ~= nil) or v13 == "" then
            v14 = {
                AccountSwitchTargetUsername = v12
            };
        else
            v14 = l_HttpService_0:JSONDecode(v13);
            v14.AccountSwitchTargetUsername = v12;
        end;
        v9.setAccountSwitcherMetadataMap(l_HttpService_0:JSONEncode(v14));
    end;
end;
v9.getAccountSwitchStatus = function()
    if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        return "";
    else
        local v15 = v9.getAccountSwitcherMetadataMap();
        if not (v15 ~= nil) or v15 == "" then
            return "";
        else
            local v16 = l_HttpService_0:JSONDecode(v15);
            if not (((v16 ~= nil and v16 ~= "") and next(v16) ~= nil) and next(v16) ~= "") or v16.AccountSwitchStatus == nil then
                return "";
            else
                return v16.AccountSwitchStatus;
            end;
        end;
    end;
end;
v9.setAccountSwitchStatus = function(v17)
    if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
        local v18 = v9.getAccountSwitcherMetadataMap();
        local v19 = nil;
        if not (v18 ~= nil) or v18 == "" then
            v19 = {
                AccountSwitchStatus = v17
            };
        else
            v19 = l_HttpService_0:JSONDecode(v18);
            v19.AccountSwitchStatus = v17;
        end;
        v9.setAccountSwitcherMetadataMap(l_HttpService_0:JSONEncode(v19));
    end;
end;
v9.flush = function()
    l_AppStorageService_0:flush();
end;
return v9;
