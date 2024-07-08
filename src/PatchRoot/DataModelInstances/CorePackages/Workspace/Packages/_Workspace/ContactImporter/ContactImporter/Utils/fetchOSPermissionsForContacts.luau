local v0 = require(script.Parent.Parent.dependencies);
local l_updateOptedInUsers_0 = v0.SocialModalsCommon.Utils.updateOptedInUsers;
local l_PermissionsProtocol_0 = v0.PermissionsProtocol;
local l_AppStorageService_0 = v0.AppStorageService;
return function(v4, v5)
    v4:hasPermissions({
        l_PermissionsProtocol_0.Permissions.CONTACTS_ACCESS
    }):andThen(function(v6)
        local v7 = v6 and v6.status == l_PermissionsProtocol_0.Status.AUTHORIZED;
        if not v7 then
            l_updateOptedInUsers_0:clearLocalStorage(l_AppStorageService_0);
        end;
        if v5 then
            v5(v7);
        end;
    end):catch(function(_)
    end);
end;
