local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.Luobu.Http.Requests.SignUpRequest);
local v5 = require(l_Modules_0.Luobu.Thunks.LaunchLuobuApp);
local v6 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v7 = require(l_Modules_0.Luobu.Analytics.Events.AppSignupCounterNames);
local v8 = v2.interface({
    birthday = v2.string, 
    displayName = v2.string, 
    gender = v2.number, 
    voucher = v2.string, 
    channelId = v2.number, 
    agreementIds = v2.table
});
return function(v9, v10, v11, v12, v13)
    return function(v14)
        assert(v8(v13));
        return v4(v9, v12, v13):andThen(function(_)
            v10.Diag:reportCounter(v7.Success, 1);
            v14:dispatch(v5(v9, v10, v11));
            return v3.resolve();
        end, function(_)
            v10.Diag:reportCounter(v7.Failure, 1);
            v14:dispatch(v6({
                HttpError = Enum.HttpError.OK
            }));
            return v3.reject();
        end);
    end;
end;
