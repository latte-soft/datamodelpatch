local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.AccountSwitcher.LogoutAllLoggedInUsersRequest);
local v3 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
return function(v5, _)
    if v3 then
        local v7 = v4.getAccountBlob();
        v4.setAccountBlob("");
        v4.flush();
        return v2(v5, v7):andThen(function(v8)
            return v1.resolve(v8.responseBody);
        end):catch(function(v9)
            if not v9.data then
                if v9.StatusCode then
                    return v1.reject({
                        v9.StatusCode
                    });
                else
                    return v1.reject();
                end;
            else
                return v1.reject(v9.data.errorCode);
            end;
        end);
    else
        return v1.resolve();
    end;
end;
