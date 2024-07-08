local v0 = require(script.Parent.contactImporterModalInfo);
return function(v1)
    local l_appStorageService_0 = v1.appStorageService;
    local l_userid_0 = v1.userid;
    if not v0:isUserOptedInLocalStorage(l_appStorageService_0, l_userid_0) then
        return v0:shouldUserSeeModalPotentiallyAgain(l_appStorageService_0, l_userid_0);
    else
        return false;
    end;
end;
