local l_AppStorageService_0 = game:GetService("AppStorageService");
game:DefineFastFlag("EnableContactInvitesForNonPhoneVerifiedForAll", false);
game:DefineFastInt("EnableContactInvitesForNonPhoneVerifiedRollout", 0);
return function(v1)
    local l_l_AppStorageService_0_0 = l_AppStorageService_0;
    if v1 then
        l_l_AppStorageService_0_0 = v1;
    end;
    local l_l_l_AppStorageService_0_0_Item_0 = l_l_AppStorageService_0_0:GetItem("AppInstallationId");
    local v4 = typeof(l_l_l_AppStorageService_0_0_Item_0);
    if v4 == "number" then
        return l_l_l_AppStorageService_0_0_Item_0;
    elseif v4 == "string" then
        if string.len(l_l_l_AppStorageService_0_0_Item_0) <= 0 then
            return nil;
        else
            return (tonumber((string.sub(l_l_l_AppStorageService_0_0_Item_0, -2))));
        end;
    else
        return nil;
    end;
end;
