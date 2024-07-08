local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.AccountSwitcher.GetLoggedInUsersMetadata);
local v3 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
return function(v5, v6)
    if v3 then
        return v2(v5, not not v3 and v4.getAccountBlob() or "", not v6):andThen(function(v7)
            if v3 then
                v4.setAccountBlob(v7.responseBody.encrypted_users_data_blob);
                v4.flush();
            end;
            return v1.resolve(v7.responseBody);
        end):catch(function(v8)
            if not v8.data then
                if v8.StatusCode then
                    return v1.reject({
                        v8.StatusCode
                    });
                else
                    return v1.reject();
                end;
            else
                return v1.reject(v8.data.errorCode);
            end;
        end);
    else
        return v1.resolve();
    end;
end;
