local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Logging);
local v3 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.LuaApp.Http.Requests.FollowingsGetStatus);
local v6 = require(l_Modules_0.LuaApp.Actions.SetGameFollowingStatus);
local v7 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v8 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledLimit);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixNotificationsEnabledLimitReached);
return function(v10, v11)
    if type(v11) ~= "string" then
        error("ApiFetchGameFollowingStatus thunk expects universeId to be a string");
    end;
    return l_PerformFetch_0.Single("ApiFetchGameFollowingStatus" .. v11, function(v12)
        return v5(v10, v12:getState().LocalUserId, v11):andThen(function(v13)
            local l_responseBody_0 = v13.responseBody;
            if (l_responseBody_0 ~= nil and l_responseBody_0.CanFollow ~= nil) and l_responseBody_0.IsFollowing ~= nil then
                v12:dispatch(v6(v11, l_responseBody_0.CanFollow, l_responseBody_0.IsFollowing));
                if v9() then
                    local v15 = if l_responseBody_0.FollowingCountByType ~= nil then tonumber(l_responseBody_0.FollowingCountByType) else 0;
                    local v16 = if l_responseBody_0.FollowingLimitByType ~= nil then tonumber(l_responseBody_0.FollowingLimitByType) else 0;
                    v12:dispatch(v7(v15));
                    v12:dispatch(v8(v16));
                end;
                return v3.resolve(v13);
            else
                v2.warn("Response from FollowingsGetStatus is malformed");
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end);
    end);
end;
